public class ImportantScenarios {
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