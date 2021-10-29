trigger BooksTrigger on Book__c (before insert, Before Update) {
    BooksTriggerHandler.DiscountOf10(Trigger.New);
}