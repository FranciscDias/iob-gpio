   // GPIO
   input                     BTN_1,
   input                     BTN_2,
   input                     JUMP_IN,
   input            	     SWITCH,
   output                    JUMP_OUT,
   output [7:0] 	     PIN,
   output [3:0]              AN,
   output [`GPIO_OUTPUT_W-1:0] gpio_output,
   output [`GPIO_OUTPUT_W-1:0] gpio_output_enable,
   
