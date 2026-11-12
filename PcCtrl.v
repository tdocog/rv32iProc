module PcCtrl(
    input i_jumpTaken;
    input i_branchTaken;
    input [31:0] i_pc;
    input [31:0] i_imm;
    input [31:0] i_jumpTarget;

    output reg [31:0] o_nextPc;
);

    
    always(*) begin

        // default case
        o_nextPc = i_pc + 3'b100; // pc + 4

        if (i_jumpTaken) begin
            o_nextPc = i_jumpTarget;
        end

        if (i_branchTaken) begin
            o_nextPc = i_pc + i_imm;
        end

    end
