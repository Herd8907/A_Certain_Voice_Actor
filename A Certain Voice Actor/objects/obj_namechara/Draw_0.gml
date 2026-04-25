//draw black rect bg
draw_rectangle_color(0, 0, 400, 400, c_black, c_black, c_black, c_black, false)

//set text draw values
draw_set_font(fnt_main)

//draw top text
draw_set_halign(fa_left)
draw_text(center.x - 70, center.y - 100, toptext)

//draw name
draw_text_transformed(center.x - 21 + name_x, center.y - 80 + name_y, global.name, name_size, name_size, 0 + name_rot_off)
draw_set_halign(fa_center)

if stage = 1 { //typing the name stage
    
    toptext = "Name the fallen human."
    name_x = 0
    name_y = 0
    name_rot_off = 0
    name_size = 1
    
    //draw letters
    
    //uppercase
    
    //loop through each row (r)
    for (var r = 0; r < 4; r++) {
        
        //loop through each column (c)
        for (var c = 0; c < 7; c++) {
            
            var i = (r*7+c)
            
            //highlight z
            if i > 25 {
                
                i = 25
                
                if row = 3 and column = 4 {
                    
                    draw_set_colour(#189BCC)
                    selected = alphabetu[25]
                    
                }
                
            }
            
            //set color + select letter
            if row = r and column = c{
                
                draw_set_colour(#189BCC)
                selected = alphabetu[i]
                
            }
            
            //draw text
            draw_text((center.x - (97*(2.31*r+1))) + (i * 32) + xoff[i], (center.y - 60 + (r*14)) + yoff[i], alphabetu[i])
            
            //reset color
            draw_set_colour(c_white)
            
        }
        
    }
    
    //lowercase
    
    //loop through each row (r)
    for (var r = 0; r < 4; r++) {
        
        //loop through each column (c)
        for (var c = 0; c < 7; c++) {
            
            var i = (r*7+c)
            
            //highlight z
            if i > 25 {
                
                i = 25
                
                if row = 7 and column = 4 {
                    
                    draw_set_colour(#189BCC)
                    selected = alphabetl[25]
                    
                }
                
            }
            
            //set color + select letter
            if row = r+4 and column = c{
                
                draw_set_colour(#189BCC)
                selected = alphabetl[i]
                
            }
            
            //draw text
            draw_text((center.x - (97*(2.31*r+1))) + (i * 32) + xoff[i], (center.y - 60 + (r*14) - lowoff) + yoff[i], alphabetl[i])
            
            //reset color
            draw_set_colour(c_white)
            
        }
        
    }
    
    //options
    
    //quit
    
    //set color and return to title
    if row = 8 and column = 0 {
        
        draw_set_colour(#189BCC)
        
        if global.selectbuttonpressed {
            
            instance_create_depth(159, 37, 100, obj_title)
            instance_destroy()
            
        }
        
    }
    
    //draw text
    draw_text((center.x - 108), (center.y + 70), "Quit")
    
    //reset color
    draw_set_colour(c_white)
    
    //backspace
    
    //set color and delete
    if row = 8 and column = 1 {
        
        draw_set_colour(#189BCC)
        
        if global.selectbuttonpressed and string_length(global.name) > 0 {
            
            global.name = string_delete(global.name, string_length(global.name), 1)
            
        }
        
    }
    
    //draw text
    draw_text((center.x - 16), (center.y + 70), "Backspace")
    
    //reset color
    draw_set_colour(c_white)
    
    //done
    
    //set color and advance stage
    if row = 8 and column = 2 {
        
        draw_set_colour(#189BCC)
        
        if global.selectbuttonpressed {
            
            column = 0
            stage++
            
        }
        
    }
    
    //draw text
    draw_text((center.x + 90), (center.y + 70), "Done")
    
    //reset color
    draw_set_colour(c_white)
    
    //delete with x
    if global.cancelbuttonpressed and string_length(global.name) > 0 {
        
        global.name = string_delete(global.name, string_length(global.name), 1)
        
    }
    
    //☝︎✌︎💧︎❄︎☜︎☼︎
    if string_lower(global.name) = "gaster" {
        
        game_end()
        
    }
    
} else if stage = 2 { //verifying the name stage ------------------------------------------------------------------------------------------
    
    //default text
    toptext = "Is this name correct?"
    nameforbidden = false
    
    //special names -----------------------------------------------------------------------------------------------------------------------
    
    //aaaaaa
    if string_lower(global.name) = "aaaaaa" {
        
        toptext = "OW STOP YELLING AT ME!!!"
        
    }
    
    //chara
    if string_lower(global.name) = "chara"{
        toptext = "The true name."
    }
    
    //mettaton 1
    if string_lower(global.name) = "mett"{
        toptext = "OOOOH!!! ARE YOU\nPROMOTING MY BAND?"
    }
    
    //mettaton 2
    if string_lower(global.name) = "metta"{
        toptext = "OOOOH!!! ARE YOU\nPROMOTING MY BAND?"
    }
    
    //mettaton 3
    if string_lower(global.name) = "mtt"{
        toptext = "OOOOH!!! ARE YOU\nPROMOTING MY BAND?"
    }
    
    //napstablook 1
    if string_lower(global.name) = "napsta"{
        toptext = "...........\n(They're powerless to\nstop you.)"
    }
    
    //napstablook 2
    if string_lower(global.name) = "blooky"{
        toptext = "...........\n(They're powerless to\nstop you.)"
    }
    
    //papyrus
    if string_lower(global.name) = "papyru"{
        toptext = "I'LL ALLOW IT!!!!"
    }
    
    //temmie
    if string_lower(global.name) = "temmie"{
        toptext = "hOI!"
    }
    
    //alphy
    if string_lower(global.name) = "alphy"{
        toptext = "Uh... OK?"
    }
    
    //glungle blungle
    if string_lower(global.name) = "glungl"{
        toptext = "it's glungle blungle!!!"
    }
    
    //trends cat
    if string_lower(global.name) = "oldcat"{
        toptext = "this is trends cat, yeah"
    }
    
    //cancel
    if string_lower(global.name) = "cancel"{
        toptext = "It's almost like...\nA Mickerrific Hater..."
    }
    
    //averie
    if string_lower(global.name) = "averie"{
        toptext = "Oh hey that's me!\n- AverietheDoodler"
    }
    
    //flappy
    if string_lower(global.name) = "flappy"{
        toptext = ":P"
    }
    
    //clover
    if string_lower(global.name) = "clover"{
        toptext = "Yee Haw!\nJustice and guns!"
    }
    
    //mickerrific 1
    if string_lower(global.name) = "mick"{
        
        toptext = "Mr. Iffic himself!\nVoice Acting Fangames?"
        
    }
    
    //mickerrific 2
    if string_lower(global.name) = "micke"{
        
        toptext = "Mr. Iffic himself!\nVoice Acting Fangames?"
        
    }
    
    //mickerrific 3
    if string_lower(global.name) = "micker"{
        
        toptext = "Mr. Iffic himself!\nVoice Acting Fangames?"
        
    }
    
    //mickerrific 4
    if string_lower(global.name) = "mickey"{
        
        toptext = "Mr. Iffic himself!\nVoice Acting Fangames?"
        
    }
    
    //melongod 1
    if string_lower(global.name) = "melon"{
        
        toptext = "let's hope i remembered\nto put in water sausage lore"
        
    }
    
    //melongod 2
    if string_lower(global.name) = "melong"{
        
        toptext = "let's hope i remembered\nto put in water sausage lore"
        
    }
    
    //merg
    if string_lower(global.name) = "merg"{
        
        toptext = "gooner apple"
        
    }
    
    //hans
    if string_lower(global.name) = "hans"{
        
        toptext = "The coolest mod."
        
    }
    
    //Me!!!
    if string_lower(global.name) = "herd"{
        
        toptext = "hi me!!! unless...\nYOU ARENT ME! >:("
        
    }
    
    //frisk
    if string_lower(global.name) = "frisk"{
        
        toptext = "Your life is already hell.\nWhy try to make it harder?"
        
    }
    
    //forbidden names ---------------------------------------------------------------------------------------------------------------------
    
    //none
    if string_length(global.name) = 0 {
        
        toptext = "You must choose a name."
        nameforbidden = true
        
    }
    
    //undyne
    if string_lower(global.name) = "undyne"{
        toptext = "Get your OWN name!"
        nameforbidden = true
    }
    
     //toriel
    if string_lower(global.name) = "toriel"{
        toptext = "I think you should\nthink of your own\nname, my child."
        nameforbidden = true
    }
    
    //sans
    if string_lower(global.name) = "sans"{
        toptext = "nope."
        nameforbidden = true
    }
    
    //flowey
    if string_lower(global.name) = "flowey"{
        toptext = "I already CHOSE\nthat name."
        nameforbidden = true
    }
    
    //asriel
    if string_lower(global.name) = "asriel"{
        toptext = "The Prince turned\nFlower then to God."
        nameforbidden = true
    }
    
     //asgore
    if string_lower(global.name) = "asgore"{
        toptext = "You cannot."
        nameforbidden = true
    }
    
    //alphys
    if string_lower(global.name) = "alphys"{
        toptext = "D-don't do that."
        nameforbidden = true
    }
    
    //acma
    if string_lower(global.name) = "acma"{
        toptext = "do not put in\nthat name ever again."
        nameforbidden = true
    }
    
    //orci
    if string_lower(global.name) = "orci"{
        toptext = "Why'd you crash out\nover me not wanting\nthe bit to continue?"
        nameforbidden = true
    }
    
    //kris
    if string_lower(global.name) = "kris"{
        toptext = "wrong universe twin.\nbro forgot </3"
        nameforbidden = true
    }
    
    //mercy
    if string_lower(global.name) = "mercy"{
        toptext = "Bit on the nose don't\nyou think Angel?"
        nameforbidden = true
    }
    
    //fight
    if string_lower(global.name) = "fight"{
        toptext = "Bit on the nose don't\nyou think Murderer?"
        nameforbidden = true
    }
    
    //hammer
    if string_lower(global.name) = "hammer"{
        
        toptext = "DEAR GOD HE'S HOLDING\nHAMMERS CORPSE"
        nameforbidden = true
        
        if (!opened) {
            
            url_open("https://youtu.be/-TZX7yzuDjo?start=4826&end=4935")
            opened = true
            
        }
        
    }
    
    //weezer
    if string_lower(global.name) = "weezer"{
        
        toptext = "I look just like\nBuddy Holly."
        nameforbidden = true
        
        if (!opened) {
            
            url_open("https://www.youtubetrimmer.com/view/?v=SiJie3Z7DG8&start=128&end=132&loop=0")
            opened = true
            
        }
        
    }
    
    //options
    
    if column > 1 {
        
        column = 0
        
    }
    
    if !nameforbidden {
        
        //no
        
        if column = 0 {
            
            draw_set_colour(#189BCC)
            if global.selectbuttonpressed {
                
                stage--
                
            }
            
        }
        
        draw_text((center.x - 108), (center.y + 70), "No")
        
        draw_set_colour(c_white)
        
        //yes
        
        if column = 1 {
            
            draw_set_colour(#189BCC)
            if global.selectbuttonpressed {
                
                instance_create_depth(0, 0, -1000, obj_whitefade)
                audio_stop_all()
                audio_play_sound(snd_cymbal, 1, false)
                stage++
                
            }
            
        }
        
        draw_text((center.x + 90), (center.y + 70), "Yes")
        
        draw_set_colour(c_white)
        
    }
    
    if nameforbidden {
        
        //go back
        
        column = 0
        if column = 0 {
            
            draw_set_colour(#189BCC)
            if global.selectbuttonpressed {
                
                column = 1
                stage = 1
            }
            
        }
        
        draw_text((center.x - 108), (center.y + 70), "Go back")
        
        draw_set_colour(c_white)
        
    }
    
}

if stage = 3 { //starting game stage -------------------------------------------------------------------------
    
    toptext = ""
    
    if !instance_exists(obj_whitefade) {
        
        room_goto(global.start_room)
		var instantiated = instance_create_layer(global.start_x, global.start_y, "mainchara", obj_mainchara)
		global.new_game = false
    	global.menutime = current_time
        
    }
    
}