/*
     * Create a bulkified Apex trigger that adds a follow-up task to an opportunity if its stage is Closed Won. Fire the Apex trigger after inserting or updating an opportunity.
Create an Apex trigger:
Name: ClosedOpportunityTrigger
Object: Opportunity
Events: after insert and after update
Condition: Stage is Closed Won
Operation: Create a task:
Subject: Follow Up Test Task
WhatId: the opportunity ID (associates the task with the opportunity)
Bulkify the Apex trigger so that it can insert or update 200 or more opportunities*/
    
    trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasksToInsert = new List<Task>();

    // Collect all opportunities that are Closed Won
    for (Opportunity opp : Trigger.new) {
        if (opp.StageName == 'Closed Won') {
            Task followUpTask = new Task(
                Subject = 'Follow Up Himanshi Task',
                WhatId = opp.Id
            );
            tasksToInsert.add(followUpTask);
        }
    }

    // Insert all tasks in bulk
    if (!tasksToInsert.isEmpty()) {
        try {
            insert tasksToInsert;
        } catch (DmlException e) {
            // Handle DML exceptions if any
            System.debug('Error inserting tasks: ' + e.getMessage());
        }
    }
}