//rm0 = test
//rm1 = homeentrance
//rm2 = homelivingroom
//rm3 = 
//rm4 = 
//rm5 = 

room_to_save = rm_homeentrance

newseconds = floor(global.newtime / 1000)
newmins = floor(newseconds+1 / 60)
newhours = floor(newmins+1 / 60)

oldseconds = floor(global.oldtime / 1000)
oldmins = floor(oldseconds / 60)
oldhours = floor(oldmins / 60)

totalseconds = newseconds + oldseconds
totalmins = newmins + oldmins
totalhours = newhours + oldhours

  while totalmins >= 60 and totalhours < 999 {
        
        totalmins -= 60
        
    }
    
    if totalmins < 10 {
        
        global.time = string(totalhours) + ":0" + string(totalmins)
        
    } else {
        
        global.time = string(totalhours) + ":" + string(totalmins)
        
    }
    
    if totalhours >= 999 and totalmins >= 59 {
        
        global.time = "999:59"
        
    }