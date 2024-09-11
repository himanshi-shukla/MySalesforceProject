public class PositionPayTriggerHandler {
    
    public static void updatePay(List <position__c> posList){
        for(position__c pos :posList){
            if(pos.Status__c == 'New Position' && pos.Min_Pay__c == null && pos.Max_Pay__c == null){
                pos.Open_Date__c = System.Today();
                pos.Max_Pay__c = 200000;
                pos.Min_Pay__c = 150000;
            }
        }
        
    }

}