/// @description Runs every frame
//control
var up_key = keyboard_check(vk_up)
var down_key = keyboard_check(vk_down)
var left_key = keyboard_check(vk_left)
var right_key = keyboard_check(vk_right)

//movement
xspd = (right_key - left_key) * move_spd
yspd = (down_key - up_key) * move_spd

x += xspd
y += yspd

//animate
if (xspd > 0) {
	sprite_index = spr_friskwr
} else if (xspd < 0) {
	sprite_index = spr_friskwl
} else if (yspd > 0) {
	sprite_index = spr_friskwd
} else if (yspd < 0) {
	sprite_index = spr_friskwu
}

if (xspd != 0 or yspd != 0) {
	image_speed = 1
} else {
	image_speed = 0
	image_index = 0
}