public class RelationshipQueryDemo {
//child to Parent

    public static void childToParentStdRelationshipField(){
        
        List<Contact> conList = new List<Contact>();
        
        conList = [Select id, firstname, lastname, Account.Name, Account.Phone, Account.Active__c from contact];
        
        if(!conList.isEmpty()){
            for(Contact con : conList){
                System.debug('First Name = ' + con.FirstName);
                System.debug('Last Name = ' + con.LastName);
                System.debug('Account Name = ' + con.Account.Name);
                System.debug('Account Phone = ' + con.Account.Phone);
                System.debug('Account Active Status = ' + con.Account.Active__c);
            }
        }
    }
    
    
    //Query Opportunities along with account info
    public static void childToParentRelationOpptoAccount(){
        
        List<Opportunity> oppList = new List<Opportunity>();
        
        oppList = [Select id,Name, Account.Name, Account.Phone, Account.Active__c from Opportunity];
        
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                System.debug('Opportunity Name =' + opp.Name);
                System.debug('Account Name = ' + opp.Account.Name);
                System.debug('Account Phone = ' + opp.Account.Phone);
                System.debug('Account Active Status = ' + opp.Account.Active__c);
            }
        }
    }
}