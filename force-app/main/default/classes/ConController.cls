public with sharing class ConController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsForUser() {
        Id userId = UserInfo.getUserId();
        return [
            SELECT Id, FirstName, LastName, Email, Phone, Account.Name, CreatedDate 
            FROM Contact 
            WHERE OwnerId = :userId 
            ORDER BY CreatedDate DESC
            LIMIT 5
        ];
    }
    
    @AuraEnabled
    public static String mergeContacts(Id contact1Id, Id contact2Id) {
        Contact contact1 = [SELECT Id, Email, AccountId FROM Contact WHERE Id = :contact1Id];
        Contact contact2 = [SELECT Id, Email, AccountId FROM Contact WHERE Id = :contact2Id];

        if (contact1.Email != contact2.Email || contact1.AccountId != contact2.AccountId) {
            return 'error';
        } else {
            return 'success';
        }
    }
    }

    