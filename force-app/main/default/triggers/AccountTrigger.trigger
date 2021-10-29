trigger AccountTrigger on Account (before update) {
    //AccountTriggerHandler.PutMrOnName(Trigger.new);
    //AccountTriggerHandler.preventDuplicateName(Trigger.New);
    //AccountTriggerHandler.preventDuplicatePhone(trigger.New);
    
    /*if(trigger.Isafter && trigger.isInsert){
        AccountTriggerHandler.createNoOfContact(Trigger.New);
    }*/
    
    
            //AccountTriggerHandler.storeOwnerInSalesRep(trigger.new);
            AccountTriggerHandler.updateNamePhone(trigger.new, trigger.oldMap);
      
}