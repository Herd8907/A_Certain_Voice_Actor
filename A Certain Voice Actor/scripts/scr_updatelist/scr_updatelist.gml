function scr_updatelist(load = false){
    
    if load = true and global.new_game = false {
        save = scr_json_to_var()
        global.inv = save[global.slot].mainchara.inv
        scr_lists_id_convert()
        exit
    }
    
    global.inv = []
    
    for(var i = 0; i < array_length(global.inventory); i++) {
        array_resize(global.inv, array_length(global.inv))
        array_set(global.inv, i, global.inventory[i].id)
    }
    
}