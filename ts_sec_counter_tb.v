//----testbench of ts_mjsq----

`timescale 1ns/10ps

module ts_mjsq_tb;
reg		clk_1;
reg		res_1;
wire[3:0]	s_num_1;


ts_mjsq	ts_mjsq(
		.clk(clk_1),
		.res(res_1),
		.s_num(s_num_1)
);



initial begin
	clk_1<=0;res_1<=0;
	#17 res_1<=1;
	#1000000 $stop;
end

always #5 clk_1<=~clk_1;


initial begin
	$dumpfile("test10.vcd");
	$dumpvars(0,ts_mjsq_tb);

end
endmodule
