@isTest
private class accountRestTest {
    @isTest static void TestgetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        System.test.startTest();
        RestRequest request = new RestRequest();
        RestResponse res = new RestResponse();
        request.requestUri = 'https://https://eternussolutions71-dev-ed.my.salesforce.com/services/apexrest/accounts/' + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        RestContext.response = res;
        // Call the method to test
        Account acc = accountRest.getAccountById();
        System.test.stopTest();
        // Verify results
        System.assert(acc != null);
        System.assertEquals('Test record', acc.Name);
    }
    @isTest static void deleteAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        System.test.startTest();
        RestRequest request = new RestRequest();
        RestResponse res = new RestResponse();
        request.requestUri = 'https://https://eternussolutions71-dev-ed.my.salesforce.com/services/apexrest/accounts/' + recordId;
        request.httpMethod = 'Delete';
        RestContext.request = request;
        RestContext.response = res;
        // Call the method to test
        Account acc = accountRest.deleteAccount();
        System.test.stopTest();
        // Verify results
        List<account> account = [SELECT Id FROM Account WHERE Id=:recordId];
        System.assert(account.size() == 0);
    }
    
    @isTest static void testCreateAccount() {
        System.test.startTest();
		Id newacc = accountRest.createAccount('Test record','9876543210');        
		System.test.stopTest();
        account newAcccount = [SELECT Id, Name, Phone FROM Account WHERE Id=: newAcc];
       //verify
      	system.assert(newAcccount!= null);
        system.assertEquals('Test record', newAcccount.Name);
        
    }
    @isTest static void testUpsertAccount() {
        Id recordId = createTestRecord();
        System.test.startTest();
        
		Id newacc = accountRest.upsertAccount(recordId, 'Test record11','9876543210');        
		System.test.stopTest();
        account newAcccount = [SELECT Id, Name, Phone FROM Account WHERE Id=: newAcc];
       //verify
      	system.assert(newAcccount!= null);
        system.assertEquals('Test record11', newAcccount.Name);
        
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