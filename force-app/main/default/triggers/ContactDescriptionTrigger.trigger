trigger ContactDescriptionTrigger on Contact (before insert) {
    
    if(Trigger.isInsert && Trigger.isBefore){
        for(Contact con : Trigger.new){
            con.Description = 'Yay , We got this !!!';
        }
    
    }
}