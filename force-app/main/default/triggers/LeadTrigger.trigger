trigger LeadTrigger on Lead (before insert, before update) {
    LeadTriggerHandler.checkEmailofContact(Trigger.New);
}