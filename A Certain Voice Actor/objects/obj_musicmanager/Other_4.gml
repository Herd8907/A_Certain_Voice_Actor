//Home
if room == rm_homeentrance
|| room == rm_homelivingroom
|| room == rm_homekitchen
|| room == rm_homehallway
|| room == rm_homenursery
|| room == rm_homebigbedroom
{
	
	set_song_ingame(sng_home, 0, 0)
	
}

//Silence/Mysterious Ambience
if room == rm_homebasement{
	
	set_song_ingame(sng_ruinspiano, 60, 0)
	
}

//Blue Headphone Zone
if room == rm_outsidehome{
	
	set_song_ingame(sng_blue_headphone_zone, 0, 0)
	
}

//Menu
if room == rm_title{
	
	set_song_ingame(sng_menufull, 0, 0)
	
}

//Noone/undecided
if room == rm_streamingroom{
	
	set_song_ingame(noone, 0, 0)
	
}

//hatsune krillku
if room == rm_hatsunekrillku{
	
	set_song_ingame(sng_krillmiku, 60, 0)
	
}