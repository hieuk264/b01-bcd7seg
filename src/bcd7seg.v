module bcd7seg(
  input  [3:0] ui_in,
  output reg [7:0] uo_out   // [6:0]={g,f,e,d,c,b,a}, [7]=lỗi
);
  always @(*) begin
    case (ui_in)
      4'd0: uo_out = {1'b0, 7'b1000000};
      4'd1: uo_out = {1'b0, 7'b1111001};
      4'd2: uo_out = {1'b0, 7'b0100100};
      4'd3: uo_out = {1'b0, 7'b0110000};
      4'd4: uo_out = {1'b0, 7'b0011001};
      4'd5: uo_out = {1'b0, 7'b0010010};
      4'd6: uo_out = {1'b0, 7'b0000010};
      4'd7: uo_out = {1'b0, 7'b1111000};
      4'd8: uo_out = {1'b0, 7'b0000000};
      4'd9: uo_out = {1'b0, 7'b0010000};
      default: uo_out = {1'b1, 7'b1111111}; // 10-15: tắt hết + cờ lỗi
    endcase
  end
endmodule
