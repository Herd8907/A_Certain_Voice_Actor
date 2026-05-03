function scr_equip_weapon(index){
    
    inv = global.inventory
    wp_old = global.stats.under.mainchara.wp
    wp_new = inv[index]
    
    inv[index] = wp_old
    global.stats.under.mainchara.wp = wp_new
    
    scr_updatelist()
    
}