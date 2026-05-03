if keyboard_check_pressed(global.menubutton) and instance_exists(obj_mainchara) and obj_mainchara.can_move {
    instance_create_depth(0, 0, -1000, obj_menu)
    image_index = 0
    image_speed = 0
    scr_snd(snd_squeak)
    obj_mainchara.can_move = false
}