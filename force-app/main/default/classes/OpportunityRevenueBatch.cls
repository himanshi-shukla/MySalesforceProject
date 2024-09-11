public class OpportunityRevenueBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    // Storing variables for revenue sum
    private Map<Id, Decimal> totalRevenueLastYear = new Map<Id, Decimal>();
    private Map<Id, Decimal> totalRevenueThisYear = new Map<Id, Decimal>();
    private Integer recordsProcessed = 0; 

    // Retrieving closed opportunities with their associated account, amount, and close date.
    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, AccountId, Amount, CloseDate FROM Opportunity WHERE StageName IN (\'Closed Won\', \'Closed Lost\')';
        return Database.getQueryLocator(query);
    }

    // Calculating the total revenue for each account for the current year and the last year based on the close date of opportunities.
    public void execute(Database.BatchableContext bc, List<Opportunity> scope) {
        Date today = System.today();
        Integer currentYear = today.year();
        Integer lastYear = currentYear - 1;

        recordsProcessed += scope.size(); // Update the number of records processed

        for (Opportunity opp : scope) {
            if (opp.AccountId != null) {
                if (opp.CloseDate.year() == currentYear) {
                    if (totalRevenueThisYear.containsKey(opp.AccountId)) {
                        totalRevenueThisYear.put(opp.AccountId, totalRevenueThisYear.get(opp.AccountId) + opp.Amount);
                    } else {
                        totalRevenueThisYear.put(opp.AccountId, opp.Amount);
                    }
                } else if (opp.CloseDate.year() == lastYear) {
                    if (totalRevenueLastYear.containsKey(opp.AccountId)) {
                        totalRevenueLastYear.put(opp.AccountId, totalRevenueLastYear.get(opp.AccountId) + opp.Amount);
                    } else {
                        totalRevenueLastYear.put(opp.AccountId, opp.Amount);
                    }
                }
            }
        }

        updateAccountRecords();
    }

    private void updateAccountRecords() {
        Map<Id, Account> accountsToUpdateMap = new Map<Id, Account>();

        for (Id accountId : totalRevenueLastYear.keySet()) {
            if (!accountsToUpdateMap.containsKey(accountId)) {
                accountsToUpdateMap.put(accountId, new Account(Id = accountId));
            }
            accountsToUpdateMap.get(accountId).Total_Revenue_Last_Year__c = totalRevenueLastYear.get(accountId);
        }

        for (Id accountId : totalRevenueThisYear.keySet()) {
            if (!accountsToUpdateMap.containsKey(accountId)) {
                accountsToUpdateMap.put(accountId, new Account(Id = accountId));
            }
            accountsToUpdateMap.get(accountId).Total_Revenue_Last_Year__c = totalRevenueThisYear.get(accountId);
        }

        // Converting the map values to a list and update
        if (!accountsToUpdateMap.isEmpty()) {
            update accountsToUpdateMap.values();
        }
    }

    public void finish(Database.BatchableContext bc) {
        // Adding assertions to verify the results
        List<Account> accounts = [SELECT Id, Total_Revenue_Last_Year__c, Total_Revenue_This_Year__c FROM Account WHERE Id IN :totalRevenueLastYear.keySet() OR Id IN :totalRevenueThisYear.keySet()];

        for (Account acc : accounts) {
            Decimal expectedLastYear = totalRevenueLastYear.get(acc.Id);
            Decimal expectedThisYear = totalRevenueThisYear.get(acc.Id);

            System.assertEquals(expectedLastYear, acc.Total_Revenue_Last_Year__c, 'Total Revenue Last Year for account ' + acc.Id + ' is incorrect.');
            System.assertEquals(expectedThisYear, acc.Total_Revenue_This_Year__c, 'Total Revenue This Year for account ' + acc.Id + ' is incorrect.');
        }

        // Log or perform an action with the processed record count
        System.debug('Total records processed: ' + recordsProcessed);
    }
}