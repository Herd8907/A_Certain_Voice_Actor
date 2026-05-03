room_goto(target_room)
obj_mainchara.x = target_x
obj_mainchara.y = target_y

//facing

if (facing = "right") {
	
	obj_mainchara.sprite_index = spr_friskwr
	
}

if (facing = "left") {
	
	obj_mainchara.sprite_index = spr_friskwl
	
}

if (facing = "down") {
	
	obj_mainchara.sprite_index = spr_friskwd
	
}

if (facing = "up") {
	
	obj_mainchara.sprite_index = spr_friskwu
	
}

//fade out
image_speed = -1