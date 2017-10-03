// -----------------------------------------------------------------------------
// -- INTERFAZ DEL MÓDULO UART2 (Universal Asynchronous Receiver Transmitter) ---
// -----------------------------------------------------------------------------

/**
 * @file     uart2.h
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

#ifndef _UART2_H
#define _UART2_H

// -----------------------------------------------------------------------------
// ------------------- PROTOTIPOS DE LAS FUNCIONES PÚBLICAS --------------------
// -----------------------------------------------------------------------------

/**
 * Inicializa la UART.
 *
 * Se inicializa la UART para usar una trama de 8 bits de datos sin paridad y
 * con un bit de stop. El módulo usa interrupciones tanto para la recepción como
 * para la transmisión. La comunicación con las rutinas de interrupción se
 * realiza mediante dos colas.
 *
 * @param baudrate Baudrate de la uart en baudios
 */
void inicializarUART2(unsigned long baudrate);

// -----------------------------------------------------------------------------

/**
 * Procesa los mensajes recibidos a través del puerto USB.
 */
void procesarUART2(void);

/**
 * Transmite una cadena de caracteres por la UART.
 *
 * @param pcad cadena de caracteres a transmitir
 */

void putsUART2(char *pcad);

/**
 * Obtiene un caracter de la UART si hay alguno disponible. Si no obtiene un \0
 *
 * @return char leído de la cola de recepción de la UART o \0 si la cola está
 *              vacía.
 */

char getcharUART2(void);
#endif
