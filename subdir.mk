C_SRCS += \
main.c \
clkconfig.c \
cr_startup_lpc13.c

ODIR = build

OBJS += \
main.o \
clkconfig.o \
cr_startup_lpc13.o

_OBJS = $(patsubst %,$(ODIR)/%,$(OBJS))

C_DEPS += \
main.d \
clkconfig.d \
cr_startup_lpc13.d

_C_DEPS = $(patsubst %,$(ODIR)/%,$(C_DEPS))

INCLUDES = include/

EXECUTABLE = $(ODIR)/lpcbin


# Each subdirectory must supply rules for building sources it contributes
%.o: src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -I$(INCLUDES) -DDEBUG -D__USE_CMSIS=CMSISv1p30_LPC13xx -I"/home/kubov/workspace/CMSISv1p30_LPC13xx/inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -mcpu=cortex-m3 -mthumb -MMD -MP -MF"$(ODIR)/$(@:%.o=%.d)" -MT"$(ODIR)/$(@:%.o=%.d)" -o"$(ODIR)/$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


