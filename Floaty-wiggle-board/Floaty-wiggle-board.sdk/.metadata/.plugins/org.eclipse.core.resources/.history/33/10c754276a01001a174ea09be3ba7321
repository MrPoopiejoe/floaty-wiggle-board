/*
 * main.c
 *
 *  Created on: Oct 21, 2019
 *      Author: PoopieJoe
 */

#include <stdio.h>
#include <math.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "hdr/errorcodes.h"
//#include "hdr/i2c.h"
#include "xparameters.h"
#include "xiic_l.h"
#include "xiic.h"
#include "xil_exception.h"
#include "sleep.h"
#include "xil_types.h"
#include "xil_assert.h"
#include "bspconfig.h"

#define MPU6050_I2C_ADDR (0b1101000)
#define MPU6050_ACCEL_XOUT_H (0x3B)
#define MPU6050_GYRO_XOUT_H (0x43)

#define MPU_6050_SMPLRT_DIV (0x19)

#define MPU6050_GYRO_CONFIG (0x1B)
#define MPU6050_ACCEL_CONFIG (0x1C)
#define MPU6050_PWR_MGMT_1 (0x6B)

#define MPU_6050_WHO_AM_I (0x75)

#define IIC_DEV_ID 		(XPAR_AXI_IIC_0_DEVICE_ID)
#define IIC_BASE_ADDR 	(XPAR_AXI_IIC_0_BASEADDR)

#define MPU_ACCEL_SENSITIVITY (float)(16384) //sensitivity of the accelecrometer measurement in LSB/g. Convert from binary value to g's by dividing the raw value by this, and subtract 2
#define MPU_GYRO_SENSITIVITY (float)(131) //sensitivity of the gyroscopr measurement in LSB/(deg/s). convert from binary value to deg/s by dividing the raw value by this, and subtract 250

#define ASCII_DATA	3
#define DIGITS 1000

//0xD0 0xD0 0xCA 0xFE
const unsigned int PREFIX = 0xD0D0CAFE;

typedef struct
{
	short x,y,z;
}accelreading_raw_t;

typedef struct
{
	float x,y,z;
}accelreading_t;

typedef struct
{
	short x,y,z;
}gyroreading_raw_t;

typedef struct
{
	float x,y,z;
}gyroreading_t;

typedef struct
{
	float theta,phi,psi;
}orientation_t;

typedef struct
{
	float x,y,z;
}position_t;


u8 mpu6050_reg_read( u8 regaddr );
u8 mpu6050_reg_write( u8 regaddr , u8 data );
void mpu6050_reg_read_multiple( u8 regaddr , u8 num_bytes , u8* data);
accelreading_raw_t mpu6050_readaccel( void );
gyroreading_raw_t mpu6050_readgyro( void );
accelreading_t convert_accelreading(accelreading_raw_t reading);
gyroreading_t convert_gyroreading( gyroreading_raw_t reading );
void send_data(uint8_t * data, uint16_t len);
void printfloat_data(char* pre_string, float data1, float data2, float data3, char* post_string);

setup_status_t setup()
{
	setup_status_t status = setup_succes;
	//setup sensor stuff
	mpu6050_reg_write(MPU6050_PWR_MGMT_1, 	mpu6050_reg_read(MPU6050_PWR_MGMT_1) 	& !0xF8 ); //set clock to internal 8MHz
	mpu6050_reg_write(MPU6050_PWR_MGMT_1, 	mpu6050_reg_read(MPU6050_PWR_MGMT_1) 	& !0x40 ); //disable sleep
	mpu6050_reg_write(MPU6050_GYRO_CONFIG, 	mpu6050_reg_read(MPU6050_GYRO_CONFIG) 	& !0x18 ); //set gyro scale to +-250 deg/s
	mpu6050_reg_write(MPU6050_ACCEL_CONFIG, mpu6050_reg_read(MPU6050_ACCEL_CONFIG) 	& !0x18 ); //set accel scale to +-2g
	mpu6050_reg_write(MPU_6050_SMPLRT_DIV, 0x0); //set sample rate divider to 0

	//setup serial comms
	if (0)
	{
		return setup_serial_fail;
	}

	return status;
};

