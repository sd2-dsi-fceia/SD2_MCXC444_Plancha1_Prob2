/*==================[inclusions]=============================================*/

// Standard C Included Files
#include <string.h>
#include <stdio.h>
#include <stdbool.h>

// Project Included Files
#include "SD2_board.h"
#include "key.h"

/*==================[macros and definitions]=================================*/
typedef enum {

	EST_MEF_INICIO,
	EST_MEF_SEC_PRIMERO,
	EST_MEF_SEC_A_2DO,
	EST_MEF_SEC_A_3RO,
	EST_MEF_SEC_B_2DO,
	EST_MEF_SEC_B_3RO,
} estMef_enum;




/*==================[internal data declaration]==============================*/

/*==================[internal functions declaration]=========================*/

/*==================[internal data definition]===============================*/

/*==================[external data definition]===============================*/

/*==================[internal functions definition]==========================*/

void mefSecuencia(void) {
	static estMef_enum estMefSec = EST_MEF_INICIO;

	switch (estMefSec) {

	case EST_MEF_INICIO:

		if (key_getPressEv(BOARD_SW_ID_2)) {
			estMefSec = EST_MEF_SEC_PRIMERO;
			key_getPressEv(BOARD_SW_ID_3);  // por si antes fue presionado SW3
		}
		break;

	case EST_MEF_SEC_PRIMERO:
		if (key_getPressEv(BOARD_SW_ID_2 && !key_getPressEv(BOARD_SW_ID_3))) {
			estMefSec = EST_MEF_SEC_A_2DO;
			key_getPressEv(BOARD_SW_ID_3); // redundante !!!!! ¿por qué?
		}
		if (key_getPressEv(BOARD_SW_ID_3)) {
			estMefSec = EST_MEF_SEC_B_2DO;
			key_getPressEv(BOARD_SW_ID_2);
		}
		break;

	case EST_MEF_SEC_A_2DO:
		if (key_getPressEv(BOARD_SW_ID_3)) {
			estMefSec = EST_MEF_SEC_A_3RO;
			board_setLed(BOARD_LED_ID_ROJO, BOARD_LED_MSG_TOGGLE);
			key_getPressEv(BOARD_SW_ID_2);
		}
		break;

	case EST_MEF_SEC_A_3RO:
		if (key_getPressEv(BOARD_SW_ID_2)) {
			estMefSec = EST_MEF_SEC_PRIMERO;
			key_getPressEv(BOARD_SW_ID_3);
		}
		if (key_getPressEv(BOARD_SW_ID_3) && !key_getPressEv(BOARD_SW_ID_2)) {
			estMefSec = EST_MEF_SEC_B_3RO;
			board_setLed(BOARD_LED_ID_VERDE, BOARD_LED_MSG_TOGGLE);
		}

		break;

	case EST_MEF_SEC_B_2DO:

		if (key_getPressEv(BOARD_SW_ID_2)) {
			estMefSec = EST_MEF_SEC_PRIMERO;
			key_getPressEv(BOARD_SW_ID_3);
		}
		if (key_getPressEv(BOARD_SW_ID_3) && !key_getPressEv(BOARD_SW_ID_2)) {
			board_setLed(BOARD_LED_ID_VERDE, BOARD_LED_MSG_TOGGLE);
			estMefSec = EST_MEF_SEC_B_3RO;
		}

		break;

	case EST_MEF_SEC_B_3RO:
		if (key_getPressEv(BOARD_SW_ID_2)) {
			estMefSec = EST_MEF_SEC_PRIMERO;
			key_getPressEv(BOARD_SW_ID_3);
		}

		break;

	default:
		estMefSec = EST_MEF_INICIO;

	}
}


/*==================[external functions definition]==========================*/

int main(void) {
	// Se inicializan funciones de la placa
	board_init();

	// Inicializa keyboard
	key_init();

	/* inicializa interrupción de systick cada 1 ms */
	SysTick_Config(SystemCoreClock / 1000U);

	board_setLed(BOARD_LED_ID_ROJO, BOARD_LED_MSG_ON);
	board_setLed(BOARD_LED_ID_VERDE, BOARD_LED_MSG_ON);

	while (1) {
		mefSecuencia();

	}
}

void SysTick_Handler(void) {
	key_periodicTask1ms();

}

/*==================[end of file]============================================*/


