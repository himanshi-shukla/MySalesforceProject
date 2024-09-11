public class RelatedConAccountHandler {
    public static void updateCon(List< Account> accList){
        System.debug('Hello there');
        List<Contact> conList = new List<Contact>();
        for(Account acc: accList){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.FirstName = acc.name +'Rahi';
            con.LastName = 'Job';
            conList.add(con);
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }

}