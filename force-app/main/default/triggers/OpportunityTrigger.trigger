trigger OpportunityTrigger on Opportunity (before insert,before update,After insert) {
    /* Before Insert */
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            //calling the calculateNumberOfEmi method and passing the comming values from user
            OpportunityHandler.calculateNumberOfEmi(Trigger.new);
        }
    }
    
    /* After Insert */
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            OpportunityHandler.createPayment(Trigger.new);
        }    
    } 
}