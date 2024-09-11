public class MapDemo {
    public static void  MapDemo(){
        Map< Integer, String> testMap = new Map<Integer, String>();
          
        testMap.put(1,'Blue');
        testMap.put(2,'Red');
        System.debug('My Map contains.....' + testMap);
         testMap.put(3, 'Yellow');
        testMap.put(4, 'Yellow');
        System.debug('Map Contains ... ' + testMap);//key and Value
        System.debug('Map Contains ... ' + testMap.keySet());// key
         System.debug('Map Contains ... ' + testMap.values());//Value
        testMap.remove(2);
        System.debug('Map Contains ... ' + testMap);
         System.debug('Map Contains ... ' + testMap.size());
        if(testMap.containsKey(3)){
          System.debug('----Available');  
        }
        else{
          System.debug('--NOt--Available');  
        }
        System.debug('Value is = ' + testMap.get(3));
    }
    
    public static void listToMap(){
        
        List<Account> accList = new List<Account>();
        
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
            insert accList;
        }
        
        Map<Id, Account> accMap = new Map<Id, Account>(accList);		//converts list into Map
        
        System.debug('Account Map Contains... ' + accMap);
        System.debug('Account Map Contains... ' + accMap.keyset());
        
    }
}