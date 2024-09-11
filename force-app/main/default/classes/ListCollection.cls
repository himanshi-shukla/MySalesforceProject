public class ListCollection {
    
    //Insert 5 Account Records using a List.
    public Static Void CollectionDemo(){
	List<Account> accList = new List<Account>();
    for(Integer i = 1 ; i <=5 ; i++){
        Account acc = new Account();
        acc.name = 'Learnt Account-'+ i;
        acc.Phone = '9876543210';
        acc.Industry = 'Media';
        acc.Active__c = 'Yes';
        if(acc.Active__c == 'Yes'){
            accList.add(acc);
        }  
        System.debug('Data Created....');
    }
    
    if(!accList.isEmpty()){
            insert accList;
        }
    
    /*Insert 5 Opportunity records and 
    relate each opportunity record with one account created in previous step using a List.*/
    List<Opportunity> oppList = new List<Opportunity>();
    //Create Set of Account Ids and Opportunity Ids separately.
    
    Set<Account> accSet = new Set<Account>();
    Set<Opportunity> oppSet = new Set<Opportunity>();
    //Create Map having key as Opportunity Id and Value as Opportunity record.
    

}
}