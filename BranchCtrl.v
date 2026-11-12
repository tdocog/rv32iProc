module BranchCtrl(
    input [4:0] i_rd;
    input [2:0] i_func3;
    input [6:0] i_func7;

    input i_Branch;
    input i_isZero;
    input i_isLT;
    input i_isLTU;

    output reg o_branchTaken;
);
    // This module calculates if a branch is to be taken using flags
    // from the ALU and the func3 bits
    // considered having own alu / branch target unit but i can worry 
    // about that later when i am pipelining or multi issue

    always @(*) begin
        o_branchTaken = 0;

        case(i_nfunc3)
            3'b000: begin // BEQ
                // we take branch is its a branch instruction AND 
                // output from (rs1 - rs2 == 0) == 1
                o_branchTaken = isZero && i_Branch;
            end

            3'b001: begin // BNE
                // we take branch is its a branch instruction AND 
                // output from (rs1 - rs2 != 0) == 1
                o_branchTaken = !isZero && i_Branch;
            end

            3'b100: begin // BLT
                // we take branch is its a branch instruction AND 
                // output from (rs1 < rs2) == 1
                o_branchTaken = i_isLT && i_Branch;
            end

            3'b110: begin // BLTU
                // we take branch is its a branch instruction AND 
                // output from (rs1 < rs2) == 1
                o_branchTaken = i_isLTU && i_Branch;
            end

            3'b101: begin // BGE
                // we take branch is its a branch instruction AND 
                // output from (rs1 >= rs2) == 1
                o_branchTaken = !i_isLT && i_Branch;
            end

            3'b111: begin // BGEU
                // we take branch is its a branch instruction AND 
                // output from (rs1 >= rs2) == 1
                o_branchTaken = !i_isLTU && i_Branch;
            end
    end
