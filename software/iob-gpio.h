#include <stdbool.h>

#include "iob_gpio_swreg.h"

//GPIO functions

//Set GPIO base address
void gpio_init(int base_address);

//Get values from inputs
uint8_t gpio_button1_get();

uint8_t gpio_button2_get();

uint8_t gpio_jump_get();

uint8_t gpio_switch_get();

//Set values on outputs
void gpio_set(uint32_t outputs);

//Set mask for outputs (bits 1 are driven outputs, bits 0 are tristate)
void gpio_set_output_enable(uint32_t value);

void gpio_set_anode_output(uint8_t);

void gpio_set_jump_output(uint8_t);


