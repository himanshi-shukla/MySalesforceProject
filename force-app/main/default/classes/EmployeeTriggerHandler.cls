public class EmployeeTriggerHandler {
    
    public static void countLeftEmployee(List<Employee__c> oldEmpList){
        
        Set<Id> accIds = new Set<Id>();
        List<Employee__c> empList = new List<Employee__c>();
        Map<Id, Account> accIdToAccMap;
        Map<Id, Decimal> accIdToTotalCount = new Map<Id, Decimal>();
        List<Account> accToBeUpdated = new LIst<Account>();
        
        //Checking whether employee is related to Account, 
        //if yes then collecting account ids and filtering employee records
        for(Employee__c emp : oldEmpList){
            if(emp.Account__c!=null){
                accIds.add(emp.Account__c);
                empList.add(emp);
            }
        }
        
        //Query Account records related to employee which are being deleted
        if(!accIds.isEmpty()){
            accIdToAccMap = new Map<Id,Account>([SELECT Id,Left_Employee_Count__c FROM Account WHERE Id IN:accIds]);
        }
        
        if(!empList.isEmpty()){
            for(Employee__c emp : empList){
                
                if(accIdToAccMap.containsKey(emp.Account__c)){
                    if(accIdToTotalCount.containsKey(emp.Account__c)){
                        Decimal count = accIdToTotalCount.get(emp.Account__c)+1;
                        accIdToTotalCount.put(emp.Account__c,count);
                    }else{
                        accIdToTotalCount.put(emp.Account__c,accIdToAccMap.get(emp.Account__c).Left_Employee_Count__c+1);
                    }
                }
            }
        }
        
        for(Id accId : accIdToTotalCount.keySet()){
            Account acc= new Account();
            acc.Id=accId;
            acc.Left_Employee_Count__c=accIdToTotalCount.get(accId);
            accToBeUpdated.add(acc);
        }
        if(!accToBeUpdated.isEmpty()){
            update  accToBeUpdated;
        }
    }


        
//Account1 -> emp1, emp2, emp3 [Left Employee Count = 5]
//Account2 -> emp4, emp5 [Left Employee Count = 3]
    
//Deleted -> emp1, emp2, emp4
        
//accIdToTotalCount [Account1, 7 | Account2, 4]

//Undelete code

public static void countLeftEmployeeUndelete(List<Employee__c> newEmpList){
        
        Set<Id> accIds = new Set<Id>();
        List<Employee__c> empList = new List<Employee__c>();
        Map<Id, Account> accIdToAccMap;
        Map<Id, Decimal> accIdToTotalCount = new Map<Id, Decimal>();
        List<Account> accToBeUpdated = new LIst<Account>();
        
        //Checking whether employee is related to Account, 
        //if yes then collecting account ids and filtering employee records
        for(Employee__c emp : newEmpList){
            if(emp.Account__c!=null){
                accIds.add(emp.Account__c);
                empList.add(emp);
            }
        }
        
        //Query Account records related to employee which are being deleted
        if(!accIds.isEmpty()){
            accIdToAccMap = new Map<Id,Account>([SELECT Id,Left_Employee_Count__c FROM Account WHERE Id IN:accIds]);
        }
        
        if(!empList.isEmpty()){
            for(Employee__c emp : empList){
                
                if(accIdToAccMap.containsKey(emp.Account__c)){
                    if(accIdToTotalCount.containsKey(emp.Account__c)){
                        
                        accIdToTotalCount.put(emp.Account__c,accIdToTotalCount.get(emp.Account__c) - 1);
                    }else{
                        accIdToTotalCount.put(emp.Account__c,accIdToAccMap.get(emp.Account__c).Left_Employee_Count__c - 1);
                    }
                }
            }
        }
        
        for(Id accId : accIdToTotalCount.keySet()){
            Account acc= new Account();
            acc.Id=accId;
            acc.Left_Employee_Count__c=accIdToTotalCount.get(accId);
            accToBeUpdated.add(acc);
        }
        if(!accToBeUpdated.isEmpty()){
            update  accToBeUpdated;
        }
    }
}