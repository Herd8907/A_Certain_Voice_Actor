//reset can_close
if submenu = "select" {
    can_close = true
}

//update the offset
x_off = center.topleft_x
y_off = center.topleft_y

if obj_mainchara.y > center.y {
    
    box_stats_mini_y = box_stats_bot
    
} else {
    
    box_stats_mini_y = box_stats_top
    
}

draw_sprite_stretched(box, frame, box_left_x + x_off, box_stats_mini_y + y_off, box_left_w, box_stats_mini_h)

//reset font draw settings
draw_set_halign(fa_left)
draw_set_colour(c_white)

draw_set_font(fnt_main)
draw_text(box_left_x + x_off + 8, box_stats_mini_y + y_off + 5, name)

draw_set_font(fnt_small)
draw_text(box_left_x + x_off + 8, box_stats_mini_y + y_off + 22, get_txt("menu.lv_mini"))
draw_text(box_left_x + x_off + 26, box_stats_mini_y + y_off + 22, lv)

draw_text(box_left_x + x_off + 8, box_stats_mini_y + y_off + 31, get_txt("menu.hp_mini"))
draw_text(box_left_x + x_off + 26, box_stats_mini_y + y_off + 31, string(hp) + "/" + string(hpmax))

draw_text(box_left_x + x_off + 8, box_stats_mini_y + y_off + 40, get_txt("menu.g_mini"))
draw_text(box_left_x + x_off + 26 - money_off, box_stats_mini_y + y_off + 40, money)

//select
draw_sprite_stretched(box, frame, box_left_x + x_off, box_bot_y + y_off, box_left_w, box_select_h)

draw_set_font(fnt_main)
draw_text(box_left_x + x_off + 26, box_bot_y + y_off + 10, get_txt("menu.item"))
draw_text(box_left_x + x_off + 26, box_bot_y + y_off + 28, get_txt("menu.stat"))

//right box
if submenu = "item" {
    box_right_h = box_item_h
} else if submenu = "stat" {
    box_right_h = box_stats_h
}

if submenu != "select" {
    draw_sprite_stretched(box, frame, box_right_x + x_off, box_top_y + y_off, box_right_w, box_right_h)
}

//item
if submenu = "item" or submenu = "item_options" {
    for(var i = 0; i < array_length(global.inventory); i++) {
        draw_text(box_right_x + x_off + 22, box_top_y + y_off + 14 + (i * 16), global.inventory[i].name)
    }
    
    draw_text(box_right_x + x_off + 22, box_top_y + y_off + 154, get_txt("menu.use"))
    draw_text(box_right_x + x_off + 72, box_top_y + y_off + 154, get_txt("menu.info"))
    draw_text(box_right_x + x_off + 132, box_top_y + y_off + 154, get_txt("menu.drop"))
    
}

//stat
if submenu = "stat" {
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 16, "\"" + name + "\"")
    
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 40, get_txt("menu.lv") + string(lv))
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 62, get_txt("menu.hp") + string(hp) + " / " + string(hpmax))
    
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 94, get_txt("menu.at") + string(at) + " (" + string(weapon_at) + ")")
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 110, get_txt("menu.df") + string(df) + " (" + string(armor_df) + ")")
    
    draw_text(box_right_x + x_off + 98, box_top_y + y_off + 94, get_txt("menu.xp") + string(xp))
    draw_text(box_right_x + x_off + 98, box_top_y + y_off + 110, get_txt("menu.next") + string(next_lv))
    
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 140, get_txt("menu.wp") + string(wp.name))
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 156, get_txt("menu.ar") + string(ar.name))
    
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 176, get_txt("menu.g") + string(money))
    
    draw_sprite(spr_friskicon, frame, box_right_x + x_off + 125, box_top_y + y_off + 38)
    draw_text(box_right_x + x_off + 109, box_top_y + y_off + 62, "Frisk")
}

//navigate submenu
if submenu = "select" and selected < 1 and global.downbuttonpressed1 {
    selected++
    scr_snd(snd_squeak)
} else if submenu = "select" and selected > 0 and global.upbuttonpressed1 {
    selected--
    scr_snd(snd_squeak)
} else if submenu = "item" and selected < array_length(global.inventory) - 1 and global.downbuttonpressed1 {
    selected++
    scr_snd(snd_squeak)
} else if submenu = "item" and selected > 0 and global.upbuttonpressed1{
    selected--
    scr_snd(snd_squeak)
} else if submenu = "item_options" and selected < 2 and global.rightbuttonpressed1 {
    selected++
    scr_snd(snd_squeak)
} else if submenu = "item_options" and selected > 0 and global.leftbuttonpressed1 {
    selected--
    scr_snd(snd_squeak)
}

if submenu = "select" and selected = 0 and global.selectbuttonpressed { //select to item
    submenu = "item"
    scr_snd(snd_squeak)
    can_close = false
} else if submenu = "item" and global.cancelbuttonpressed { //item to select
    submenu = "select"
    scr_snd(snd_squeak)
    selected = 0
} else if submenu = "select" and selected = 1 and global.selectbuttonpressed { //select to stat
    submenu = "stat"
    scr_snd(snd_squeak)
    can_close = false
} else if submenu = "stat" and global.cancelbuttonpressed { //stat to select
    submenu = "select"
    scr_snd(snd_squeak)
} else if submenu = "item" and global.selectbuttonpressed { //item to item options
    submenu = "item_options"
    scr_snd(snd_squeak)
    selected_item = selected
    selected = 0
    can_close = false
} else if submenu = "item_options" and global.cancelbuttonpressed { //item options to item
    submenu = "item"
    scr_snd(snd_squeak)
    selected = selected_item
} else if submenu = "item_options" and selected = 0 and global.selectbuttonpressed {
    if struct_exists(global.item.food, global.inv[selected_item]) { //food
        scr_eat(selected_item)
        close = true
    } else if struct_exists(global.item.weapons, global.inv[selected_item]) { //weapon
        scr_equip_weapon(selected_item)
        scr_snd(snd_equip)
        close = true
    } else if struct_exists(global.item.armor, global.inv[selected_item]) { //armor
        scr_equip_armor(selected_item)
        scr_snd(snd_equip)
        close = true
    }
} else if submenu = "item_options" and selected = 2 and global.selectbuttonpressed {
    scr_item_delete(selected_item)
    close = true
}

//update soul pos
if submenu = "select" {
    
    soul_x_left = box_left_x + x_off + 16
    soul_y_left = box_bot_y + y_off + 18 + (selected * 18)
    
    soul_x = soul_x_left
    soul_y = soul_y_left
    
} else if submenu = "item" {
    
    soul_x_right = box_right_x + x_off + 12
    soul_y_right = box_top_y + y_off + 22 + (selected * 16)
    
    soul_x = soul_x_right
    soul_y = soul_y_right
    
} else if submenu = "item_options" {
    
    soul_x_bot = box_right_x + x_off + 14 + (selected * 50)
    if selected = 2 {
        soul_x_bot = box_right_x + x_off + 24 + (selected * 50)
    }
    soul_y_bot = box_top_y + y_off + 162
    
    soul_x = soul_x_bot
    soul_y = soul_y_bot
    
}

if submenu != "stat" {
    draw_sprite(soul, frame, soul_x, soul_y)
}

//destroy
if global.cancelbuttonpressed and can_close or close{
    obj_mainchara.can_move = true
    scr_snd(snd_squeak)
    instance_destroy()
}