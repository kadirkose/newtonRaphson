#include <math.h>
#include <stdio.h>
#include <termios.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <time.h>
#include <gsl/gsl_poly.h>
#include <gsl/gsl_complex.h>

#define floatSize 32
#define maxFloatNumber 32
#define CPLD_CLOCK_FREQ 125000000

int degree_min, degree_max;
int cpldUart;
__uint32_t iteration_count;

typedef union {
    float f;
    struct {
        // Order is important.
        // Here the members of the union data structure
        // use the same memory (32 bits).
        // The ordering is taken
        // from the LSB to the MSB.
        unsigned int mantissa : 23;
        unsigned int exponent : 8;
        unsigned int sign : 1;
    } raw;
	__uint32_t bit_vector;
} floatingPoint;

floatingPoint fPoint[maxFloatNumber];
floatingPoint fPointTemp;
floatingPoint errRate;

void printBinary(int n, int i)
{
    // Prints the binary representation
    // of a number n up to i-bits.
    int k;
    for (k= i-1; k >= 0; k--) {
        if((n >> k) & 1)
            printf("1");
        else
            printf("0");
    }
}

int sendToCpld()
{
	int degreeCount;
	char degree_min_pos;
	char deg_max;

	if(degree_min < 0)
		degree_min_pos= -1*degree_min;
	else
		degree_min_pos= 0;

	deg_max = degree_min_pos + degree_max;

	write(cpldUart, &deg_max, 1);
	write(cpldUart, &fPointTemp.bit_vector, 4);
	write(cpldUart, &errRate.bit_vector, 4);
	write(cpldUart, &iteration_count, 4);

	for(degreeCount= 0; degreeCount <= (degree_max-degree_min); degreeCount++)
	{
		write(cpldUart, &fPoint[degreeCount].bit_vector , 4);
	}

	return 0;
}

int receiveFromCpld()
{
	char rcvData[4];
	__uint32_t rcvDataInt;
	__uint32_t cycleCount;
	float fRcvData;
	double cpld_compute_time;

	if(read(cpldUart, rcvData, 4) > 0)
	{
		memcpy(&rcvDataInt, (unsigned int*)&rcvData, sizeof(rcvData));
		memcpy(&fRcvData,   &rcvData, sizeof(rcvData));
		printf("FPGA Result for given variable substitution :                 %.040f \n",fRcvData);
	}
	else
		return 1;

	if(read(cpldUart, rcvData, 4) > 0)
	{
		memcpy(&cycleCount, (unsigned int*)&rcvData, sizeof(rcvData));
		printf("FPGA operation cycle count :                                  ");
		printf("%u\n", cycleCount);
		cpld_compute_time = (double)cycleCount / 125;
		printf("Computation time of fpga ignoring the uart communication:     ");
		printf("%lf usec\n",cpld_compute_time);
	}
	else
		return 1;

	if(read(cpldUart, rcvData, 4) > 0)
	{
		memcpy(&rcvDataInt, (unsigned int*)&rcvData, sizeof(rcvData));
		printf("FPGA computation iteration count      :                       ");
		printf("%u\n", rcvDataInt);
	}
	else
		return 1;

	if(read(cpldUart, rcvData, 4) > 0)
	{
		memcpy(&rcvDataInt, (unsigned int*)&rcvData, sizeof(rcvData));
		printf("FPGA total cycle count      :                                 ");
		printf("%u\n", rcvDataInt);
	}
	else
		return 1;

	return 0;
}

