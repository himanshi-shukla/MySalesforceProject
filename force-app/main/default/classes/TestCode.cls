public with sharing class TestCode {
      // This method can be invoked from Flow or Process Builder
      @InvocableMethod 
      //Method(label='My Label', description='Retrieve accounts by their IDs', category='Other')
      public static List<Account> getAccounts(List<Id> acctIds) {
          // Query to retrieve the Account records based on the provided IDs
          List<Account> myAccounts = [SELECT Id, Name FROM Account WHERE Id IN :acctIds];
          return myAccounts;
      }
}