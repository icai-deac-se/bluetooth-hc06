/* 
 * File:   btconfig.h
 * Author: Felipe Gil
 * Description: Initial configuration functions for HC06 Bluetooth module
 *              (name, pin & baudrate) & functions to control transmission
 *              and reception after the device is paired
 * Created on 29th september 2017, 13:14
 */

#include "DriverPicTrainer/uart2.h"

#ifndef BTCONFIG_H
#define	BTCONFIG_H

//--------------------------------------
//-------------PUBLIC FUNCTIONS---------
//--------------------------------------

/**
 * Initializes an UART module for transferring Bluetooth data.
 * HC06 module will use UART2 module, so as to keep UART1 for other uses.
 * Default configuration: 9600 bps, 8 data bits, 1 stop bit, no parity.
 *
 * Then, it sends a connection test to the device. If the configuration
 * was successful, an "OK" message should be received via UART after abobut 1s.
 */
void initializeBT(void);

/**
 * BLUETOOTH MODULE UART CONFIGURATION FUNCTIONS
 * Each time a parameter is changed, a confirmation will be recevied
 * via UART. IMPORTANT: the confirmation is delayed about 1-2 seconds
 */

/**
 * Set specified baudrate for HC06 and UART module.
 */
void setBTbaudrate(unsigned long baudrate);

/**
 * This function allows to change the BT module name.
 * Default: ??
 */
void setBTname(char *pname);

/**
 * This function allows to change the BT module pin.
 * Default: 1234
 */
void setBTpin(int pin);


//BLUETOOTH DATA TRANSFER CONTROL FUNCTIONS

/**
 * Sends a string of characters to paired device
 *
 * @param pcad string to transmit
 */

void sendBT(char *pcad);

/**
 * Obtiene un caracter de la UART si hay alguno disponible. Si no obtiene un \0
 *
 * @return char leído de la cola de recepción de la UART o \0 si la cola está
 *              vacía.
 */

char getcharBT(void);

#endif	/* BTCONFIG_H */

