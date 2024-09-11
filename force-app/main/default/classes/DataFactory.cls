public class DataFactory {

    public static List<Account> createAccounts(String name, Integer count, Boolean isInsert){
        
        List<Account> accList = new List<Account>();
        
        for(Integer i=1; i<= count; i++){
            Account acc = new Account();
            acc.Name = name;
            acc.Industry = 'Media';
            accList.add(acc);
        }
        
        if(isInsert){
            insert accList;
        }
        
        return accList;
    }
}