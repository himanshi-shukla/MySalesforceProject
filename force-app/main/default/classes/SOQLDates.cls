public class SOQLDates {
    Date today = Date.today();
    
    Date oneWeekAgo = today.addDays(-7);
    // Construct the SOQL query
	String soqlQuery = 'SELECT Id, Name, CreatedDate FROM Account WHERE CreatedDate >= :oneWeekAgo AND CreatedDate <= :today';
    
    // Execute the query
    List<Account> recentAccounts = Database.query(soqlQuery);
        
        
    // Process the results as needed
    //System.debug('Accounts created in the last week: ' + recentAccounts);

}