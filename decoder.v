module decoder(input [6:0] received_data, output reg[3:0] decoded_data, output error);
  wire syndrome1, syndrome2, syndrome4;

  // Calculate syndrome bits
  assign syndrome1 = received_data[0] ^ received_data[2] ^ received_data[4] ^ received_data[6];
  assign syndrome2 = received_data[1] ^ received_data[2] ^ received_data[5] ^ received_data[6];
  assign syndrome4 = received_data[3] ^ received_data[4] ^ received_data[5] ^ received_data[6];

  // Calculate the error syndrome((if error is present or not)
  assign error =syndrome4 | syndrome2 |syndrome1;

  // Correct the error (if any)
  always @(*)
  begin
    
	 
		if(syndrome4==1&&syndrome2==1&&syndrome1==1) begin//7
		decoded_data[3]=~received_data[6];decoded_data[2]=received_data[5];decoded_data[1]=received_data[4];decoded_data[0]=received_data[2];
		end
		if(syndrome4==1&&syndrome2==1&&syndrome1==0) begin//6
		decoded_data[3]=received_data[6];decoded_data[2]=~received_data[5];decoded_data[1]=received_data[4];decoded_data[0]=received_data[2];
		end
		if(syndrome4==1&&syndrome2==0&&syndrome1==1) begin//5
		decoded_data[3]=received_data[6]; decoded_data[2]=received_data[5]; decoded_data[1]=~received_data[4];decoded_data[0]=received_data[2];
		end
		if(syndrome4==1&&syndrome2==0&&syndrome1==0) begin//4
		decoded_data[3]=received_data[6];decoded_data[2]=received_data[5];decoded_data[1]=received_data[4];decoded_data[0]=received_data[2];
		end
		if(syndrome4==0&&syndrome2==1&&syndrome1==1) begin//3
		decoded_data[3]=received_data[6];decoded_data[2]=received_data[5];decoded_data[1]=received_data[4];decoded_data[0]=~received_data[2];
		end
		if(syndrome4==0&syndrome2==1&&syndrome1==0) begin//2
		decoded_data[3]=received_data[6];decoded_data[2]=received_data[5];decoded_data[1]=received_data[4];decoded_data[0]=received_data[2];
		end
		if(syndrome4==0&&syndrome2==0&&syndrome1==1) begin//1
		decoded_data[3]=received_data[6];decoded_data[2]=received_data[5];decoded_data[1]=received_data[4];decoded_data[0]=received_data[2];
		end
		if(syndrome4==0&&syndrome2==0&&syndrome1==0) begin//0
		decoded_data[3]=received_data[6];decoded_data[2]=received_data[1];decoded_data[1]=received_data[4];decoded_data[0]=received_data[2];
		end
	 
  end
endmodule
