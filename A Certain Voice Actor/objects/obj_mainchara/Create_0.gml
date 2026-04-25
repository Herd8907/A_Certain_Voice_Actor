/// @description Runs upon creation
//define variables
xspd = 0
yspd = 0

move_spd = 2.5
walk_spd = 2.5
run_spd = 5
was_running = false

can_move = true

facing_direction = 3

endpress = false

//are the buttons being pressed
upbutton = false
downbutton = false
leftbutton = false
rightbutton = false
selectbutton = false
cancelbutton = false
menubutton = false

//Finite State Machine
enum mainchara_state {
    
    idle,
    walk,
    run,
    dance
    
}

mState = mainchara_state.idle
mInnerState = 0 //0 = enter, 1 = update, 2 = exit
mNextState = mState

ChangeState = function(nextState) {
    
    mNextState = nextState
    mInnerState = 2
    
}

scr_face_to_string = function(){
  switch(facing_direction){
    case 0: return "right";
    case 1: return "up";
    case 2: return "left";
    case 3: return "down";
  }
}

//sprite library
sprites = {
    
    idle : {
        normal : {
            right : spr_friskwr,
            left : spr_friskwl,
            down : spr_friskwd,
            up : spr_friskwu,
        },
        wigged : {
            right : spr_friskwigwr,
            left : spr_friskwigwl,
            down : spr_friskwigwd,
            up : spr_friskwigwu
        }
    },
    
    walk : {
        normal : {
            right : spr_friskwr,
            left : spr_friskwl,
            down : spr_friskwd,
            up : spr_friskwu,
            }, 
        wigged : {
            right : spr_friskwigwr,
            left : spr_friskwigwl,
            down : spr_friskwigwd,
            up : spr_friskwigwu
        }
    },
    
    run : {
        normal : { 
            right : spr_friskrr,
            left : spr_friskrl,
            down : spr_friskrd,
            up : spr_friskru,
            },
        wigged : {
            right : spr_friskwigrr,
            left : spr_friskwigrl,
            down : spr_friskwigrd,
            up : spr_friskwigru
        }
    },
    
    dance : {
        normal : spr_friskdance,
        wigged : spr_friskwigdance
    }
    
}