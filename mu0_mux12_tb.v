// MU0 12 bit, 2 to 1 MUX testbench
// P W Nutter (based on a design by Jeff Pepper)
// Date 20/8/2021
//

// Do not touch the following line it is required for simulation
`timescale 1ns/100ps

// module header

module mu0_mux12_tb();

// Define any internal connections

reg [11:0] A;
reg [11:0] B;
reg S;
wire [11:0] Q;

// Instantiate mu0_mux12 as dut (device under test)

mu0_mux12 dut(A,B,S,Q);

// Test vectors
initial
 begin


A = 12'b0; B = 12'b1; S = 12'b0;
#100
A = 12'b0; B = 12'b1; S = 12'b0;
#100
A = 12'b0; B = 12'b1; S = 12'b0;
#100
A = 12'b0; B = 12'b1; S = 12'b1;
#100
A = 12'b1; B = 12'b0; S = 12'b1;
#100
A = 12'b1; B = 12'b0; S = 12'b0;
#100
A = 12'b1; B = 12'b0; S = 12'b0;
#100
A = 12'b1; B = 12'b0; S = 12'b1;


  #100 $finish; // exit the simulation
 end

// Save results as VCD file
// Do not change
initial
 begin
  $dumpfile("mu0_mux12_tb_results.vcd");  // Save simulation waveforms in this file
  $dumpvars; // Capture all simulation waveforms
 end

endmodule
