################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Main/demo/demo.cpp 

OBJS += \
./Main/demo/demo.o 

CPP_DEPS += \
./Main/demo/demo.d 


# Each subdirectory must supply rules for building sources it contributes
Main/demo/%.o: ../Main/demo/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: MCU G++ Compiler'
	@echo $(PWD)
	arm-none-eabi-g++ -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -std=c++1y '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/Projects/GitHub/stm32f103-vga-demo/Inc" -I"D:/Projects/GitHub/stm32f103-vga-demo/Main" -I"D:/Projects/GitHub/stm32f103-vga-demo/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/Projects/GitHub/stm32f103-vga-demo/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/Projects/GitHub/stm32f103-vga-demo/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/Projects/GitHub/stm32f103-vga-demo/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/Projects/GitHub/stm32f103-vga-demo/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/Projects/GitHub/stm32f103-vga-demo/Drivers/CMSIS/Include"  -O2 -Wall -fmessage-length=0 -ffunction-sections -c -fno-exceptions -fno-rtti -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


