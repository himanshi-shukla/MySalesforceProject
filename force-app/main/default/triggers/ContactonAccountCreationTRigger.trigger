trigger ContactonAccountCreationTRigger on Account (after insert) {
    
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            RelatedConAccountHandler.updateCon(Trigger.new);
        }
    }

}