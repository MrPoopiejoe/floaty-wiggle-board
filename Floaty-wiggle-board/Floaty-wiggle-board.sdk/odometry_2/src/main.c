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
#include "xparameters.h"
#include "xiic_l.h"
#include "xiic.h"
#include "xil_exception.h"

#define MPU6050_I2C_ADDR (0b1101000)
#define MPU6050_ACCEL_XOUT_H (0x3B)
#define MPU6050_ACCEL_XOUT_L (0x3C)
#define MPU6050_ACCEL_YOUT_H (0x3D)
#define MPU6050_ACCEL_YOUT_L (0x3E)
#define MPU6050_ACCEL_ZOUT_H (0x3F)
#define MPU6050_ACCEL_ZOUT_L (0x40)

XIic MPU6050;
XIic_Config *ConfigPtr;
u16 DeviceId = XPAR_AXI_IIC_0_DEVICE_ID;

volatile struct {
	int EventStatus;
	int RemainingRecvBytes;
	int EventStatusUpdated;
	int RecvBytesUpdated;
} HandlerInfo;

static void RecvHandler(void *CallbackRef, int ByteCount)
{
	HandlerInfo.RemainingRecvBytes = ByteCount;
	HandlerInfo.RecvBytesUpdated = TRUE;
}

static void StatusHandler(void *CallbackRef, int Status)
{
	HandlerInfo.EventStatus |= Status;
	HandlerInfo.EventStatusUpdated = TRUE;
}

static int SetupInterruptSystem(XIic *IicPtr)
{
	int Status = XST_SUCCESS;

	/*
	 * Initialize the interrupt controller driver so that it's ready to use,
	 * specify the device ID that is generated in xparameters.h
	 */

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/*
	 * Connect a device driver handler that will be called when an interrupt
	 * for the device occurs, the device driver handler performs the
	 * specific interrupt processing for the device
	 */

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the interrupt controller such that interrupts are recognized
	 * and handled by the processor.
	 */

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupts for the IIC device.
	 */


	/*
	 * Initialize the exception table.
	 */


	/*
	 * Register the interrupt controller handler with the exception table.
	 */


	/*
	 * Enable non-critical exceptions.
	 */


	return XST_SUCCESS;

}

setup_status_t setup()
{
	setup_status_t status = setup_succes;
	int progress_status;

	ConfigPtr = XIic_LookupConfig(DeviceId);
	XIic_CfgInitialize(&MPU6050,ConfigPtr,ConfigPtr->BaseAddress);
	progress_status = XIic_SelfTest(&MPU6050);

	XIic_SetRecvHandler(&MPU6050,(void *)&HandlerInfo, RecvHandler);
	XIic_SetStatusHandler(&MPU6050,(void *)&HandlerInfo, StatusHandler);
	progress_status = SetupInterruptSystem(&MPU6050);

	XIic_Start(&MPU6050);
	XIic_SetAddress(&MPU6050,XII_ADDR_TO_SEND_TYPE,MPU6050_I2C_ADDR);

	//setup sensor
	if (progress_status)
	{
		return setup_sensor_fail;
	}

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
	volatile u8 xout_l = 0;
	program_status_t program_status = err_succes;
	setup_status_t setup_status = setup();

	if (setup_status != setup_succes) running = 0;
	while(running)
	{
		//main loop here
		u8 read_status = axi_i2c_reg_read(MPU6050_I2C_ADDR, MPU6050_ACCEL_ZOUT_L);
		read_status = axi_i2c_reg_read(MPU6050_I2C_ADDR, MPU6050_ACCEL_ZOUT_L);
		read_status = axi_i2c_reg_read(MPU6050_I2C_ADDR, MPU6050_ACCEL_ZOUT_L);
		waiting_for_rx = 1;	//start waiting for data
		if (read_status == 0)
		{
			while (waiting_for_rx)
			{
				if (is_rx_fifo_full())
				{
					waiting_for_rx = 0;
				}
			}
			xout_l = get_rx_data();
			running = 0;
		}
	}
	return 0;
}