\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
   /* verilator lint_on WIDTH */
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/LF-Building-a-RISC-V-CPU-Core/main/lib/calc_viz.tlv']).
\TLV
   $reset = *reset;
   $val1[31:0] = >>1$out;
   $val2[31:0] = {28'b0,$val2_rand[3:0]};
   
   $sum[31:0] = $val1 + $val2;
   $diff[31:0] = $val1 - $val2;   // No need to declare range again for the same variables
   $prod[31:0] = $val1 * $val2;
   $quot[31:0] = $val1 / $val2;
   
   $out[31:0] = $reset ? 32'b0 :
                $op[1:0] == 2'b00 ? $sum :
                $op == 2'b01 ? $diff :
                $op == 2'b10 ? $prod : 
                               $quot; // Default operation
   
   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   m4+calc_viz()
\SV
   endmodule
