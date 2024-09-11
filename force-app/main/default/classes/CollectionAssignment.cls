public class CollectionAssignment {
    
    /*Insert 5 Account Records using a List.
Insert 5 Opportunity records and relate each opportunity record with one account created in previous step using a List.
Create Set of Account Ids and Opportunity Ids separately.
Create Map having key as Opportunity Id and Value as Opportunity record.
Display values of map by iterating map through keys.
Display values of map by iterating map through values.*/
    
 public static void loopDemo2(){

 		List<Account> accList = new List<Account>();
        List<Opportunity> oppList = new List<Opportunity>();
        Map<Id, Opportunity> oppMap = new Map<Id, Opportunity>();
        Set<Id> accIds = new Set<Id>();
        Set<Id> oPPIds = new Set<Id>();
         
        for(Integer i=1; i<=5; i++){
            Account acc = new Account();
            acc.Name = 'Test Account_' + i;
            acc.Phone = '1234344556';
            acc.Industry = 'Media';
            acc.Active__c = 'Yes';
            if(acc.Active__c == 'Yes'){
            	accList.add(acc);          
            }
        }
        
        if(!accList.isEmpty()){
            insert accList;
        }
        
        Integer cnt = 1;
        for(Account acc: accList){            
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name = 'Test Opportunity_' + cnt;
            opp.Amount = 120;            
            opp.StageName = 'Qualification';
            opp.CloseDate = System.today();
            oppList.add(opp);
            cnt = cnt+1;
        }
        
        if(!oppList.isEmpty()){
            insert oppList;
        }
        
        for(Account acc : accList){
            accIds.add(acc.Id);
        }
        
        for(Opportunity opp : oppList){
            oPPIds.add(opp.Id);
        }
        
        for(Opportunity opp : oppList){
            oppMap.put(opp.Id, opp);
        }
        
        for(Id i : oppMap.keySet()){
            System.debug(i);
        }
        
        System.debug('Opportunity information through Map Value');
        for(Opportunity opp : oppMap.values()){
            System.debug(opp);
        }

}
}