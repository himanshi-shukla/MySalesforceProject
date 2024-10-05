@isTest
public class FutureMethodTest {
    @isTest
    static void testFutureMethod() {
        // Setup test data
        Account testAcc = new Account(Name = 'Test Account');
        insert testAcc;
        
        Case testCase = new Case(Origin = 'Email', AccountId = testAcc.Id);
        insert testCase;
        
        List<Id> accountIds = new List<Id>{ testAcc.Id };
        
        Test.startTest();
        // Call the future method
        CalculateCaseOrigin.countCaseOrginOnAccount(accountIds);
        Test.stopTest();
        
        // Verify the results
        Account updatedAcc = [SELECT Cases_From_Email__c FROM Account WHERE Id = :testAcc.Id];
        System.assertEquals(1, updatedAcc.Cases_From_Email__c, 'Email case count should be 1');
    }
}
