/*  Name: JAGB Jayasekara
    SKF No: SKF2400233
    email: geethika.j19@gmail.com
*/

//testbench file for traffic light controller
`timescale 1ns/1ps

module traffic_light_controller_tb;
logic timer_done, traffic_B, clk, rstn;
logic [6:0] traffic_out;

//port declaration
traffic_light_controller dut(.*);

//clock geeration
initial begin 
    clk = 0;
    forever begin 
        #5 clk =~clk;
    end
end

//test stimulus 
initial begin 
    $dumpfile("traffic_light_wavefoem.vcd"); //file that save the waveform data
    $dumpvars(0,traffic_light_controller_tb); //dumping all the variables in this module

 
    //applying of the test sequence
    
    //testing of green A red B state - GARB
    #10
    traffic_B = 0 ; timer_done = 0 ; 

    #10
    traffic_B = 0 ; timer_done = 1 ; // testing the effect of timer_done at this state

    #10
    traffic_B = 1 ; timer_done = 0 ; // testing the effect of traffic_B at this state. when there is a traffic at road B and no traffic at road A, that is traffic_B is high

    //testing of amber A red B state - AARB
    #10
    traffic_B = 1 ; timer_done = 0 ; // testing the  ongoing timer during this state

    #10
    traffic_B = 0 ; timer_done = 0 ; // testing the effect of traffic_B at this state

    #10
    traffic_B = 1 ; timer_done = 1 ; // testing when the completion of the timer

    //testing of red A green B state - RAGB
    #10
    traffic_B = 1 ; timer_done = 1 ; // testing of still traffic at B road and no traffic at A road. that is traffc_B is high

    #10
    traffic_B = 1 ; timer_done = 0 ; // testing the effect of timer_done at this state

    #10
    traffic_B = 0 ; timer_done = 0 ; // testing when there is traffic at road A. that is traffic_B is low.

    //testing of red A amber B state - RAAB
    #10
    traffic_B = 0 ; timer_done = 0 ; // testing the timer ongoing

    #10
    traffic_B = 1 ; timer_done = 0 ; // testing the effect of the traffic_B at this state

    #10
    traffic_B = 0 ; timer_done = 1 ; // testing of the completion of the timer. that is the timer_done becomming high.

    #20

//stopping the simulation
$finish;

end

endmodule