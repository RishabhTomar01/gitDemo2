public class DonationController {
    
    public Opportunity opp;
    Public ApexPages.StandardController controller;
    public Flow.Interview.Update_Payment_Status myFlow {get; set;}
    public static String recId{get;set;}
    //constructor
    public donationController(ApexPages.StandardController controller) {
        this.controller = controller;
        this.opp = (Opportunity)controller.getRecord();
    } 
    
    //this method will redirect one vf page to another with id
    public pageReference saveDonation(){
        
        PageReference pref2 = Page.DonationMangementPayment;
        controller.save();
        Opportunity oppRecord = [SELECT ID , Name,Total_No_Of_EMI__c,Installment_Amount__c FROM Opportunity ORDER BY createdDate DESC LIMIT 1];
        system.debug('oppRecord --> ' + oppRecord);
        pref2.getParameters().put('id', oppRecord.ID);
        pref2.setRedirect(true);
        return pref2;
    }
    //on clicking of Pay button status will changed too processed 
    public void payEmi(){
        
    }

    public void callFlow(){
        Map<String, Payment__c> oppRecord = new Map<String, Payment__c>([SELECT Id, Name ,Effective_Date__c,Status__c FROM Payment__c where Donation__c=: opp.id]);
        //List<Payment__c> oppRecord = [SELECT Id, Name ,Effective_Date__c,Status__c FROM Payment__c where Donation__c=: opp.id];
        myFlow = new Flow.Interview.Update_Payment_Status(oppRecord);
        myFlow.start();
    } 
    public Payment__c getOutput() {
      if (myFlow == null) return null;
      return (Payment__c)(myFlow.getVariableValue('paid successfully'));
   }
   
    /*
@RemoteAction
public static void callFlow(String recId){
//String recordId = System.currentPageReference().getParameters().get('id');
//String recordId = recId;
System.debug('recordid: ' + recId);
String pRecId;
List<Payment__c> pList = [SELECT Name,Status__c,Id FROM Payment__c WHERE Donation__c =: recId];
for(Payment__c prec : pList){
if(prec.Status__c == 'Draft'){
pRecId = prec.Id;
System.debug('records: ' + prec);

}
System.debug('records: ' + pRecId);
}
//Flow.Interview.Update_Payment_Status flow = new Flow.Interview.Update_Payment_Status(pList);
//myFlow = new Flow.Interview.Update_Payment_Status(pRecId);
} */
}