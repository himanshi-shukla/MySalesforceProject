/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
public class ContactControllerTest {
    @testSetup
    static void setupTestData() {
        // Create a test user
        User testUser = [SELECT Id FROM User WHERE Profile.Name = 'Standard User' LIMIT 1];

        // Create an account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Create contacts owned by the test user
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 5; i++) {
            contacts.add(new Contact(
                FirstName = 'Test' + i,
                LastName = 'User' + i,
                Email = 'test' + i + '@example.com',
                Phone = '123-456-789' + i,
                AccountId = testAccount.Id,
                OwnerId = testUser.Id
            ));
        }
        insert contacts;
    }

    @isTest
    static void testGetUserContacts() {
        // Get a test user
        User testUser = [SELECT Id FROM User WHERE Profile.Name = 'Standard User' LIMIT 1];
        System.runAs(testUser) {
            // Call the Apex method
            Test.startTest();
            List<Contact> userContacts = ContactController.getUserContacts();
            Test.stopTest();

            // Assert that the correct number of contacts is returned
            System.assertEquals(5, userContacts.size(), 'Should return 5 contacts');
            for (Contact contact : userContacts) {
                System.assertEquals(testUser.Id, contact.OwnerId, 'Contact should belong to the logged-in user');
            }
        }
    }

    @isTest
    static void testNoContactsForUser() {
        // Create a new test user without any contacts
        User newTestUser = [SELECT Id FROM User WHERE Profile.Name = 'Standard User' LIMIT 1];
        System.runAs(newTestUser) {
            // Call the Apex method
            Test.startTest();
            List<Contact> userContacts = ContactController.getUserContacts();
            Test.stopTest();

            // Assert that no contacts are returned for the user
            System.assertEquals(0, userContacts.size(), 'Should return 0 contacts');
        }
    }
}
