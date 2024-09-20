public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getUserContacts() {
        Id userId = UserInfo.getUserId();
        return [
            SELECT Id, FirstName, LastName, Email, Phone, Account.Name, CreatedDate, AccountId
            FROM Contact
            WHERE OwnerId = :userId  order by createddate desc limit 4
        ];
    }
}
