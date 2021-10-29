@isTest
public class LeadManipulatorSoapConsumerTest {
    @isTest
    public static void testsendLeadInformation(){
       // System.Test.setMock(WebServiceMock.class, new LeadManipulatorWebServiceMock());
        System.test.startTest();
        soapSforceComSchemasClassLeadmanipu.Response testResp = new soapSforceComSchemasClassLeadmanipu.Response();
        testResp = LeadManipulatorSoapConsumer.sendLeadInformation('some-random-id');
        System.test.stopTest();
        System.assert(testResp != null);
    }
    @isTest
    public static void testDeleteLeadInformation(){
        //System.Test.setMock(WebServiceMock.class, new LeadManipulatorWebServiceMock());
        test.startTest();
        soapSforceComSchemasClassLeadmanipu.Response delResp = new soapSforceComSchemasClassLeadmanipu.Response();
        delResp = LeadManipulatorSoapConsumer.deleteLeadInformation('some-random-id');
        System.test.stopTest();
        System.assert(delResp != null);
    }
    @isTest
    public static void testUpdateLeadInformation(){
        //System.Test.setMock(WebServiceMock.class, new LeadManipulatorWebServiceMock());
        test.startTest();
        soapSforceComSchemasClassLeadmanipu.Response updateResp = new soapSforceComSchemasClassLeadmanipu.Response();
        updateResp = LeadManipulatorSoapConsumer.updateLeadInformation('some-random-id');
        System.test.stopTest();
        System.assert(updateResp != null);
    }
}