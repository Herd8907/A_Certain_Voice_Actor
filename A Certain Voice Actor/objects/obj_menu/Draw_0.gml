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
draw_text(box_left_x + x_off + 8, box_stats_mini_y + y_off + 22, "LV")
draw_text(box_left_x + x_off + 26, box_stats_mini_y + y_off + 22, lv)

draw_text(box_left_x + x_off + 8, box_stats_mini_y + y_off + 31, "HP")
draw_text(box_left_x + x_off + 26, box_stats_mini_y + y_off + 31, string(hp) + "/" + string(hpmax))

draw_text(box_left_x + x_off + 8, box_stats_mini_y + y_off + 40, "G")
draw_text(box_left_x + x_off + 26 - money_off, box_stats_mini_y + y_off + 40, money)

//select
draw_sprite_stretched(box, frame, box_left_x + x_off, box_bot_y + y_off, box_left_w, box_select_h)

draw_set_font(fnt_main)
draw_text(box_left_x + x_off + 26, box_bot_y + y_off + 10, "ITEM")
draw_text(box_left_x + x_off + 26, box_bot_y + y_off + 28, "STAT")

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
    
    draw_text(box_right_x + x_off + 22, box_top_y + y_off + 154, "USE")
    draw_text(box_right_x + x_off + 72, box_top_y + y_off + 154, "INFO")
    draw_text(box_right_x + x_off + 132, box_top_y + y_off + 154, "DROP")
    
}

//stat
if submenu = "stat" {
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 16, "\"" + name + "\"")
    
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 40, "LV  " + string(lv))
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 62, "HP  " + string(hp) + " / " + string(hpmax))
    
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 94, "AT  " + string(at) + " (" + string(weapon_at) + ")")
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 110, "DF  " + string(df) + " (" + string(armor_df) + ")")
    
    draw_text(box_right_x + x_off + 98, box_top_y + y_off + 94, "EXP: " + string(xp))
    draw_text(box_right_x + x_off + 98, box_top_y + y_off + 110, "NEXT: " + string(next_lv))
    
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 140, "WEAPON: " + string(wp.name))
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 156, "ARMOR: " + string(ar.name))
    
    draw_text(box_right_x + x_off + 14, box_top_y + y_off + 176, "MONEY: " + string(money))
    
    draw_sprite(spr_friskicon, frame, box_right_x + x_off + 125, box_top_y + y_off + 38)
    draw_text(box_right_x + x_off + 109, box_top_y + y_off + 62, "Frisk")
}

//navigate submenu
if submenu = "select" and selected < 1 and global.downbuttonpressed1 {
    selected++
} else if submenu = "select" and selected > 0 and global.upbuttonpressed1 {
    selected--
} else if submenu = "item" and selected < array_length(global.inventory) - 1 and global.downbuttonpressed1 {
    selected++
} else if submenu = "item" and selected > 0 and global.upbuttonpressed1{
    selected--
} else if submenu = "item_options" and selected < 2 and global.rightbuttonpressed1 {
    selected++
} else if submenu = "item_options" and selected > 0 and global.leftbuttonpressed1 {
    selected--
}

if submenu = "select" and selected = 0 and global.selectbuttonpressed { //select to item
    submenu = "item"
    can_close = false
} else if submenu = "item" and global.cancelbuttonpressed { //item to select
    submenu = "select"
    selected = 0
} else if submenu = "select" and selected = 1 and global.selectbuttonpressed { //select to stat
    submenu = "stat"
    can_close = false
} else if submenu = "stat" and global.cancelbuttonpressed { //stat to select
    submenu = "select"
} else if submenu = "item" and global.selectbuttonpressed { //item to item options
    submenu = "item_options"
    selected_item = selected
    selected = 0
    can_close = false
} else if submenu = "item_options" and global.cancelbuttonpressed { //item options to item
    submenu = "item"
    selected = selected_item
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
if global.cancelbuttonpressed and can_close = true {
    obj_mainchara.can_move = true
    instance_destroy()
}