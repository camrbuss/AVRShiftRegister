CC=avr-gcc
OBJCOPY=avr-objcopy
BUILD_DIR = build
TARGET = cam
MCU = atmega328p
DEVICE = __AVR_ATmega328P__
F_CPU = 16000000

PORT=/dev/tty.wchusbserial40


default: $(BUILD_DIR)
		$(CC) -Os -D$(DEVICE) -DF_CPU=$(F_CPU) -mmcu=$(MCU) -c -o $(BUILD_DIR)/$(TARGET).o $(TARGET).c
		$(CC) -mmcu=$(MCU) $(BUILD_DIR)/$(TARGET).o -o $(BUILD_DIR)/$(TARGET).elf
		$(OBJCOPY) -O ihex -R .eeprom $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex

flash: default
		avrdude -c arduino -p m328p -P $(PORT) -b 57600 -Uflash:w:$(BUILD_DIR)/$(TARGET).hex:i

clean:
		-rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	mkdir $@
