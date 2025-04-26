module demux(
    input D,
    input s0,
    input s1,
    output y0,
    output y1,
    output y2,
    output y3
);
assign y0 = (D&~s1&~s0);
assign y1 = (D&~s1&s0);
assign y2 = (D&s1&~s0);
assign y3 = (D&s1&s0);
endmodule