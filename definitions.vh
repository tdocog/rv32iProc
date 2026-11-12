`ifndef DEFINITIONS_VH
`define DEFINITIONS_VH


`define OP_R_TYPE     7'b0110011 // R-TYPE (minus MRET) 
`define OP_ALU_IMM 7'b0010011 // same as R-TYPE but imm variants
`define OP_LOAD 7'b0000011 // load ins 
`define OP_STORE 7'b0100011
`define OP_BRANCH 7'b1100011

`define OP_JALR 7'b1100111
`define OP_LUI 7'b0110111
`define OP_AUIPC 7'b0010111
`define OP_JAL 7'b1101111

// RISC-V ALU Operations
`define OP_ALU_NOP    6'b000000 
`define OP_ALU_ADD    6'b011001 // Add
`define OP_ALU_SUB    6'b011011 // Subtract
`define OP_ALU_AND    6'b011101 // Bitwise AND
`define OP_ALU_OR     6'b011111 // Bitwise OR
`define OP_ALU_XOR    6'b100001 // Bitwise XOR
`define OP_ALU_SLT    6'b100011 // Set Less Than (signed)
`define OP_ALU_SLTU   6'b100101 // Set Less Than (unsigned)
`define OP_ALU_SLL    6'b100111 // Shift Left Logical
`define OP_ALU_SRL    6'b101001 // Shift Right Logical
`define OP_ALU_SRA    6'b101011 // Shift Right Arithmetic

`define BRANCH_BEQ    3'b000 // Branch Equal
`define BRANCH_BNE    3'b001 // Branch Not Equal
`define BRANCH_BLT    3'b100 // Branch Less Than
`define BRANCH_BGE    3'b101 // Branch Greater Than Or Equal
`define BRANCH_BLTU    3'b110 // Branch Less Than Unsigned
`define BRANCH_BGEU    3'b111 // Branch Greater Than Or Equal Unsigned

`define BRANCH_JAL_JALR 3'b010

// Other constants or parameters can be defined here

`endif
