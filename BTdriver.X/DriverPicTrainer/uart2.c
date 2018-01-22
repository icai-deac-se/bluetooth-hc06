// -----------------------------------------------------------------------------
// --------- MÓDULO UART2 (Universal Asynchronous Receiver Transmitter) ---------
// -----------------------------------------------------------------------------

/**
 * @file     uart2.c
 *
 * @author   Felipe Gil
 *
 * @version  0.1
 *
 * @date     02/10/2017
 *
 * @brief    Módulo encargado de gestionar la UART2
 */

// -----------------------------------------------------------------------------

#include <xc.h>
//#include "uart.h"
#include "config.h" // Se define aquí FCY, necesario para configurar el baudrate
#include "uart2.h"

// -----------------------------------------------------------------------------
// -------------------------------- PARÁMETROS ---------------------------------
// -----------------------------------------------------------------------------

/// Tamaño de los vectores y colas
#define TAM_TR_UART  250  // Cola de transmisión
#define TAM_REC_UART 250  // Cola de recepción

/// Prioridad de las interrupciones (máx. 7 - mín. 1)
#define PR_INT_TX 5  // Transmisión
#define PR_INT_RX 6  // Recepción

// -----------------------------------------------------------------------------
// ----------------------- VARIABLES GLOBALES AL MÓDULO ------------------------
// -----------------------------------------------------------------------------

static unsigned char uc_cola_transmision[TAM_TR_UART];
static unsigned char uc_cola_recepcion[TAM_REC_UART];
static unsigned int ui_icabeza_tr  = 0;
static unsigned int ui_icola_tr    = 0;
static unsigned int ui_icabeza_rec = 0;
static unsigned int ui_icola_rec   = 0;

// -----------------------------------------------------------------------------
// ------------------- PROTOTIPOS DE LAS FUNCIONES PRIVADAS --------------------
// -----------------------------------------------------------------------------

void __attribute__((interrupt, no_auto_psv)) _U2TXInterrupt(void);
void __attribute__((interrupt, no_auto_psv)) _U2RXInterrupt(void);
void ponerEnColaTransmisionUART2(unsigned char uc_caracter);
void transmitirUART2(void);

// -----------------------------------------------------------------------------
// ---------------------------- FUNCIONES PÚBLICAS -----------------------------
// -----------------------------------------------------------------------------

void inicializarUART2(unsigned long baudrate)
{
    U2BRG = (FCY/baudrate)/16 - 1;  // transmission speed 

    U2MODEbits.STSEL   = 0;   // Stop bits: 1
    U2MODEbits.PDSEL   = 0;   // Data bits: 8, Parity: none
    U2MODEbits.ABAUD   = 0;   // Disable speed detection
    U2MODEbits.BRGH    = 0;   // Low Speed mode
    U2MODEbits.UEN     = 0;   // Use only U2TX and U1RX
    U2MODEbits.USIDL   = 0;   // Keep module active in rest mode

    U2STAbits.UTXISEL0 = 0;   // TX Interrupt: when U1TXREG empty
    U2STAbits.UTXISEL1 = 1;
    U2STAbits.URXISEL  = 0;   // RX Interrupt: Each received character

    IPC7bits.U2TXIP = PR_INT_TX; // TX Interrupt priority
    IPC7bits.U2RXIP = PR_INT_RX; // RX Interrupt priority

    IFS1bits.U2TXIF    = 0;   // Clear TX Interrupt Flag
    IFS1bits.U2RXIF    = 0;   // Clear RX Interrupt Flag

    IEC1bits.U2TXIE    = 0;   // Disable transmission interruptions
    IEC1bits.U2RXIE    = 1;   // Enable reception interruptions

    U2MODEbits.UARTEN  = 1;   // Enable UART module 
    U2STAbits.UTXEN    = 1;   // Enable transmission (only if UARTEN = 1)

    // Configure microcontroller pins: RB6 and RB7 are used for RX and TX
    __builtin_write_OSCCONL(OSCCON & 0xBF);  // Unlock PPS
    RPINR19bits.U2RXR = 6;  // Assign U2RX to pin 15 => RP6
    RPOR3bits.RP7R    = 5;  // Assign U2TX to pin 16 => RP7
    __builtin_write_OSCCONL(OSCCON | 0x40);  // Lock PPS

    TRISB |= 1<<6; // Configure RB6 as input (reception)
}

