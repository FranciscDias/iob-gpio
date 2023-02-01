   // GPIO
   input [`GPIO_INPUT_W-1:0] gpio_input,  
   input                     BTN,
   input                     JUMP_IN,
   output                    JUMP_OUT,
   output [7:0] 	     PIN,
   output [3:0]              AN,
   output [`GPIO_OUTPUT_W-1:0] gpio_output,
   output [`GPIO_OUTPUT_W-1:0] gpio_output_enable,
   
