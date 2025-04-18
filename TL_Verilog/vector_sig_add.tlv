\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   $out1[7:0] = $in1[6:0] + $in2[6:0];
   $out2[6:0] = $in1[6:0] - $in2[4:0];
   $out3[6:0] = $in1[6:0] / $in2[2:0];
   $out4[5:0] = $in1[2:0] * $in2[2:0]
   $out5[6:0] = $in1[6:0] % $in2[2:0];  
   
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule