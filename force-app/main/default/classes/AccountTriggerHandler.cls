public class AccountTriggerHandler {
    
    public void beforeInsertLogic(List <Account> accList){
        for(Account acc : accList){
            acc.Description = 'Test khaata hai yeh';
        }
    }
    
    public static void recursionDemo(List<Account> accList){
        
        List<Account> accToBeUpdated = new List<Account>();
        for(Account acc : accLIst){
            Account a = new Account();
            a.id = acc.Id;
            a.Description = 'Recursion Demo';
            accToBeUpdated.add(a);
        }
        
        update accToBeUpdated;
    }

}