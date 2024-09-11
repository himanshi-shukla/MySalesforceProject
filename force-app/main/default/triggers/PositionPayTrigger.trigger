trigger PositionPayTrigger on position__c (before insert) {
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            PositionPayTriggerHandler.updatePay(Trigger.new);
        }
    }

}