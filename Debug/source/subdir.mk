################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/Plancha1_Prob2.c \
../source/SD2_board.c \
../source/key.c \
../source/mtb.c \
../source/semihost_hardfault.c 

C_DEPS += \
./source/Plancha1_Prob2.d \
./source/SD2_board.d \
./source/key.d \
./source/mtb.d \
./source/semihost_hardfault.d 

OBJS += \
./source/Plancha1_Prob2.o \
./source/SD2_board.o \
./source/key.o \
./source/mtb.o \
./source/semihost_hardfault.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MCXC444VLH -DCPU_MCXC444VLH_cm0plus -DSERIAL_PORT_TYPE_UART=1 -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\board" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\source" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\drivers" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\CMSIS" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\CMSIS\m-profile" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\utilities" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\utilities\debug_console\config" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\device" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\device\periph2" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\utilities\debug_console" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\component\serial_manager" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\component\lists" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\utilities\str" -I"C:\Users\Walte\Documents\MCUXpressoIDE_24.12.148\workspace\SD2_1_MCXC444_Plancha1_Prob2\component\uart" -O0 -fno-common -g3 -gdwarf-4 -Wall -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source

clean-source:
	-$(RM) ./source/Plancha1_Prob2.d ./source/Plancha1_Prob2.o ./source/SD2_board.d ./source/SD2_board.o ./source/key.d ./source/key.o ./source/mtb.d ./source/mtb.o ./source/semihost_hardfault.d ./source/semihost_hardfault.o

.PHONY: clean-source

