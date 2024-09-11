trigger AccountTrigger on Account (before insert) {
  
   /* AccountTriggerHandler handler = new AccountTriggerHandler();
    handler.beforeInsertLogic(Trigger.new);
    if(Util.flag){
                Util.flag = false;
                AccountTriggerHandler.recursionDemo(Trigger.New);
            }*/
    
    
    // Set the account rating to hot when industry is banking, etc
    
    if(Trigger.isInsert && Trigger.isBefore){
        for(Account acc : Trigger.new){
            if(acc.Industry == 'Banking' || Acc.Industry == 'Healthcare'){
                acc.rating = 'Hot';
            }
        }
    }

}