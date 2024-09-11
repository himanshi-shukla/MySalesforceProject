public class SOQLPractice {
public static void fetchAccountsWhereClause(){
        
        List<Account> accList = [SELECT Id, Name, AnnualRevenue, Rating FROM Account Where AnnualRevenue != null OR Rating = 'Hot'];
        Set<Id> accIds = new Set<Id>();
        List<Contact> conList = new List<Contact>();
    	List<opportunity> OppList = new List<Opportunity>();

        //collecting accIds in a set through List
        for(Account acc : accList){
            accIds.add(acc.Id);
        }
         
		conList = [Select Id, FirstName, LastName FROM Contact WHERE AccountId IN: accIds];
        
         for(Contact con : conList){
             System.debug(con);
         }
    
    //fetch related Opportunities
    OppList = [Select Id, name FROM Opportunity WHERE AccountId IN: accIds];
        
         for(Opportunity opp : OppList){
             System.debug(opp);
         }
         
    }
}