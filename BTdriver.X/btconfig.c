/* 
 * File:   btconfig.c
 * Author: Felipe Gil
 * Description: Initial configuration functions for HC06 Bluetooth module
 *              (name, pin & baud rate) & functions to control transmission
 *              and reception after the device is paired
 * Created on 29th September 2017, 13:14
 */

#include <xc.h>
#include <stdio.h>
#include "config.h"
#include "btconfig.h"
#include "DriverPicTrainer/uart2.h" 

//maximum name length
#define NAME_LENGTH 20
//HC06 default baudrate
#define DEF_BAUD 9600

//--------------------------------------------------------------------------------
//-------MODULE GLOBAL VARIABLES (baud rate, name and pin for checking purposes)--
//--------------------------------------------------------------------------------

 //static unsigned long bt_baudrate = 9600;
// static unsigned long user_baudrate = 9600;
// static int bt_pin = 1234;
// static int user_pin = 1234;
// static char bt_name[NAME_LENGTH];
// static char user_name[NAME_LENGTH];


// -----------------------------------------------------------------------------
// ------------------- PUBLIC FUNCTIONS  ---------------------------------------
// -----------------------------------------------------------------------------

void initializeBT(void)
{
    
    char test[5] = "AT\0";
    //initialize UART2
    inicializarUART2(DEF_BAUD);
    //send connection test
    putsUART2(test);
    
}

void setBTbaudrate(unsigned long baudrate)
{
    int baud_code;
    char baud_message[10];
    
    if(baudrate <= 1200){
        baud_code = 1;
    }else if(baudrate <= 2400){
        baud_code = 2;            
    }else if(baudrate <= 4800){
        baud_code = 3;
    }else if(baudrate <= 9600){
        baud_code = 4;
    }else if(baudrate <= 19200){
        baud_code = 5;
    }else if(baudrate <= 38400){
        baud_code = 6;
    }else if(baudrate <= 57600){
        baud_code = 7;
    }else if(baudrate <= 115200){
        baud_code = 8;
    }else if(baudrate <= 230400){
        baud_code = 9;
    }else if(baudrate <= 460800){
        baud_code = 10;
    }else if(baudrate <= 921600){
        baud_code = 11;
    }else{
        baud_code = 12;
    }
    
    //send baudrate AT command to bluetooth module
    sprintf(baud_message,"AT+BAUD%X \0",baud_code);
    putsUART2(baud_message);
    
    //inicializarUART2(baudrate);
    IEC1bits.U2TXIE    = 0;   // Disable transmission interruptions
    IEC1bits.U2RXIE    = 0;   // Disable reception interruptions
    U2MODEbits.UARTEN  = 0;   // Disable UART module 
    U2STAbits.UTXEN    = 0;   // Disable transmission (only if UARTEN = 1)
    U2BRG = (FCY/baudrate)/16 - 1;  // transmission speed 
    IEC1bits.U2TXIE    = 0;   // Disable transmission interruptions
    IEC1bits.U2RXIE    = 1;   // Enable reception interruptions
    U2MODEbits.UARTEN  = 1;   // Enable UART module 
    U2STAbits.UTXEN    = 1;   // Enable transmission (only if UARTEN = 1)
    
}

void setBTname(char *pname){
    char name_message[30] = "AT+NAME";
    int i=0;
    while(*pname != '\0'){
        name_message[i+7]= *pname;
        pname++;
        i++;
    }
    name_message[i+7]='\0';
    putsUART2(name_message);        
}


void setBTpin(int pin){
    char pin_message[10];
    sprintf(pin_message, "AT+PIN%u",pin);
    putsUART2(pin_message);    
}

void sendBT(char *pmessage){
    char *pcad;
    
    pcad = pmessage;
    putsUART2(&pcad);
}

char getcharBT(void){
    char message;
    
    message = getcharUART2();
    return message;
}