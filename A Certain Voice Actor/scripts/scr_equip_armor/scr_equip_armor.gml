function scr_equip_armor (index){
    
    inv = global.inventory
    ar_old = global.stats.under.mainchara.ar
    ar_new = inv[index]
    
    inv[index] = ar_old
    global.stats.under.mainchara.ar = ar_new
    
    scr_updatelist()
    
}