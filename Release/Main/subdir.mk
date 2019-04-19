################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Main/vgaDraw.s 

CPP_SRCS += \
../Main/font8x8.cpp \
../Main/main.cpp \
../Main/timing.cpp \
../Main/vga.cpp \
../Main/vgaCore.cpp \
../Main/vgaText.cpp 

OBJS += \
./Main/font8x8.o \
./Main/main.o \
./Main/timing.o \
./Main/vga.o \
./Main/vgaCore.o \
./Main/vgaDraw.o \
./Main/vgaText.o 

CPP_DEPS += \
./Main/font8x8.d \
./Main/main.d \
./Main/timing.d \
./Main/vga.d \
./Main/vgaCore.d \
./Main/vgaText.d 


# Each subdirectory must supply rules for building sources it contributes
Main/%.o: ../Main/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: MCU G++ Compiler'
	@echo $(PWD)
	arm-none-eabi-g++ -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -std=c++1y '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/Projects/GitHub/stm32f103-vga-demo/Inc" -I"D:/Projects/GitHub/stm32f103-vga-demo/Main" -I"D:/Projects/GitHub/stm32f103-vga-demo/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/Projects/GitHub/stm32f103-vga-demo/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/Projects/GitHub/stm32f103-vga-demo/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/Projects/GitHub/stm32f103-vga-demo/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/Projects/GitHub/stm32f103-vga-demo/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/Projects/GitHub/stm32f103-vga-demo/Drivers/CMSIS/Include"  -O2 -Wall -fmessage-length=0 -ffunction-sections -c -fno-exceptions -fno-rtti -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Main/%.o: ../Main/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Assembler'
	@echo $(PWD)
	arm-none-eabi-as -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -g -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


