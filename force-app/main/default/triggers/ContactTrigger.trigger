trigger ContactTrigger on Contact (before insert) {
ContactTriggerHandler.changeContactParent(Trigger.new);
}