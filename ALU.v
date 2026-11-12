`define ADD	4'b0000
`define SUB	4'b0001
`define AND	4'b0010
`define OR 4'b0011
`define XOR 4'b0100
`define SLT 4'b0101
`define SLTU 4'b0110
`define SLL 4'b0111
`define SRL 4'b1000
`define SRA 4'b1001

`define PASS1 4'b1010
`define PASS2 4'b1110
`define NOP 4'b1111

module Alu(
    //inputs
    input [31:0] bus1;
    input [31:0] bus2;
    input [3:0] aluCtrl; // how wide this is depends on number on ins
    
    //outputs 
    output isZero;  
    output [31:0] busOut;
    // overflows are ignore in rv32i
);

    always @(aluCtrl or bus1 or bus2) begin
        case(aluCtrl) 
            'ADD: begin  
                busOut = bus1 + bus2;
            end

            `SUB: begin
                busOut = bus1 - bus2;
            end

            `AND: begin
                busOut = bus1 & bus2;
            end

            `AND: begin
                busOut = bus1 - bus2;
            end

            `OR: begin
                busOut = bus1 | bus2;
            end

            `XOR: begin
                busOut = bus1 ^ bus2;
            end

            `STL: begin
                butOut = ($signed(bus1) < $signed(bus2));
            end

            `STLU: begin
                butOut = (bus1 < bus2);
            end

            `SLL: begin
                butOut = bus1 << bus2;
            end

            `SRA: begin
                butOut = $signed(bus1) >>> bus2;
            end

            `PASS1: begin
                butOut = bus1;
            end

            `PASS2: begin
                butOut = bus2;
            end

            `NOP: begin
                butOut = 32'b0;
            end
    end



