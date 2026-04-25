function scr_save(slot = global.slot, snd = false){
    
    //time management
    
    if file_exists(global.json) and global.new_game = false{
        global.oldtime = global.slots[slot].game.time
    } else {
        global.oldtime = 0
    }
    if global.countmenutime = true{
        global.newtime = current_time - global.menutime - global.savetime
        global.countmenutime = false
    } else{
        global.newtime = current_time - global.savetime
    }
    
    newseconds = floor(global.newtime / 1000)
    newmins = floor((newseconds + 1) / 60)
    newhours = floor((newmins + 1) / 60)

    oldseconds = floor(global.oldtime / 1000)
    oldmins = floor(oldseconds / 60)
    oldhours = floor(oldmins / 60)

    totseconds = newseconds + oldseconds
    totmins = newmins + oldmins
    tothours = newhours + oldhours
    
    while totmins >= 60 and tothours < 999{
        totmins -= 60
    }
    
    if totmins < 10{
        global.time = string(tothours) + ":0" + string(totmins)
    } else{
        global.time = string(tothours) + ":" + string(totmins)
    }
    
    if tothours >= 999 and totmins >= 59{
        global.time = "999:59"
    }
    
    time_to_save = global.oldtime + global.newtime
    global.savetime = current_time
    
    //save
    
    save = {
        
        mainchara : {
            
            name : global.name,
            mainchara_x : obj_mainchara.x,
            mainchara_y : obj_mainchara.y,
            facing : obj_mainchara.facing_direction,
            
            inv : global.inv,
            
            at : global.stats.under.mainchara.at,
            df : global.stats.under.mainchara.df,
            wp : global.stats.under.mainchara.wp.id,
            ar : global.stats.under.mainchara.ar.id,
            money : global.stats.under.mainchara.money,
            hp : global.stats.under.mainchara.hp,
            hp_max : global.stats.under.mainchara.hpmax,
            lv : global.stats.under.mainchara.lv,
            xp : global.stats.under.mainchara.xp
            
        },
            
        game : {
            slot,
            rm : room_get_name(room),
            time : time_to_save
        }
        
    }
    
    global.slots[0] = global.num_slots
    global.slots[slot] = save
    slots_dummy = global.slots
    
    global.slots = json_stringify(global.slots, true)
    
    file = file_text_open_write(global.json)
    
    file_text_write_string(file, global.slots)
    file_text_close(file)
    
    global.slots = slots_dummy
    
    global.new_game = false
    
    if snd = true{
        scr_snd(snd_save)
    }
    
}