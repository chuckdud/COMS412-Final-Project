mdp
    // 25600 states    
    module aircraft

        x : [0..4] init 0;  
        y : [0..4] init 0;
        heading : [0..1] init 0; // 0=right 1=up

        [go] heading = 0 & x < 4 ->
            .90: (x'=x+1) + 
            .10: (x'=x);
        [go] heading = 1 & y < 4 ->
            .90: (y'=y+1) + 
            .10: (y'=y);
        
        [turn_left] heading = 1 ->
            .90: (heading'=0) + 
            .10: (y'= y < 4 ? y + 1 : y);

        [turn_up] heading = 0 ->
            .90: (heading'=1) + 
            .10: (x'= x < 4 ? x + 1 : x);

    endmodule


    // for now, storms cannot move
    module storm04

        present04 : bool init true;

        [go] true ->
            .20: (present04'=!present04) + 
            .80: (present04'=present04);
        [turn_left] true ->
            .20: (present04'=!present04) + 
            .80: (present04'=present04);
        [turn_up] true ->
            .20: (present04'=!present04) + 
            .80: (present04'=present04);

    endmodule

    module storm03 = storm04 [present04=present03] endmodule
    module storm13 = storm04 [present04=present13] endmodule

    module storm12 = storm04 [present04=present12] endmodule
    module storm22 = storm04 [present04=present22] endmodule

    module storm21 = storm04 [present04=present21] endmodule
    module storm31 = storm04 [present04=present31] endmodule

    module storm30 = storm04 [present04=present30] endmodule
    module storm40 = storm04 [present04=present40] endmodule


    
    formula damage = (
    x = 0 & y = 4 & present04 |

    x = 0 & y = 3 & present03 |
    x = 1 & y = 3 & present13 |

    x = 1 & y = 2 & present12 |
    x = 2 & y = 2 & present22 |

    x = 2 & y = 1 & present21 |
    x = 2 & y = 2 & present22 |

    x = 3 & y = 0 & present30 |
    x = 4 & y = 0 & present40
    );

    formula reach_goal = (x = 4 & y = 4);
