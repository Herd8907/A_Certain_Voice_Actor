function scr_eat(index, target = global.stats.under.mainchara){
    
    food = global.inventory[index]
    hp = target.hp
    hpmax = target.hpmax
    cap = true
    
    if hp > hpmax or struct_exists(food, "cap") {
        cap = false
    }
    
    hp += food.heals
    
    if hp > hpmax and cap {
        hp = hpmax
    }
    
    target.hp = hp
    
    del = true
    
    if del{
        scr_item_delete(index)
    }
    
    scr_updatelist()
    scr_snd(snd_heal)
    
}