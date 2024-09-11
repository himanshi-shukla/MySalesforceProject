public class leadTriggerhandler {
		public static boolean alreadyExecuted = false;    
    public static void beforeInsertHandler(list<Lead> newRecords){
        //create a new Identifier for lead: newRecords as it will not understand Trigger.new in the for loop parameter
        for(Lead leadRecord :newRecords ){
            //mandate filling out the industry field
            if(String.isBlank(leadRecord.industry)){
                leadRecord.Industry.addError('Industry cannot be blank');
            }
            //set lead source field to foo , if blank already
            if(String.isBlank(leadRecord.LeadSource)){
                leadRecord.LeadSource = 'Foo';
            }
        }
    }
    
    
    // after insert logic ges here 
    public static void afterInsertHandler(list<Lead> newRecords){
        List <Task> LeadTasks = new List <Task>();
        for(Lead eachLeadRecord : newRecords){
            
            Task LeadTask = new Task(Subject ='Follow up on Lead record status',  WhoId = eachLeadRecord.id);
            LeadTasks.add(LeadTask);
        }
        insert LeadTasks;
        
        //create 1 more Lead record everytime
        if(leadTriggerhandler.alreadyExecuted == false){
            leadTriggerhandler.alreadyExecuted = true;
        Lead anotherLead = new Lead(lastName='Test Record',status = 'Open - Not Contacted', company ='abc', industry ='Agriculture');
            insert anotherLead;
            
        }
    }
    //Before Update Logic goes here
    public static void beforeUpdateHandler(list<Lead> newRecords, map<id, Lead> oldRecordMap){
        
        for(Lead eachLeadRecord : newRecords){
            if((eachLeadRecord.Status == 'Closed - Converted' 
                ||
                eachLeadRecord.status == 'Closed - Not Converted') 
               && 
               oldRecordMap.get(eachLeadRecord.id).status == 'Open - Not Contacted'){
                   eachLeadRecord.Status.addError('You may not directly close the lead. Please first change to Working status');   
               }
        }
    }
    
}