int main()
{
	u8 running = 1;
	setup_status_t setup_status = setup();

	if (setup_status != setup_succes) running = 0;
	//main loop, running at approx 8kHz
	u32 counter = 0;
	accelreading_t body_acceleration = {.x = 0, .y = 0, .z = 0};
	gyroreading_t body_rates = {.x = 0, .y = 0, .z = 0};
	orientation_t orientation = {.phi = 0, .psi = 0, .theta = 0};
	position_t position = {.x = 0, .y = 0, .z = 0};
	const float delta_time_gyro = 0.000125;		//8kSps for gyro
	const float delta_time_accel = 0.001;		//1kSps for accel
	float euler_rate_phi_cur = 0, euler_rate_theta_cur = 0, euler_rate_psi_cur = 0;	//euler rates of current sample
	float euler_rate_phi_pre = 0, euler_rate_theta_pre = 0, euler_rate_psi_pre = 0;	//euler rates of previous sample
	float abs_accel_x_cur = 0, abs_accel_y_cur = 0, abs_accel_z_cur = 0;	//absolute acceleration of current sample
	float abs_accel_x_pre = 0, abs_accel_y_pre = 0, abs_accel_z_pre = 0;	//absolute acceleration of previous sample
	float velocity_x_cur = 0, velocity_y_cur = 0, velocity_z_cur = 0;	//current velocities in the cardinal directions
	float velocity_x_pre = 0, velocity_y_pre = 0, velocity_z_pre = 0;	//previous velocities in the cardinal directions
	struct { float x; float y; float z; } gravity_vector =
	{
		.x = 0,
		.y = 0,
		.z = 0
	};	//magnitude of gravity in each of the cardinal directions, determined during calibration
	while(running)
	{
		//start reading

		//convert raw values to real numbers
		body_rates = convert_gyroreading( mpu6050_readgyro() );

		if ( (counter % 8) == 0 )
		{
			if ( (counter % 400) == 0 )
			{
				//@20Hz
				//output stuff to console

				#if ASCII_DATA == 2
					   xil_printf("Prefix = 0xD0D0CAFE\r\n");
					   position.x = 1.112;
					   position.y = 2.2;
					   position.z = -10.9;

					   orientation.theta = -4;
					   orientation.phi = 30.197;
					   orientation.psi = 40.040;

					   printfloat_data("Position: ", position.x,  position.y, position.z, "");
					   printfloat_data("Orientation: ", orientation.theta, orientation.phi, orientation.psi,",\r\n");

		        #elif ASCII_DATA == 3
					   xil_printf("Prefix = 0xD0D0CAFE\r\n");
					   position.x = 1.112;
					   position.y = 2.2;
					   position.z = -10.9;

					   orientation.theta = -4;
					   orientation.phi = 30.197;
					   orientation.psi = 40.040;

					   printfloat_data(",", position.x,  position.y, position.z, "");
					   printfloat_data(",", orientation.theta, orientation.phi, orientation.psi,",\r\n");

				#else
					   uint8_t data[sizeof(PREFIX) + sizeof(position) + sizeof(orientation)] = { PREFIX >> 24, PREFIX >> 16, PREFIX >> 8, PREFIX };
					   memcpy(data + sizeof(PREFIX), &position, sizeof(position));
					   memcpy(data + sizeof(PREFIX) + sizeof(position), &orientation, sizeof(orientation));
					   send_data(data, sizeof(PREFIX) + sizeof(position) + sizeof(orientation));
				#endif
			}
			//@1kHz
			body_acceleration = convert_accelreading(mpu6050_readaccel());

			//run algorithm calculations
			//convert accelerations to be relative to gravity
			abs_accel_x_cur = 	body_acceleration.x * (cos(orientation.phi))
								+ body_acceleration.z * (sin(orientation.psi));

			abs_accel_y_cur =	body_acceleration.x * (sin(orientation.phi))
								+ body_acceleration.y * (cos(orientation.theta));

			abs_accel_z_cur =	body_acceleration.y * (sin(orientation.theta))
								+ body_acceleration.z * (cos(orientation.psi));

			//subtract gravity from the acceleration
			abs_accel_x_cur -= gravity_vector.x;
			abs_accel_y_cur -= gravity_vector.y;
			abs_accel_z_cur -= gravity_vector.z;

			//integrate to get new velocity
			velocity_x_cur += ( (abs_accel_x_cur + abs_accel_x_pre)/2 ) * delta_time_accel;
			velocity_y_cur += ( (abs_accel_y_cur + abs_accel_y_pre)/2 ) * delta_time_accel;
			velocity_z_cur += ( (abs_accel_z_cur + abs_accel_z_pre)/2 ) * delta_time_accel;

			//integrate to get new position
			position.x += ( (velocity_x_cur + velocity_x_pre)/2 ) * delta_time_accel;
			position.y += ( (velocity_y_cur + velocity_y_pre)/2 ) * delta_time_accel;
			position.z += ( (velocity_z_cur + velocity_z_pre)/2 ) * delta_time_accel;

			//make current samples the previous samples in anticipation of the next loop
			velocity_x_pre = velocity_x_cur;
			velocity_y_pre = velocity_y_cur;
			velocity_z_pre = velocity_z_cur;

			abs_accel_x_pre = abs_accel_x_cur;
			abs_accel_y_pre = abs_accel_y_cur;
			abs_accel_z_pre = abs_accel_z_cur;
		}

		//run algorithm calculations

		//convert body rates to euler rates
		//phi -> angle between x and y
		//theta -> angle between x and z
		//psi -> angle between y and z
		euler_rate_phi_cur = 	body_rates.x
								+ body_rates.y*(sinf(orientation.phi))*(tanf(orientation.theta))
								+ body_rates.z*(cosf(orientation.phi))*(tanf(orientation.theta));

		euler_rate_theta_cur = 	body_rates.y*(cos(orientation.phi))
								- body_rates.z*(sin(orientation.phi));

		euler_rate_psi_cur = 	body_rates.y*((sin(orientation.phi))/(cos(orientation.theta)))
								+ body_rates.z*((cos(orientation.phi))/(cos(orientation.theta)));

		//calculate new orientation from euler rates
		//new theta = old theta + euler rate theta * 0.125ms
		orientation.theta 	+= ( (euler_rate_theta_cur + euler_rate_theta_pre)/2 ) * delta_time_gyro;
		orientation.phi 	+= ( (euler_rate_phi_cur + euler_rate_phi_pre)/2 ) * delta_time_gyro;
		orientation.psi		+= ( (euler_rate_psi_cur + euler_rate_psi_pre)/2 ) * delta_time_gyro;

		//make current samples the previous samples in anticipation of the next loop
		euler_rate_theta_pre = euler_rate_theta_cur;
		euler_rate_phi_pre = euler_rate_phi_cur;
		euler_rate_psi_pre = euler_rate_psi_cur;

		counter++;
		usleep(125); //0.125 ms per loop (yes this is inaccurate but we didn't have enough time to get timers working so heck you)
	}
	return 0;
}

