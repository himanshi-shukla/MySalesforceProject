trigger EmployeeTrigger on Employee__c (after delete, after undelete) {
    
    
    if(Trigger.isDelete && Trigger.isAfter){
        EmployeeTriggerHandler.countLeftEmployee(Trigger.old);
    }
    
        if(Trigger.isunDelete && Trigger.isAfter){
        EmployeeTriggerHandler.countLeftEmployeeUndelete(Trigger.new);
    }

}