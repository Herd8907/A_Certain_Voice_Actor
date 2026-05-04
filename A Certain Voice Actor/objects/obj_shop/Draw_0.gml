draw_sprite(keeper.bg, keeper.bg_anim, center.x + keeper.bg_xoff, center.y - keeper.bg_yoff)
draw_sprite(keeper.sprite, anim, center.x - keeper.spr_xoff, center.y - keeper.spr_yoff)

draw_set_font(fnt_main)
draw_set_halign(fa_left)

if menu = "select" {
    
    draw_sprite_stretched(box, anim, 0, 120, 214, 121)
    draw_sprite_stretched(box, anim, 210, 120, 111, 121)
    
    if welcome = true {
        for(var i = 0; i < array_length(keeper.lines.intro); i++) {
            draw_set_font(fnt_main)
            draw_text(20, 130 + (i * 18), star)
            draw_text(36, 130 + (i * 18), keeper.lines.intro[i])
            draw_set_font(fnt_main)
        }
    } else {
        for(var i = 0; i < array_length(keeper.lines.random_flavor); i++) {
            draw_set_font(fnt_main)
            draw_text(20, 130 + (i * 18), star)
            draw_text(36, 130 + (i * 18), keeper.lines.random_flavor[i])
            draw_set_font(fnt_main)
        }
    }
    
    draw_text(230, 210, string(global.stats.under.mainchara.money) + "G")
    draw_text(280, 210, string(array_length(global.inventory)) + "/8")
    
    if global.downbuttonpressed1 and selected < 3 {
        selected++
        scr_snd(snd_squeak)
    } else if global.upbuttonpressed1 and selected > 0 {
        selected--
        scr_snd(snd_squeak)
    }
    
    draw_sprite(soul, anim, 229, 138 + (selected * 20))
    
    for(var i = 0; i < 4; i++) {
        draw_text(240, 130 + (i * 20), options[i])
    }
    
    if global.selectbuttonpressed {
        switch (options[selected]) {
            case "Buy":
                menu = "buy"
                selected = 0
                welcome = false
                break
            
            case "Sell":
                menu = "sell"
                if !keeper.refuse_buy {
                    selected = 0
                    welcome = false
                    ex = false
                }
                break
            
            case "Talk":
                menu = "talk"
                selected = 0
                welcome = false
                break
            
            case "Exit":
                menu = "exit"
                break
        }
    }
    
}

if menu = "buy" {
    
    if percent < 1 {
        percent += 1/30
    }
    pos = animcurve_channel_evaluate(curve, percent)
    info_y = info_bottom - (dist * pos)
    
    draw_sprite_stretched(box, anim, 210, info_y, 111, 85)
    
    if selected != array_length(stock) {
        var item = stock[selected]
        var plus = "+"
        switch item.type {
            case "armor":
                if item.stat - global.stats.under.mainchara.ar.def >= 0 {
                    plus = "+"
                } else {
                    plus = ""
                }
                draw_text(224, info_y + 14, $"Armor {item.stat}DF")
                draw_text(224, info_y + 30, $"({plus}{item.stat - global.stats.under.mainchara.ar.def} DF)")
                draw_text(224, info_y + 46, item.desc)
                break
            case "weapon":
                if item.stat - global.stats.under.mainchara.wp.atk >= 0 {
                    plus = "+"
                } else {
                    plus = ""
                }
                draw_text(224, info_y + 14, $"Weapon {item.stat}AT")
                draw_text(224, info_y + 30, $"({plus}{item.stat - global.stats.under.mainchara.wp.atk} AT)")
                draw_text(224, info_y + 46, item.desc)
                break
            case "food":
                draw_text(224, info_y + 14, $"Heals: {item.stat}")
                draw_text(224, info_y + 30, item.desc)
                break
        }
    }
    
    draw_sprite_stretched(box, anim, 0, 120, 214, 121)
    draw_sprite_stretched(box, anim, 210, 120, 111, 121)
    
    draw_set_font(fnt_main)
    switch buy_flavor{
        case "default":
            draw_text(230, 130, keeper.lines.buy)
            break
        case "broke":
            draw_text(230, 130, keeper.lines.broke)
            break
        case "thanks":
            draw_text(230, 130, keeper.lines.thanks)
            break
        case "full":
            draw_text(230, 130, keeper.lines.full)
            break
        case "buying":
            draw_set_font(fnt_main)
            draw_text(230, 130, $"Buy it for\n{stock[selected].price}G ?")
            draw_set_font(fnt_main)
            break
        case "looking":
            draw_text(230, 130, keeper.lines.looking)
            break
    }
    draw_set_font(fnt_main)
    draw_text(230, 210, $"{global.stats.under.mainchara.money}G")
    draw_text(280, 210, $"{array_length(global.inventory)}/8")
    
    if buy_flavor != "buying" {
        if global.downbuttonpressed1 and selected < array_length(stock) {
            selected++
            scr_snd(snd_squeak)
        } else if global.upbuttonpressed1 and selected > 0 {
            selected--
            scr_snd(snd_squeak)
        }
    } else {
        if global.downbuttonpressed1 and selected_yn < 1 {
            selected_yn++
            scr_snd(snd_squeak)
        } else if global.upbuttonpressed1 and selected_yn > 0 {
            selected_yn--
            scr_snd(snd_squeak)
        }
    }
    
    for(var i = 0; i < array_length(stock); i++) {
        draw_text(30, 130 + (i * 20), $"{stock[i].price}G - {stock[i].name}")
    }
    draw_text(30, 130 + (array_length(stock) * 20), "Exit")
    if buy_flavor != "buying" {
        draw_sprite(soul, anim, 19, 138 + (selected * 20))
    }
    
    if selected = array_length(stock) {
        percent = 0
        if global.selectbuttonpressed {
            menu = "select"
            selected = 0
            menu_timer = 2
            buy_flavor = "default"
        }
    } else if menu_timer <= 0 and buy_flavor != "buying"{
        if global.selectbuttonpressed{
            buy_flavor = "buying"
            selected_yn = 0
            menu_timer = 1
        } else if global.cancelbuttonpressed{
            menu = "select"
            selected = 0
            menu_timer = 2
            buy_flavor = "default"
            percent = 0
        }
    }
    
    if buy_flavor = "buying" {
        for(var i = 0; i < 2; i++){
            draw_text(240, 170 + (i * 20), yn[i])
        }
        draw_sprite(soul, anim, 229, 178 + (selected_yn * 20))
        if yn[selected_yn] = "Yes" and global.selectbuttonpressed  and menu_timer <= 0{
            if global.stats.under.mainchara.money >= stock[selected].price and array_length(global.inventory) < 8{
                global.stats.under.mainchara.money -= stock[selected].price
                scr_item_add(stock[selected].item)
                scr_snd(snd_buyitem)
                buy_flavor = "thanks"
                menu_timer = 2
            } else if global.stats.under.mainchara.money < stock[selected].price{
                buy_flavor = "broke"
                menu_timer = 2
            } else if global.stats.under.mainchara.money >= stock[selected].price and array_length(global.inventory) >= 8{
                buy_flavor = "full"
                menu_timer = 2
            }
    }
    
}