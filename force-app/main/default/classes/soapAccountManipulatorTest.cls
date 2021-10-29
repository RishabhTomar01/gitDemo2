@istest
public class soapAccountManipulatorTest {
	@isTest
    static void testCreateLead(){
        System.test.startTest();
       
        // insert createList;
       Id newAcc = soapAccountManipulator.createAccount('Rohit','9999999999');
        System.test.stopTest();
        //verify test results
        account newAcccount = [SELECT Id, Name, Phone FROM Account WHERE Id=: newAcc];
        //System.assertEquals('Rohit', newAcc.Name);
    }
     @isTest
    static void testdeleteAccount(){
        System.test.startTest();
        Account accTest = new Account(
            Name='Test record',
            Phone='9876543210',
        	Industry = 'Banking');
        insert accTest;
        soapAccountManipulator.deleteAccount(accTest.Name, accTest.Phone, accTest.Industry);
        //List to be deleted
        List<Account> getAccountList = new List<Account>([SELECT Name,Phone,Industry FROM Account
                                                 WHERE Name =: accTest.Name AND Phone =: accTest.Phone 
                                                 AND Industry =: accTest.Industry]);
        delete getAccountList;
        System.test.stopTest();
        //verify the test results
        System.assert(getAccountList.size() == 0);
        
    }
    @isTest
    static void testgetAccountById(){
        Id recordId = createTestRecord();
        System.test.startTest();
        Account acc = soapAccountManipulator.getAccountById(recordId);
        System.test.stopTest();
        //verify 
        System.assert(acc!= null);
        System.assertEquals('Test record', acc.Name);
    }
    static Id createTestRecord() {
        // Create test record
        Account accTest = new Account(
            Name='Test record',
            Phone='9876543210',
        	Industry = 'Banking');
        insert accTest;
        return accTest.Id;
    } 
}