int computeDerivative()
{
	int degreeCount;
	float subsResult=0, derSubsResult=0, err=0, variable;
	int iter_count = 0;
	struct timespec ts_start_compute;
	struct timespec ts_stop_compute;
	double cpu_compute_time, cpu_power_compute_time, cpu_mult_compute_time, cpu_variable_compute_time;
	int i;
	float power_result[33];
	struct timespec ts_start_power_compute, ts_stop_power_compute;
	struct timespec ts_start_mult_compute, ts_stop_mult_compute;
	struct timespec ts_start_variable_compute, ts_stop_variable_compute;
	
	variable = fPointTemp.f;

	double dPoly[degree_max+1];
	double roots[degree_max*2];
	float fPoly[degree_max+1];

	// memcpy(fPoly, fPoint, sizeof(float)*(degree_max+1));

	// for (i = 0; i < degree_max+1; i++)
	// 	dPoly[i] = fPoly[i];
	
  	// gsl_poly_complex_workspace *w  = gsl_poly_complex_workspace_alloc (degree_max+1);
  
  	// clock_gettime(CLOCK_MONOTONIC, &ts_start_compute);
  	// gsl_poly_complex_solve (dPoly, degree_max+1, w, roots);
	// clock_gettime(CLOCK_MONOTONIC, &ts_stop_compute);

  	// gsl_poly_complex_workspace_free (w);

	// cpu_compute_time = (ts_stop_compute.tv_sec - ts_start_compute.tv_sec)*1000000 + (ts_stop_compute.tv_nsec - ts_start_compute.tv_nsec) / 1000;
	// printf("Time spent for computation CPU using gsl                 : %lf usec \n\n\n",cpu_compute_time);

  	// for (i = 0; i < degree_max; i++)
    //   printf("%d.root                                   		     : %+.18f %+.18fi\n", i, roots[2*i], roots[2*i+1]);


	clock_gettime(CLOCK_MONOTONIC, &ts_start_compute);
	
	while(iter_count < iteration_count)
	{
		subsResult = 0;
		derSubsResult = 0;
		clock_gettime(CLOCK_MONOTONIC, &ts_start_power_compute);
		for(degreeCount= 0; degreeCount < (degree_max - degree_min + 2); degreeCount++)
		{
			power_result[degreeCount] = pow(variable, (degreeCount + degree_min - 1));
		
		}
		clock_gettime(CLOCK_MONOTONIC, &ts_stop_power_compute);
		for(degreeCount= 0; degreeCount < (degree_max - degree_min + 1); degreeCount++)
		{
			if((variable == 0) && (degree_min != 0))
			{
				printf("Process is stopped because variable is zero. x/0 is nan");
				goto exit;
			}
			subsResult+= (fPoint[degreeCount].f) * power_result[degreeCount + 1];
			if(degreeCount + degree_min == 0)
				derSubsResult+= 0;
			else
				derSubsResult+= (fPoint[degreeCount].f * (degreeCount + degree_min)) * power_result[degreeCount];
		}
		clock_gettime(CLOCK_MONOTONIC, &ts_stop_mult_compute);
		if(derSubsResult == 0)
		{
			printf("Process is stopped because derSubsResult is zero. subsResult/0 is nan. iteratin: %d, root :%f \n", iter_count, variable);
			goto exit;
		}
		err = subsResult / derSubsResult;
		variable = variable - err;
		if(fabs(err) < errRate.f)
			break;
		iter_count += 1;
		clock_gettime(CLOCK_MONOTONIC, &ts_stop_variable_compute);
	}
exit:
	clock_gettime(CLOCK_MONOTONIC, &ts_stop_compute);
	printf(" ----------------------------- CPU ----------------------------------- \n");
	printf("Iteration Count : %d\n", iter_count);
	printf("Result in float : %.040f\n", variable);
	cpu_compute_time = (ts_stop_compute.tv_sec - ts_start_compute.tv_sec)*1000000000 + 
					   (ts_stop_compute.tv_nsec - ts_start_compute.tv_nsec) / 1000;
	cpu_power_compute_time = (ts_stop_power_compute.tv_sec - ts_start_power_compute.tv_sec)*1000000000 + 
							 (ts_stop_power_compute.tv_nsec - ts_start_power_compute.tv_nsec);
	cpu_mult_compute_time = (ts_stop_mult_compute.tv_sec - ts_stop_power_compute.tv_sec)*1000000000 + 
							(ts_stop_mult_compute.tv_nsec - ts_stop_power_compute.tv_nsec);
	cpu_variable_compute_time = (ts_stop_variable_compute.tv_sec - ts_stop_mult_compute.tv_sec)*1000000000 + 
					   (ts_stop_variable_compute.tv_nsec - ts_stop_mult_compute.tv_nsec);
	printf("Power Computition ---- Mult/Add Computition ---- New Root Computition ---- Total Spent -- \n");
	printf("   Time(nsec)              Time(nsec)                 Time(nsec)             Time(usec) -- \n");
	printf("   %.05f ",cpu_power_compute_time);
	printf("             %.05f ",cpu_mult_compute_time);
	printf("                 %.05f ",cpu_mult_compute_time);
	printf("             %.05f \n\n\n",cpu_compute_time);

	return 0;
}

__device__ void sumOfArray(float *array, int size)
{
	int index = threadIdx.x;

	if(index*2 + 1 < size)
		array[index] = __fadd_rn(array[index*2], array[index*2 + 1]);
	else
		array[index] = array[index*2];

	__syncthreads();
}


