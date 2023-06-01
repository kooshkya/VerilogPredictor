module predictor(input wire request, result, clk, taken, output reg prediction);

reg [1:0] memory;

initial begin
    memory = 2'b11;
end

always @ (posedge clk) begin
    if (request) begin
        prediction = memory[1];
    end else if (result) begin
        if (~taken && |memory) begin
            memory -= 1;
        end else if (taken && |(~memory)) begin
            memory += 1;
        end
    end
end

endmodule