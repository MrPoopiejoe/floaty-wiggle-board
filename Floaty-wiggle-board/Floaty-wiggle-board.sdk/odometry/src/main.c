/*
 * main.c
 *
 *  Created on: Oct 21, 2019
 *      Author: PoopieJoe
 */

#include "hdr/errorcodes.h"

setup_status_t setup()
{
	//setup sensor
	if (0) return setup_sensor_fail;

	//setup serial comms
	if (0) return setup_serial_fail;

	return setup_succes;
};

int main()
{
	unsigned int running = 1;
	program_status_t program_status = err_succes;
	setup_status_t setup_status = setup();

	if (setup_status != setup_succes) running = 0;
	while(running)
	{
		//main loop here
	}
	return 0;
}
