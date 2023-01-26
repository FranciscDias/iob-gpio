`timescale 1ns/1ps

`include "iob_lib.vh"
`include "iob_gpio_swreg_def.vh"

module iob_gpio 
  # (
     parameter GPIO_W = 32, //PARAM Number of GPIO (can be up to DATA_W)
     parameter DATA_W = 32, //PARAM CPU data width
     parameter ADDR_W = `iob_gpio_swreg_ADDR_W //MACRO CPU address section width
     )
   (

   //CPU interface
`include "iob_s_if.vh"

    // inputs and outputs have dedicated interface
    input [GPIO_W-1:0] gpio_input,
 //   input [7:0] echo_input,
 //   input [GPIO_W-1:0] cathode_input,
 //   input [GPIO_W-1:0] anode_input,
    // output enable can be used to tristate outputs on external module
    output [GPIO_W-1:0] gpio_output_enable,
    output [GPIO_W-1:0] gpio_output,
    output [7:0]        PIN,
    output [7:0] anode_output,
    output [3:0] AN,
 //   output [7:0] trigger_output,
 //   output [GPIO_W-1:0] anode_output,  
 
`include "iob_gen_if.vh"
    );

//BLOCK Register File & Configuration control and status register file.
`include "iob_gpio_swreg_gen.vh"

    // SWRegs
    `IOB_WIRE(GPIO_OUTPUT_ENABLE, DATA_W)
    iob_reg #(.DATA_W(DATA_W))
    gpio_output_enable_reg (
        .clk        (clk),
        .arst       (rst),
        .rst        (rst),
        .en         (GPIO_OUTPUT_ENABLE_en),
        .data_in    (GPIO_OUTPUT_ENABLE_wdata),
        .data_out   (GPIO_OUTPUT_ENABLE)
    );

    `IOB_WIRE(GPIO_OUTPUT, DATA_W)
    iob_reg #(.DATA_W(DATA_W))
    gpio_output_reg      (
        .clk        (clk),
        .arst       (rst),
        .rst        (rst),
        .en         (GPIO_OUTPUT_en),
        .data_in    (GPIO_OUTPUT_wdata),
        .data_out   (GPIO_OUTPUT)
    );

  /* `IOB_WIRE(GPIO_CATHODE_OUTPUT, DATA_W)
   iob_reg #(.DATA_W(DATA_W))
   cathode_output_reg    (
        .clk       (clk),
        .arst      (rst),
        .rst       (rst),			  
        .en        (GPIO_CATHODE_OUTPUT_en),
        .data_in   (GPIO_CATHODE_OUPUT_wdata),	     
        .data_out  (GPIO_CATHODE_OUTPUT)
    );
   */
    `IOB_WIRE(GPIO_ANODE_OUTPUT, 8)
    iob_reg #(8)
    anode_output_reg   (
         .clk       (clk),
         .arst      (rst),
         .rst       (rst),
         .en        (GPIO_ANODE_OUTPUT_en),
         .data_in   (GPIO_ANODE_OUTPUT_wdata),        
         .data_out  (GPIO_ANODE_OUTPUT)			 
    );
   /*
    `IOB_WIRE(GPIO_TRIGGER_OUTPUT, 8)
    iob_reg #(8)
    trigger_output_reg   (
        .clk       (clk),
        .arst      (rst),
        .rst       (rst),
        .en        (GPIO_TRIGGER_OUTPUT_en),
        .data_in   (GPIO_TRIGGER_OUTPUT_wdata),        
        .data_out  (GPIO_TRIGGER_OUTPUT)			 
    );*/

   // Read GPIO
   assign GPIO_INPUT_rdata = gpio_input;
   /*assign GPIO_ECHO_INPUT_rdata = echo_input;
   assign GPIO_CATHODE_rdata = cathode_input;
   assign GPIO_ANODE_rdata = anode_input;*/

   // Write GPIO
   assign gpio_output = GPIO_OUTPUT;
   assign gpio_output_enable = GPIO_OUTPUT_ENABLE;
   assign PIN = GPIO_OUTPUT_ENABLE;
   
   
   /*assign cathode_output = GPIO_CATHODE_OUTPUT;
   assign trigger_output = GPIO_TRIGGER_OUTPUT;*/
   assign anode_output = GPIO_ANODE_OUTPUT;
   assign AN = GPIO_ANODE_OUTPUT;
   
   
      
endmodule
