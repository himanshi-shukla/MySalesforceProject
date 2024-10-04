public with sharing class FutureEnabledContactOnAccount {
    @future
    public static void contactsOnAccounts(List<Id> accIds) {
        List<Account> accList = [SELECT Id,Name, Active_Contacts__c,(SELECT Id FROM Contacts) FROM Account WHERE Id IN:accIds];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Active_Contacts__c = acc.Contacts.size();
            }
            update accList;
        }

    }
}