slots = []

if file_exists(global.json) {
    save = scr_json_to_var()
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
    }
}
global.slots = slots

if file_exists(global.json) and global.new_game = false{
    json = scr_json_to_var()
    global.oldtime = json[1].game.time
} else {
    global.oldtime = 0
}

//items ------------------------------------------------------------------------------------------------------------------------------
global.item = {
	
	food : {
		
		terrific_cocoa : {
			
            id : "terrific_cocoa",
			name : "Terrific Cocoa",
			name_short : "TeriCocoa",
            desc : "Heals 25 HP A cup of hot chocolate at the perfect temperature. Has microphone shaped marshmallows.",
            
            heals : 25
            
        },
        
        honey_bunny : {
			
            id : "honey_bunny",
			name : "Honey Bunny",
			name_short : "HoneyBun",
            desc : "Heals 12 HP A honey bun in the shape of a rabbit. Reminds you of a certain snowy shop.",
            
            heals : 12
            
        },
        
        pie : {
			
            id : "pie",
			name : "Butterscotch Pie",
			name_short : "ButtPie",
            desc : "All HP A warm slice of Butterscotch and Cinnamon pie.",
            
            heals : 99
            
        },
        
        fanta_c : {
			
            id : "fanta_c",
			name : "The Fanta C",
			name_short : "FantaC",
            desc : "All HP Is this the real life? Is this just Fanta C? Increases ATTACK and DEFENSE.",
            
            heals : 99
            
        },
        
        bandage : {
			
            id : "bandage",
			name : "Bandage",
			name_short : "Bandage",
            desc : "Heals 10 HP It has already been used several times.",
            
            heals : 10
            
        },
		
	},
	
	weapons : {
		
		wooden_dirk : {
			
            id : "wooden_dirk",
			name : "Wooden Dirk",
			name_short : "WoodDirk",
            desc : "Weapon AT 3 A dagger made of wood. Lightweight and easy to use.",
            
            atk : 3
            
        },
        
        stick : {
			
            id : "stick",
			name : "Stick",
			name_short : "Stick",
            desc : "Weapon AT 0 Its bark is worse than its bite.",
            
            atk : 0
            
        },
		
	},
	
	armor : {
		
		stylish_wig : {
			
            id : "stylish_wig",
			name : "Stylish Wig",
			name_short : "StyleWig",
            desc : "It's ok to be a femboy Mick!",
            
            def : 8
            
        },
        
        bandage : {
			
            id : "bandage",
			name : "Bandage",
            
            def : 0
            
        },
		
	},
    
}

global.inventory = [global.item.food.honey_bunny, global.item.weapons.wooden_dirk, global.item.food.pie, global.item.food.terrific_cocoa, global.item.food.fanta_c]
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
            wp : global.item.weapons.wooden_dirk,
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
            wp : global.item.weapons.wooden_dirk,
            ar : global.item.armor.stylish_wig,
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
            lv : 1,
            xp : 0,
            next_lv : 10,
            money : 0,
            spells : []
            
        },
        
        hator : {
            
            name : "Hator",
            hp : 110,
            hpmax : 110,
            at : 14,
            df : 2,
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
        xp_gain : 0,
        money_gain : 0
        
    },
    
    herd : {
        
        name : "Herd",
        hp : 30,
        at : 5,
        df : 5,
        xp_gain : 0,
        money_gain : 0
        
    }
    
}

if file_exists(global.json) and global.new_game = false {
    global.stats.under.mainchara.hp = slot.mainchara.hp
    global.stats.under.mainchara.hpmax = slot.mainchara.hp_max
    global.stats.under.mainchara.at = slot.mainchara.at
    global.stats.under.mainchara.df = slot.mainchara.df
    global.stats.under.mainchara.wp = scr_equippable_id_convert(slot.mainchara.wp)
    global.stats.under.mainchara.ar = scr_equippable_id_convert(slot.mainchara.ar)
    global.stats.under.mainchara.lv = slot.mainchara.lv
    global.stats.under.mainchara.xp = slot.mainchara.xp
    global.stats.under.mainchara.money = slot.mainchara.money
    global.stats.under.mainchara.next_lv = 10 //will be calculated in later vid
}