public class ForEachLoopDemo {
	public static void loopDemo(){
        
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        Map<Id, Account> accMap = new Map<Id, Account>();
        
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
        
        //inserting accounts in org
        if(!accList.isEmpty()){
            insert accList;
        }
        
        //extract ids into a set from the list
        for(Account acc : accList){
            accIds.add(acc.Id);
        }
        
        //Convert List into Map
        for(Account acc : accList){
            accMap.put(acc.Id, acc);
        }
        
        //Display accounts by iterating a List
        System.debug('Account information displayed through List');
        for(Account acc : accList){
            System.debug(acc);
        }
        
        //Display account ids through set
        System.debug('Account Ids through Set');
        for(Id i : accIds){
            System.debug(i);
        }
        
        //Display Account Ids thorugh Map
        System.debug('Account Ids thorugh Map Keys');
        for(Id i : accMap.keySet()){
            System.debug(i);
        }
        
        //Display Account information/values thorugh Map
        System.debug('Account information thorugh Map value');
        for(Account acc : accMap.values()){
            System.debug(acc);
        }

    }

}