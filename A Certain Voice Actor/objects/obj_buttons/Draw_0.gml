draw_set_font(fnt_main)
draw_set_halign(fa_left)

if menu = 1 {
	
	if selected = 0{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y, "Begin Game")
	
	if selected = 1{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y + 30, "Settings")
	
	if selected = 2{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y + 60, "Credits")
	
}

if menu = 2{
	
	if selected = 0{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y, "Volume")
	
	if selected = 1{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y + 30, "Controls")
	
}

if menu = 3{
	
	if selected = 0{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y, "Select - Enter/" + obj_initialize.selectkey)
	
	if selected = 1{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y + 20, "Cancel/Run - " + obj_initialize.cancelkey)
	
	if selected = 2{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y + 40, "Menu - " + obj_initialize.menukey)
	
	if selected = 3{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y + 60, "Up - Up Arrow/" + obj_initialize.upkey)
	
	if selected = 4{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y + 80, "Down - Down Arrow/" + obj_initialize.downkey)
	
	if selected = 5{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y + 100, "Left - Left Arrow/" + obj_initialize.leftkey)
	
	if selected = 6{
		draw_set_colour(#189BCC)
	} else {
		draw_set_color(c_white)
	}
	draw_text(x, y + 120, "Right - Right Arrow/" + obj_initialize.rightkey)
	
}

 if menu = 4{
	if selected = 0{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x, y, "A")
	if selected = 1{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x, y + 20, "B")
	if selected = 2{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x, y + 40, "C")
	if selected = 3{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x, y + 60, "D")
	if selected = 4{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x, y + 80, "E")
	if selected = 5{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x, y + 100, "F")
	if selected = 6{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x, y + 120, "G")
	if selected = 7{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 20, y, "H")
	if selected = 8{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 20, y + 20, "I")
	if selected = 9{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 20, y + 40, "J")
	if selected = 10{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 20, y + 60, "K")
	if selected = 11{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 20, y + 80, "L")
	if selected = 12{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 20, y + 100, "M")
	if selected = 13{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 20, y + 120, "N")
	if selected = 14{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 40, y, "O")
	if selected = 15{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 40, y + 20, "P")
	if selected = 16{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 40, y + 40, "Q")
	if selected = 17{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 40, y + 60, "R")
	if selected = 18{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 40, y + 80, "S")
	if selected = 19{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 40, y + 100, "T")
	if selected = 20{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 40, y + 120, "U")
	if selected = 21{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 60, y, "V")
	if selected = 22{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 60, y + 20, "W")
	if selected = 23{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 60, y + 40, "X")
	if selected = 24{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 60, y + 60, "Y")
	if selected = 25{
    	draw_set_color(#189BCC)
	} else{
    	draw_set_color(c_white)
	}
	draw_text(x + 60, y + 80, "Z")
    
}