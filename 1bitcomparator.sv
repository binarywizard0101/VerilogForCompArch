module edge_detect(
    input a,
    input clk,
    output b
);
assign b = ~clk & clk;
endmodule