// include

module ImmGen(
    input [6:0] i_opcode,
    input [2:0] i_func3, // likely wont need
    input [31:0] i_ins,

    output reg [31:0] o_imm
);


    always @(*) begin
        o_imm = 32'b0;

        case(i_opcode) begin
            `OP_ALU_IMM: begin
                o_imm =  { {20{i_ins[31]}}, i_ins[31:20] }; // sign extend
            end 
            `OP_LOAD: begin
                o_imm =  { {20{i_ins[31]}}, i_ins[31:20] }; 
            end 
            `OP_BRANCH: begin
                o_imm =  { {20{i_ins[31]}}, i_ins[7], i_ins[30:25], i_ins[11:8], 1'b0};
            end
            `OP_STORE: begin
                o_imm =  { {20{i_ins[31]}}, i_ins[31:25], i_ins[11:7] }; 
            end
            `OP_JALR: begin
                o_imm =  { {20{i_ins[31]}}, i_ins[31:20] }; 
            end
            `OP_LUI: begin
                o_imm =  { i_ins[31:12], 12'b0 }; 
            end
            `OP_AUIPC: begin
                o_imm =  { i_ins[31:12], 12'b0 }; 
            end
            `OP_JAL: begin
                o_imm =  { {12{i_ins[31]}}, i_ins[19:12], i_ins[20], i_ins[30:21], 1'b0}; 
            end
            default: o_imm = 32'bx;
        end
    end
