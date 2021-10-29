@isTest
public class OpportunityHandlerTest {
    
    @isTest
    public static void Test1(){
        
        Contact con = new Contact();
        con.Lastname= 'Test1 Contact'; 
        con.Email= 'test1@gmail.com'; 
        con.Phone= '987654321';
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name= 'ramesh';
        opp.Amount= 2400;
        opp.Number_Of_Years__c = 2;
        opp.Payment_Frequency__c = 'Quarterly';
        opp.CloseDate = System.today();
        opp.StageName = 'open';

        insert opp;
        List<Payment__c> paymentList = [select Name, Amount__c from Payment__c where Donation__c=: opp.id]; 
        System.debug('Payment list of opp ====>' +paymentList);
        System.assertEquals(paymentList.size(), 8);
        
        //List<Payment> paymentList = [select PaymentNumber, Amount from Payment where Id = :AccountId];
        
        Opportunity opp2 = new Opportunity();
        opp2.Name= 'suresh';
        opp2.Amount= 400;
        opp2.Number_Of_Years__c = 3;
        opp2.Payment_Frequency__c = 'Monthly';
        opp2.CloseDate = System.today();
        opp2.StageName = 'open';

        insert opp2;
        List<Payment__c> paymentList2 = [select Name, Amount__c from Payment__c where Donation__c=: opp2.id]; 
        System.debug('Payment list of opp2 ====>' +paymentList2);
        System.assertEquals(paymentList2.size(), 36);
        
        Opportunity opp3 = new Opportunity();
        opp3.Name= 'Mahesh';
        opp3.Amount= 10000;
        opp3.Number_Of_Years__c = 1;
        opp3.Payment_Frequency__c = 'Half-yearly';
        opp3.CloseDate = System.today();
        opp3.StageName = 'open';

        insert opp3;
        List<Payment__c> paymentList3 = [select Name, Amount__c from Payment__c where Donation__c=: opp3.id]; 
        System.debug('Payment list of opp3 ====>' +paymentList3);
        System.assertEquals(paymentList3.size(), 2
                           );

        Opportunity opp4 = new Opportunity();
        opp4.Name= 'Ganesh';
        opp4.Amount= 500;
        opp4.Number_Of_Years__c = 1;
        opp4.Payment_Frequency__c = 'One-time';
        opp4.CloseDate = System.today().ADDDAYS(5);
        opp4.StageName = 'open';

        insert opp4;
        List<Payment__c> paymentList4 = [select Name, Amount__c from Payment__c where Donation__c=: opp4.id]; 
        System.debug('Payment list of opp4 ====>' +paymentList4);
        System.assertEquals(paymentList4.size(), 1);
        
        Opportunity opp5 = new Opportunity();
        opp5.Name= 'dhanesh';
        opp5.Amount= 500;
        opp5.Number_Of_Years__c = 1;
        opp5.Payment_Frequency__c = 'One-time';
        opp5.CloseDate = System.today();
        opp5.StageName = 'open';

        insert opp5;
        List<Payment__c> paymentList5 = [select Name, Amount__c from Payment__c where Donation__c=: opp5.id]; 
        System.debug('Payment list of opp5====>' +paymentList5);
        System.assertEquals(paymentList5.size(), 1);
    }
    
    @isTest
    public static void Test2(){
        Contact c1 = new Contact();
        c1.Lastname= 'Test1 Contact'; 
        c1.Email= 'test1@gmail.com'; 
        c1.Phone= '987654321';
        insert c1;
        
        List<Opportunity> opportunityList = new List<Opportunity>();
        
        System.test.startTest();
        for(Integer i=1; i<=200; i++) {
            Opportunity opp = new Opportunity();
            opp.Name= 'Test'+i+' Donation';
            opp.Amount= 90*i;
            opp.Number_Of_Years__c = 2;
            opp.Payment_Frequency__c = 'Monthly';
            opp.CloseDate = System.today();
            opp.StageName = 'open';
            
            opportunityList.add(opp);
        }
        
        insert opportunityList;
        System.test.stopTest();
        
        List<Payment> paymentList = [select PaymentNumber, Amount from Payment];
        System.assert(paymentList!=null);
        System.assert(opportunityList != null);
        System.assertEquals(opportunityList.size(), 200);
        
    } 
}