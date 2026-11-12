// BE AWARE OF UNINTENTIOAL LATCHES FROM NOT DEFINING EVERY LOGIC PATH (need
// to fix)

module proc(
    input resetl,
    input [31:0] startPc,
    
    // ----
    // In a given clock cycle we care about computing two numbers:
    // The next PC and (sometimes) fetching memeory - Is this part true?
    output reg [31:0] currentPc,
    output [31:0] MemToRegOut,
    // ----
    input CLK
);

    
    // instruction mem ( 
    //  [31:0] addr,
    // ) -> [31:0] Ins

    
    // DONE
    // In this block branch target is calculated inside
    PcCtrl pcCtrl(
        .i_jumpTaken(),
        .i_branchTaken(),
        .i_pc(),
        .i_imm(),
        .i_jumpTarget(),
        .o_nextPc()
    ); 

    // TODO: Implement the pc reg? 

    

    // DONE
    // might be nice to figure out which type of imm for imm gen :hmm
    Decoder decoder(
        .i_ins(INS_WIRE),
        .o_opcode(),
        .o_rd(),
        .o_func3(),
        .o_rs1(),
        .o_rs2(),
        .o_fun7()
    );

    // DONE-ISH
    Control control(
        //inputs
        .i_opcode(),
        .i_func3(),

        // outputs
        .o_Jump(),
        .o_Branch(),
        .o_MemRead(),
        .o_MemWrite(),
        .o_ALUSrc1(),
        .o_ALUSrc2(),
        .o_RegWrite(),
        .o_RegWriteSrc()
    );


    // TODO: fix ie write on pos edge
    RegisterFile registerFile(
        // inputs
        .rs1(),
        .rs2(),
        .rd(),
        .regWrite(),
        .busW(),

        // outputs
        .bus1(),
        .bus2(),
        .CLK()

    );

    // DONE
    ImmGen immGen(
        .i_opcode(),
        .i_func3(),
        .i_ins(),

        .o_imm(),
    );

    // TODO: FIX so we have our defines be the rd field and bit diff in imm
    // and bugs with non regs assigned in always block
    Alu alu(
        //inputs
        .bus1(ALU_INPUT1),
        .bus2(ALU_INPUT2), // will be given by aluSrc (mux)
        .aluCtrl(ALU_CTRL_OUT) // comes from ctrl and elswhere :) 
        
        //outputs
        .isZero(isZero),
        .busOut(ALU_OUT)
    ); 

    // consider making a branch target unit later
    // DONE
    BranchCtrl branchCtrl(
        .i_rd(),
        .i_func3(),
        .i_func7(),

        .i_Branch(),
        .i_isZero(),
        .i_isLT(),
        .i_isLTU(),

        .o_branchTaken()
    );


    // TODO: ;>
    DataMemory dataMemory(
        .i_clk(),
        .i_MemWrite(),
        .i_MemRead(),
        .i_addr(ALU_OUT),
        .i_func3(),
        .i_busW(take in rs2)
        .o_busOut(),
    );

