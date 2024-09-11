public with sharing class CaseStatusBatchApex implements Database.Batchable<SObject>, Database.Stateful {

//instantiate the variable for tracking
public Integer recordProcessed = 0;

public Database.QueryLocator start(Database.BatchableContext bc){

return Database.getQueryLocator('SELECT id, Status, Priority from Case where Priority = null');

}

//exceute method
public void execute(Database.BatchableContext bc,List<Case> caseList){
    for( Case c : caseList){
        c.Priority = 'Low';
        recordProcessed = recordProcessed + 1;
    }
    update caseList;
}
//finish method

public void finish(Database.BatchableContext bc){
    System.debug('The total number of records Processed are : ' +recordProcessed);
}
    
}