module testbench();
    reg clk;
    integer timer;
    initial begin
        timer = 0;
        clk = 0;
    end
    always #5 clk = ~clk;
    always @(posedge clk) timer = (timer+1)%(24*60);
    //inputs
    reg car_entered,is_uni_car_enterd,car_exited,is_uni_car_exited;
    //outputs
    wire uni_is_vacated_space,is_vacated_space;
    wire [31:0] uni_parked_car,parked_car;
    wire [31:0] uni_vacated_space,vacated_space;
    //get instance
    parking parking1(.car_entered(car_entered),.is_uni_car_enterd(is_uni_car_enterd),
    .car_exited(car_exited),.is_uni_car_exited(is_uni_car_exited),.clk(clk),.timer(timer),
        .uni_parked_car(uni_parked_car),.parked_car(parked_car),.uni_vacated_space(uni_vacated_space),
        .vacated_space(vacated_space),.uni_is_vacated_space(uni_is_vacated_space),.is_vacated_space(is_vacated_space));

    integer i;
    initial begin
        car_entered = 0;
        is_uni_car_enterd = 0;
        car_exited = 0;
        is_uni_car_exited = 0;
        #10
        $display("timer = %d:%d    uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);

        $display("50 university cars want to enter");
        #(8*60*10)
        for(i = 0;i<50;i= i+1) begin 
            is_uni_car_enterd = 1;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d    uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #110
        
        $display("50 ordinay cars want to enter");
        for(i = 0;i<50;i= i+1) begin 
            is_uni_car_enterd = 0;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d    uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #130

        
        $display("25 ordinay cars want to exit");
        for(i = 0;i<25;i= i+1) begin 
            is_uni_car_exited = 1;
            #0 car_exited = 1;
            #0 car_exited = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #450


        $display("45 university casr want to enter");
        for(i = 0;i<45;i= i+1) begin 
            is_uni_car_enterd = 1;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #1300

        $display("35 university cars want to enter");
        for(i = 0;i<35;i= i+1) begin 
            is_uni_car_enterd = 1;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #130

        $display("80 ordinay cars want to enter");
        for(i = 0;i<80;i= i+1) begin 
            is_uni_car_enterd = 0;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #1300

        $display("125 ordinay cars want to enter");
        for(i = 0;i<125;i= i+1) begin 
            is_uni_car_enterd = 0;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #450

        
        $display("15 university cars want to exit");
        for(i = 0;i<15;i= i+1) begin 
            is_uni_car_exited = 1;
            #0 car_exited = 1;
            #0 car_exited = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #450

        $display("60 ordinay cars want to enter");
        for(i = 0;i<60;i= i+1) begin 
            is_uni_car_enterd = 0;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #450

        $display("80 university cars want to exit");
        for(i = 0;i<20;i= i+1) begin 
            is_uni_car_exited = 0;
            #0 car_exited = 1;
            #0 car_exited = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #450

        $display("60 ordinay cars want to enter");
        for(i = 0;i<60;i= i+1) begin 
            is_uni_car_enterd = 0;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #450

        $display("70 university cars want to enter");
        for(i = 0;i<70;i= i+1) begin 
            is_uni_car_enterd = 1;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #450
        

        $display("70 universitys car want to enter");
        for(i = 0;i<70;i= i+1) begin 
            is_uni_car_enterd = 1;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #450


        $display("30 university cars want to enter");
        for(i = 0;i<30;i= i+1) begin 
            is_uni_car_enterd = 1;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #1200

        $display("30 ordinary cars want to enter");
        for(i = 0;i<30;i= i+1) begin 
            is_uni_car_enterd = 0;
            #0 car_entered = 1;
            #0 car_entered = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #450

        
        $display("100 ordinay cars want to exit");
        for(i = 0;i<100;i= i+1) begin 
            is_uni_car_exited = 0;
            #0 car_exited = 1;
            #0 car_exited = 0;
        end
        #0
        $display("timer = %d:%d     uni_parked_car = %d  parked_car = %d  uni_vacated_space = %d  vacated_space = %d  uni_is_vacated_space = %d  is_vacated_space = %d",
        timer/60,timer%60,uni_parked_car,parked_car,uni_vacated_space,vacated_space,uni_is_vacated_space,is_vacated_space);
        #450

        $stop();
    end
endmodule;
