trigger OpportunityTriggerOnLogicUpdate on Opportunity (before insert, before update) {
    for(Opportunity opp : Trigger.new){
        if(opp.Amount > 1000000 && opp.StageName != 'Closed Won'){
            opp.StageName = 'Closed Won';
        }
        
    }
}