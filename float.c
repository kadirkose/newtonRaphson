#include <math.h>
#include <stdio.h>
#include <termios.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <time.h>

#define floatSize 32
#define maxFloatNumber 32
#define CPLD_CLOCK_FREQ 125000000

int degree_min, degree_max;
int cpldUart;
unsigned int floatingPointNumber[floatSize]= {0};
struct timespec ts_stop_fpga_comp;
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

int * convertToFloat(unsigned int sgn,unsigned int exp, unsigned int mnt)
{
	int k;

	floatingPointNumber[0]= sgn;

	for (k= 7; k >= 0; k--)
	{
		if((exp >> k) & 1)
			floatingPointNumber[8-k]= 1;
		else
			floatingPointNumber[8-k]= 0;
	}

	for (k= 22; k >= 0; k--)
	{
		if((mnt >> k) & 1)
			floatingPointNumber[31-k]= 1;
		else
			floatingPointNumber[31-k]= 0;
	}
	return floatingPointNumber;
}

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

int getFloat()
{
	int degreeCount, k;
	int index;

	printf("Enter min degree [-31,0]: ");
	scanf("%d", &degree_min);

	printf("\nEnter max degree [0,31]: ");
	scanf("%d", &degree_max);

	if(degree_min < -31 || degree_min > 0 || degree_max < 0 || degree_max > 31 || (degree_max + degree_min) == 0)
	{
		printf("\nDegree is out of range!\n");
		return 1;
	}

	printf("\nEnter variable value: ");
	scanf("%f", &(fPointTemp.f));

	printf("\nEnter iteration count: ");
	scanf("%d", &iteration_count);
	
	printf("\nEnter error value: ");
	scanf("%f", &(errRate.f));

	printf("\nVariable | The IEEE-754 representation of the given float     %f:\n                                                              %d", fPointTemp.f, fPointTemp.raw.sign);
	printBinary(fPointTemp.raw.exponent, 8);
	printBinary(fPointTemp.raw.mantissa, 23);
	printf("\n");

	for(index=degree_min; index <= (degree_max); index++)
	{
		printf("\nEnter %d.degree coefficient : ", index);
		degreeCount = index - degree_min;
		scanf("%f", &fPoint[degreeCount].f);	
		printf("%2d.degree | The IEEE-754 representation of the given float    %f:\n", index, fPoint[degreeCount].f);
		printf("                                                              %d", fPoint[degreeCount].raw.sign);
		printBinary(fPoint[degreeCount].raw.exponent, 8);
		printBinary(fPoint[degreeCount].raw.mantissa, 23);
		printf("\n");
	}
	return 0;
}

int sendToCpld()
{
	int degreeCount, bitCount;
	char degree_min_pos;
	char data;


	if(degree_min < 0)
		degree_min_pos= -1*degree_min;
	else
		degree_min_pos= 0;

	write(cpldUart, &degree_min_pos, 1);
	write(cpldUart, (char*)&degree_max, 1);
	for(bitCount= 3; bitCount > -1; bitCount--)
	{
		data = (fPointTemp.bit_vector >> (bitCount * 8)) & 0xFF;
		write(cpldUart, &data, 1);
	}

	for(bitCount= 3; bitCount > -1; bitCount--)
	{
		data = (errRate.bit_vector >> (bitCount * 8)) & 0xFF;
		write(cpldUart, &data, 1);
	}

	for(bitCount= 3; bitCount > -1; bitCount--)
	{
		data = (iteration_count >> (bitCount * 8)) & 0xFF;
		write(cpldUart, &data, 1);
	}

	for(degreeCount= 0; degreeCount <= (degree_max-degree_min); degreeCount++)
	{
		for(bitCount= 3; bitCount > -1; bitCount--)
		{
			data = (fPoint[degreeCount].bit_vector >> (bitCount * 8)) & 0xFF;
			write(cpldUart, &data, 1);
		}

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
		clock_gettime(CLOCK_MONOTONIC, &ts_stop_fpga_comp);
		memcpy(&rcvDataInt, (unsigned int*)&rcvData, sizeof(rcvData));
		memcpy(&fRcvData,   &rcvData, sizeof(rcvData));
		printf("FPGA Result for given variable substitution :                 %.040f \n",fRcvData);
		printf("					    :                 ");
		printBinary(rcvDataInt, 32);
		printf("\n");
	}
	else
	{
		return 1;
	}

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
		printf("FPGA communication cycle count      :                          ");
		printf("%u\n", rcvDataInt - cycleCount) ;
	}
	else
		return 1;

	return 0;
}

