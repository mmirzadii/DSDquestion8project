module parking(input car_entered,is_uni_car_enterd,car_exited,is_uni_car_exited,clk,input integer timer,
    output integer uni_parked_car,parked_car,output wire [31:0] uni_vacated_space,vacated_space,output uni_is_vacated_space,is_vacated_space);


    integer uni_car_space; //maximum cars that can be parked as university cars 
    integer free_car_space; //maximum cars that can be parked as free cars (not university cars)
    initial begin 

        uni_parked_car = 0;
        parked_car = 0;
        uni_car_space = 0;
        free_car_space = 0;

    end

    assign uni_vacated_space = uni_car_space - uni_parked_car;
    assign vacated_space = free_car_space - parked_car;

    assign uni_is_vacated_space = (uni_car_space - uni_parked_car) > 0; //check if there is a vacated space
    assign is_vacated_space = (free_car_space - parked_car) > 0; 
    always @(posedge clk) begin
        
        if(timer<8*60||timer>=20*60) begin // if clock is not between 8 Am to 8 pm the parking is closed to everyone
            uni_car_space = 0;
            free_car_space = 0; 
        end
        else if( timer>=8*60 && timer<13*60 ) begin //if we are in official hours
            if(timer == 8*60) begin //reset variables after opening parking
                uni_parked_car = 0;
                parked_car = 0;
            end
            
            uni_car_space = 500;
            free_car_space = 200;
        end
        else if ( timer >= 13*60 && timer < 16*60 ) begin
            if( timer % 60 == 0) begin

                uni_car_space = uni_car_space - 50;
                free_car_space = free_car_space + 50;
        end
        end
        else if ( timer>= 16*60 && timer <20*60 ) begin
            uni_car_space = 200;
            free_car_space = 500;
        end
        if (uni_parked_car>uni_car_space) begin //if university parking is full move the cars into free cars parking
            parked_car = parked_car+(uni_parked_car-uni_car_space);
            uni_parked_car = uni_car_space;
            
        end
        if (parked_car>free_car_space) begin // if parking is full pick them out
            parked_car = free_car_space;
        end
    end

    always @(posedge car_entered) begin
    
        #0
        if(is_uni_car_enterd && (uni_car_space-uni_parked_car)>0) begin //if the car is university car and it has capacity
            uni_parked_car = uni_parked_car + 1;
        end
        else if (free_car_space-parked_car>0) begin
            parked_car = parked_car + 1;
        end
    end

    always @(posedge car_exited) begin 
        #0
        if(is_uni_car_exited) begin
            if(uni_parked_car>0) begin
            uni_parked_car = uni_parked_car - 1;
            end
        end
        else if(parked_car>0) begin
            parked_car = parked_car - 1;
        end
    end
endmodule;