__device__ void evalutaionPolynomial(float *coeff_array, float variable, float *polynomial_mult)
{
	int index = threadIdx.x;
	float polynomial_pow ;
	
	if(index == 0)
		polynomial_mult[index] = coeff_array[index];
	else
	{
		if(variable < 0)
		{
			//variable = __fsub_rn(0.0f, variable);
			variable = -variable;
			polynomial_pow = __powf(variable, (float)index);
			if(index%2)
				polynomial_pow = -polynomial_pow;
				//polynomial_pow = __fsub_rn(0.0f, polynomial_pow);
		}
		else
			polynomial_pow = __powf(variable, (float)index);
	
		polynomial_mult[index] = __fmul_rn(coeff_array[index], polynomial_pow); 
	}
	__syncthreads();
}

__device__ void evalutaionDerivativeOfPolynomial(float *coeff_array, float variable, float *derivative_mult)
{
	int index = threadIdx.x;
	float derivative_pow;

	if(index == 0)
	{
		derivative_mult[index] = 0;
	}
	else if(index == 1)
	{
		derivative_mult[index] = coeff_array[index];
	}
	else
	{
		if(variable < 0)
		{
			//variable = __fsub_rn(0.0f, variable);
			variable = -variable;
			derivative_pow = __powf(variable, (float)(index - 1));
			if(!(index%2))
				derivative_pow = -derivative_pow;
				//derivative_pow = __fsub_rn(0.0f, derivative_pow);
		}
		else
			derivative_pow = __powf(variable, (float)(index - 1));
		
		derivative_mult[index] = __fmul_rn(coeff_array[index], index);
		derivative_mult[index] = __fmul_rn(derivative_mult[index], derivative_pow);
	}
	__syncthreads();

}

__global__ void newtonRaphsonIteration (float *coeff_array, float *variable, float *size,
										float *err, float *derivative_mult, float *polynomial_mult)
{
	int block_index = blockIdx.x;
	int index = threadIdx.x;
	int count = 0;
	float addition_iter = ceil(log2(*size));
	float size_of_adder;
	*err = 0;

	if(block_index)
		evalutaionPolynomial(coeff_array, *variable, polynomial_mult);
	else
		evalutaionDerivativeOfPolynomial(coeff_array, *variable, derivative_mult);

	size_of_adder = *size;
	while(count < addition_iter)
	{
		if(index < size_of_adder)
		{
			if(block_index)
				sumOfArray(polynomial_mult, size_of_adder);
			else
				sumOfArray(derivative_mult, size_of_adder);
		}
		count++;
		size_of_adder = ceil(size_of_adder/2);
	}
	if(block_index == 0 && index == 0)
	{
		*err = __fdiv_rn(polynomial_mult[0], derivative_mult[0]);
	}
}

