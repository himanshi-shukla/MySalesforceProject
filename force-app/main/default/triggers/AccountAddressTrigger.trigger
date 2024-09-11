trigger AccountAddressTrigger on Account (before insert, before update) {
    /*
     * Pre-Work:
Add a checkbox field to the Account object:

Field Label: Match Billing Address
Field Name: Match_Billing_Address
Note: The resulting API Name should be Match_Billing_Address__c.
Create an Apex trigger:
Name: AccountAddressTrigger
Object: Account
Events: before insert and before update
Condition: Match Billing Address is true
Operation: set the Shipping Postal Code to match the Billing Postal Code */
    
    for(Account acc : Trigger.new){
        //make sure that Matching billing address field is checked
        if(acc.Match_Billing_Address__c){
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
    
    

}