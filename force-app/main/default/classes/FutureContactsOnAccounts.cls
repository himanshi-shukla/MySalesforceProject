public class FutureContactsOnAccounts {
    @future
    public static void updateContactCount(List<id> accId) {
    List<Account> accList = [SELECT id, Name, Active_Contacts__c, (SELECT Id, lastName FROM Contacts) FROM Account WHERE id IN:accId];
    if(!accList.isEmpty()){
        for(Account acc :accList ){
            acc.Active_Contacts__c = acc.Contacts.size();
        }
        update accList;
    }
    }
}

/*
// List to hold Account IDs for which contacts need to be updated
List<Id> accountIds = new List<Id>();

// Query to get a few Account IDs (replace with your filter criteria if needed)
accountIds = [SELECT Id FROM Account LIMIT 5];

// Call the @future method with the list of Account IDs
FutureContactsOnAccounts.updateContactCount(accountIds);
*/