int computeDerivativeGpu()
{
	float err=0, variable;
	int iter_count = 0;
	struct timespec ts_start_compute;
	struct timespec ts_stop_compute;
	double gpu_compute_time;
    int size = degree_max - degree_min + 1;
    float *coeff_array;
	float *size_gpu;
	float *variable_gpu;
	float addition_iter = ceil(log2(size));
	variable = fPointTemp.f;
	
	float fsize = size;
	float *err_gpu;
	float *derivative_mult;
    float *polynomial_mult;

    cudaMalloc(&coeff_array, sizeof(float)*size);
	cudaMalloc(&size_gpu, sizeof(float));
	cudaMalloc(&variable_gpu, sizeof(float));
	cudaMalloc(&err_gpu, sizeof(float));

	cudaMalloc(&derivative_mult, sizeof(float)*size);
	cudaMalloc(&polynomial_mult, sizeof(float)*size);

    cudaMemcpy(size_gpu, &fsize, sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(coeff_array, fPoint, size*sizeof(float), cudaMemcpyHostToDevice);

    clock_gettime(CLOCK_MONOTONIC, &ts_start_compute);
	while(iter_count < iteration_count)
	{

		cudaMemcpy(variable_gpu, &variable, sizeof(float), cudaMemcpyHostToDevice);
		newtonRaphsonIteration<<<2,size>>>(coeff_array, variable_gpu, size_gpu, err_gpu, derivative_mult, polynomial_mult);
        cudaDeviceSynchronize();
		cudaMemcpy(&err, err_gpu, sizeof(float), cudaMemcpyDeviceToHost);
		//printf("computeDerivativeGpu var %f err %f \n",variable, err);
		variable = variable - err;
		if(fabs(err) < errRate.f)
			break;
		iter_count += 1;
	}
	clock_gettime(CLOCK_MONOTONIC, &ts_stop_compute);

	cudaFree(coeff_array);
	cudaFree(size_gpu);
	cudaFree(variable_gpu);
	cudaFree(derivative_mult);
	cudaFree(polynomial_mult);
	printf(" ----------------------------- GPU ----------------------------------- \n");
	printf("\nIteration Count : %d\n", iter_count);
	printf("Result in float : %.040f\n", variable);
	gpu_compute_time = (ts_stop_compute.tv_sec - ts_start_compute.tv_sec)*1000000 + (ts_stop_compute.tv_nsec - ts_start_compute.tv_nsec) / 1000;
	printf("Time spent for computation GPU:  %lf usec \n\n\n",gpu_compute_time);

	return 0;
}

int uartInit()
{
	cpldUart = open("/dev/ttyUSB0", O_RDWR);
	// Create new termios struct, we call it 'tty' for convention
	struct termios tty;

	// Read in existing settings, and handle any error
	if(tcgetattr(cpldUart, &tty) != 0) {
	  printf("Error from tcgetattr\n");
	  return 1;
	}

	tty.c_cflag &= ~PARENB; // Clear parity bit, disabling parity (most common)
	tty.c_cflag &= ~CSTOPB; // Clear stop field, only one stop bit used in communication (most common)
	tty.c_cflag &= ~CSIZE; // Clear all bits that set the data size
	tty.c_cflag |= CS8; // 8 bits per byte (most common)
	tty.c_cflag &= ~CRTSCTS; // Disable RTS/CTS hardware flow control (most common)
	tty.c_cflag |= CREAD | CLOCAL; // Turn on READ & ignore ctrl lines (CLOCAL = 1)

	tty.c_lflag &= ~ICANON;
	tty.c_lflag &= ~ECHO; // Disable echo
	tty.c_lflag &= ~ECHOE; // Disable erasure
	tty.c_lflag &= ~ECHONL; // Disable new-line echo
	tty.c_lflag &= ~ISIG; // Disable interpretation of INTR, QUIT and SUSP
	tty.c_iflag &= ~(IXON | IXOFF | IXANY); // Turn off s/w flow ctrl
	tty.c_iflag &= ~(IGNBRK|BRKINT|PARMRK|ISTRIP|INLCR|IGNCR|ICRNL); // Disable any special handling of received bytes

	tty.c_oflag &= ~OPOST; // Prevent special interpretation of output bytes (e.g. newline chars)
	tty.c_oflag &= ~ONLCR; // Prevent conversion of newline to carriage return/line feed

	tty.c_cc[VTIME] = 250;    // Wait for up to 1s (10 deciseconds), returning as soon as any data is received.
	tty.c_cc[VMIN] = 0;

	// Set in/out baud rate to be 115200
	cfsetispeed(&tty, 115200);
	cfsetospeed(&tty, 115200);

	// Save tty settings, also checking for error
	if (tcsetattr(cpldUart, TCSANOW, &tty) != 0) {
	  close(cpldUart);
	  printf("Error from tcsetattr\n");
	  return 1;
	}
	return 0;
}

int main()
{
	int error = 0;
	struct timespec ts_start_time;
	double total_fpga_computition_time;
	struct timespec ts_end_compute;
	int index = 0;
	float a = 5.0;
	degree_min = 0;

	for(index = 6; index < 32; index+=5)
	{
		printf("----------------------Polynom Degree: %d ---------------------------- \n",index - 1);
		fPointTemp.f = ((float)rand()/(float)(RAND_MAX)) * a;
		printf("Starting Point %f:\n", fPointTemp.f);

		printf("polynomial random coefficients : \n");
   		for (int i = 0; i < index; i++)
		{
			fPoint[i].f = ((float)rand()/(float)(RAND_MAX)) * a;
			printf("%f \n",fPoint[i].f);
		}
		printf("\n");
		degree_max = index - 1;

		iteration_count = 100000;
		errRate.f = 0.0;

		error = computeDerivative();
		if(error)
		{
			printf("ERROR computeDerivative! \n");
			return (1);
		}

		error = computeDerivativeGpu();
		if(error)
		{
			printf("ERROR computeDerivative! \n");
			return (1);
		}
		
		error = uartInit();
		if(error)
		{
			printf("ERROR uartInit!\n");
			printf("Check the ttyUSB number!\n");
			return (1);
		}

		error = sendToCpld();
		if(error)
		{
			printf("ERROR sendToCpld! \n");
			return (1);
		}
		printf(" ----------------------------- FPGA ----------------------------------- \n");
		clock_gettime(CLOCK_MONOTONIC, &ts_start_time);
		error = receiveFromCpld();
		clock_gettime(CLOCK_MONOTONIC, &ts_end_compute);
		total_fpga_computition_time = (ts_end_compute.tv_sec - ts_start_time.tv_sec)*1000000 + (ts_end_compute.tv_nsec - ts_start_time.tv_nsec) / 1000;
		printf("Total time required by fpga: 				%lf usec\n",total_fpga_computition_time);
		if(error)
		{
			printf("ERROR receiveFromFpga! \n");
			return (1);
		}

	}
}

