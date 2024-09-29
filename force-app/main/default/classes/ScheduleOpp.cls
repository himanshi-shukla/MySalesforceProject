public with sharing class ScheduleOpp implements Schedulable{
    public void execute(SchedulableContext sc) {
        BatchOfOpportunity bopp = new BatchOfOpportunity();
        Database.executeBatch(bopp, 100);

    }
}