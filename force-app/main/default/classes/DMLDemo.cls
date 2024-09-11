public class DMLDemo {

    //Update DML On acciounts
    
    public static void updateAccounts(){
        List<Account> accList = new List<Account>();
        
        accList = [SELECT Id, Name, Phone from Account Where Phone = null];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Phone = '123456';
            }
            
            update accList;
        }

    }
    
    //Query Contacts where email is null and update them with comn@gts.com
    
    public static void updateContacts(){
        List<Contact> conList = new List<Contact>();
        conList = [SELECT Id, firstName, lastName, email from Contact where email = null];
        if(!conList.isEmpty()){
            for(Contact con : conList){
                con.email = 'Contact@sgts.com';
            }
            update conList;
        }
    }
    
    //Insert + Update
    public static void upsertAccounts(){
        List<Account> accList = new List<Account>();
        
        accList = [SELECT Id, Name, Phone from Account Where Phone = '123456'];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Phone = '987656789';
            }
        }
        
        for(Integer i=1; i<=5; i++){
            Account acc = new Account();
            acc.Name = 'Test Account'+i;
            acc.Phone = '2342342424';
            acc.Industry = 'Media';
            acc.Active__c = 'Yes';
            if(acc.Active__c == 'Yes'){
                accList.add(acc); 
            }
        }
        
        if(!accList.isEmpty()){
            upsert accList;		//If record has id then update otherwise insert
        }
    }
    
    public static void deleteAccounts(){
        List<Account> accList = new List<Account>();
        
        accList = [SELECT Id, Name, Phone from Account Where Name Like 'Test%'];
        
        if(!accList.isEmpty()){
            delete accList;
        }
    }
    
    
}