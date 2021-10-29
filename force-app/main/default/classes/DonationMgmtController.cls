public class DonationMgmtController {/*
    public Opportunity opp;
    Public ApexPages.StandardController controller;
    public DonationMgmtController(ApexPages.StandardController controller) {
        this.controller = controller;
        this.opp = (Opportunity)controller.getRecord();
    }
    public List<Opportunity>getOpportunity() {
        return [select 
                     Total_No_Of_EMI__c,Amount_To_Pay__c, Next_Due_Date__c, Balance_Amount__c, Total_Paid_Amount__c
                from 
                    Opportunity 
                where id=:opp.id];
    }
    
     public List<Payment> getPayment() {
        return [select PaymentNumber, Amount from Payment where Donation__c=: opp.id];
    }
    
    public pageReference saveDonation(){
        controller.save();
        return Page.DonationMgmt2;
    }*/
}