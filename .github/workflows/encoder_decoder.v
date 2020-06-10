module encoder42(
input enable,
input [3:0]in,
output reg[1:0]out);
always@(*)
begin
     if(!enable)
	 out =0;
	 else begin
	 case ({in})
	 4'b0001 : out =2'b00;
	 4'b0010 : out =2'b01;
	 4'b0100 : out =2'b10;
	 4'b1000 : out =2'b11;
	 default : out =2'bxx;
	 endcase
	end
end
endmodule	/// 4:2 encoder verified on modelsim */


module decoder2_4( 
//output [3:0] out,
input [1:0] in ,
input enable,
output reg[3:0]out);
always @ (in or enable)
 begin
 if(!enable)
 out=0;
 else begin
 case ({in})
  2'b00 : out = 8;
  2'b01 : out = 4;
  2'b10 : out = 2;
  2'b11 : out = 3;
  default : out = 0;
  endcase
 end
end
endmodule    /// 2:4 decoder verified on modelsim 


module encoder83(
input  en,
input  [7:0]in,
output reg [2:0]out);

   always@(*)
   begin
       if(!en) //Active low enable
           out = 0;
       else begin
           case ({in})
           8'b0000_0001 : out =3'b000;
           8'b0000_0010 : out =3'b001;
           8'b0000_0100 : out =3'b010;
           8'b0000_1000 : out =3'b011;
           8'b0001_0000 : out =3'b100;
           8'b0010_0000 : out =3'b101;
           8'b0100_0000 : out =3'b110;
           8'b1000_0000 : out =3'b110;
           default      : out =3'bxxx;
           endcase
       end
   end 

endmodule /// 8:3 encoder verified on modelsim  

module decoder83(
input  en,
input  [2:0]in,
output reg [7:0]out);

   always@(*)
   begin
       if(!en) //Active low enable
           out = 0;
       else begin
           case ({in})
           3'b000 : out =2;
           3'b001 : out =4;
           3'b010 : out =6;
           3'b011 : out =8;
           3'b100 : out =3;
           3'b101 : out =1;
           3'b110 : out =7;
           3'b111 : out =0;
           default      : out =0;
           endcase
       end
   end 

endmodule /// 3:8 decoder verified on modelsim  


module encoder16_4(
binary_out , 
encoder_in ,
enable       
);
output [3:0] binary_out  ;
input  enable ; 
input [15:0] encoder_in ; 
     
output reg [3:0] binary_out ;
      
always @ (enable or encoder_in)
//always @ (*)
begin
  if (!enable) // active low
binary_out = 0;
  else begin
    case ({encoder_in}) 
	  16'h0002 : binary_out = 1; //0000000000000010
      16'h0004 : binary_out = 2; 
      16'h0008 : binary_out = 3; 
      16'h0010 : binary_out = 4;
      16'h0020 : binary_out = 5; 
      16'h0040 : binary_out = 6; 
      16'h0080 : binary_out = 7; 
      16'h0100 : binary_out = 8;
      16'h0200 : binary_out = 9;
      16'h0400 : binary_out = 10; 
      16'h0800 : binary_out = 11; 
      16'h1000 : binary_out = 12; 
      16'h2000 : binary_out = 13; 
      16'h4000 : binary_out = 14; 
      16'h8000 : binary_out = 15;  //1000000000000000
   endcase
  end
end
endmodule //16:4 encoder verified on modelsim 

module encoder16_4_tb();
	  reg [15:0] encoder_in;
	  wire [3:0] binary_out;
	  reg enable;
	  
encoder16_4 uut( .encoder_in(encoder_in), .binary_out(binary_out), .enable(enable));

initial begin
 enable =1'b1;
#10 encoder_in=16'h0002;
#10 encoder_in=16'h0004;
#10 encoder_in=16'h0008;
#10 encoder_in=16'h0010;
#10 encoder_in=16'h0020;
#10 encoder_in=16'h0040;
#10 encoder_in=16'h0080;
#10 encoder_in=16'h0100;
#10 encoder_in=16'h0200;
#10 encoder_in=16'h0400;
#10 encoder_in=16'h0800;
#10 encoder_in=16'h1000;
#10 encoder_in=16'h2000;
#10 encoder_in=16'h4000;
#10 encoder_in=16'h8000; 
end
endmodule;              //16:4 encoder_tb verified on modelsim   

module decoder4_16(
binary_out , 
decoder_in ,
enable       
);
output [15:0] binary_out  ;
input  enable ; 
input [3:0] decoder_in ; 
     
output reg [15:0] binary_out ;
      
always @ (enable or decoder_in)
//always @ (*)
begin
  if (!enable) // active low
binary_out = 0;
  else begin
    case ({decoder_in}) 
	  4'b0000 : binary_out = 1; //0000000000000001
      4'b0001 : binary_out = 2;
	  4'b0010 : binary_out = 3;
	  4'b0011 : binary_out = 4;
	  4'b0100 : binary_out = 5;
	  4'b0101 : binary_out = 6;
	  4'b0110 : binary_out = 7;
	  4'b0111 : binary_out = 8;
	  4'b1000 : binary_out = 9;
	  4'b1001 : binary_out = 10;
	  4'b1010 : binary_out = 11;
	  4'b1011 : binary_out = 12;
	  4'b1100 : binary_out = 13;
	  4'b1101 : binary_out = 14;
	  4'b1110 : binary_out = 15;
	  4'b1111 : binary_out = 16;
	  default : binary_out = 0;
	  endcase
	  end 
	  end
	  endmodule;   //4:16 decoder verified on modelsim
	  
	  
module decoder16_4_tb();
	  reg [3:0] decoder_in;
	  wire [15:0] binary_out;
	  reg enable;
	  
decoder4_16 uut( .decoder_in(decoder_in), .binary_out(binary_out), .enable(enable));

initial begin
 enable =1'b1;
#10 decoder_in=4'b0000;
#10 decoder_in=4'b0001;
#10 decoder_in=4'b0010;
#10 decoder_in=4'b0011;
#10 decoder_in=4'b0100;
#10 decoder_in=4'b0101;
#10 decoder_in=4'b0110;
#10 decoder_in=4'b0111;
#10 decoder_in=4'b1000;
#10 decoder_in=4'b1001;
#10 decoder_in=4'b1010;
#10 decoder_in=4'b1011;
#10 decoder_in=4'b1100;
#10 decoder_in=4'b1101;
#10 decoder_in=4'b1110; 
#10 decoder_in=4'b1111;
end           

endmodule;              //16:4 decoder_tb verified on modelsim	
