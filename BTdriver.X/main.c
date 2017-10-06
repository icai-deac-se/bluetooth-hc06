/*
 * File:   main.c
 * Author: Felipe Gil
 * Description: Program to test HC06 driver
 *              Each time a character is received from Bluetooth device,
 *              it is sent through the USB, and every character received
 *              via USB is transmitted to the BT device.
 * Created on 3rd October 2017, 17:03
 */


#include "xc.h"
#include "config.h"
#include "btconfig.h"
#include "uart.h"
#include "idle.h"

int main(void) {
    
    char receivedBT[2];     //[0] character received from BT device
                            //[1] just '\0'
    int  message = 0;       //message from BT flag
    char receivedUSB[2];    //character received from USB
    
    
    inicializarReloj();
    initializeBT();
    inicializarTareaIdle(50);
    //setBTbaudrate(57600);
    //wait for response (maybe not needed)
    receivedBT[1]='\0';
    receivedUSB[1]='\0';
    
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
