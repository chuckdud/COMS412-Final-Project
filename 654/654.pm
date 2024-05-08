mdp
    
    module player

    // values of dice
    die1 : [1..6] init 1;
    die2 : [1..6] init 1;
    die3 : [1..6] init 1;
    die4 : [1..6] init 1;
    die5 : [1..6] init 1;

    // current turn
    n : [1..4] init 1;

    // bools representing if each die has been rolled
    rolled_1 : bool init false;
    rolled_2 : bool init false;
    rolled_3 : bool init false;
    rolled_4 : bool init false;
    rolled_5 : bool init false;

    // number of dice player must roll to complete this turn
    to_roll: [0..6] init 6;

    // index of first die to turn up 6
    got_6: [0..6] init 0;
    // index of first die to turn up 5
    got_5: [0..6] init 0;
    // index of first die to turn up 4
    got_4: [0..6] init 0;

    //  actions:
    //      roll_n: roll die n
    //      next_turn: roll no more dice this turn and move to next turn
    //      quit: forfeit remaining turns

    
    // player must roll all non-654 dice OR quit
    [next_turn] n < 4 & to_roll = 0 ->
        1:  (rolled_1'=(got_6 = 1 | got_5 = 1 | got_4 = 1)) &
            (rolled_2'=(got_6 = 2 | got_5 = 2 | got_4 = 2)) &
            (rolled_3'=(got_6 = 3 | got_5 = 3 | got_4 = 3)) &
            (rolled_4'=(got_6 = 4 | got_5 = 4 | got_4 = 4)) &
            (rolled_5'=(got_6 = 5 | got_5 = 5 | got_4 = 5)) &
            (to_roll' = (got_6!=0) ? ((got_5!=0) ? ((got_4!=0) ? 2 : 3) : 4) : 5 )&
            (n'=n+1);

    // once player gets 654 they can quit
    [quit] (to_roll = 0 & got_6 != 0 & got_5 != 0 & got_4 != 0) | n = 4 ->
        1: (n' = 4); // setting n=4 disables all other actions

    [roll_1] n < 4 & !rolled_1 & to_roll > 0 & //not finished and haven't yet rolled this die
           got_6 != 1 & got_5 != 1 & got_4 != 1 -> // this die is not 6 (ship) 5 (captain), or 4 (crew)
        0.166666667: (die1'=1) & (rolled_1' = true) & (to_roll'=to_roll-1) + 
        0.166666667: (die1'=2) & (rolled_1' = true) & (to_roll'=to_roll-1) +
        0.166666667: (die1'=3) & (rolled_1' = true) & (to_roll'=to_roll-1) +
        0.166666667: (die1'=4) & (rolled_1' = true) & (to_roll'=to_roll-1) & (got_4' = got_5!=0 ? 1 : got_4) +
        0.166666666: (die1'=5) & (rolled_1' = true) & (to_roll'=to_roll-1) & (got_5' = got_6!=0 ? 1 : got_5) +
        0.166666666: (die1'=6) & (rolled_1' = true) & (to_roll'=to_roll-1) & (got_6' = 1) ;  

    [roll_2] n < 4 & rolled_1 & !rolled_2 & to_roll > 0 & //not finished and haven't yet rolled this die
                got_6 != 2 & got_5 != 2 & got_4 != 2 -> // this die is not 6 (ship) 5 (captain), or 4 (crew)
        0.166666667: (die2'=1) & (rolled_2' = true) & (to_roll'=to_roll-1) + 
        0.166666667: (die2'=2) & (rolled_2' = true) & (to_roll'=to_roll-1) +
        0.166666667: (die2'=3) & (rolled_2' = true) & (to_roll'=to_roll-1) +
        0.166666667: (die2'=4) & (rolled_2' = true) & (to_roll'=to_roll-1) & (got_4' = got_5!=0 ? 2 : got_4) +
        0.166666666: (die2'=5) & (rolled_2' = true) & (to_roll'=to_roll-1) & (got_5' = got_6!=0 ? 2 : got_5) +
        0.166666666: (die2'=6) & (rolled_2' = true) & (to_roll'=to_roll-1) & (got_6' = 2) ; 

    [roll_3] n < 4 & rolled_2 & !rolled_3 & to_roll > 0 & //not finished and haven't yet rolled this die
            got_6 != 3 & got_5 != 3 & got_4 != 3 -> // this die is not 6 (ship) 5 (captain), or 4 (crew)
        0.166666667: (die3'=1) & (rolled_3' = true) & (to_roll'=to_roll-1) + 
        0.166666667: (die3'=2) & (rolled_3' = true) & (to_roll'=to_roll-1) +
        0.166666667: (die3'=3) & (rolled_3' = true) & (to_roll'=to_roll-1) +
        0.166666667: (die3'=4) & (rolled_3' = true) & (to_roll'=to_roll-1) & (got_4' = got_5!=0 ? 3 : got_4) +
        0.166666666: (die3'=5) & (rolled_3' = true) & (to_roll'=to_roll-1) & (got_5' = got_6!=0 ? 3 : got_5) +
        0.166666666: (die3'=6) & (rolled_3' = true) & (to_roll'=to_roll-1) & (got_6' = 3) ;  

    [roll_4] n < 4 & rolled_3 & !rolled_4 & to_roll > 0 & //not finished and haven't yet rolled this die
            got_6 != 4 & got_5 != 4 & got_4 != 4 -> // this die is not 6 (ship) 5 (captain), or 4 (crew)
        0.166666667: (die4'=1) & (rolled_4' = true) & (to_roll'=to_roll-1) + 
        0.166666667: (die4'=2) & (rolled_4' = true) & (to_roll'=to_roll-1) +
        0.166666667: (die4'=3) & (rolled_4' = true) & (to_roll'=to_roll-1) +
        0.166666667: (die4'=4) & (rolled_4' = true) & (to_roll'=to_roll-1) & (got_4' = got_5!=0 ? 4 : got_4) +
        0.166666666: (die4'=5) & (rolled_4' = true) & (to_roll'=to_roll-1) & (got_5' = got_6!=0 ? 4 : got_5) +
        0.166666666: (die4'=6) & (rolled_4' = true) & (to_roll'=to_roll-1) & (got_6' = 4) ;

    [roll_5] n < 4 & rolled_4 & !rolled_5 & to_roll > 0 & //not finished and haven't yet rolled this die
            got_6 != 5 & got_5 != 5 & got_4 != 5 -> // this die is not 6 (ship) 5 (captain), or 4 (crew)
        0.166666667: (die5'=1) & (rolled_5' = true) & (to_roll'=to_roll-1) + 
        0.166666667: (die5'=2) & (rolled_5' = true) & (to_roll'=to_roll-1) +
        0.166666667: (die5'=3) & (rolled_5' = true) & (to_roll'=to_roll-1) +
        0.166666667: (die5'=4) & (rolled_5' = true) & (to_roll'=to_roll-1) & (got_4' = got_5!=0 ? 5 : got_4) +
        0.166666666: (die5'=5) & (rolled_5' = true) & (to_roll'=to_roll-1) & (got_5' = got_6!=0 ? 5 : got_5) +
        0.166666666: (die5'=6) & (rolled_5' = true) & (to_roll'=to_roll-1) & (got_6' = 5) ;  

    endmodule
