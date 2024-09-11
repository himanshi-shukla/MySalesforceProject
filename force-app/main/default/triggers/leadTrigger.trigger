trigger leadTrigger on Lead (before insert, before update,after insert, after update) {
    
    
    switch on Trigger.OperationType {
        when BEFORE_INSERT{
            leadTriggerhandler.beforeInsertHandler(Trigger.new);
        }

        
        when BEFORE_UPDATE{
            
            leadTriggerhandler.beforeUpdateHandler(Trigger.new, Trigger.oldMap);
              
        }

        when AFTER_INSERT{
            
            leadTriggerhandler.afterInsertHandler(Trigger.new);
            
        }
    }

}