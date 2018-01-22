/*
 * File:   main.c
 * Author: Felipe Gil
 * Description: Program to test HC06 driver
 *              Each time a character is received from Bluetooth device,
 *              it is sent through the USB, and every character received
 *              via USB is transmitted to the BT device.
 * Created on 3rd October 2017, 17:03
 * Version: 0.3 - 22/01/2018
 */


#include "xc.h"
#include "config.h"
#include "btconfig.h"
#include "uart.h"
#include "idle.h"
#include <stdio.h>
#include "timers.h"

#define BT_RESP_TIME 1200   //ms
#define SAMPLE_TIME 50      //5 ms

int main(void) {
    
    char receivedBT[2];     //[0] character received from BT device
                            //[1] just '\0'
    int  message = 0;       //flag to indicate message from BT
    char receivedUSB[2];    //character received from USB
    //char TestMessage[10];
    TRISB &= 0x0FFF;
    PORTB |= 0xFFFF;
    
    inicializarReloj();
    //sprintf(TestMessage,"UART OK");
    inicializarUART(9600);
    //putsUART(TestMessage);
    initializeBT();
    delay(BT_RESP_TIME);
    //setBTbaudrate(57600); //it doesn't work properly
    //delay(BT_RESP_TIME);
    receivedBT[1]='\0';
    receivedUSB[1]='\0';
    
    inicializarTareaIdle(SAMPLE_TIME);
    while(1){
        
        receivedBT[0] = getcharBT();
        if(receivedBT[0] != '\0'){      //something is being received
            putsUART(receivedBT); 
            message = 1;                //indicate transmission to USB began
        }else{
            if(message == 1){           //end of message
                receivedBT[0] = '\n';   //end message with a line break
                putsUART(receivedBT); 
                message = 0;            //reset message flag
            }
        }
        receivedUSB[0] = getcharUART(); //character from USB
        if(receivedUSB[0] != '\0')    
            sendBT(receivedUSB);        //send via BT
                
        tareaIdle();                    //5 milliseconds
    }
    return 0;
}
