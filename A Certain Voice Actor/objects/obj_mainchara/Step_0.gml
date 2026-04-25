/// @description Runs every frame
//control
//are the buttons being pressed
upbutton = keyboard_check(ord(obj_initialize.upkey)) || keyboard_check(vk_up)
downbutton = keyboard_check(ord(obj_initialize.downkey)) || keyboard_check(vk_down)
leftbutton = keyboard_check(ord(obj_initialize.leftkey)) || keyboard_check(vk_left)
rightbutton = keyboard_check(ord(obj_initialize.rightkey)) || keyboard_check(vk_right)
selectbutton = keyboard_check(ord(obj_initialize.selectkey)) || keyboard_check(vk_enter)
cancelbutton = keyboard_check(ord(obj_initialize.cancelkey)) || keyboard_check(vk_shift)
menubutton = keyboard_check(ord(obj_initialize.menukey))

var up_key = global.upbuttonpressed and can_move;
var down_key = global.downbuttonpressed and can_move;
var left_key = global.leftbuttonpressed and can_move;
var right_key = global.rightbuttonpressed and can_move;

/*/movement
if (keyboard_check(vk_shift) or keyboard_check(ord("X"))) {
    move_spd = run_spd;
}
else {
    move_spd = walk_spd;
}

xspd = (right_key - left_key) * move_spd
yspd = (down_key - up_key) * move_spd*/

var idling = xspd == 0 && yspd == 0;
var running = move_spd == run_spd;
var wearing_wig = global.stats.under.mainchara.ar == global.item.armor.stylish_wig;

/*if (xspd > 0) {
    facing_direction = 0;
}
else if (xspd < 0) {
    facing_direction = 2;
}
else if (yspd < 0) {
    facing_direction = 1;
}
else if (yspd > 0) {
    facing_direction = 3;
}

if (running) {
    switch (facing_direction) {
        case 0:
            sprite_index = wearing_wig ? spr_friskwigrr : spr_friskrr;
            break;
        case 1:
            sprite_index = wearing_wig ? spr_friskwigru : spr_friskru;
            break;
        case 2:
            sprite_index = wearing_wig ? spr_friskwigrl : spr_friskrl;
            break;
        case 3:
            sprite_index = wearing_wig ? spr_friskwigrd : spr_friskrd;
            break;
    }
}
else {
    switch (facing_direction) {
        case 0:
            sprite_index = wearing_wig ? spr_friskwigwr : spr_friskwr;
            break;
        case 1:
            sprite_index = wearing_wig ? spr_friskwigwu : spr_friskwu;
            break;
        case 2:
            sprite_index = wearing_wig ? spr_friskwigwl : spr_friskwl;
            break;
        case 3:
            sprite_index = wearing_wig ? spr_friskwigwd : spr_friskwd;
            break;
    }
}*/

//implementation of Finite State Machine
var face_dir = scr_face_to_string()
var is_armored = global.stats.under.mainchara.ar == global.item.armor.stylish_wig
var mode = wearing_wig ? "wigged" : "normal"

if !keyboard_check(upbutton) && !keyboard_check(downbutton) {
    show_debug_message("You should be dancing rn")
} else {
    show_debug_message("you arent dancing")
}

