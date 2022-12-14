// MU0 design - structural style
// P W Nutter (based on a design by Jeff Pepper)
// Date 20/8/2021
// 

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps

// for simulation purposes, do not delete
`default_nettype none

module mu0(input  wire         Clk,
           input  wire         Reset,
           input  wire [15:0]  Data_in,
           output wire         Rd,
           output wire         Wr,
           output wire [11:0]  Addr,
           output wire [15:0]  Data_out,
           output wire         Halted);

// Internal flags
wire N;
wire Z;


// Define any internal signals
wire [3:0] F;       //F from datapath to control
wire fet;              //fetch from control to datapath
wire PC_En;         //PC_En from control to datapath
wire IR_En;         //IR_En from control to datapath
wire Acc_En;        //Acc_En from control to datapath
wire X_sel;         //X_sel from control to datapath
wire Y_sel;         //Y_sel from control to datapath
wire Addr_sel;      //Addr_sel from control to datapath
wire [1:0] M;             //M from control to datapath         


//Instantiate Datapath

mu0_control control(Clk,Reset,F[3:0],N,Z,fet,PC_En,IR_En,Acc_En,X_sel,Y_sel,Addr_sel,M[1:0],Rd,Wr,Halted);
 
// Instantiate Control

mu0_datapath datapath(Clk,Reset,Data_in[15:0],X_sel,Y_sel,Addr_sel,PC_En,IR_En,Acc_En,M[1:0],F[3:0],Addr[11:0],Data_out[15:0],N,Z);

endmodule 

// for simulation purposes, do not delete
`default_nettype wire
