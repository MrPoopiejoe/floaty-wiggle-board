/*
 * i2c.c
 *
 *  Created on: Oct 29, 2019
 *      Author: PoopieJoe
 */

#include "hdr/i2c.h"

unsigned char axi_i2c_setup ( void )
{
	*AXI_I2C_CR 			|= 0x1;		//enable the axi module
	*AXI_I2C_CR 			|= 0x2;		//enable tx reset
	*AXI_I2C_TX_FIFO 		= 0x0;		//clear tx fifo
	*AXI_I2C_RX_FIFO_PIRQ 	= 0x1 - 1;	//set rx fifo depth to 1
	*AXI_I2C_CR				&= (!0x2);	//clear tx reset
	*AXI_I2C_IER			|= 0x8;		//enable rx fifo filled interrupt
	*AXI_I2C_CR				&= (!0x20);	//disable general call
	return 0;
}

unsigned char axi_i2c_reg_read ( unsigned char slave , unsigned char reg )
{
	if ( (*AXI_I2C_SR) & (0x40 	//rx fifo empty
						| 0x80	//tx fifo empty
						| 0x4)) //i2c bus is not busy
	{
		return 1; //failed to initialize read
	}

	*AXI_I2C_TX_FIFO = 0x100;	//set start bit
	*AXI_I2C_TX_FIFO = slave;	//write 7 bit slave address
	*AXI_I2C_TX_FIFO = reg; 	//write 1 byte register address to read
	*AXI_I2C_TX_FIFO = 0x200;	//set stop bit

	waiting_for_rx = 1;	//start waiting for data

	return 0;
}





