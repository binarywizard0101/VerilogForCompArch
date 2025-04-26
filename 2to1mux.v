module mux(
    input i0,
    input i1,
    input s0,
    output y
);
assign y = (i0&~s0) | (i1&s0);
endmodule