//slide on screen
if(y < 37){
    
	y += 1
    
}

//don't shake
x = round(x)
y = round(y)

if !instance_exists(obj_buttons) and !instance_exists(obj_buttons_continue){
	instance_create_depth(10, 70, 100, obj_buttons)
}