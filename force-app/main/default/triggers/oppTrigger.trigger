trigger oppTrigger on Opportunity (before insert) {

    /*Upon Opportunity Creation if Amount is not null and is greater than 100000 then populate ‘Hot Opportunity’ in description field.*/
    
    OppTriggerHandler.updateDesconOpp(Trigger.new);
    
    
}