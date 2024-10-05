public with sharing class CalculateCaseOrigin {
    //@future
    public static void countCaseOrginOnAccount(List<Id> Ids) {
        // Query the accounts and their related cases
        List<Account> accList = [SELECT Id, Name, Cases_From_Email__c, Cases_From_Phone__c, Cases_From_Web__c, 
                                 (SELECT Id, Origin FROM Cases) FROM Account WHERE Id IN: Ids];

        // Create a list to store updated accounts
        List<Account> updatedAccList = new List<Account>();

        // Iterate through each account and update the case origin count fields
        for (Account acc : accList) {
            Integer email = 0; 
            Integer phone = 0; 
            Integer web = 0;

            // Count cases based on their origin
            for (Case c : acc.Cases) {
                System.debug('Case Origin: ' + c.Origin); // Debug statement for Origin value
                if (c.Origin != null && c.Origin.equalsIgnoreCase('Email')) {
                    email++;
                } else if (c.Origin != null && c.Origin.equalsIgnoreCase('Phone')) {
                    phone++;
                } else if (c.Origin != null && c.Origin.equalsIgnoreCase('Web')) {
                    web++;
                }
            }

            // Update account fields with case counts
            acc.Cases_From_Email__c = email;
            acc.Cases_From_Phone__c = phone;
            acc.Cases_From_Web__c = web;

            // Debug statement to verify values before updating
            System.debug('Account ' + acc.Id + ' | Email: ' + email + ' | Phone: ' + phone + ' | Web: ' + web);

            // Add the updated account to the list
            updatedAccList.add(acc);
        }

        // Update all modified accounts in a single DML operation
        if (!updatedAccList.isEmpty()) {
            update updatedAccList;
            System.debug('Accounts updated: ' + updatedAccList.size()); // Debug to verify updates
        }
    }
}
