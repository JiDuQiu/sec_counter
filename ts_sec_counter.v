// 2022-7-30；
// 秒计数器，0-9循环；
module ts_mjsq(
		clk,
		res,
		s_num
		);
input		clk;
input		res;
output[3:0]	s_num;

reg[24:0]	con_t;//秒脉冲分频计数器；
reg	s_pulse;//秒脉冲尖；
reg[3:0]	s_num;

parameter	frequency_clk=24;//24MHz;

always @ (posedge clk or negedge res)
if(~res) begin
	con_t<=0;s_pulse<=0;s_num=0;
end
else begin
	//if(con_t==frequency_clk*1000000-1) begin
	if(con_t==frequency_clk*1000-1) begin

		con_t<=0;
	end
	else begin
		con_t<=con_t+1;
	end
// 看见cont_t=0了就至为1；
	if(con_t==0) begin
	  s_pulse<=1;
	end
	else begin
	  s_pulse<=0;
	end
// 看见s_pulse=1了就加1；
	if(s_pulse==1)begin
		if(s_num==9)begin
		  s_num<=0;
		end
		else begin
		  s_num<=s_num+1;
		end
	end
end




endmodule
