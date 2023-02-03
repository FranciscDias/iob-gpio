   //
   // GPIO
   //

   iob_gpio gpio0
     (
      .clk     (clk),
      .rst     (rst),

      // Registers interface
      .gpio_output (gpio_output),
      .gpio_output_enable (gpio_output_enable),

      // CPU interface
      .valid   (slaves_req[`valid(`GPIO)]),
      .address (slaves_req[`address(`GPIO,`iob_gpio_swreg_ADDR_W+2)-2]),
      .wdata   (slaves_req[`wdata(`GPIO)]),
      .wstrb   (slaves_req[`wstrb(`GPIO)]),
      .rdata   (slaves_resp[`rdata(`GPIO)]),
      .ready   (slaves_resp[`ready(`GPIO)]),

      .JUMP_IN(JUMP_IN),
      .JUMP_OUT(JUMP_OUT),
      .PIN(PIN),
      .AN(AN),
      .BTN_1(BTN_1),
      .BTN_2(BTN_2),
      .SWITCH(SWITCH)
      );
