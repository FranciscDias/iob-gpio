   //
   // GPIO
   //

   iob_gpio gpio0
     (
      .clk     (clk),
      .rst     (rst),

      // Registers interface
      .gpio_input (gpio_input),
      //.echo_input (echo_input),
      //.cathode_input (cathode_input),
      //.anode_input (anode_input),
      .gpio_output (gpio_output),
      .gpio_output_enable (gpio_output_enable),
      //.cathode_output (cathode_output),
      .anode_output (anode_output),
     // .trigger_output (trigger_output),

      // CPU interface
      .valid   (slaves_req[`valid(`GPIO)]),
      .address (slaves_req[`address(`GPIO,`iob_gpio_swreg_ADDR_W+2)-2]),
      .wdata   (slaves_req[`wdata(`GPIO)]),
      .wstrb   (slaves_req[`wstrb(`GPIO)]),
      .rdata   (slaves_resp[`rdata(`GPIO)]),
      .ready   (slaves_resp[`ready(`GPIO)]),

      .PIN(gpio_output_enable),
      .AN(anode_output)
      );