u8 mpu6050_reg_read( u8 regaddr )
{
	u8 readval = 0xFF;
	XIic_Send(IIC_BASE_ADDR,MPU6050_I2C_ADDR,&regaddr,1,XIIC_STOP);
	XIic_Recv(IIC_BASE_ADDR,MPU6050_I2C_ADDR,&readval,1,XIIC_STOP);
	return readval;
}

u8 mpu6050_reg_write( u8 regaddr , u8 data )
{
	u8 write_buf[2] = {regaddr, data};
	u8 bytes_sent = XIic_Send(IIC_BASE_ADDR, MPU6050_I2C_ADDR, write_buf, 2, XIIC_STOP);
	if (bytes_sent != 2)
	{
		return 0xFF;
	}
	return 0;
}

void mpu6050_reg_read_multiple( u8 regaddr , u8 num_bytes , u8* data)
{
	XIic_Send(IIC_BASE_ADDR,MPU6050_I2C_ADDR,&regaddr,1,XIIC_STOP);
	XIic_Recv(IIC_BASE_ADDR,MPU6050_I2C_ADDR,data,num_bytes,XIIC_STOP);
}

accelreading_raw_t mpu6050_readaccel( void )
{
	accelreading_raw_t result;
	u8 tmp[6];
	mpu6050_reg_read_multiple(MPU6050_ACCEL_XOUT_H,6,tmp);
	result.x = (short)((u16)tmp[0] << 8) | tmp[1];
	result.y = (short)((u16)tmp[2] << 8) | tmp[3];
	result.z = (short)((u16)tmp[4] << 8) | tmp[5];
	return result;
}

gyroreading_raw_t mpu6050_readgyro( void )
{
	gyroreading_raw_t result;
	u8 tmp[6];
	mpu6050_reg_read_multiple(MPU6050_GYRO_XOUT_H,6,tmp);
	result.x = (short)((u16)tmp[0] << 8) | tmp[1];
	result.y = (short)((u16)tmp[2] << 8) | tmp[3];
	result.z = (short)((u16)tmp[4] << 8) | tmp[5];
	return result;
}

