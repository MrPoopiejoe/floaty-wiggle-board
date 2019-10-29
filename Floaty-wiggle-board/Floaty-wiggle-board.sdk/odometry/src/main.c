/*
 * main.c
 *
 *  Created on: Oct 21, 2019
 *      Author: PoopieJoe
 */

#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "hdr/errorcodes.h"
#include "hdr/i2c.h"

#define MPU6050_I2C_ADDR (0b1101000)
#define MPU6050_ACCEL_XOUT_H (0x3B)
#define MPU6050_ACCEL_XOUT_L (0x3C)
#define MPU6050_ACCEL_YOUT_H (0x3D)
#define MPU6050_ACCEL_YOUT_L (0x3E)
#define MPU6050_ACCEL_ZOUT_H (0x3F)
#define MPU6050_ACCEL_ZOUT_L (0x40)

setup_status_t setup()
{
	//setup sensor
	if (axi_i2c_setup())
	{
		return setup_sensor_fail;
	}

	//setup serial comms
	if (0)
	{
		return setup_serial_fail;
	}

	return setup_succes;
};

int main()
{
	unsigned int running = 1;
	unsigned char xout_l = 0;
	program_status_t program_status = err_succes;
	setup_status_t setup_status = setup();

	if (setup_status != setup_succes) running = 0;
	while(running)
	{
		//main loop here
		unsigned char read_status = axi_i2c_reg_read(MPU6050_I2C_ADDR, MPU6050_ACCEL_XOUT_L);
		if (read_status == 0)
		{
			while (waiting_for_rx)
			{
				if (is_rx_fifo_full()) waiting_for_rx = 0;
			}
			xout_l = get_rx_data();
			running = 0;
		}
	}
	return 0;
}