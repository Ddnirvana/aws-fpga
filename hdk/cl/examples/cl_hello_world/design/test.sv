module test (
clk,
test_input,
test_output,
test_inout
);

input clk;
input test_input;
output test_output;
inout test_inout;

assign test_inout = clk ? 1'bz : test_input;
assign test_output = test_inout;

endmodule