function scr_item_add(item){
    
    inv = global.inventory
    
    if array_length(inv) >= 8 {
        exit
    }
    
    index = array_length(inv)
    
    
    scr_updatelist()
    
}