@isTest
public class AccountWithContactsTest {
    @isTest
    public static void testAccountWithContacts(){
        
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        
        List<Id> accIds = new List<Id>();
        for(Integer i=1; i<=5; i++){
            Account acc = new Account();
            acc.Name = 'Test'+i;
            accList.add(acc);
        }
        Test.startTest();
        insert accList;

for(Account acc : accList){
            Contact con = new Contact();
            con.LastName = 'Test' + acc.Name;
            con.AccountId = acc.Id;
            accIds.add(acc.Id);		//Adding accids into collection
            conList.add(con);
        }
        insert conList;
        AccountWithContacts.countContacts(accIds);
        test.StopTest();
        
        List<Account> updatedAccs = [SELECT Id, Active_Contacts__c FROM Account WHERE Id IN: accIds];
        System.assertEquals(2, updatedAccs[0].Active_Contacts__c);
    }
}
 
/*Sanjay Gupta (Aug 6, 2024, 8:05 PM)
Create a future method to count how many cases are created through Phone, Web, Email. You need to put the counted value on Account in 3 different fields. Ensure proper code coverage as well.
*/