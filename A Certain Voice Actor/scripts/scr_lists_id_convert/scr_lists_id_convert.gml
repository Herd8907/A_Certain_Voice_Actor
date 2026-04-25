function scr_lists_id_convert(){
    
    invie = global.inventory
    inv = global.inv
    
    array_resize(invie, array_length(inv))
    
    for(var i = 0; i < array_length(inv); i++) {
        
        item_id = inv[i]
        
        if struct_exists(global.item.food, item_id) {
            invie[i] = struct_get(global.item.food, item_id)
        } else if struct_exists(global.item.weapons, item_id) {
            invie[i] = struct_get(global.item.weapons, item_id)
        } else if struct_exists(global.item.armor, item_id) {
            invie[i] = struct_get(global.item.armor, item_id)
        } else if struct_exists(global.item.key, item_id) {
            invie[i] = struct_get(global.item.key, item_id)
        }
        
    }
    
}