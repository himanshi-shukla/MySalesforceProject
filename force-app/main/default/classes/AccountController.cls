 public with sharing class AccountController {
    //CHECK
        @AuraEnabled(cacheable=true)
        public static List<Account> getAccounts() {
            return [
                SELECT Id, Name, Phone, Industry 
                FROM Account 
                LIMIT 10
            ];
        }
    }
    
