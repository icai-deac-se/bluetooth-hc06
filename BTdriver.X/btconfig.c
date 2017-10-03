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
/// UART interrupts priority
#define PR_INT_TX 5  // transmission
#define PR_INT_RX 6  // reception
//UART queues length
#define TAM_TR_UART  250  // Cola de transmisión
#define TAM_REC_UART 250  // Cola de recepción

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
    inicializarUART2(9600);
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
    sprintf(baud_message,"AT+BAUD%X \0",baud_code);
    putsUART2(baud_message);
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