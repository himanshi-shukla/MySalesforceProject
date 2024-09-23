public with sharing class ContactTriggerHelper {
    public static void enforcePerAccountContactLimit(List<Contact> contacts) {

        //limit only 5 cons per account
        Set<Id> accountIds = new Set<Id>();
        for(Contact con: Contacts){
            if(!String.isBlank(con.AccountId)){
                accountIds.add(con.AccountId);
            }
        }
        //
        if(accountIds?.isEmpty()){
            return;
        }
        Map<Id,Account> accountList = new Map<Id,Account>([SELECT Id,(SELECT Id FROM Contacts) FROM Account where Id IN :(accountIds)]);
        for(Contact con:contacts){
            /*if(!String.isBlank(con.AccountId)){
                continue;
            }
                */
                if(String.isBlank(con.AccountId)){ continue; }
                if(accountList.get(con.AccountId).Contacts != null && accountList.get(con.AccountId).Contacts.size() >= 5){
                con.addError('You are not allowed to associate more than 5 contacts to a unique Account! TRy working with another Account');

            }
        }

    }
}