int computeDerivative()
{
	int degreeCount;
	float subsResult=0, derSubsResult=0, err=0, result;
	int iter_count = 0;
	printf("\n");
	while(iter_count < iteration_count)
	{
		subsResult = 0;
		derSubsResult = 0;
		for(degreeCount= 0; degreeCount < (degree_max-degree_min+1); degreeCount++)
		{
			if((fPointTemp.f == 0) && (degree_min != 0))
			{
				printf("Process is stopped because variable is zero. x/0 is nan");
				goto exit;
			}

			subsResult+= (fPoint[degreeCount].f) * (pow(fPointTemp.f, (degreeCount+degree_min)));
			if(degreeCount+degree_min == 0)
				derSubsResult+= 0;
			else
				derSubsResult+= (fPoint[degreeCount].f * (degreeCount+degree_min)) * (pow(fPointTemp.f, (degreeCount+degree_min-1)));
		}
		printf("%d. iteration\n",iter_count+1);
		if(subsResult == 0 || derSubsResult == 0)
			goto exit;

		err = subsResult / derSubsResult;
		printf("subs: %.040f  derivative subs: %.040f  error: %.040f\n", subsResult, derSubsResult, err);
		fPointTemp.f = fPointTemp.f - err;
		printf("root: %.040f\n\n", fPointTemp.f);
		if(fabs(err) < errRate.f)
			break;
		iter_count += 1;
	}
exit:
	printf("\nResult in float :                                             %.040f\n", fPointTemp.f);
	printf("Result in IEEE-754 representation float :                     %d", fPointTemp.raw.sign);
	printBinary(fPointTemp.raw.exponent, 8);
	printBinary(fPointTemp.raw.mantissa, 23);
	printf("\n");

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

	tty.c_cc[VTIME] = 10;    // Wait for up to 1s (10 deciseconds), returning as soon as any data is received.
	tty.c_cc[VMIN] = 0;

	// Set in/out baud rate to be 115200
	cfsetispeed(&tty, 1152000);
	cfsetospeed(&tty, 1152000);

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
	printf("Floating Point Differentiator\n\n");
	int error = 0;
	struct timespec ts_start_compute;
	struct timespec ts_stop_compute;
	struct timespec ts_stop_receive_data_from_fpga;
	double cpu_compute_time;
	double total_cpld_time;

	error = uartInit();
	if(error)
	{
		printf("ERROR uartInit!\n");
		printf("Check the ttyUSB number!\n");
		return (1);
	}

	error = getFloat();
	if(error)
	{
		printf("ERROR getFloat! \n");
		return (1);
	}


	clock_gettime(CLOCK_MONOTONIC, &ts_start_compute);
	error = computeDerivative();
	clock_gettime(CLOCK_MONOTONIC, &ts_stop_compute);
	cpu_compute_time = (ts_stop_compute.tv_sec - ts_start_compute.tv_sec)*1000000 + (ts_stop_compute.tv_nsec - ts_start_compute.tv_nsec) / 1000;
	printf("Time spent for computation CPU:  			      %lf usec \n\n\n",cpu_compute_time);
	if(error)
	{
		printf("ERROR computeDerivative! \n");
		return (1);
	}
	
	error = sendToCpld();
	if(error)
	{
		printf("ERROR sendToCpld! \n");
		return (1);
	}

	error = receiveFromCpld();
	clock_gettime(CLOCK_MONOTONIC, &ts_stop_receive_data_from_fpga);
	total_cpld_time = (ts_stop_receive_data_from_fpga.tv_sec - ts_stop_compute.tv_sec)*1000000 + (ts_stop_receive_data_from_fpga.tv_nsec - ts_stop_compute.tv_nsec) / 1000;
	printf("Total time required by fpga: 			              %lf usec\n",total_cpld_time);
	if(error)
	{
		printf("ERROR receiveFromFpga! \n");
		return (1);
	}
}
