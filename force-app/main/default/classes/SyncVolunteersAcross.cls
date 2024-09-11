public class SyncVolunteersAcross {
    
    //Method to work with the volunteers
	public void syncVolunteers() {
    // Step 1: Retrieve all Volunteer_Staging__c records
    List<Volunteer_Staging__c> stagingRecords = [SELECT Id, Last_Name__c, First_Name__c, Mobile__c FROM Volunteer_Staging__c];

    // Step 2: Prepare sets to hold unique identifiers (mobile number here) to efficiently check existence
    Set<String> stagingMobiles = new Set<String>();
    Map<String, Volunteer__c> existingVolunteersMap = new Map<String, Volunteer__c>();

    // Populate stagingMobiles with all mobile numbers from Volunteer_Staging__c
    for (Volunteer_Staging__c stagingRecord : stagingRecords) {
        stagingMobiles.add(stagingRecord.Mobile__c);
    }

    // Retrieve all Volunteer__c records that match the mobile numbers in stagingMobiles
    List<Volunteer__c> existingVolunteers = [SELECT Id, Last_Name__c, First_Name__c, Mobile__c FROM Volunteer__c WHERE Mobile__c IN :stagingMobiles];

    // Populate existingVolunteersMap with mobile number as key for easy lookup
    for (Volunteer__c volunteer : existingVolunteers) {
        existingVolunteersMap.put(volunteer.Mobile__c, volunteer);
    }

    // Step 3: Process each record in Volunteer_Staging__c and apply sync logic
    List<Volunteer__c> volunteersToInsert = new List<Volunteer__c>();
    List<Volunteer__c> volunteersToUpdate = new List<Volunteer__c>();
    Set<String> mobilesInStaging = new Set<String>();

    for (Volunteer_Staging__c stagingRecord : stagingRecords) {
        mobilesInStaging.add(stagingRecord.Mobile__c);

        if (!existingVolunteersMap.containsKey(stagingRecord.Mobile__c)) {
            // Scenario a: Insert into Volunteer__c
            volunteersToInsert.add(new Volunteer__c(
                Last_Name__c = stagingRecord.Last_Name__c,
                First_Name__c = stagingRecord.First_Name__c,
                Mobile__c = stagingRecord.Mobile__c
            ));
        } else {
            // Scenario c: Update Volunteer__c if mobile number is different
            Volunteer__c existingVolunteer = existingVolunteersMap.get(stagingRecord.Mobile__c);
            if (existingVolunteer.Last_Name__c != stagingRecord.Last_Name__c ||
                existingVolunteer.First_Name__c != stagingRecord.First_Name__c ||
                existingVolunteer.Mobile__c != stagingRecord.Mobile__c) {

                existingVolunteer.Last_Name__c = stagingRecord.Last_Name__c;
                existingVolunteer.First_Name__c = stagingRecord.First_Name__c;
                existingVolunteer.Mobile__c = stagingRecord.Mobile__c;
                volunteersToUpdate.add(existingVolunteer);
            }
        }
    }

    // Step 4: Delete records from Volunteer__c that are not in Volunteer_Staging__c
    List<Volunteer__c> volunteersToDelete = new List<Volunteer__c>();
    for (Volunteer__c volunteer : existingVolunteers) {
        if (!mobilesInStaging.contains(volunteer.Mobile__c)) {
            volunteersToDelete.add(volunteer);
        }
    }

    // Step 5: Perform DML operations
    if (!volunteersToInsert.isEmpty()) {
        insert volunteersToInsert;
    }
    if (!volunteersToUpdate.isEmpty()) {
        update volunteersToUpdate;
    }
    if (!volunteersToDelete.isEmpty()) {
        delete volunteersToDelete;
    }
}

}