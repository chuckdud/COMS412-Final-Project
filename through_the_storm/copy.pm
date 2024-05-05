mdp
                
    module aircraft

        x : [0..7] init 0;  
        y : [0..7] init 0;
        x_heading : [-1..1] init -1;
        y_heading : [-1..1] init 0;
        damage : [0..2] init 0; // damage sustained by aircraft


        [go] 
        
        [turn_left] heading = 0 ->
            .90: (heading'=3);
        [turn_left] heading = 1 ->
            .90: (heading'=0);
        [turn_left] heading = 2 ->
            .90: (heading'=1);
        [turn_left] heading = 3 ->
            .90: (heading'=2);

        [turn_right] heading = 0 ->
            .90: (heading'=1);
        [turn_right] heading = 1 ->
            .90: (heading'=2);
        [turn_right] heading = 2 ->
            .90: (heading'=3);
        [turn_right] heading = 3 ->
            .90: (heading'=0);
        

    endmodule


    module storm
        x : [0..7] init 0;
        y : [0..7] init 0;
        present : bool init true;

    endmodule

    formula collision = (p=3 & b=7 | p=4 & b=4 | p=6 & b=6 | p=7 & b=3);
