`include "definitions.vh"
`include "ALUOp.vh"

// DEFINE OPCODE PARSING

module Control(
    // inputs
    input [6:0] i_opcode,
    input [2:0] i_func3,


    // outputs
    output reg o_RegDst
    output reg o_Jump;
    output reg o_Branch;
    output reg o_MemRead;
    output reg o_MemtoReg;
    output reg o_MemWrite;
    output reg o_ALUSrc1;
    output reg o_ALUSrc2;
    output reg o_RegWrite;
    output reg [2:0] o_RegWriteSrc;

);


    always @(*) begin
        // set all control flags to zero
        o_RegDst = 0;  
        o_Jump = 0;
        o_Branch = 0;
        o_MemRead = 0;
        o_MemtoReg = 0;
        //o_ALUOp = `ALU_NOP; // default for now
        o_MemWrite = 0;
        o_ALUSrc1 = 0;
        o_ALUSrc2 = 0;
        o_RegWrite = 0;
        o_regWriteSrc = 2'b01; // ALU out

        case(i_opcode)
            `OP_LUI: begin
                // TODO: Rethink
                o_ALUOp = `ALU_PASS2; // pass bc imm gen handle imm<< 12
                o_ALUSrc2 = 1;
                o_RegWrite = 1;
            end
            `OP_AUIPC: begin
                // TODO: Rethink
                o_ALUOp = `ALU_ADD;
                o_ALUSrc1 = 1; // this give us PC
                o_ALUSrc2 = 1;
                o_RegWrite = 1;
            end
            `OP_JAL: begin
                o_jump = 1;
                o_ALUSrc1 = 1; // PC
                o_ALUSrc2 = 1; // imm from imm gen
                o_RegWrite = 1;
                o_regWriteSrc = 2'b11; // PC + 4 
            end
            `OP_JALR: begin
                o_jump = 1;
                o_ALUSrc2 = 1; // imm from imm gen
                o_RegWrite = 1;
                o_regWriteSrc = 2'b11; // PC + 4 
            end
            `OP_R_TYPE: begin
                o_RegWrite = 1;
                o_RegWriteSrc = 2'b01; //Alu Out
            end
            `OP_ALU_IMM: begin
            // TODO: Make sure we direct shamt bits thru imm gen correctly
                o_ALUSrc2 = 1; // imm gen out
                o_RegWrite = 1;
                o_RegWriteSrc = 2'b01; //Alu Out
            end
            `OP_LOAD: begin
            // TODO: need to handle bytes etc elsewhere
                o_MemWrite = 1;
                o_ALUSrc2 = 1; // imm gen out
                o_RegWrite = 1;
                o_RegWriteSrc = 2'b00; // mem Out
            end
            `OP_STORE: begin
            // TODO: need to handle bytes etc elsewhere
                o_MemWrite = 1;
                o_ALUSrc2 = 1; // imm gen out
                o_MemWrite = 1;
            end
            `OP_BRANCH: begin
                o_Branch = 1;
            end
    end