accelreading_t convert_accelreading(accelreading_raw_t reading)
{
	accelreading_t result = {.x = 0, .y = 0, .z = 0};
	result.x = ( (float)(reading.x) / MPU_ACCEL_SENSITIVITY );
	result.y = ( (float)(reading.y) / MPU_ACCEL_SENSITIVITY );
	result.z = ( (float)(reading.z) / MPU_ACCEL_SENSITIVITY );

	return result;
}

gyroreading_t convert_gyroreading( gyroreading_raw_t reading )
{
	gyroreading_t result;
	result.x = ( (float)(reading.x) / MPU_GYRO_SENSITIVITY );
	result.y = ( (float)(reading.y) / MPU_GYRO_SENSITIVITY );
	result.z = ( (float)(reading.z) / MPU_GYRO_SENSITIVITY );

	return result;
}

void printfloat1(float data_float)
{
	float data = data_float;

	//xil_printf("Hoi %d  %d %d\r\n", (int) (data*DIGITS), (int_part*DIGITS), (data*DIGITS)-(int_part*DIGITS));
	char signed_num;

	if(data<0)
	{
		data = ! data;
		signed_num=1;
	}
	else
	{
		signed_num = 0;
	}

	int int_part= (int)data;
	//xil_printf("%d\r\n", int_part);
	int dec_part = (data*DIGITS) - (int_part*DIGITS);

	/*if (dec_part<0)
	{
		dec_part=!dec_part;
	}*/
if(signed_num) //Negative
	if(dec_part<10)
	{
		xil_printf("-%d.00%d", int_part, dec_part);
	}
	else if(dec_part<100)
	{
		xil_printf("-%d.0%d", int_part, dec_part);
	}
	else
	{
		xil_printf("-%d.%d", int_part, dec_part);
	}
else //Positive
{
	if(dec_part<10)
	{
		xil_printf("%d.00%d", int_part, dec_part);
	}
	else if(dec_part<100)
	{
		xil_printf("%d.0%d", int_part, dec_part);
	}
	else
	{
		xil_printf("%d.%d", int_part, dec_part);
	}
}
}

void printfloat_pudding(char* pre_string, float data1, float data2, float data3, char* post_string)
{
	xil_printf("%s", pre_string);
	printfloat1(data1);
	xil_printf(", ");
	printfloat1(data2);
	xil_printf(", ");
	printfloat1(data3);
	xil_printf("%s", post_string);
}

void printfloat_data(char* pre_string, float data1, float data2, float data3, char* post_string)
{
	xil_printf("%s", pre_string);
	printfloat1(data1);
	xil_printf(", ");
	printfloat1(data2);
	xil_printf(", ");
	printfloat1(data3);
	xil_printf("%s", post_string);
/*	int data[6];

	data[0] = (int)data1;
	data[1] = (data1 - data[0]) * DIGITS;
	if(data[1]<0)
	{
		data[1]=!data[1];
	}
	data[2] = (int)data2;
	data[3] = (data2 - data[2]) * DIGITS;
	if(data[3]<0)
	{
		data[1]=!data[1];
	}
	data[4] = (int)data3;
	data[5] = (data3 - data[4]) * DIGITS;
	if(data[5]<0)
	{
		data[1]=!data[1];
	}
	if(data[1]<10)
	{

	}
	xil_printf("%s(%d.%03d, %d.%03d, %d.%03d)%s \r\n", pre_string, data[0], data[1], data[2], data[3], data[4], data[5], post_string);*/
}

void send_data(uint8_t * data, uint16_t len)
{
#if ASCII_DATA == 1
	for (int i = 0; i<len-2; i+=2)
	{
		xil_printf("%.2x %.2x : ", data[i], data[i + 1]);

	}
	xil_printf("%.2x %.2x\r\n", data[len-2], data[len-1]);

#else //Normal data
	for(uint16_t i = 0; i < len; i++)
	{
		outbyte(data[i]);
	}
#endif //ASCII_DATA

}

//int send_cords(cords_t *cords_p)
//{
//	uint8_t data[sizeof(PREFIX)+sizeof(cords_t)]={PREFIX>>24, PREFIX>>16, PREFIX>>8, PREFIX};
//	memcpy(data+sizeof(PREFIX), cords_p, sizeof(cords_t));
//	send_data(data, sizeof(PREFIX)+sizeof(cords_t));
//	return 0;
//}
void delay_ms(uint32_t ms)
{
	usleep(ms*1000);
}

