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
        
        intro : get_dia("intro"),
        outro : get_dia("outro"),
        buy : get_dia("buy"),
        thanks : get_dia("thanks"),
        broke : get_dia("broke"),
        full : get_dia("full"),
        looking : get_dia("looking"),
        random_flavor : get_dia("random_flavor"),
        talk_flavor : get_dia("talk_flavor"),
        talk_options : get_dia("talk_options"),
        talk_hello : get_dia("talk_hello"),
        talk_hacma : get_dia("talk_hacma"),
        talk_mick : get_dia("talk_mick"),
        talk_battle_style : get_dia("talk_battle_style"),
        
        refuse_buy : get_dia("talk_refuse_buy"),
        
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

currency = get_dia("currency")
star = "*"

options = [
    get_txt("shop.buy"),
    get_txt("shop.sell"),
    get_txt("shop.talk"),
    get_txt("shop.exit")
]
yn = get_txt("sys.yn")

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