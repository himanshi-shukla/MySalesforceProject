Public with sharing class BatchAddressUpdateOnContact implements Database.Batchable <sObject>,Database.Stateful {
    //Save instance for the records updated
    public Integer recordProcessed = 0;

    //start method**
    public Database.QueryLocator start(Database.BatchableContext bc){

        //return a dataset on which actions will be performed
        return database.getQueryLocator('SELECT Id,BillingStreet, BillingCity , BillingState, BillingPostalCode,(SELECT ID, MailingStreet, MailingCity,' 
        +' MailingState, MailingPostalCode FROM Contacts) FROM Account' + 'WHERE BillingCountry = \'USA\'');
    }
    //execute method**
    Public Void execute(Database.BatchableContext bc, List<Account> accList ){
        //Process each batch of records
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList){
            for(Contact con : acc.Contacts){
                con.MailingStreet = acc.BillingStreet;
                con.MailingCity = acc.BillingCity;
                con.MailingState = acc.BillingState;
                con.MailingPostalCode = acc.BillingPostalCode;
                conList.add(con);
                recordProcessed = recordProcessed + 1;
            }
        }
        update conList;
    }

    //finish Method
    public void finish(Database.BatchableContext bc){
        System.debug('The total number of records Processed are' + recordProcessed);

    }  
    
}