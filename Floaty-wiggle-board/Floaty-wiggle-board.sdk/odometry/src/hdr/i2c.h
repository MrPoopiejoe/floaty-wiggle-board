/*
 * i2c.h
 *
 *  Created on: Oct 29, 2019
 *      Author: PoopieJoe
 */

#ifndef SRC_HDR_I2C_H_
#define SRC_HDR_I2C_H_

#define AXI_I2C_GIE				(unsigned char *)( 0x4160001c )
#define AXI_I2C_ISR				(unsigned char *)( 0x41600020 )
#define AXI_I2C_IER				(unsigned char *)( 0x41600028 )
#define AXI_I2C_SOFTR			(unsigned char *)( 0x41600040 )
#define AXI_I2C_CR				(unsigned char *)( 0x41600100 )
#define AXI_I2C_SR				(unsigned char *)( 0x41600104 )
#define AXI_I2C_TX_FIFO			(unsigned short *)( 0x41600108 )
#define AXI_I2C_RX_FIFO			(unsigned char *)( 0x4160010c )
#define AXI_I2C_ADR				(unsigned char *)( 0x41600110 )
#define AXI_I2C_TX_FIFO_OCY		(unsigned char *)( 0x41600114 )
#define AXI_I2C_RX_FIFO_OCY		(unsigned char *)( 0x41600118 )
#define AXI_I2C_TEN_ADR			(unsigned char *)( 0x4160011c )
#define AXI_I2C_RX_FIFO_PIRQ	(unsigned char *)( 0x41600120 )
#define AXI_I2C_GPO				(unsigned char *)( 0x41600124 )
#define AXI_I2C_TSUSTA			(unsigned char *)( 0x41600128 )
#define AXI_I2C_TSUSTO			(unsigned char *)( 0x4160012c )
#define AXI_I2C_THDSTA			(unsigned char *)( 0x41600130 )
#define AXI_I2C_TSUDAT			(unsigned char *)( 0x41600134 )
#define AXI_I2C_THIGH			(unsigned char *)( 0x41600138 )
#define AXI_I2C_TBUF			(unsigned char *)( 0x41600138 )
#define AXI_I2C_TLOW			(unsigned char *)( 0x41600140 )
#define AXI_I2C_THDDAT			(unsigned char *)( 0x41600144 )

static unsigned char waiting_for_rx;

unsigned char axi_i2c_setup ( void );
unsigned char axi_i2c_reg_read ( unsigned char slave , unsigned char reg );

static inline unsigned char is_rx_fifo_full ( void )
{
	return ( (*AXI_I2C_SR) & 0x20);
}

static inline unsigned char get_rx_data ( void )
{
	return AXI_I2C_RX_FIFO;
}

#endif /* SRC_HDR_I2C_H_ */
