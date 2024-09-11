public class AccountWithContacts {
    
    //Create a future method to count the number of contacts associated with an account. 
    //List of Account Ids will be passed to the future method. 
    //Ensure proper code coverage as well.
    //
    @future
    public static void countContacts(List<id> accIds){
        List<Account> accList = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accIds];
        if(!accList.isEmpty()){
                 for(Account acc : accList){     
                     acc.Active_Contacts__c  = acc.Contacts.size();
                 }
            update accList;
    }
    }
}


/*List<Account> accList = [Select id from Account];
List<id> accIds = new List<Id>();
for(Account acc : accList){
    accIds.add(acc.id);
}
AccountWithContacts.countContacts(accIds);
*/