//submenu box default
box = spr_simplebox
frame = -1

x_off = center.topleft_x
y_off = center.topleft_y

box_top_y = 26
box_bot_y = 84

box_stats_top = box_top_y
box_stats_bot = 161
box_stats_mini_y = box_stats_top

box_left_x = 16
box_right_x = 94

box_left_w = 71
box_right_w = 173

box_stats_mini_h = 55
box_select_h = 74

box_item_h = 181
box_stats_h = 209

box_right_h = box_item_h //changes based off what was selected

money_off = 1

//text
name = global.name
lv = global.stats.under.mainchara.lv
hp = global.stats.under.mainchara.hp
hpmax = global.stats.under.mainchara.hpmax
money = global.stats.under.mainchara.money
at = global.stats.under.mainchara.at
weapon_at = 0
df = global.stats.under.mainchara.df
armor_df = 0
mg = global.stats.under.mainchara.mg
xp = global.stats.under.mainchara.xp
next_lv = global.stats.under.mainchara.next_lv
wp = global.stats.under.mainchara.wp
ar = global.stats.under.mainchara.ar

//select
selected = 0
selected_item = 0
submenu = "select"

soul = spr_soulsmall

soul_x_left = box_left_x + x_off + 16
soul_y_left = box_bot_y + y_off + 18 + (selected * 18)

soul_x_right = box_right_x + x_off + 12
soul_y_right = box_bot_y + y_off + 18 + (selected * 18)

soul_x = soul_x_left
soul_y = soul_y_left

//close
can_close = true
close = false