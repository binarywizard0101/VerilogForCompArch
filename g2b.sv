module ALU (
    input  logic [3:0] a, b,       // 4-bit operands
    input  logic [2:0] op,         // 3-bit operation selector
    output logic [3:0] result,     // 4-bit result
    output logic       zero,       // Zero flag
    output logic       carry,      // Carry flag
    output logic       overflow    // Overflow flag
);

    logic [4:0] temp_result;  // Temporary result for carry detection

    always_comb begin
        carry = 0;
        overflow = 0;
        case (op)
            3'b000: begin  // ADD
                temp_result = a + b;
                result = temp_result[3:0];
                carry = temp_result[4];  // Carry-out
                overflow = (a[3] == b[3]) && (result[3] != a[3]);  // Signed overflow
            end
            3'b001: begin  // SUB
                temp_result = a - b;
                result = temp_result[3:0];
                carry = temp_result[4];  // Borrow flag (if needed)
                overflow = (a[3] != b[3]) && (result[3] != a[3]);  // Signed overflow
            end
            3'b010: result = a & b;  // AND
            3'b011: result = a | b;  // OR
            3'b100: result = a ^ b;  // XOR
            3'b101: result = a * b;  // Multiplication (lower 4 bits)
            3'b110: result = a << 1; // Shift Left
            3'b111: result = a >> 1; // Shift Right
            default: result = 4'b0000;
        endcase
        
        zero = (result == 4'b0000) ? 1 : 0;  // Set zero flag if result is 0
    end

endmodule
