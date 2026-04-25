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
lv = 1
hp = 20
hpmax = 20
money = 0
at = 0
weapon_at = 3
df = 0
armor_df = 8
xp = 0
next_lv = 10
wp = global.item.weapons.wooden_dirk
ar = global.item.armor.stylish_wig

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