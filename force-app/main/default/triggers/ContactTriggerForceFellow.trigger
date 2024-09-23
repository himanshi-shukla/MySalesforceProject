trigger ContactTriggerForceFellow on Contact (after insert, after update, after undelete) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete)){
    ContactTriggerHelper.enforcePerAccountContactLimit(Trigger.new);
    }
}