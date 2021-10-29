public class vfReportController {
    private Report report;
    public vfReportController(apexpages.StandardController controller){
        report = (Report)controller.getRecord();
        
        /* report = [select id, name from report where name=: '$user.name'];
        PageReference pref2 = Page.DonationMangementPayment;
        controller.save();
        Opportunity oppRecord = [SELECT ID , Name,Total_No_Of_EMI__c,Installment_Amount__c FROM Opportunity ORDER BY createdDate DESC LIMIT 1];
        system.debug('oppRecord --> ' + oppRecord);
        pref2.getParameters().put('id', oppRecord.ID);
        pref2.setRedirect(true);
        return pref2; */
    }
    public Report getReport(){
        return report;
    }
}