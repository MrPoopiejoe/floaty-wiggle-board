/*
 * i2c.c
 *
 *  Created on: Oct 29, 2019
 *      Author: PoopieJoe
 */

#include "hdr/i2c.h"

void setregbit( UINTPTR regaddr , u8 bit)
{
	Xil_Out32(regaddr, Xil_In32(regaddr) | (1 << bit) );
}

void clrregbit( UINTPTR regaddr , u8 bit)
{
	Xil_Out32(regaddr, Xil_In32(regaddr) & (!(1 << bit)) );
}

void setregdata( UINTPTR regaddr , u32 data )
{
	Xil_Out32(regaddr, data);
}

u32 getregdata( UINTPTR regaddr )
{
	return Xil_In32(regaddr);
}

u8 is_rx_fifo_full ( void )
{
	u8 result = getregdata(AXI_I2C_SR);
	return ( result & !0x40 );
}

u8 get_rx_data ( void )
{
	return getregdata(AXI_I2C_RX_FIFO);
}

unsigned char axi_i2c_setup ( void )
{
	setregbit(AXI_I2C_CR, 				0);		//enable the axi module
	setregbit(AXI_I2C_CR, 				1);		//enable tx reset
	setregdata(AXI_I2C_TX_FIFO, 		0x0);	//clear tx fifo
	setregdata(AXI_I2C_RX_FIFO_PIRQ, 	0x0F);	//set rx fifo depth to 1
	clrregbit(AXI_I2C_CR, 				1);		//clear tx reset
	//setregbit(AXI_I2C_IER, 				3);		//enable rx fifo filled interrupt
	clrregbit(AXI_I2C_CR, 				1);		//disable general call
	return 0;
}

unsigned char axi_i2c_reg_read ( u8 slave , u8 reg )
{
	if (getregdata(AXI_I2C_SR)  & !(0x40 	//rx fifo empty
								 | 0x80		//tx fifo empty
								 | 0x4)) 	//i2c bus is not busy
	{
		return 1; //failed to initialize read
	}

	setregbit(AXI_I2C_CR, 3);			//set mode to TX
	setregdata(AXI_I2C_TX_FIFO, (0x1 << 8) | ( (0x0 << 7) & (slave) ) );	//write: read access, slave address
	setregdata(AXI_I2C_TX_FIFO, (0x20 << 7) | reg);	//write reg id
	while( !(getregdata(AXI_I2C_SR) & 0x80) ); //while tx not empty
	clrregbit(AXI_I2C_CR, 2);			//generate stop bit
	clrregbit(AXI_I2C_CR, 3);			//set mode to RX

	return 0;
}
