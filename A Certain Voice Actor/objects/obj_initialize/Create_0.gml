global.json = "A_Certain_Voice_Actor.json"
global.slot = 1
global.new_game = true

//variable
global.start_room = 2
global.start_x = 160
global.start_y = 180
global.facing = "down"

global.name = ""

global.title_buttons = false

//lang
global.lang = "en"
global.fontdefault = fnt_main
global.fontsans = fnt_main_sans
global.fontpapyrus = fnt_papyrus
global.font_comic_sans = fnt_comic_sans
if global.lang = "jp"{
	global.fontdefault = fnt_main_jp
    global.font_comic_sans = fnt_jp_comicsans
}
dir = $"{program_directory}lang\\{global.lang}.lang" //check ignore sandbox so it works
if string_char_at(program_directory, 4) = "P"{ //if is in gamemaker test environment (not exported)
    dir = $"C:\\Users\\adamm\\GameMakerProjects\\A Certain Voice Actor\\A Certain Voice Actor\\datafiles\\lang\\{global.lang}.lang"
}
if os_type = os_macosx{
    dir = $"{program_directory}/lang/{global.lang}.lang"
    if string_char_at(program_directory, 8) = "S"{
        dir = $"/Users/USERNAME/Documents/Dessappearance Dev/datafiles/lang/{global.lang}.lang"
    }
}
global.langtxt = json_to_var(dir)
randomize()


//time vars
global.newtime = 0
global.savetime = 0
global.menutime = 0
global.countmenutime = true

//control defaults
global.selectbutton = ord("Z")
global.cancelbutton = ord("X")
global.sprintbutton = ord("X")
global.menubutton = ord("C")
global.upbutton = ord("W")
global.downbutton = ord("S")
global.leftbutton = ord("A")
global.rightbutton = ord("D")

//control defaults
selectkey = "Z"
cancelkey = "X"
menukey = "C"
upkey = "W"
downkey = "S"
leftkey = "A"
rightkey = "D"

//update controls
scr_updatecontrols()