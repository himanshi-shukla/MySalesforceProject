@isTest
public class UserNicknameTriggerTest {
    @isTest
    static void testNicknameGeneration(){
        User testUser = new User(
            FirstName = 'Johny',
            LastName = 'Walker',
            Username = 'Walker@example.com',
            Email = 'Walker@example.com',
            Alias = 'jWalker',
            TimeZoneSidKey = 'America/Los_Angeles',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1].Id,
            LanguageLocaleKey = 'en_US'
        );
        insert testUser;

        // Retrieve the inserted user
        User insertedUser = [SELECT customNickname__c  FROM User WHERE Id = :testUser.Id];

        // Verify the nickname
        System.assertEquals('JoWa', insertedUser.customNickname__c , 'Nickname should be "JoWa"');
    }
    }