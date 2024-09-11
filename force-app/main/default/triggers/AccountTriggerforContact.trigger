trigger AccountTriggerforContact on Account (after insert, after update) {
    
   if (Trigger.isAfter) {
       
        if (Trigger.isInsert || Trigger.isUpdate) {
            for (Account acc : Trigger.new) {
                
                
                // Fetch active contacts for the current account
                // 
                
                List<Contact> activeContacts = CountContactonAccount.getActiveContactsForAccount(acc.Id);
                  
              //logging the count of active contacts
                

             
           System.debug('Number of active contacts for account ' + acc.Name + ':' + activeContacts.size());
            }
        }
    }

}