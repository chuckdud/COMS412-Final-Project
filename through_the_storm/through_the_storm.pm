mdp

    // reduced from 1073741824 states
    // to            536870912 states  
    // still too big
    module aircraft

        x : [0..7] init 0;  
        y : [0..7] init 0;
        heading : [0..1] init 0; // 0=right 1=up

        [go] heading = 0 & x < 7 ->
            .90: (x'=x+1) + 
            .10: (x'=x);
        [go] heading = 1 & y < 7 ->
            .90: (y'=y+1) + 
            .10: (y'=y);
        
        [turn_left] heading = 1 ->
            .90: (heading'=0) + 
            .10: (y'= y < 7 ? y + 1 : y);

        [turn_up] heading = 0 ->
            .90: (heading'=1) + 
            .10: (x'= x < 7 ? x + 1 : x);
    
    endmodule


    // for now, storm scannot move
    module storm07

        present07 : bool init true;

        [go] true ->
            .20: (present07'=!present07) + 
            .80: (present07'=present07);
        [turn_left] true ->
            .20: (present07'=!present07) + 
            .80: (present07'=present07);
        [turn_right] true ->
            .20: (present07'=!present07) + 
            .80: (present07'=present07);

    endmodule

    module storm06 = storm07 [present07=present06] endmodule
    
    module storm17 = storm07 [present07=present17] endmodule
    module storm16 = storm07 [present07=present16] endmodule
    module storm15 = storm07 [present07=present15] endmodule
    
    module storm26 = storm07 [present07=present26] endmodule
    module storm25 = storm07 [present07=present25] endmodule
    module storm24 = storm07 [present07=present24] endmodule
    
    module storm35 = storm07 [present07=present35] endmodule
    module storm34 = storm07 [present07=present34] endmodule
    module storm33 = storm07 [present07=present33] endmodule
    
    module storm44 = storm07 [present07=present44] endmodule
    module storm43 = storm07 [present07=present43] endmodule
    module storm42 = storm07 [present07=present42] endmodule
    
    module storm53 = storm07 [present07=present53] endmodule
    module storm52 = storm07 [present07=present52] endmodule
    module storm51 = storm07 [present07=present51] endmodule
    
    module storm62 = storm07 [present07=present62] endmodule
    module storm61 = storm07 [present07=present61] endmodule
    module storm60 = storm07 [present07=present60] endmodule
    
    module storm71 = storm07 [present07=present71] endmodule
    module storm70 = storm07 [present07=present70] endmodule


    formula damage = (
        x = 0 & y = 6 & present06 |
        
        x = 1 & y = 7 & present17 |
        x = 1 & y = 6 & present16 |
        x = 1 & y = 5 & present15 |
        
        x = 2 & y = 6 & present26 |
        x = 2 & y = 5 & present25 |
        x = 2 & y = 4 & present24 |
        
        x = 3 & y = 5 & present35 |
        x = 3 & y = 4 & present34 |
        x = 3 & y = 3 & present33 |
        
        x = 4 & y = 4 & present44 |
        x = 4 & y = 3 & present43 |
        x = 4 & y = 2 & present42 |
        
        x = 5 & y = 3 & present53 |
        x = 5 & y = 2 & present52 |
        x = 5 & y = 1 & present51 |
        
        x = 6 & y = 2 & present62 |
        x = 6 & y = 1 & present61 |
        x = 6 & y = 0 & present60 |
        
        x = 7 & y = 1 & present71 |
        x = 7 & y = 0 & present70
    );

    formula reach_goal = (x = 7 & y = 7);
