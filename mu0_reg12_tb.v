// MU0 12 bit register testbench
// P W Nutter (based on a design by Jeff Pepper)
// Date 20/8/2021
//

// Do not touch the following line it is required for simulation
`timescale 1ns/100ps

// module header

module mu0_reg12_tb();

// Define any internal connections

reg Clk;
reg Reset;
reg En;
reg [11:0] D;
wire [11:0] Q;


// Instantiate mu0_reg12 as dut (device under test)


mu0_reg12 dut(Clk,Reset,En,D,Q);


// Test vectors

initial Clk = 0;

always
begin
#50
Clk = ~Clk;
end

initial begin
Reset <= 12'b0; En <= 12'b0; D <= 12'b0;
#100
Reset <= 12'b0; En <= 12'b0; D <= 12'b1;
#100
Reset <= 12'b0; En <= 12'b1; D <= 12'b1;
#100
Reset <= 12'b0; En <= 12'b0; D <= 12'b1;
#100
Reset <= 12'b1; En <= 12'b0; D <= 12'b0;
#100
Reset <= 12'b0; En <= 12'b1; D <= 12'b1;
#100
Reset <= 12'b0; En <= 12'b1; D <= 12'b0;
#100
Reset <= 12'b0; En <= 12'b1; D <= 12'b1;


  #100 $finish;      // end the simulation
end

// Save results as VCD file
// Do not change
initial
 begin
  $dumpfile("mu0_reg12_tb_results.vcd");  // Save simulation waveforms in this file
  $dumpvars; // Capture all simulation waveforms
 end

endmodule
