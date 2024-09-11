public with sharing class ContactControllerClass {
    @AuraEnabled
    public static List<Contact> getContacts(Id accountId){
        return [ Select Name, Email from Contact where AccountId = :accountId] ;
    }
 	
    @AuraEnabled
    public static void updateContactWithAccountId (List <Contact> updatedContacts){
        update updatedContacts;
    }
}