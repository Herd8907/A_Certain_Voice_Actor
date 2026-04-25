function set_song_ingame(_song, _fadeOutCurrentSong = 0, fadeInCurrentSong = 0, _songpitch = 1){
	
	with(obj_musicmanager){
		
		targetSongAsset = _song
		endFadeOutTime = _fadeOutCurrentSong
		startFadeInTime = fadeInCurrentSong
		pitch = _songpitch
		
	}
	
}