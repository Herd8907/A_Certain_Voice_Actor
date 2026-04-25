//global volume control
global.masterVolume = 1
global.musicVolume = 1

//info for current song
songInstance = noone
songAsset = noone
targetSongAsset = noone
endFadeOutTime = 0
startFadeInTime = 0
fadeInInstVol = 1
pitch = 1

//fade out volume/stop song
fadeOutInstances = array_create(0)
fadeOutInstVol= array_create(0)
fadeOutInstTime = array_create(0)