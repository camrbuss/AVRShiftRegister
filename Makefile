CC=avr-gcc
OBJCOPY=avr-objcopy
BUILD_DIR = build
TARGET = cam
MCU = atmega328p

CFLAGS=-Os -DF_CPU=16000000UL -mmcu=$(MCU)
PORT=/dev/tty.wchusbserial40

# hex: elf
#     $(OBJCOPY) -O ihex -R .eeprom led.elf led.hex

default: $(BUILD_DIR)
		$(CC) -c $(TARGET).c -o $(BUILD_DIR)/$(TARGET).o
		$(OBJCOPY) -O ihex -R .eeprom $(BUILD_DIR)/$(TARGET).o $(BUILD_DIR)/$(TARGET).hex

flash: default
		avrdude -F -c arduino -p m328p -P $(PORT) -b 57600 -U flash:w:$(BUILD_DIR)/$(TARGET).hex:i

clean:
		-rm -rf $(BUILD_DIR)

$(BUILD_DIR):
		mkdir $@
