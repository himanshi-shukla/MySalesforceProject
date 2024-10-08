@restResource(urlMapping='/actconcasemgmt/')
Global with sharing class AccountRelatedObjAPI {
    @httpGet
    Global static list<Account> getAccountApex(){
        Set<Id> accIds = new Set<Id>();
        Map<String,String> accParamMap = RestContext.request.params;
        String accIndustry = accParamMap.get('Industry');
        List<Account> accList = [SELECT Id, Industry, Name, AnnualRevenue FROM Account WHERE AnnualRevenue!=null and Industry = :accIndustry];
        for(Account acc:accList ){
            accIds.add(acc.Id);
            }
            List<Contact> conList = [SELECT Id, LastName, Email, AccountId FROM Contact WHERE AccountId In :accIds];
            List<Case> caseList = [SELECT Id, Priority, Subject, AccountId FROM Case WHERE AccountId In :accIds];
            List<Opportunity> oppList = [SELECT Id, Name, StageName, AccountId FROM Opportunity WHERE AccountId In :accIds];
            
            AccountWrapper accWrapper = new AccountWrapper();
            accWrapper.accList = accList;
            accWrapper.conList = conList;
            accWrapper.caseList = caseList;
            accWrapper.oppList = oppList;
            return accWrapper;
    }
//wrapper class
        global class AccountWrapper{
        global List<Account> accList;
        global List<Contact> conList;
        global List<Case> caseList;
        global List<Opportunity> oppList;    
        }   
        
}
