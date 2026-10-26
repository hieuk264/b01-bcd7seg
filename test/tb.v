module tb;
  reg [3:0] ui_in; wire [7:0] uo_out;
  reg [6:0] exp [0:9];
  integer i, err = 0;
  bcd7seg dut(.ui_in(ui_in), .uo_out(uo_out));
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    exp[0]=7'b1000000; exp[1]=7'b1111001; exp[2]=7'b0100100;
    exp[3]=7'b0110000; exp[4]=7'b0011001; exp[5]=7'b0010010;
    exp[6]=7'b0000010; exp[7]=7'b1111000; exp[8]=7'b0000000;
    exp[9]=7'b0010000;
    for (i=0;i<10;i=i+1) begin
      ui_in=i; #1;
      if (uo_out !== {1'b0,exp[i]}) begin err=err+1; $display("LOI so %0d: %b",i,uo_out); end
    end
    for (i=10;i<16;i=i+1) begin
      ui_in=i; #1;
      if (uo_out !== 8'b11111111) begin err=err+1; $display("LOI ma khong hop le %0d: %b",i,uo_out); end
    end
    if (err==0) $display("TAT CA CA KIEM THU DAT"); else $display("%0d LOI",err);
    $finish;
  end
endmodule
