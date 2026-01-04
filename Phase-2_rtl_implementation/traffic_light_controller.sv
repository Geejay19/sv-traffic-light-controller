/*  Name: JAGB Jayasekara
    SKF No: SKF2400233
*/
module traffic_light_controller(
    input logic timer_done, traffic_B, clk, rstn, // declaration of inputs and active low reset for resetting the system
    output logic [6:0] traffic_out = 7'b0000000 //declaration of the output as 7-bit variable and initiallizing all bits to zero

);

//defining the states
enum logic [1:0] {
    GARB, //00
    AARB, //01
    RAGB, //10
    RAAB //11
} state, next_state;

// implimenting the next state comb logic in behevioral way
always_comb begin 
    if (state == GARB) begin 
        //since this is not a amber state no need to consider the condition of the timer_done signal
        if (traffic_B == 0) // when traffic_B low, that means trafiic in the road A system should stay in the same state
            next_state = GARB; 
        else
        // when traffic_B is high system need to transist to amber A and red B
            next_state = AARB; 
    end
    else if (state == AARB) begin 
        //when sysytem in the amber state traffic_B is not caused any effect to the system. therefore no need to consider condition of the traffic_B signal
        if (timer_done == 0) // since the timer is ongoing system should stay at the same state
            next_state = AARB;
        else
        //when the timer has completed, system need to transist to the next state
            next_state = RAGB;
    end
    else if (state == RAGB) begin 
        if (traffic_B == 1)
            next_state = RAGB; // when trafic_B high system should stay in the same state.
        else 
            next_state = RAAB; // when the traffic_B low, that is when the traffic in road A sysytem should rtransist to next state
    end
    else if (state == RAAB) begin //this is a amber state. therefore no effect from raffic_B
        if (timer_done == 0)
            next_state = RAAB; //since the timer is ongoing system should stay at the same state
        else
            next_state = GARB; //when timer_done system should move to the initial state
    end
    else 
    next_state = GARB;
end

//implimenting the state register logic
always_ff @(posedge clk) begin
    if (!rstn)
        state <= GARB; //resetting the sysytem to its prioratize state GARB
    else
        state <= next_state;   
end

//implementing of output combinational logic
always_comb begin 
    case (state) 
        GARB: traffic_out = 7'b0001100;
        AARB: traffic_out = 7'b1001010;
        RAGB: traffic_out = 7'b0100001;
        RAAB: traffic_out = 7'b1010001;
    endcase
   
end

endmodule