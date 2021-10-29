public class OpportunityHandler {

    //Method to calculate total nuber of EMI
    public static void calculateNumberOfEmi(List<Opportunity> opportunityList){
        for(Opportunity getOpportunity : opportunityList){
            if(getOpportunity.Payment_Frequency__c != null){
                //scalculating nuber of EMI if user wants to pay at once
                if(getOpportunity.Payment_Frequency__c == 'One-time'){ 
                    getOpportunity.Total_No_Of_EMI__c = 1;
                }
                //calculating nuber of EMI if user wants to pay Quarterly
                else if(getOpportunity.Payment_Frequency__c == 'Quarterly'){
                    getOpportunity.Total_No_Of_EMI__c = 4*getOpportunity.Number_Of_Years__c;
                }
                //calculating nuber of EMI if user wants to pay Half yearly
                else if(getOpportunity.Payment_Frequency__c == 'Half-yearly'){
                    getOpportunity.Total_No_Of_EMI__c = 2*getOpportunity.Number_Of_Years__c;
                }
                //calculating nuber of EMI if user wants to pay monthly
                else if(getOpportunity.Payment_Frequency__c == 'Monthly'){
                    getOpportunity.Total_No_Of_EMI__c = 12*getOpportunity.Number_Of_Years__c;
                }
            }
        }       
    }
    
    //Method to create payment records accordingly EMI
    public static void createPayment(List<Opportunity> opportunityList){
        //cresting List of Payment
        List<Payment__c> paymentList = new List<Payment__c>();
        for(Opportunity getOpportunity : opportunityList){
            Date tempDate = getOpportunity.CloseDate;
            
            system.debug('getOpportunity.CloseDate---> ' + getOpportunity.CloseDate);
            system.debug('tempDate---> ' + tempDate);
            for(Integer j = 0; j < getOpportunity.Total_No_Of_EMI__c; j++){
                //setting up the required fields for payment
                Payment__c paymentRecord = new Payment__c();
                paymentRecord.Amount__c = getOpportunity.Installment_Amount__c;
                paymentRecord.Donation__c = getOpportunity.Id;
                
                if(getOpportunity.Payment_Frequency__c == 'One-time'){
                    paymentRecord.Effective_Date__c = getOpportunity.CloseDate;
                    if(paymentRecord.Effective_Date__c <= Date.Today()){
                        paymentRecord.Status__c = 'Processed';
                    }
                    else{
                        paymentRecord.Status__c = 'Draft';
                    }
                }
                else if(getOpportunity.Payment_Frequency__c == 'Quarterly'){
                    paymentRecord.Effective_Date__c = tempDate;
                    if(paymentRecord.Effective_Date__c <= Date.Today()){
                        paymentRecord.Status__c = 'Processed';
                    }
                    else{
                        paymentRecord.Status__c = 'Draft';
                    }
                    tempDate = tempDate.ADDMONTHS(3);
                }
                else if(getOpportunity.Payment_Frequency__c == 'Half-yearly'){
                    paymentRecord.Effective_Date__c = tempDate;
                    if(paymentRecord.Effective_Date__c <= Date.Today()){
                        paymentRecord.Status__c = 'Processed';
                        system.debug('Inside If');
                        system.debug('paymentRecord.EffectiveDate--->' + paymentRecord.Effective_Date__c);
                        system.debug('paymentRecord.Status--->' + paymentRecord.Status__c);
                    }
                    else{
                        paymentRecord.Status__c = 'Draft';
                        system.debug('paymentRecord.EffectiveDate--->' + paymentRecord.Effective_Date__c);
                        system.debug('paymentRecord.Status--->' + paymentRecord.Status__c);
                    }
                    tempDate = tempDate.ADDMONTHS(6);
                }
                else if(getOpportunity.Payment_Frequency__c == 'Monthly'){
                    paymentRecord.Effective_Date__c = tempDate;
                    if(paymentRecord.Effective_Date__c <= Date.Today()){
                        paymentRecord.Status__c = 'Processed';
                    }
                    else{
                        paymentRecord.Status__c = 'Draft';
                    }
                    tempDate = tempDate.ADDMONTHS(1);
                }
                
                //adding all created record in payment list
                paymentList.add(paymentRecord);
            }
        }
        //inserting all payment record
        insert paymentList;
/*
        system.debug('opportunityList---> ' + opportunityList);
        Map<Id,Opportunity> oppMap = new Map<Id,Opportunity>([SELECT Id,Total_Paid_Amount__c,Balance_Amount__c,Amount
                                                              FROM Opportunity]);
        List<Opportunity> returnOppList = new List<Opportunity>();
        for(Payment paymentRecord : paymentList){
            if(paymentRecord.Status__c == 'Processed' && oppMap.containsKey(paymentRecord.Donation__c)){
                Opportunity oppRecord = oppMap.get(paymentRecord.Donation__c);
                oppRecord.Total_Paid_Amount__c = oppRecord.Total_Paid_Amount__c + paymentRecord.Amount;
                oppRecord.Balance_Amount__c = oppRecord.Amount - oppRecord.Total_Paid_Amount__c;
                returnOppList.add(oppRecord);
            }
        }
        update returnOppList;
        */
    }
   
}