module demux(
    input D,
    input s0,
    output y0,
    output y1
);
assign y0 = (D&~s0);
assign y1 = (D&s0);
endmodule