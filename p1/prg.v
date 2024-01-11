module chanceLooper (
    input wire clk,
    input wire stop,
    input wire reset,
    output reg [6:0] answer
);
    reg[6:0] ans;
    reg [1:0] counter;
    reg [3:0] a;
  always @(posedge clk) begin
    if(reset)
    begin
        a <= 0;
        ans <= 0;
        counter <= 0;
    end
    if(~stop)
    begin
        a = a+1;
    end
    else a = a;
    end
    always @(posedge stop) begin
        ans = ans + a;
        counter = counter + 1;
        if(counter == 3)
        begin
            answer = ans;
            $display (answer);
            //$finish();
        end
  end  
endmodule

module test;
reg clk;
reg reset;
reg stop;
wire [6:0] answer;

    chanceLooper x
    (
    .reset (reset),
    .clk (clk),
    .stop(stop),
    .answer(answer)
    );

always #5 clk=~clk;

initial begin
    reset = 1;
    clk = 1;
    stop = 0;
    #5 reset=0;
    #47 stop = 1;
    #2 stop = 0;
    #28 stop = 1;
    #2 stop = 0;
    #63 stop  = 1;
    #2 stop = 0;
    

end

endmodule


