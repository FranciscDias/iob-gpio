   // GPIO
   input [`GPIO_INPUT_W-1:0] gpio_input,
   input [`GPIO_INPUT_W-1:0] gpio_set,			     
   output [`GPIO_OUTPUT_W-1:0] gpio_output,
   output [`GPIO_OUTPUT_W-1:0] gpio_output_enable,
   output [7:0] CA,
   output [3:0] AN,
