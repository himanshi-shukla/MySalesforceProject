trigger UserNicknameTrigger on User (before insert) {
    for( User user : Trigger.new){
        if(user.FirstName != null && user.FirstName.length() >= 2 && user.LastName != null && user.LastName.length() >= 2 ){
             String firstNamePart = user.FirstName.substring(0, 2);
         String lastNamePart = user.LastName.substring(0, 2);
        user.customNickname__c = firstNamePart + lastNamePart;
    }
        else{
             // Handle cases where the first or last name is null or too short
            user.customNickname__c = 'Default';
        }

}
}