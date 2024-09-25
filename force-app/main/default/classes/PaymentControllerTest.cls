@isTest
public class PaymentControllerTest {
    @isTest
    static void testSendPayment() {
        // Create test data
        Case testCase = new Case(Subject = 'Test Case');
        insert testCase;

        Service__c testService = new Service__c(Name = 'Immediate Assistance', Case__c = testCase.Id);
        insert testService;

        Distribution__c testDist = new Distribution__c(Name = 'D-000001', Amount__c = 100, External_Id__c = 'Test-001', Status__c = 'Approved', Service__c = testService.Id);
        insert testDist;

        Test.startTest();
        String result = PaymentController.sendPayment(testCase.Id);
        Test.stopTest();

        // Verify results
        System.assertEquals('Success', result);
        testDist = [SELECT Status__c FROM Distribution__c WHERE Id = :testDist.Id];
        System.assertEquals('Sent', testDist.Status__c);
    }
}
