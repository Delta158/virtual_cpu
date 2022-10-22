// MU0 16 bit register testbench
// P W Nutter (based on a design by Jeff Pepper)
// Date 20/8/2021
//

// Do not touch the following line it is required for simulation
`timescale 1ns/100ps

// module header

module mu0_reg16_tb();

// Define any internal connections

reg Clk;
reg Reset;
reg En;
reg [15:0] D;
wire [15:0] Q;


// Instantiate mu0_reg16 as dut (device under test)



mu0_reg16 dut(Clk,Reset,En,D,Q);



// Test vectors

initial Clk= 0;

always
begin
#50
Clk = ~Clk;
end


initial
 begin
Reset = 16'b0; En = 16'b0; D = 16'b0;
#100
Reset = 16'b0; En = 16'b0; D = 16'b0;
#100
Reset = 16'b0; En = 16'b1; D = 16'b1;
#100
Reset = 16'b0; En = 16'b0; D = 16'b0;
#100
Reset = 16'b1; En = 16'b0; D = 16'b0;
#100
Reset = 16'b0; En = 16'b1; D = 16'b1;
#100
Reset = 16'b1; En = 16'b0; D = 16'b1;
#100
Reset = 16'b0; En = 16'b1; D = 16'b1;


  #100 $finish;      // exit the simulation
 end

// Save results as VCD file
// Do not change
initial
 begin
  $dumpfile("mu0_reg16_tb_results.vcd");  // Save simulation waveforms in this file
  $dumpvars; // Capture all simulation waveforms
 end

endmodule
