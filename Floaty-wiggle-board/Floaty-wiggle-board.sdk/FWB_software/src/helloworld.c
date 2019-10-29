/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"

#include "xil_types.h"
#include "xil_assert.h"
#include "xparameters.h"
#include "bspconfig.h"

#define LITTLE_ENDIAN 1 //Places data in little endian format


typedef struct{
	float x;
	float y;
	float z;
}axis_t;

typedef struct{
	axis_t pos;
	axis_t rot;
}cords_t;
//0xD0 0xD0 0xCA 0xFE
const unsigned int PREFIX = 0xD0D0CAFE;


void send_data(uint8_t * data, uint16_t len)
{
	for(uint16_t i = 0; i < len; i++)
	{
		outbyte(data[i]);
	}

}
int send_cords(cords_t *cords_p)
{
	uint8_t data[sizeof(PREFIX)+sizeof(cords_t)]={PREFIX>>24, PREFIX>>16, PREFIX>>8, PREFIX};
	memcpy(data+sizeof(PREFIX), cords_p, sizeof(cords_t));
	send_data(data, sizeof(PREFIX)+sizeof(cords_t));
	return 0;
}
void delay_ms(uint32_t ms)
{
	usleep(ms*1000);
}

void send_float(float num)
{
	float ref = num;
	send_data((uint8_t*) &ref, sizeof(float));
}

int main()
{
    init_platform();
    //int a = 0;
    cords_t cords = {
    		.pos.x = 1.1,
			.pos.y = 2.2,
			.pos.z = 3.3,
			.rot.x = 4.4,
			.rot.y = 5.5,
			.rot.z = 6.6
    };
    while(1)
    {


		//Process data
		//send_cords(&cords);

	   uint8_t data[sizeof(PREFIX)]={PREFIX>>24, PREFIX>>16, PREFIX>>8, PREFIX};
	   send_data(data, sizeof(PREFIX));

		delay_ms(1000);
    }
    cleanup_platform();
    return 0;
}
