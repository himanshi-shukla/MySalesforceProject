public class CountContactonAccount {

    /// Query to fetch active
    public static List<Contact> getActiveContactsForAccount(Id accountId){
        // Query to fetch active contacts related to the account
        List<Contact> activeContacts = [SELECT Id, FirstName, Email 
                                        FROM Contact 
                                           WHERE AccountId = :accountId 
                                         AND Active__c = TRUE];   
        return activeContacts;
}
}