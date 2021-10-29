trigger OpportunityTriggerLearning on Opportunity (before insert) {
    OpportunityTriggerLearningHandler.updateAccountHot(Trigger.new);
}