module DataMemory(
    input i_clk,
    input i_MemWrite,
    input i_MemRead,
    input [31:0] i_addr,
    input [31:0] i_busW,
    output reg [31:0] o_busOut
);

    // consider rom 

    always @ (*) begin
        // always read, might change to falling edge ?
        case(i_func3)
            3'b000: begin
                // load byte signed
                o_busOut = {{24{MEM_FIX[7]}}, MEM_FIX[7:0]};
            end
            3'b100: begin
                // load byte unsigned 
                o_busOut = MEM_FIX & 32'hFF;
            end
            3'b001: begin
                // load half word signed 
                o_busOut = {{16{MEM_FIX[15]}}, MEM_FIX[15:0]}; 
            end
            3'b101: begin
                // load half word unsigned 
                o_busOut = MEM_FIX & 32'hFFFF;
            end
            3'b010: begin
                // load word 
                o_busOut = MEM_FIX;
            end
    end

    always @ (posedge clk) begin
        // We are writing on posedge
        case(func3)
            3'b000: begin
                // write byte 
                MEM_FIX = lower bits;
            end
    end

