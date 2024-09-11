public class AccountTrriggerHandlerSGTS {
public static void updateDescOnAcc(List<Account> accList){
        for(Account acc : accList){
            acc.Description = 'New Account Created';
        }
    }
    
    
    public static void updateRating(List<Account> accList){
                    for(Account acc : accList){
                        if(acc.Industry != null && acc.Industry == 'Media'){
                              acc.Rating = 'Hot'; 
                        }
                    }  
				}
    
    //When an Account inserts and CopyBillingToShipping (new field) checkbox is checked then automatically copy account billing address into account shipping address.
//Hint: acc.ShippingCity = acc.BillingCity;
    public static void updateBillingData(List<Account> accList){
        if(!acclist.isEmpty()){
                    for(Account acc : accList){
                        if(acc.acc_CopyBillingToShipping__c  == true){
                                acc.ShippingStreet = acc.BillingStreet;
                               /* acc.ShippingCity = acc.BillingCity;                    
                                acc.ShippingState = acc.BillingState;
                                acc.BillingPostalCode = acc.BillingPostalCode; */
                                acc.ShippingCountry = acc.BillingCountry;
                } 
               }
        }}  
}