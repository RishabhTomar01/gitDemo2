public class LeadManipulatorSoapConsumer {
    
    /*public static String getSessionIdByHTTP(){
String endpoint = 'https://ap24.salesforce.com/services/Soap/class/LeadManipulatorSoap';
String username = 'guestadmin6989@gmail.com';
String password = 'Mangal@758CUtCGOrJnoIafKeyCPDe2oFUK';

String body = '<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">'+
'<Header/><Body>' +
'<login xmlns="urn:partner.soap.sforce.com">'+
'<username>'+
username +
'</username>'+
'<password>' +
password +
'</password>' +
'</login>' +
'</Body></Envelope>';

HttpRequest request = new HttpRequest();
request.setEndpoint(endpoint);
request.setMethod('POST');
request.setHeader('Content-Type', 'text/xml;charset=UTF-8');
request.setHeader('SOAPAction', '""');
request.setBody(body);

Http http = new Http();
HttpResponse response = http.send(request);

System.debug(response.getBody());
Dom.Document responseDoc = response.getBodyDocument();
Dom.XmlNode resultElmt = responseDoc.getRootElement()
.getChildElement('Body', 'https://ap24.salesforce.com/services/Soap/class/LeadManipulatorSoap')
.getChildElement('loginResoponse', 'urn:partner.soap.sforce.com')
.getChildElement('result', 'urn:partner.soap.sforce.com');

String sessionId = resultElmt
.getChildElement('sessionId', 'urn:partner.soap.sforce.com')
.getText();

System.debug(sessionId);
return sessionId;
}*/
    
    public static String getSessionIdByPartnerWSDL(){
        String username = 'Rishabh.tomar@eternussolutions.com';
        String password = 'Rishabh@123enRRlAHO4xEWh8m00XHj3yW9r';
        
        partnerSoapSforceCom.Soap partner = new partnerSoapSforceCom.Soap();
        partnerSoapSforceCom.LoginResult result = partner.login(username, password);
        System.debug('sessionid ===> ' + result.sessionId);
        return result.sessionId;
    } 
    
    public static soapSforceComSchemasClassLeadmanipu.Response sendLeadInformation(String sessionId){
        soapSforceComSchemasClassLeadmanipu.Response consumerResp = new soapSforceComSchemasClassLeadmanipu.Response();
        
        soapSforceComSchemasClassLeadmanipu.LeadManipulatorSoap leadManipulator = new soapSforceComSchemasClassLeadmanipu.LeadManipulatorSoap();
        leadManipulator.SessionHeader = new soapSforceComSchemasClassLeadmanipu.SessionHeader_element();
        leadManipulator.SessionHeader.sessionId = sessionId;
        //List <Lead> leadList = new List<Lead>();
        /*
        for(Integer i = 1; i <= 10; i++){
            Lead newLead = new Lead();
            newLead.FirstName = 'Sachin'+i;
            newLead.LastName = 'Tendulkar'+i;
            newLead.Email = 'sachin'+i+'@gmail.com';
            newLead.Phone = '888888888'+i;
            newLead.Company = 'Tendulkar'+i+' Ltd';
            leadList.add(newLead);
        }*/
            
            consumerResp = leadManipulator.createLead(
                			'Sam11',
                			'Curren11',
                			'sam11.curran11@test.com',
                			'8569677769',
                			'Sam Ltd 11');
        System.debug('result ===> ' + consumerResp);
        
        return consumerResp;
    }
    
    public static soapSforceComSchemasClassLeadmanipu.Response deleteLeadInformation(String sessionId){
        soapSforceComSchemasClassLeadmanipu.Response delResponse = new soapSforceComSchemasClassLeadmanipu.Response();
        
        soapSforceComSchemasClassLeadmanipu.LeadManipulatorSoap soapLead = new soapSforceComSchemasClassLeadmanipu.LeadManipulatorSoap();
        soapLead.SessionHeader = new soapSforceComSchemasClassLeadmanipu.SessionHeader_element();
        soapLead.SessionHeader.sessionId = sessionId;
        
        delResponse = soapLead.leadDelete('joss12', 'TheBoss', 'jos12.buttler12@cricbuzz.com', '987653210');
        return delResponse;
    }
    
    public static soapSforceComSchemasClassLeadmanipu.Response updateLeadInformation(String sessionId){
        soapSforceComSchemasClassLeadmanipu.Response updateRes = new soapSforceComSchemasClassLeadmanipu.Response();
        
        soapSforceComSchemasClassLeadmanipu.LeadManipulatorSoap leadSoap = new soapSforceComSchemasClassLeadmanipu.LeadManipulatorSoap();
        leadSoap.SessionHeader = new soapSforceComSchemasClassLeadmanipu.SessionHeader_element();
        leadSoap.SessionHeader.sessionId = sessionId;
        
        updateRes = leadSoap.updateLead('Hari', 'Krishna', 'krishna@gmail.com', '9999999999');
        return updateRes;
    }
    
}