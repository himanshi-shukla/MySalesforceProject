public class UpdateOppOnAmountField implements Database.Batchable<sObject>,Database.Stateful{
    /*Given a list of 100,000 Opportunity records, 
    write an efficient Apex code to update their "Stage" 
    field to "Closed-Won" if the "Amount" field is greater than $100,000. */

    // Query to retrieve the records to be processed

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id, Amount, StageName 
        FROM Opportunity 
        WHERE Amount > 100000 AND StageName != 'Closed-Won']);
    }


    // Method to process each batch of records
    public void execute(Database.BatchableContext bc,List<Opportunity> scope){
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
        /// Loop through each record in the current batch
        for (Opportunity opp : scope) {
            opp.StageName = 'Closed-Won';
            opportunitiesToUpdate.add(opp);
        }

        // Update the records in the current batch
        if (!opportunitiesToUpdate.isEmpty()) {
            update opportunitiesToUpdate;
        }
    }

    //Method to end the process of all batches
    public void finish(Database.BatchableContext bc){
        // Post-processing logic (e.g., sending a notification) can be added here
    }
}