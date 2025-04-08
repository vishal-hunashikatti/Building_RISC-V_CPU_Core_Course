# LFD111x: Building RISC-V CPU Core Course

## File Structure and Tool Flow

'''
TL-Verilog features are used to define the logic within a (System)Verilog module. Code comments below explain the parts of a TL-Verilog source file structured for use within Makerchip.

\m4_TLV_version 1d --bestsv: tl-x.org
   // This version line specifies:
   //   o that macro preprocessing using M4 is enabled
   //   o the language version in use (1d)
   //   o optionally command-line arguments
   //   o a link to docs.

\SV
   // This region contains SystemVerilog (or Verilog) code.
   // SandPiper passes this code through to the Verilog file without
   // any processing.

   m4_makerchip_module
      // This M4 macro expands to a Verilog module definition with
      // an interface that is required by the Makerchip platform.
      // This module interface provides the communication between
      // Makerchip and your design.
      //
      // It includes global clock and reset input signals
      // via this interface and its output signals “passed”
      // and “failed” can be driven to end the simulation with a
      // “Simulation Passed” or “Simulation FAILED” message in the
      // LOG.
      //
      // To see the expansion of this macro, look in the NAV-TLV
      // pane. This macro also provides a random vector that can
      // be used for stimulus and it provides some Verilator
      // configuration.

\TLV
   // TL-Verilog syntax is enabled in this region to express your
   // logic. In this course, we’ll always declare our logic
   // here within the m4_makerchip_module, but you could also
   // put your TLV logic in a separate module with an interface
   // that is yours to define.

   $reset = *reset;
      // In \TLV context, *reset references the (System)Verilog
      // reset signal. Here we simply connect it to a TL-Verilog
      // $reset pipesignal.

   // YOUR LOGIC HERE

   *passed = ...;
   *failed = ...;
      // Assert either of these to end simulation (before Makerchip
      // cycle limit).

\SV
   // Back to SystemVerilog context to end the module.
   endmodule

'''
