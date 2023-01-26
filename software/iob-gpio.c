#include "iob-gpio.h"

//GPIO functions

//Set GPIO base address
void gpio_init(int base_address){
  IOB_GPIO_INIT_BASEADDR(base_address);
}

//Get values from inputs
uint32_t gpio_get(){
  return IOB_GPIO_GET_INPUT();
}

uint8_t echo_input(){
  return IOB_GPIO_GET_ECHO_INPUT();
}

uint32_t gpio_cathode_get(){
  return IOB_GPIO_GET_CATHODE_INPUT();
}

uint32_t gpio_anode_get(){
  return IOB_GPIO_GET_ANODE_INPUT();
}

//Set values on outputs
void gpio_set(uint32_t value){
  IOB_GPIO_SET_OUTPUT(value);
}

//Set mask for outputs (bits 1 are driven outputs, bits 0 are tristate)
void gpio_set_output_enable(uint32_t value){
  IOB_GPIO_SET_OUTPUT_ENABLE(value);
}

void trigger_output(uint8_t value){
  IOB_GPIO_SET_TRIGGER_OUTPUT(value);
}

void gpio_set_cathode_output(uint32_t value){
  IOB_GPIO_SET_CATHODE_OUTPUT(value);
}

void gpio_set_anode_output(uint8_t value){
  IOB_GPIO_SET_ANODE_OUTPUT(value);
}

