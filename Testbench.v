module Test;

	// Inputs
	reg [31:0] Data1;
	reg [31:0] Data2;
	reg Clock;
	reg In_Data_Valid;
	reg Op;

	// Outputs
	wire [31:0] Data_Out;
	wire Out_Data_Valid;
	
	// Instantiate the Unit Under Test (UUT)
	FPU uut (
		.Data1(Data1),
        .Data2(Data2),
		.Clock(Clock),
		.In_Data_Valid(In_Data_Valid),
		.Op(Op),
		.Data_Out(Data_Out),
		.Out_Data_Valid(Out_Data_Valid)
	);
	// initial #20000 $finish;
	// Generating the Clock of 200ps
	initial 
		begin
			Clock=1'b0;
			repeat(100)
			#100 Clock = ~Clock;
		end

	initial begin
		// Initialize Inputs
		//Data1 = 0;
		//Data2 = 0;
		//In_Data_Valid = 0;
		
		
		// ADDITION CASES
		
		#600;
		In_Data_Valid = 1'b1;
        Data1=32'b00111111100011001100110011001101;//1.1
		Data2=32'b01000000000011001100110011001101;//2.2
		Op = 1'b0;
		//SUM=3.3000002  01000000010100110011001100110100
					  // 01000000010100110011001100110011
		$monitor("Output:  %b ",Data_Out);
		
		#200
		In_Data_Valid = 1'b0;		
		 
		#600
		In_Data_Valid = 1'b1;
		Data1=32'b00111111100011001100110011001101;//1.1
		Data2=32'b11000000000011001100110011001101;//-2.2
		Op = 1'b0;
		//SUM=-1.1  10111111100011001100110011001101
		//			10111111100011001100110011001110 
		$monitor("Output:  %b ",Data_Out);
		
		#200
		In_Data_Valid = 1'b0;	
		 
	    // #600 
	    // In_Data_Valid = 1'b1;
	    // Data1=32'b10111111100011001100110011001101;//-1.1
	    // Data2=32'b01000000000011001100110011001101;//2.2
	    // Op = 1'b0;
	    // //SUM=1.1 00111111100011001100110011001101
	    // //		  00111111100011001100110011001110 
	    // $monitor("Output:  %b ",Data_Out);
	   
	    // #200
	    // In_Data_Valid = 1'b0;	
	   
	    #600
	    In_Data_Valid = 1'b1;
	    Data1=32'b10111111100011001100110011001101;//-1.1
	    Data2=32'b00111111100011001100110011001101;//1.1
	    Op = 1'b0;
	    //SUM=0.0 10000000000000000000000000000000
	    //		  10000000000000000000000000000000 
	   
	    $monitor("Output:  %b ",Data_Out);
	   
	    #200
	    In_Data_Valid = 1'b0;	
	   
	    #600
	    In_Data_Valid = 1'b1;
	    Data1=32'b00000000000000000000000000000000;//0
	    Data2=32'b00111111100011001100110011001101;//1.1
	    Op = 1'b0;
	    //SUM=1.1 00111111100011001100110011001101
	    //		  00111111100011001100110011001101 
	    $monitor("Output:  %b ",Data_Out);
	   
	    #200
	    In_Data_Valid = 1'b0;	
	   
	    #600
	    In_Data_Valid = 1'b1;
	    Data1=32'b00000000000000000000000000000000;//0
	    Data2=32'b01111111100000000000000000000000;//Inf
	    Op = 1'b0;
	    //SUM=Inf 01111111100000000000000000000000
	    //		  01111111100000000000000000000000 
	    $monitor("Output:  %b ",Data_Out);
	   
	    #200
	    In_Data_Valid = 1'b0;	
	   
	    // #600
	    // In_Data_Valid = 1'b1;
	    // Data1=32'b00111111100011001100110011001101;//1.1
	    // Data2=32'b11111111111111111111111111111111;//NaN
	    // Op = 1'b0;
	    // //SUM=NaN 11111111111111111111111111111111
	    // //		  11111111111111111111111111111111 
	    // $monitor("Output:  %b ",Data_Out);
	   
	    // #200
	    // In_Data_Valid = 1'b0;	
	   
	    #600
	    In_Data_Valid = 1'b1;
	    Data1=32'b00000000000011001100110011001101;//1.175495E-39
	    Data2=32'b00000000000000000000000001111111;//1.78E-43
	    Op = 1'b0;
	    //SUM=1.175673E-39 0 00000000 00011001100110101001100
	    //				   
	    $monitor("Output:  %b ",Data_Out);
	   
	    #200
	    In_Data_Valid = 1'b0;	
		
		
		
		
		
		// MULTIPLICATION CASES
		
		// #600;
		// In_Data_Valid = 1'b1;
        // Data1=32'b00111111100011001100110011001101;//1.1
		// Data2=32'b01000000000011001100110011001101;//2.2
		// Op = 1'b1;
		// //MULT=2.42 01000000000110101110000101001000
		// //			01000000000110101110000101001000
			   
		// $monitor("Output:  %b ",Data_Out);
		
		// #200
		// In_Data_Valid = 1'b0;		
		
		#600
		In_Data_Valid = 1'b1;
		Data1=32'b00111111100011001100110011001101;//1.1
		Data2=32'b11000000000011001100110011001101;//-2.2
		Op = 1'b1;
		//MULT=-2.42  11000000000110101110000101001000
		//			  11000000000110101110000101001000 
		$monitor("Output:  %b ",Data_Out);
		
		#200
		In_Data_Valid = 1'b0;	
		
		#600 
		In_Data_Valid = 1'b1;
		Data1=32'b10111111100011001100110011001101;//-1.1
		Data2=32'b11000000000011001100110011001101;//-2.2
		Op = 1'b1;
		//MULT=2.42 01000000000110101110000101001000
		//			01000000000110101110000101001000
		$monitor("Output:  %b ",Data_Out);
		
		#200
		In_Data_Valid = 1'b0;	
		
		#600
		In_Data_Valid = 1'b1;
		Data1=32'b00000000000000000000000000000000;//0
		Data2=32'b00111111100011001100110011001101;//1.1
		Op = 1'b1;
		//MULT=0.0 00000000000000000000000000000000
		$monitor("Output:  %b ",Data_Out);
		
		#200
		In_Data_Valid = 1'b0;	
		
		#600
		In_Data_Valid = 1'b1;
		Data1=32'b00000000000000000000000000000000;//0
		Data2=32'b01111111100000000000000000000000;//Inf
		Op = 1'b1;
		//MULT=NaN 11111111111111111111111111111111
		$monitor("Output:  %b ",Data_Out);
		
		#200
		In_Data_Valid = 1'b0;

		#600
		In_Data_Valid = 1'b1;
		Data1=32'b00111111100011001100110011001101;//1.1
		Data2=32'b00000000000000000000000001111111;//1.78E-43
		//MULT=1.96E-43 00000000000000000000000010001100
		$monitor("Output:  %b ",Data_Out);
		
		#200
		In_Data_Valid = 1'b0;	
		
		#600
		In_Data_Valid = 1'b1;
		Data1=32'b00000000000011001100110011001101;//1.175495E-39
		Data2=32'b00000000000000000000000001111111;//1.78E-43
		Op = 1'b1;
		//MULT=0.0 00000000000000000000000000000000
		$monitor("Output:  %b ",Data_Out);
		
		#200
		In_Data_Valid = 1'b0;
			
		  
	end
      
endmodule