// -----------------------------------------------------------------------------

void procesarUART2(void)
{
    // Mientras haya datos por procesar
    while (ui_icola_rec != ui_icabeza_rec) {
        // A rellenar por la aplicación.
    }

    transmitirUART2();
}

void putsUART2(char *pcad){
    while(*pcad != '\0'){
        ponerEnColaTransmisionUART2(*pcad);
        pcad++; 
    }
    transmitirUART2();
}

char getcharUART2(void)
{
    char char_ret;

    if(ui_icola_rec != ui_icabeza_rec){ // Hay un carácter nuevo
        char_ret = uc_cola_recepcion[ui_icola_rec];
        ui_icola_rec++;
        if(ui_icola_rec == TAM_REC_UART){
            ui_icola_rec=0;
        }
    }else{ // Cola vacía
        char_ret = '\0';
    }
    
    return char_ret;
}
// -----------------------------------------------------------------------------
// ---------------------------- FUNCIONES PRIVADAS -----------------------------
// -----------------------------------------------------------------------------

/**
 * Rutina de atención a la interrupción de la UART asociada a la transmisión.
 */
void __attribute__((interrupt,no_auto_psv)) _U2TXInterrupt(void)
{
    IFS1bits.U2TXIF = 0;  // Borrar la bandera de la interrupción

    if (ui_icola_tr != ui_icabeza_tr){ // Hay datos en la cola
        U2TXREG = uc_cola_transmision[ui_icola_tr++];

        if (ui_icola_tr == TAM_TR_UART){
            ui_icola_tr = 0;
        }
    }else{ // Cola vacía. Se deshabilita la interrupción de transmisión para
           // que no estemos continuamente interrumpiendo al no tener datos
           // que transmitir.
        IEC1bits.U2TXIE = 0;
    }
}

// -----------------------------------------------------------------------------

/**
 * Rutina de atención a la interrupción de la UART asociada a la recepción.
 *
 * La rutina introduce el caracter recibido en la cola sólo si ésta no está
 * llena. Si lo está enciende el LED RB12 de la tarjeta para avisar al usuario.
 * en este caso el caracter recibido por la interrupción se pierde.
 */
void __attribute__((interrupt,no_auto_psv)) _U2RXInterrupt(void)
{
    IFS1bits.U2RXIF = 0;  // Borrar la bandera de la interrupción

    if( (ui_icabeza_rec+1 == ui_icola_rec) ||
        (ui_icabeza_rec+1 == TAM_REC_UART && ui_icola_rec == 0) ){
        // Cola llena
        PORTB &= ~(1<<13); // Enciende led RB13
    }else{
        uc_cola_recepcion[ui_icabeza_rec] = U2RXREG;
        ui_icabeza_rec++;
        if (ui_icabeza_rec == TAM_TR_UART){
            ui_icabeza_rec = 0;
        }
    }
}

// -----------------------------------------------------------------------------

/**
 * Coloca un dato en la cola de transmisión.
 *
 * La función introduce el carácter en la cola sólo si ésta no está llena. Si
 * lo está enciende el LED RB12 de la tarjeta para avisar al usuario. En este
 * caso el caracter enviado a la función se pierde.
 *
 * @param[in]  uc_caracter  Caracter que se quiere poner en cola.
 */
void ponerEnColaTransmisionUART2(unsigned char uc_caracter)
{
    if( (ui_icabeza_tr+1 == ui_icola_tr) ||
        (ui_icabeza_tr+1 == TAM_TR_UART && ui_icola_tr == 0) ){
        // Cola llena
        PORTB &= ~(1<<12); // Enciende led RB12
    }else{
        uc_cola_transmision[ui_icabeza_tr] = uc_caracter;
        ui_icabeza_tr++;
        if (ui_icabeza_tr == TAM_TR_UART){
            ui_icabeza_tr = 0;
        }
    }
}

// -----------------------------------------------------------------------------

/**
 * Envía todos los datos almacenados en la cola de transmisión.
 */
void transmitirUART2(void)
{
    IEC1bits.U2TXIE = 1;  // Habilitar las interrupciones de transmisión
    IFS1bits.U2TXIF = 1;  // Provocar una interrupción para emprezar a transmitir
}

