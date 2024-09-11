public class ListDemo {
public static void stringList(){
    //ListDemo.stringList();
        
        List<String> colors = new List<String>();
        List<String> colors2 = new List<String>();
        
        colors.add('Red');		//0
        colors.add('Blue');		//1
        colors.add('Green');	//2
        colors.add('Blue');		//3
        System.debug('List Contains = ' + colors); 
        
        colors.add(1,'Yellow');
        System.debug('List Contains = ' + colors); 
        
        colors2.add('Black');
        colors2.add('White');
    	colors2.add('pink');
        
        colors.addAll(colors2);
        System.debug('Colors List Contains = ' + colors);
        System.debug('Colors2 List Contains = ' + colors2);
        
        colors2.clear();
        System.debug('Colors2 List Contains = ' + colors2);
        
        colors2 = colors.clone();
        System.debug('Colors List Contains = ' + colors);
        System.debug('Colors2 List Contains = ' + colors2);
if(colors.contains('Red')){
            System.debug('Available');
        }else{
            System.debug('Available');
        }
    
    //equal comparision
    if(colors.equals(colors2)){
            System.debug('Both lists are equal');
        }else{
            System.debug('Both lists are not equal');
        }
        
        if(colors[2] == colors2[1]){
            System.debug('Index 2 of Colors and Index 1 of Colors2 are same');
        }
    else{
            System.debug('Index 2 of Colors and Index 1 of Colors2 are not same');
        }
    
    //isEmpty check 
    if(colors.isEmpty()){
            System.debug('List is empty');
        }else{
            System.debug('List is not empty');
        }
        
        if(!colors.isEmpty()){
            System.debug('List is not empty');
        }else{
            System.debug('List is empty');
        }
    
    // size
        System.debug('Colors List Contains = ' + colors.size());
            System.debug('Colors2 List Contains = ' + colors2.size());
            
            if(colors.size() == 0){
                System.debug('List is empty');
            }else{
                System.debug('List is not empty');
            }
            //sort
            colors.sort();
            System.debug('Colors List Contains = ' + colors);
            
            colors2.sort();
            System.debug('Colors2 List Contains = ' + colors2);
}
    
    
    public static void integerList(){
        
        Set<Integer> marksSet = new Set<Integer>();
        marksSet.add(10);
        marksSet.add(20);
        
        Set<Integer> marks = new Set<Integer>();
        marks.add(10);
        marks.add(20);
        marks.add(30);
        marks.add(20);
        marks.add(40);
        
        /*marks.addAll(marksSet);
        System.debug('Set Contains = ' + marks); 
        
        marksSet.addAll(marks);
        System.debug('List Contains = ' + marksSet); 
        
        marksSet.clear();
        System.debug('Set Contains = ' + marksSet);
        marksSet = marks.clone();
        System.debug('Set Contains = ' + marksSet);*/
        
        if(marks.contains(20)){
            System.debug('Yes');
        }else{
            System.debug('No');
        }
        
        if(marks.containsAll(marksSet)){
            System.debug('Yes');
        }else{
            System.debug('No');
        }
        
        if(marksSet.containsAll(marks)){
            System.debug('Yes');
        }else{
            System.debug('No');
        }
        
        if(marksSet.equals(marks)){
            System.debug('Yes');
        }else{
            System.debug('No');
        }

        
    }
    
    public static void createAccounts(){
        
        List<Account> accList = new List<Account>();
        Set<Id> accId = new Set<Id>();
        
        for(Integer i=1; i<=5; i++){
            Account acc = new Account();
            acc.Name = 'Test Account'+i;
            acc.Phone = '2342342424';
            acc.Industry = 'Media';
            acc.Active__c = 'Yes'; 
            accList.add(acc); 
        }
        insert accList;
    } 
    //Create 10 Opportunity Records
    public static void createOpps(){
        
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=1; i<=10; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'New Opp'+i;
            opp.CloseDate = System.today();
            opp.StageName = 'Prospecting';
            oppList.add(opp);
        }
        insert oppList;
    }
    
    //Create 5 Accounts with one opportunity related to each account.
    public static void createAccWithOpps(){
        List<Account> accList = new List<Account>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=1; i<=5; i++){
            Account acc = new Account();
            acc.Name = 'Test Account'+i;
            acc.Phone = '2342342424';
            acc.Industry = 'Media';
            acc.Active__c = 'Yes'; 
            accList.add(acc); 
        }
        insert accList;
        
        //for each loop
        for(Account acc1: accList){
            Opportunity opp = new Opportunity();
            opp.Name = 'New Opp ' + acc1.Name;
            opp.CloseDate = System.today();
            opp.StageName = 'Prospecting';
            opp.AccountId = acc1.Id;
            oppList.add(opp);
        } 
        insert oppList;
    }
    //Create 5 Accounts with one contact and one case related to each account.
    
    public static void createAccWithConAndCase(){
        
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        List<Case> csList = new List<Case>();
        
        //Inserting Account Records
        for(Integer i=1; i<=5; i++){
            Account acc = new Account();
            acc.Name = 'Test Account'+i;
            acc.Phone = '2342342424';
            acc.Industry = 'Media';
            acc.Active__c = 'Yes'; 
            accList.add(acc); 
        }
        insert accList;
        
        //Inserting Contact Records
        for(Account acc : accList){
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        insert conList;
        
        for(Account acc : accList){
            Case cs = new Case();
            cs.Origin = 'Web';
            cs.Status = 'New';
            cs.AccountId = acc.Id;
            csList.add(cs);
        }
        insert csList; 
    }
    

}