public class UpdateParentAccount implements Queueable{
    private List<Account> accList;
    private Id parentAccId;
    
    //Constructor
    public UpdateParentAccount(List<Account> accRecords, Id accId){   
        accList = accRecords;
        parentAccId = accId;
    }
   
    public void execute(QueueableContext ct){
        for(Account acc : accList){
            acc.ParentId = parentAccId;
        }
        update accList;
    }
}


/*
 * 
 * List<Account> accList = [SELECT Id FROM Account 
                         WHERE billingstate ='NY'];

Id parentId = [SELECT Id FROM Account 
               WHERE Name = 'Pyramid Construction Inc.'][0].Id;
UpdateParentAccount updateJob = new UpdateParentAccount(accList, parentId);//calls constructor
Id jobId = System.enqueueJob(updateJob);
 */