switch (mState) {
    case mainchara_state.idle : {
        
        if (mInnerState == 0) { //enter
            mInnerState = 1
        }
        if (mInnerState == 1) { //update
            var hmove = -leftbutton + rightbutton
            var vmove = -upbutton + downbutton
            if (hmove != 0 || vmove != 0) {
                ChangeState(mainchara_state.walk)
            }
            if (hmove != 0 || vmove != 0) and cancelbutton {
                ChangeState(mainchara_state.run)
            }
            if upbutton && downbutton {
                ChangeState(mainchara_state.dance)
            }
            if (can_move) {
                if (place_meeting(x + xspd, y, obj_collider)) {
                    xspd = 0
                }
                x += xspd;
                if (place_meeting(x, y + yspd, obj_collider)) {
                    yspd = 0;
                }
                y += yspd;
            }
            sprite_index = sprites.idle[$ is_armored ? "wigged" : "normal"][$ scr_face_to_string()]
        }
        if (mInnerState == 2) { // exit
            mState = mNextState
            mInnerState = 0
        }
        
    }
    break
    case mainchara_state.walk : {
        
        if (mInnerState == 0) { //enter
            mInnerState = 1
            image_speed = 1
        }
        if (mInnerState == 1) { //update
            var hmove = -leftbutton + rightbutton
            var vmove = -upbutton + downbutton
            xspd = hmove * walk_spd
            yspd = vmove * walk_spd
            if (hmove != 0 || vmove != 0){
                if leftbutton {
                    facing_direction = 2
                }
                if rightbutton {
                    facing_direction = 0
                }
                if upbutton {
                    facing_direction = 1
                }
                if downbutton {
                    facing_direction = 3
                }
            }
            if (hmove == 0 && vmove == 0){
                ChangeState(mainchara_state.idle)
            }
            if (hmove != 0 || vmove != 0) and cancelbutton {
                ChangeState(mainchara_state.run)
            }
            if (can_move) {
                if (place_meeting(x + xspd, y, obj_collider)) {
                    xspd = 0
                }
                x += xspd;
                if (place_meeting(x, y + yspd, obj_collider)) {
                    yspd = 0;
                }
                y += yspd;
            }
            sprite_index = sprites.walk[$ is_armored ? "wigged" : "normal"][$ scr_face_to_string()]
        }
        if (mInnerState == 2) { // exit
            mState = mNextState
            mInnerState = 0
        }
        
    }
    break
    case mainchara_state.run : {
        
        if (mInnerState == 0) { //enter
            mInnerState = 1
            image_speed = 1
        }
        if (mInnerState == 1) { //update
            var hmove = -leftbutton + rightbutton
            var vmove = -upbutton + downbutton
            xspd = hmove * run_spd
            yspd = vmove * run_spd
            if (hmove != 0 || vmove != 0){
                if leftbutton {
                    facing_direction = 2
                }
                if rightbutton {
                    facing_direction = 0
                }
                if upbutton {
                    facing_direction = 1
                }
                if downbutton {
                    facing_direction = 3
                }
            }
            if (hmove == 0 && vmove == 0){
                ChangeState(mainchara_state.idle)
            }
            if !cancelbutton && !idling {
                ChangeState(mainchara_state.walk)
            }
            if (can_move) {
                if (place_meeting(x + xspd, y, obj_collider)) {
                    xspd = 0
                }
                x += xspd;
                if (place_meeting(x, y + yspd, obj_collider)) {
                    yspd = 0;
                }
                y += yspd;
            }
            sprite_index = sprites.run[$ is_armored ? "wigged" : "normal"][$ scr_face_to_string()]
        }
        if (mInnerState == 2) { // exit
            mState = mNextState
            mInnerState = 0
        }
        
    }
    break
    case mainchara_state.dance : {
        
        if (mInnerState == 0) { //enter
            mInnerState = 1
            sprite_index = sprites.dance[$ is_armored ? "wigged" : "normal"]
            image_speed = 1
        }
        if (mInnerState == 1) { //update
            if !upbutton && !downbutton {
                ChangeState(mainchara_state.idle)
            }
            if (can_move) {
                if (place_meeting(x + xspd, y, obj_collider)) {
                    xspd = 0
                }
                x += xspd;
                if (place_meeting(x, y + yspd, obj_collider)) {
                    yspd = 0;
                }
                y += yspd;
            }
        }
        if (mInnerState == 2) { // exit
            mState = mNextState
            mInnerState = 0
        }
        
    }
    break
    
}

// to prevent Frisk dancing on the spot:
if (idling) {
    image_speed = 0;
    image_index = 0;
}
else {
    image_speed = 1;
}

/*/ collision
if (can_move) {
    if (place_meeting(x + xspd, y, obj_collider)) {
        xspd = 0
    }
    x += xspd;
    if (place_meeting(x, y + yspd, obj_collider)) {
        yspd = 0;
    }
    y += yspd;
}*/

//don't shake
x[0] = round(x[0.1])
y[0] = round(y[0.1])