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
        desc : "Made it myself!\n(lie)",
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
            "Howdy \"" + global.name + "\".",
            "What's up?"
        ],
        outro : [
            "See ya partner.",
            "Stop by later."
        ],
        buy : "Whatchu\nwanna buy?",
        thanks : "Thanks\na lot\nlol",
        broke : "Twin is\nme fr\n(brokey)",
        full : "There's a\nbox right\nthere y'know",
        looking : "Snooping\nas usual I\nsee?",
        random_flavor : [
            "tbh i'm\nkinda bored\nhurry up"
        ],
        talk_flavor : "Wanna chat?",
        talk_options : [
            "Say Hello",
            "Hacma",
            "Mickerrific",
            "Fight him"
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
                "........."
            ],
            [
                "..................?"
            ],
            [
                "Bro PLEASE stop staring at me 💔"
            ]
        ],
        talk_hacma : [
            [
                "The Cancellings and ACMA? Those guys are great.",
                "They're all funny and clever and\nput so much dedication and love\nInto hating or defending."
            ],
            [
                "Even though Hater ran out of ideas\naround episode 7."
            ],
            [
                "And made ME do most of the accusations.",
                "He's still an amazing boss and friend."
            ],
            [
                "Even though Averie is on the opposite team,",
                "I can't really hate them."
            ],
            [
                "It takes a lot of guts to stand\nagainst a big established thing."
            ],
            [
                "In my opinion everyone who worked on Hacma stuff,",
                "Deserves anything they can get their hands on."
            ]
        ],
        talk_mick : [
            [
                "Mickerrific? The community or the person?"
            ],
            [
                "Seeing as this is a one way dialogue choice,",
                "I'll just do both. Let's do the community first."
            ],
            [
                "This community is amazing. A bit...\"" + "hyper" + "\" sometimes..."
            ],
            [
                "But amazing nonetheless.\nI wouldn't trade this community for anything."
            ],
            [
                "Mick on the other hand is a terrible,"
            ],
            [
                "Irredeemable,"
            ],
            [
                "HORRIFIC person who 100% deserves to be cancelled."
            ]
        ],
        talk_fight : [
            [
                "Fight me?",
                "Are you sure?"
            ],
            [
                "Hm..."
            ],
            [
                "Ah fuck it, why not?"
            ],
            [
                "Just make sure you've done your\nstuff with Mick,",
                "Then come back to me again when you're ready."
            ]
        ],
        talk_fight_new : [
            [
                "You ready?",
                "Let's hope you prepared enough for this..."
            ]
        ],
        refuse_buy : [
            [
                "Bro hell nah I'm\npoor too 💔"
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
            herd.lines.talk_fight
        ]
        break
    
}

box = spr_simplebox_thick
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

exit_timer = 1
obj_mainchara.can_move = false
obj_mainchara.y -= 50