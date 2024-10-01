public with sharing class BatchOfOpportunity implements Database.Batchable<SObject>, Database.Stateful{
   //Boolean tracker to check records created
   public  Integer recordsProcessed = 0;

   //write start method   
   //QueryLocator is used when the scope is directly taken from a SOQL :
   // ﻿ Use the Database.QueryLocator object when you are using a simple query 
   //(SELECT) to generate the scope of objects used in the batch job.
   public Database.QueryLocator start(Database.BatchableContext bc){
    return Database.getQueryLocator('SELECT Id, CreatedDate, StageName FROM Opportunity WHERE CreatedDate = TODAY');
   }
   //execute
   public void execute(Database.BatchableContext bc,List<Opportunity> scope){
    List<Opportunity> oppList = new List<Opportunity>();
    // Process each record in the scope
    for(Opportunity opp: scope){
        opp.StageName = 'Prospecting';
        oppList.add(opp);
        recordsProcessed = recordsProcessed +1;
    }

    // Update the records
    if(!oppList.isEmpty()){
    update oppList;
   }
}

   //finish
   public void finish(Database.BatchableContext bc){
    System.debug('Record processed' +recordsProcessed);
   }
}