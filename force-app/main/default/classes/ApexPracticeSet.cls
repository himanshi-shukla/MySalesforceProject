public class ApexPracticeSet {

  /*Query 5 Account records into a list. 
    Now iterate on a list and create a set of account Ids and display values of the set. */

    public static void Scenario1(){
    List<Account> accList = new List<Account>();
    accList =[ Select id, Name, Industry from Account limit 5];
    
    Set<Id> accIdSet = new Set<Id>();
    for( Account acc : accList){
        accIdSet.add(acc.Id);
        System.debug('The Account ids are:' +accIdSet);
        
    }
  }
  /*
Query 5 Account records into a list. 
Now iterate on a list and create a map where 
key will be account Id and value will Account sObject (using loop) and display values of map.
*/

public static void AccountsWithMap(){
    List<Account> accListMap = new List<Account>();
    accListMap = [Select id, Name, Industry from account limit 5];

    Map<Id,Account> accMap = new Map<Id,Account>();
    for(Account acc : accListMap){
        accMap.put(acc.id,acc);
        System.debug('The account Map Contains:' +accMap.KeySet());
        System.debug('The Account Map values are :' +accMap.Values());
    }

}

}