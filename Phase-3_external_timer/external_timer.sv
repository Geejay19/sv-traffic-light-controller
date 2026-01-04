/*
Name: JAGB Jayasekara
SKF Number: SKF2400233
Email: geethika.j19@gmail.com
*/

//Implementation of the timer module

module external_timer(
    input logic clk, // clock pulse  is 100ms, that is time periode between adjacent pos edges or neg edges is 100ms
    input logic rstn, //active low reset
    output logic timer_done // this is the output form the timer module which is a input to traffic light controller module
);

/*
in  order to implement the timer we need two separate counters for milliseconds and seconds.
since the clock pulse is 100ms, 10 clock cycles equal to one second which is 1000ms
therefore, initially, millisecond counter should equal to 9. during each clock cycle this need to decrement by 1 until it reach to 0.
since we need 7.5 seconds, seconds counter need to equal to 7 at the begining.
when milliseconds counter reach to 0, 1 should be decremented from the seconds counter.
to count 7.5 seconds, seconds counter should need to reach 0 and after that millisecond counter should need to reach to 5.
after that, timer_done signal need to become HIGH
*/

logic [3:0] ms_count; //millisecond counter
logic [3:0] sec_count; // second counter
logic ms_done, sec_done;

// milliSeconds down counter (0-9)
    down_counter #(.N(9)) ms_counter (
        .clk(clk),
        .rstn(rstn),
        .done(ms_done),
        .count(ms_count)
    );

    // Seconds down counter (0-6)
    down_counter #(.N(6)) sec_counter (
        .clk(ms_done),
        .rstn(rstn),
        .done(sec_done),
        .count(sec_count)
    );

    assign timer_done = sec_done && (ms_count == 5); //timer_done get HIGH when second count =0 and after that, when millisecond count == 5


endmodule