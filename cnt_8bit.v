module cnt_8bit (  //rename later
						input 				clk,
						input      [9:0] 	sw,
						input 	   [1:0] 	key,
						output 	   [9:0] 	ledr,
						output reg [9:0] 	rez
								);
integer i;
reg my_event;
wire reset;
assign reset = key[1];

always @(sw) //check event
begin
    if ((sw[0] + sw[1] + sw[2] + sw[3] + sw[4] + sw[5] + 
		sw[6] + sw[7] + sw[8] + sw[9]) > 4'd3)  
		my_event <= 1'b1;
	else 
		my_event <= 1'b0;
end
								
always @(posedge clk)
begin

	if (reset)
		begin
		//ledr <= 0;	
		rez <= 0;						
		end
	else
																							
if (key[0])
	begin
		rez <= sw; // if key_0 pressed write sw 					
	end	

if (key[0] && my_event) // if event '+1'
	begin
	rez <= rez + 1'b1;
				
	end
																																																	
end
assign ledr = rez;
endmodule 
								
