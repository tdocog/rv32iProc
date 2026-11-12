module Decoder(
    //inputs
    input [31:0] i_ins,
    
    //outputs 
    output reg [6:0] o_opcode, 
    output reg [4:0] o_rd, 
    output reg [2:0] o_func3, 
    output reg [4:0] o_rs1, 
    output reg [4:0] o_rs2, 
    output reg [6:0] o_func7 
);

always @(i_ins) begin
    o_opcode = i_ins[6:0], 
    o_rd = i_ins[11:7], 
    o_func3 = i_ins[14:12], 
    o_rs1 = i_ins[19:15], 
    o_rs2 = i_ins[24:20], 
    o_func7 = i_ins[31:25], 
end
