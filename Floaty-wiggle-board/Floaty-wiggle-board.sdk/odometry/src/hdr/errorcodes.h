/*
 * errorcodes.h
 *
 *  Created on: Oct 28, 2019
 *      Author: PoopieJoe
 */

#ifndef HDR_ERRORCODES_H_
#define HDR_ERRORCODES_H_

typedef enum
{
	setup_succes 		= 0x0,
	setup_sensor_fail 	= 0x1,
	setup_serial_fail 	= 0x2
}setup_status_t;

typedef enum
{
	program_err_succes 	= 0x00,
	program_err_generic	= 0x10,
	program_err_sensor	= 0x20,
	program_err_math	= 0x30,
	program_err_serial	= 0x40
}program_status_category_t;

typedef enum
{
	err_succes 					= program_err_succes	| 0x00, //no error

	err_generic_unknown 		= program_err_generic	| 0x00, //unknown error not specific to a specific part

	err_sensor_unknown			= program_err_sensor 	| 0x00, //unknown error in the sensor part
	err_sensor_bad_gyro_read	= program_err_sensor 	| 0x01, //gyro returned an invalid reading
	err_sensor_bad_accel_read	= program_err_sensor 	| 0x02, //accelerometer returned an invalid reading

	err_math_unknown			= program_err_math 		| 0x00, //unknown error in the math part

	err_serial_unknown			= program_err_serial	| 0x00  //unknown error in the serial communication part
}program_status_t;

#endif /* HDR_ERRORCODES_H_ */
