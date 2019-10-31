/*
 * i2c.h
 *
 *  Created on: Oct 29, 2019
 *      Author: PoopieJoe
 */

#ifndef SRC_HDR_I2C_H_
#define SRC_HDR_I2C_H_

#include "xil_io.h"

#define AXI_I2C_GIE				( UINTPTR )( 0x4160001c )
#define AXI_I2C_ISR				( UINTPTR )( 0x41600020 )
#define AXI_I2C_IER				( UINTPTR )( 0x41600028 )
#define AXI_I2C_SOFTR			( UINTPTR )( 0x41600040 )
#define AXI_I2C_CR				( UINTPTR )( 0x41600100 )
#define AXI_I2C_SR				( UINTPTR )( 0x41600104 )
#define AXI_I2C_TX_FIFO			( UINTPTR )( 0x41600108 )
#define AXI_I2C_RX_FIFO			( UINTPTR )( 0x4160010c )
#define AXI_I2C_ADR				( UINTPTR )( 0x41600110 )
#define AXI_I2C_TX_FIFO_OCY		( UINTPTR )( 0x41600114 )
#define AXI_I2C_RX_FIFO_OCY		( UINTPTR )( 0x41600118 )
#define AXI_I2C_TEN_ADR			( UINTPTR )( 0x4160011c )
#define AXI_I2C_RX_FIFO_PIRQ	( UINTPTR )( 0x41600120 )
#define AXI_I2C_GPO				( UINTPTR )( 0x41600124 )
#define AXI_I2C_TSUSTA			( UINTPTR )( 0x41600128 )
#define AXI_I2C_TSUSTO			( UINTPTR ))( 0x4160012c )
#define AXI_I2C_THDSTA			( UINTPTR )( 0x41600130 )
#define AXI_I2C_TSUDAT			( UINTPTR )( 0x41600134 )
#define AXI_I2C_THIGH			( UINTPTR )( 0x41600138 )
#define AXI_I2C_TBUF			( UINTPTR )( 0x41600138 )
#define AXI_I2C_TLOW			( UINTPTR )( 0x41600140 )
#define AXI_I2C_THDDAT			( UINTPTR )( 0x41600144 )

static u8 waiting_for_rx;

u8 axi_i2c_setup ( void );
u8 axi_i2c_reg_read ( unsigned char slave , unsigned char reg );

void setregbit( UINTPTR regaddr , u8 bit);
void clrregbit( UINTPTR regaddr , u8 bit);
void setregdata( UINTPTR regaddr , u32 data );
u32 getregdata( UINTPTR regaddr );

u8 is_rx_fifo_full ( void );

u8 get_rx_data ( void );

#endif /* SRC_HDR_I2C_H_ */
