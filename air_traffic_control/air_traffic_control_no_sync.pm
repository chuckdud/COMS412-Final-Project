mdp
    
        // Two aircraft, PINK (aka P) and BLUE (aka B) are travelling along intersecting trajectories.

        // Each aircraft will be capable of actons: [go, turn]
        //     go: move ahead following current trajectory
        //     turn: alter current trajectory 
        // Speed will be represented by probability of moving to next state such that a high probability of moving ahead models higher speed

        // The MDP in this case is the air traffic control system that is managing both aircrafts. Therefore the actions modeled in this system
        //     will be a combination of an action in each aircraft to simulate a synchronized action in each aircraft.

        // Do I want them to be able to slow down? Start without and then see

        // Actions (of the form "p_x_b_y" for "p takes action x and b takes action y"
        //     P_go_B_go
        //     P_go_B_turn
        //     P_turn_B_go
        //     P_turn_B_turn
            
    module PINK

        p : [1..8] init 1;  

        [P_go] p != 5 & p != 8 -> 
                        .85: (p'=p+1) + 
                        .15: (p'=p)   ;

        [P_go] p = 8 ->
                        .85: (p'=5) +
                        .15: (p'=p) ;
        
        [P_go] p = 5 ->
                        1.0: (p'=p) ; 
        
        [P_turn] p = 3 ->
                        .90: (p'=6)   +
                        .05: (p'=p+1) +
                        .05: (p'=p+1) ;   

    endmodule


    module BLUE = PINK [p=b, P_go=B_go, P_turn=B_turn] endmodule

    formula collision = (p=3 & b=7 | p=4 & b=4 | p=6 & b=6 | p=7 & b=3);

    system PINK ||| BLUE endsystem
