function scr_equip_armor (index){
    
    inv = global.inventory
    ar_old = global.stats.under.mainchara.ar
    ar_new = inv[index]
    
    inv[index] = ar_old
    global.stats.under.mainchara.ar = ar_new
    
    if ar_old = global.item.armor.bandage {
        //add bandage not able to be used anymore dialogue here
        scr_item_delete(global.item.armor.bandage)
        scr_item_add(global.item.key.used_bandage)
    }
    
    scr_updatelist()
    
}