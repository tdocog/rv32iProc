module RegisterFile(
    // inputs 
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input regWrite, // control flag
    input [31:0] busW, // data comes from mem to be written

    // outputs
    output [31:0] bus1,
    output [31:0] bus2,

    // clk
    input CLK
); 

    reg [31:0] regs [31:0]

    always @ (posedge CLK) begin
        // set all default registers 
        regs[0] <= 32'b0; // x0 is hardset to zero
    end

    assign bus1 = regs[rs1];
    assign bus2 = regs[rs2];

    always @ (negedge CLK ) begin
        if (regWrite && (rd != 'd0))
            regs[rd] <= busW;

    end

endmodule

