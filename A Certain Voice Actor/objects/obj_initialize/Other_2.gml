slots = []

if file_exists(global.json) {
    save = json_to_var()
    global.num_slots = save[0]
} else {
    global.num_slots = 1
}

if global.slot > global.num_slots {
    global.num_slots = global.slot
}
for(var i = 1; i <= global.num_slots; i++) {
    slots[i] = { }
}

if file_exists(global.json) {
    
    if array_length(save)-1 < array_length(slots) {
        array_resize(save, array_length(save))
        for(var i = array_length(save); i < array_length(slots); i++){
            array_resize(save, array_length(save))
            save[i] = {}
        }
    }
    
    for(var i = 1; i <= global.num_slots; i++) {
        slots[i] = save[i]
    }
    
    slot = slots[global.slot]
    
    if variable_struct_names_count(slot) > 0 {
        global.new_game = false
        global.name = slot.mainchara.name
        global.start_room = asset_get_index(slot.game.rm)
        global.start_x = slot.mainchara.mainchara_x
        global.start_y = slot.mainchara.mainchara_y
        global.facing = slot.mainchara.facing
    }
}
global.slots = slots

if file_exists(global.json) and global.new_game = false{
    json = json_to_var()
    global.oldtime = json[1].game.time
} else {
    global.oldtime = 0
}

//items ------------------------------------------------------------------------------------------------------------------------------
cap = true

global.item = {
	
	food : {
		
		terrific_cocoa : {
			
            id : "terrific_cocoa",
			name : get_txt("item.food.terrific_cocoa.name"),
			name_short : get_txt("item.food.terrific_cocoa.name_short"),
            desc : get_txt("item.food.terrific_cocoa.desc"),
            
            heals : 25
            
        },
        
        honey_bunny : {
			
            id : "honey_bunny",
			name : get_txt("item.food.honey_bunny.name"),
			name_short : get_txt("item.food.honey_bunny.name_short"),
            desc : get_txt("item.food.honey_bunny.desc"),
            
            heals : 12
            
        },
        
        pie : {
			
            id : "pie",
			name : get_txt("item.food.pie.name"),
			name_short : get_txt("item.food.pie.name_short"),
            desc : get_txt("item.food.pie.desc"),
            
            heals : 999
            
        },
        
        fanta_c : {
			
            id : "fanta_c",
			name : get_txt("item.food.fanta_c.name"),
			name_short : get_txt("item.food.fanta_c.name_short"),
            desc : get_txt("item.food.fanta_c.desc"),
            
            heals : 999
            
        }
		
	},
	
	weapons : {
		
		wooden_dirk : {
			
            id : "wooden_dirk",
			name : get_txt("item.weapons.wooden_dirk.name"),
			name_short : get_txt("item.weapons.wooden_dirk.name_short"),
            desc : get_txt("item.weapons.wooden_dirk.desc"),
            
            atk : 3
            
        },
        
        stick : {
			
            id : "stick",
			name : get_txt("item.weapons.stick.name"),
			name_short : get_txt("item.weapons.stick.name_short"),
            desc : get_txt("item.weapons.stick.desc"),
            
            atk : 0
            
        },
		
	},
	
	armor : {
		
		stylish_wig : {
			
            id : "stylish_wig",
			name : get_txt("item.armor.stylish_wig.name"),
			name_short : get_txt("item.armor.stylish_wig.name_short"),
            desc : get_txt("item.armor.stylish_wig.desc"),
            
            def : 8
            
        },
        
        bandage : {
			
            id : "bandage",
			name : get_txt("item.armor.bandage.name"),
            
            def : 0
            
        },
		
	}
    
}

global.inventory = []
scr_updatelist(true)


//stats -----------------------------------------------------------------------------------------------------------------------------------
global.stats = {
    
    under : {
        
        mainchara : {
            
            name : global.name,
            hp : 20,
            hpmax : 20,
            at : 0,
            df : 0,
            mg : 0,
            wp : global.item.weapons.stick,
            ar : global.item.armor.bandage,
            lv : 1,
            xp : 0,
            next_lv : 10,
            money : 0
            
        }
        
    },
    
    delta : {
        
        mainchara : {
            
            name : global.name,
            hp : 70,
            hpmax : 70,
            at : 0,
            df : 0,
            mg : 0,
            wp : global.item.weapons.stick,
            ar : global.item.armor.bandage,
            lv : 1,
            xp : 0,
            next_lv : 10,
            money : 0,
            spells : []
            
        },
        
        averie : {
            
            name : "Averie",
            hp : 90,
            hpmax : 90,
            at : 10,
            df : 2,
            mg: 4,
            lv : 1,
            xp : 0,
            next_lv : 10,
            money : 0,
            spells : []
            
        },
        
        hater : {
            
            name : "Hater",
            hp : 110,
            hpmax : 110,
            at : 14,
            df : 2,
            mg: 3,
            lv : 1,
            xp : 0,
            next_lv : 10,
            money : 0,
            spells : []
            
        },
        
    }, 
    
    //enemies -----------------------------------------------------------------------------------------------------------------
    mickerrific : {
        
        name : "Mickerrific",
        hp : 680,
        at : 8,
        df : 2,
        mg: 0,
        xp_gain : 0,
        money_gain : 0
        
    }
}

if file_exists(global.json) and global.new_game = false {
    global.stats.under.mainchara.hp = slot.mainchara.hp
    global.stats.under.mainchara.hpmax = slot.mainchara.hp_max
    global.stats.under.mainchara.at = slot.mainchara.at
    global.stats.under.mainchara.df = slot.mainchara.df
    global.stats.under.mainchara.mg = slot.mainchara.mg
    global.stats.under.mainchara.wp = scr_equippable_id_convert(slot.mainchara.wp)
    global.stats.under.mainchara.ar = scr_equippable_id_convert(slot.mainchara.ar)
    global.stats.under.mainchara.lv = slot.mainchara.lv
    global.stats.under.mainchara.xp = slot.mainchara.xp
    global.stats.under.mainchara.money = slot.mainchara.money
    global.stats.under.mainchara.next_lv = 10 //will be calculated in later vid
}

room_goto(rm_title)