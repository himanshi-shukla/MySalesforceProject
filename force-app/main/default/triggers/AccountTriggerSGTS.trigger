trigger AccountTriggerSGTS on Account (before insert, before update, after insert) {
    
      /*Trigger.New is a context variable, here New is a list of sobject
    AccountTrriggerHandlerSGTS.updateDescOnAcc(Trigger.New);
    AccountTrriggerHandlerSGTS.updateRating(Trigger.New);
    AccountTrriggerHandlerSGTS.updateBillingData(Trigger.New);
    
    /*for(Account acc : Trigger.New){
        acc.description = 'Naya Account in the town';
    }*/
}

/*List<Account> accList = new List<Account>();
for(Integer i = 0; i<5 ;i++){
    Account acc = new Account();
    acc.Name = 'Test Account' + i;
    accList.add(acc);
    
}

public static void updateDescOnPhoneUpdate(List<Account> newList, Map<Id, Account> oldMap){
        
        //get method of map retuns value associated with a key
        for(Account acc : newList){
            //acc.Phone	= new value of phone field
            //oldMap.get(acc.Id).Phone = old value of phone field
            if(acc.Phone != oldMap.get(acc.Id).Phone){
                acc.Description = 'Phone is Updated';
            }
        }
    }


if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountTriggerHandler.updateDescOnPhoneUpdate(Trigger.New, Trigger.oldMap);		
        }else if(Trigger.isAfter){
        }
    }
insert accList; */