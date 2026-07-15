items = {
    
    wooden_dirk : {
        
        name : "Wooden Dirk",
        price : 100,
        type : "weapon",
        stat : global.item.weapons.wooden_dirk.atk,
        desc : "Gotta have\nprotection!",
        item : global.item.weapons.wooden_dirk
        
    },
    
    stylish_wig : {
        
        name : "Stylish Wig",
        price : 250,
        type : "armor",
        stat : global.item.armor.stylish_wig.def, 
        desc : "Femmerrific.",
        item : global.item.armor.stylish_wig
        
    },
    
    honey_bunny : {
        
        name : "Honey Bunny",
        price : 25,
        type : "food",
        stat : global.item.food.honey_bunny.heals,
        desc : "Made it\nmyself! (lie)",
        item : global.item.food.honey_bunny
        
    },
    
    terrific_cocoa : {
        
        name : "Terrific Cocoa",
        price : 50,
        type : "food",
        stat : global.item.food.terrific_cocoa.heals,
        desc : "Perfect.",
        item : global.item.food.terrific_cocoa
        
    },
    
}

herd = {
    
    sprite : spr_herdshop,
    spr_xoff : -1,
    spr_yoff : 56,
    
    bg : spr_herdshopbg,
    bg_xoff : 0,
    bg_yoff : 60,
    bg_anim : -1,
    
    refuse_buy : true,
    
    font : fnt_main,
    
    lines : {
        
        intro : [
            "Howdy " + global.name + ".",
            "What's up?"
        ],
        outro : [
            "See ya.",
            "Stop by later."
        ],
        buy : "Whatcha\nwanna buy?",
        thanks : "Thanks a lot\nman.",
        broke : "Twin is\nme fr\n(brokey)",
        full : "There's a\nbox right\nthere y'know.",
        looking : "Snooping\nas usual I\nsee?",
        random_flavor : [
            "tbh i'm kinda bored hurry\nup."
        ],
        talk_flavor : "Wanna chat?",
        talk_options : [
            "Say Hello",
            "Hacma",
            "Mickerrific",
            "Battle Style"
        ],
        talk_hello : [
            [
                "Howdy!"
            ],
            [
                "..."
            ],
            [
                "......"
            ],
            [
                "............"
            ],
            [
                "........................?"
            ],
            [
                "Bro PLEASE stop staring at me\n:heartbreak:"
            ]
        ],
        talk_hacma : [
            [
                "The Cancellings and ACMA?",
                "Those guys are great."
            ],
            [
                "They're all so funny and clever\nand put so much dedication and love\ninto hating or defending respectfully.",
            ],
            [
                "Even though Hater ran out of ideas\naround episode 7..."  
            ],
            [
                "And made ME do most of the accusations...",
            ],
            [
                "He's still an amazing boss and friend."
            ],
            [
                "And even though Averie is on the\nopposite team...",
            ],
            [
                "I can't really hate them."
            ],
            [
                "It takes a lot of guts to do what\nyou think is right."
            ],
            [
                "In my opinion everyone who\nworked on Hacma stuff...",
            ],
            [
                "Deserves anything they can get\ntheir hands on."
            ],
            [
                "..."
            ],
            [
                "Damn that was corny."
            ]
        ],
        talk_mick : [
            [
                "Mickerrific?",
                "The person or the community?"
            ],
            [
                "Seeing as this is a one way dialogue,",
                "I'll just do both."
            ],
            [
                "Let's do the community first."
            ],
            [
                "This community is amazing.",
                "A bit...\"" + "hyper" + "\" sometimes..."
            ],
            [
                "But amazing nonetheless.",
                "I wouldn't trade this community\nfor anything."
            ],
            [
                "Mick on the other hand is a terrible,"
            ],
            [
                "Irredeemable,"
            ],
            [
                "HORRIFIC person who 100% deserves\nto be cancelled."
            ]
        ],
        talk_battle_style : [
            [
                "Congrats you just changed the battle\nstyle to Deltarune!"
            ],
            [
                "You weren't thinking it but the attacks\nARE different!"
            ],
            [
                "And who knows, you might even see a\nfew familiar faces."
            ],
            [
                "(You can change back to Undertale\nStyle by talking to them again.)"
            ]
        ],
        talk_battle_style_new : [
            [
                "Congrats you just changed the battle\nstyle back to Undertale!"
            ],
            [
                "If you for some reason did the\nDeltarune fight first..."
            ],
            [
                "Uh..."
            ],
            [
                "Shame on you."
            ],
            [
                "(You can change into the Deltarune\nStyle by talking to them again.)"
            ]
        ],
        talk_battle_style_new_name : "Battle Style",
        
        refuse_buy : [
            [
                "Bro are you kidding me in THIS economy?",
                "You'd have to kill me before I waste\nmoney on stuff I just sold you."
            ]
        ],
        
        warp_rm : rm_outsidehome,
        warp_x : 77,
        warp_y : 134,
        warp_facing: "up"
        
    }
    
}

scr_keeper()

switch keeper{
    
    case herd:
        stock = [
            items.wooden_dirk,
            items.stylish_wig,
            items.honey_bunny,
            items.terrific_cocoa
        ]
        chat = [
            herd.lines.talk_hello,
            herd.lines.talk_hacma,
            herd.lines.talk_mick,
            herd.lines.talk_battle_style
        ]
        break
    
}

box = spr_simplebox
anim = -1

star = "*"

options = [
    "Buy",
    "Sell",
    "Talk",
    "Exit"
]
yn = [
    "Yes",
    "No"
]

orig_chat = []
var all_lines = struct_get_names(keeper.lines)
for(var i = 0; i < array_length(all_lines); i++){
    if array_contains(chat, variable_instance_get(keeper.lines, all_lines[i])){
        array_resize(orig_chat, array_length(orig_chat))
        orig_chat[i] = all_lines[i]
    }
}
for(var i = 0; i < array_length(orig_chat); i++){
    if orig_chat[i] = 0{
        array_delete(orig_chat, i, 1)
        i--
    }
}
new_chat = variable_clone(orig_chat)

menu = "select"
welcome = true
selected = 0
soul = spr_soulsmall
menu_timer = 1
page = 0
buy_flavor = "default"
selected_yn = 0

ref_count = 1
talk_count = [1, 1, 1, 1]
talk_count_new = [1, 1, 1, 1]
talk_col = c_white
is_new = [false, false, false, false]

no_sell = [global.item]
sellable = []
link = []
col = "left"
ex = false
selling = false

for(var i = 0; i < array_length(global.inventory); i++){
    if !array_contains(no_sell, global.inventory[i]){
        array_resize(sellable, array_length(sellable) + 1)
        len = array_length(sellable) - 1
        sellable[len] = global.inventory[i]
        array_resize(link, array_length(sellable))
        link[len] = i
    }
}

curve = animcurve_get_channel(ac_buy_popup, "curve1")
percent = 0
pos = animcurve_channel_evaluate(curve, percent)
info_top = 39
info_bottom = 123
dist = info_bottom - info_top
info_y = info_bottom - (dist * pos)

exit_timer = 1
obj_mainchara.can_move = false
obj_mainchara.y -= 50