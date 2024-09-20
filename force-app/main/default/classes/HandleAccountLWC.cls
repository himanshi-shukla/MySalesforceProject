public with sharing class HandleAccountLWC {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsData() {
        List<Account> accList = [SELECT Id, Name, Industry FROM Account LIMIT 10];
        return accList;
    }
}