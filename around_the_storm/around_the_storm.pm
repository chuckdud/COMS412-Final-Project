mdp
    
    module turner

    // turning aircraft

    // position of turning aircraft
    a : [1..8] init 1;

    //  actions:
    //      go   : move ahead
    //      turn : change trajectory (only possible when a = 3)

    [go] a != 5 & a != 8 -> 
                    .85: (a'=a+1) + 
                    .15: (a'=a)   ;

    [go] a = 8 ->
                    .85: (a'=5) +
                    .15: (a'=a) ;
    
    [go] a = 5 ->
                    1.0: (a'=a) ; 
    
    [turn] a = 3 ->
                    .90: (a'=6)   +
                    .05: (a'=a+1) +
                    .05: (a'=a+1) ;   

    endmodule



    module storm

    // presence of storm (0 = absent, 1 = present)
    p : [0..1] init 0;

    // actions defined here to synchronize with aircraft

    [go]   p = 0 ->  
                    0.90:(p'=p) +
                    0.10:(p'=1);
    [go]   p = 1 ->  
                    0.90:(p'=p) +
                    0.10:(p'=0);

    [turn]   p = 0 ->  
                    0.90:(p'=p) +
                    0.10:(p'=1);
    [turn]   p = 1 ->  
                    0.90:(p'=p) +
                    0.10:(p'=0);

    endmodule
