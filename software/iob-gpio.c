#include "iob-gpio.h"

//GPIO functions

//Set GPIO base address
void gpio_init(int base_address){
  IOB_GPIO_INIT_BASEADDR(base_address);
}

//Get values from inputs
uint8_t gpio_button1_get(){
  return IOB_GPIO_GET_BUTTON1_INPUT();
}

uint8_t gpio_button2_get(){
  return IOB_GPIO_GET_BUTTON2_INPUT();
}

uint8_t gpio_jump_get(){
  return IOB_GPIO_GET_JUMP_INPUT();
}

uint8_t gpio_switch_get(){
  return IOB_GPIO_GET_SWITCH_INPUT();
}

//Set values on outputs
void gpio_set(uint32_t value){
  IOB_GPIO_SET_OUTPUT(value);
}

//Set mask for outputs (bits 1 are driven outputs, bits 0 are tristate)
void gpio_set_output_enable(uint32_t value){
  IOB_GPIO_SET_OUTPUT_ENABLE(value);
}

void gpio_set_anode_output(uint8_t value){
  IOB_GPIO_SET_ANODE_OUTPUT(value);
}

void gpio_set_jump_output(uint8_t value){
  IOB_GPIO_SET_JUMP_OUTPUT(value);
}

