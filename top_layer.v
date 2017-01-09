module top_layer (
						input 				clk,
						input      	[9:0] 	sw,
						input 	   	[1:0] 	key,
						output	 	[6:0]   hex_n0,
						output	 	[6:0]   hex_n1);
						
						
wire [9:0] 	ledr;
wire [7:0] 	 rez;						

// generate endgenerate						
cnt_8bit cnt8		(  .clk(clk),
					   .sw(sw),
					   .key	(key),
					   .ledr(ledr),
					   .rez(rez)
					   );
					   
CodeToHex hex0		(  .clk(clk),
					   .rez(rez [3:0]),
					   .hex_n(hex_n0)
					   );
					   
					   
CodeToHex hex1		(  .clk(clk),
					   .rez(rez [7:4]),
					   .hex_n(hex_n1)
					   );
					   
					  

endmodule 