module hamming(data_i,encoded_o,err,data_o,error_detection);
input[3:0]data_i;
output [6:0]encoded_o;
output [6:0]err;
output [3:0]data_o;
output error_detection;

//encoder m0(.data(data_i),. encoded_data(encoded_o));
encoder (data_i, encoded_o);

assign err={encoded_o[6],~encoded_o[5],encoded_o[4:0]};

decoder m1(.received_data(err),.decoded_data(data_o),.error(error_detection));
endmodule
