function scr_equippable_id_convert(equippable){
    
    item = global.item.weapons.wooden_dirk
    
    if struct_exists(global.item.weapons, equippable){
        item = struct_get(global.item.weapons, equippable)
    }
    
    return item
    
}