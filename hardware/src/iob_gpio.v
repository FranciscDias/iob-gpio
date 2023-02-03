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
    input BTN_1,
    input BTN_2,
    input JUMP_IN,
    input SWITCH,
    // output enable can be used to tristate outputs on external module
    output [GPIO_W-1:0] gpio_output_enable,
    output [GPIO_W-1:0] gpio_output,
    output [7:0]        PIN,
    output              JUMP_OUT,
    output [7:0]        anode_output,
    output [3:0]        AN,
 
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
   
    `IOB_WIRE(GPIO_JUMP_OUTPUT, 8)
    iob_reg #(8)
    trigger_output_reg   (
        .clk       (clk),
        .arst      (rst),
        .rst       (rst),
        .en        (GPIO_JUMP_OUTPUT_en),
        .data_in   (GPIO_JUMP_OUTPUT_wdata),        
        .data_out  (GPIO_JUMP_OUTPUT)			 
    );

   // Read GPIO
   assign GPIO_BUTTON1_INPUT_rdata = BTN_1;
   assign GPIO_BUTTON2_INPUT_rdata = BTN_2;
   assign GPIO_JUMP_INPUT_rdata = JUMP_IN;
   assign GPIO_SWITCH_INPUT_rdata = SWITCH;
   
   
   // Write GPIO
   assign JUMP_OUT = GPIO_JUMP_OUTPUT;
   assign gpio_output = GPIO_OUTPUT;
   assign gpio_output_enable = GPIO_OUTPUT_ENABLE;
   assign PIN = GPIO_OUTPUT_ENABLE;
   assign anode_output = GPIO_ANODE_OUTPUT;
   assign AN = GPIO_ANODE_OUTPUT;
   
         
endmodule
