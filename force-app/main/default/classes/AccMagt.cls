@RestResource(urlMapping='/accountmgt/')
global class AccMagt {
@httpGet
global static AccountWrapper getAccountsApex(){
Set<Id> accIds = new Set<Id>();
Map<String , String> accParamMap = RestContext.request.params;

String accIndustry = accParamMap.get('Industry');

List<Account> accList = [SELECT Id, Industry, Name, AnnualRevenue FROM Account WHERE AnnualRevenue!=null and Industry=: accIndustry];

for(Account acc:accList ){
accIds.add(acc.Id);
}

List<Opportunity> oppList = [SELECT Id, Name, AccountId FROM Opportunity WHERE AccountId In :accIds];
List<Contact> conList = [SELECT Id, LastName, Email, AccountId FROM Contact WHERE AccountId In :accIds];

List<Case> caseList = [SELECT Id, Priority, Subject, AccountId FROM Case WHERE AccountId In :accIds];


AccountWrapper accWrapper = new AccountWrapper();
accWrapper.accList = accList;
accWrapper.conList = conList;
accWrapper.caseList = caseList;
accWrapper.oppList = oppList;

return accWrapper;
}

global class AccountWrapper{
global List<Account> accList;
global List<Opportunity> oppList;
global List<Contact> conList;
global List<Case> caseList;    
} 
@httpPost
    global static String createAccount(String accName, String accRating,String accIndustry){
        Account acc = new Account();
        acc.Name = accName;
        acc.Rating = accRating;
        acc.Industry = accIndustry;
        try{
            insert acc;
            return 'Account created successfully';
        }
        catch(Exception ex){
            return ex.getMessage();
        }  
    } 
    
    //delete

    @httpdelete 
    global static String deleteAccount(){
        Map<String, String> accparamMap = RestContext.request.params;
        String accId = accparamMap.get('accIds');
        
        List<String> accIds = accId.split(',');
        
        List<Account> acclist=[SELECT Id,Name FROM Account WHERE Id IN:accIds];
        if(!acclist.isEmpty()){
            try{
                delete acclist;
                return 'Deleted Successfully';                
            } 
            catch(Exception ex){
                return ex.getMessage();
            }
        }
        else{
            return 'record not found';
        }
    }
}
