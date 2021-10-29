public class LeadManipuatorConsumer {
    //get access token
    public static String getAccessToken(){
        //login details
        String endpoint = 'https://login.salesforce.com/services/oauth2/token';
        String body =  
            'grant_type=password'+
            '&client_id=3MVG9fe4g9fhX0E4YpjMz7jCTLD26N2EArvlVVagiEG7I5YPNTjPHC3AUKBW_uFtZFSSnMv3xHGezezPs5G0A'+
            '&client_secret=6FFF5AF6F3117C074FB90DCBF9FD3CB041A1A0D4914273E7C5C676928C94A19B'+
            '&username=Rishabh.tomar@eternussolutions.com'+
            '&password=Rishabh@123enRRlAHO4xEWh8m00XHj3yW9r';
        
        //for Request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setBody(body);
        
        //make authorization callout
        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);
        
        System.debug('auth response ===> '+ response.getBody());
        
        //get accesstoken from response
        Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        
        return ((String) responseMap.get('access_token'));
    }
    
    //Lead creation Method
    public static String createLead(){
        
        //get access token
        String accessToken = getAccessToken();
        
        //lead information
        String body = '{'+ 
            '"FirstName" : "joss9898",'+
            '"LastName" : "Buttler9898",'+
            '"Email" : "Jos12.Buttler9898@cricbuzz.com",'+
            '"Phone" : "987659898",'+
            '"Company" : "Cricbuzz98"'+
            '}';
        
        //endpoint
        String endpoint = 'https://eternussolutions54-dev-ed.my.salesforce.com/services/apexrest/Leads';
        
        //for Request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer '+accessToken);
        
        //make save http callout
        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);
        
        system.debug('status ===>  ' + response.getStatus());
        system.debug('status code ===>  ' + response.getStatusCode());
        system.debug('body ===>  ' + response.getBody());
        
        return response.getBody();
    }
     // upsert Method
    public static String upsertLead(){
        
        //get access token
        String accessToken = getAccessToken();
        
        //lead onformation
        String body = '{'+ 
            '"Id" : "00Q5g000004WgB7EAK",'+
            '"FirstName" : "joss12",'+
            '"LastName" : "TheBoss",'+
            '"Email" : "Jos12.Buttler12@cricbuzz.com",'+
            '"Phone" : "987653210",'+
            '"Company" : "Cricbuzz"'+
            '}';
        
        //endpoint
        String endpoint = 'https://eternussolutions54-dev-ed.my.salesforce.com/services/apexrest/Leads/';
        
        //for Request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('PUT');
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer '+accessToken);
        
        //make save http callout
        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);
        
        system.debug('status ===>  ' + response.getStatus());
        system.debug('status code ===>  ' + response.getStatusCode());
        system.debug('body ===>  ' + response.getBody());
        
        return response.getBody();
    }
    
    //access lead by Id
    public static String getLeadById(String LeadId){
        //get access token
        String accessToken = getAccessToken();
        
        //lead onformation

        
        //endpoint
        String endpoint = 'https://eternussolutions54-dev-ed.my.salesforce.com/services/apexrest/Leads/';
        
        //for Request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint+LeadId);
        request.setMethod('GET');
        //request.setBody(body);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer '+accessToken);
        
        //make save http callout
        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);
        
        system.debug('status ===>  ' + response.getStatus());
        system.debug('status code ===>  ' + response.getStatusCode());
        system.debug('body ===>  ' + response.getBody());
        
        return response.getBody();
    }
    
     //delete lead by Id
    public static String deleteLead(String LeadId){
        //get access token
        String accessToken = getAccessToken();
        
        //lead onformation

        
        //endpoint
        String endpoint = 'https://eternussolutions54-dev-ed.my.salesforce.com/services/apexrest/Leads/';
        
        //for Request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint+LeadId);
        request.setMethod('DELETE');
        //request.setBody(body);
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer '+accessToken);
        
        //make save http callout
        Http http = new Http();
        HttpResponse response = new HttpResponse();
        response = http.send(request);
        
        system.debug('status ===>  ' + response.getStatus());
        system.debug('status code ===>  ' + response.getStatusCode());
        system.debug('body ===>  ' + response.getBody());
        
        return response.getBody();
    }
    
    
 }   
    
    
    
    
    /*    public static void getLeadById(){
Lead leadRecord;
HttpRequest request = new HttpRequest();
request.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=3MVG9fe4g9fhX0E4YpjMz7jCTLD26N2EArvlVVagiEG7I5YPNTjPHC3AUKBW_uFtZFSSnMv3xHGezezPs5G0A&client_secret=6FFF5AF6F3117C074FB90DCBF9FD3CB041A1A0D4914273E7C5C676928C94A19B&username=Rishabh.tomar@eternussolutions.com&password=Rishabh@123enRRlAHO4xEWh8m00XHj3yW9r');
request.setMethod('POST');
Http http = new Http();
HttpResponse response = new HttpResponse();
response = http.send(request);
system.debug('respone Auth ===>  ' + response.getBody());
Oauth objAuthInfo = (Oauth)JSON.deserialize(response.getBody(), Oauth.class);
if(objAuthInfo.access_Token != null){
HttpRequest request1 = new HttpRequest();
request.setEndpoint('https://eternussolutions54-dev-ed.my.salesforce.com/services/apexrest/Leads/00Q5g000004WQdTEAW');
request.setMethod('GET');
request.setHeader('Content-Type', 'application/json');
request.setHeader('Authorization', 'Bearer '+objAuthInfo.access_Token);
Http http1 = new Http();
HttpResponse response1 = new HttpResponse();
response = http1.send(request1);
system.debug('Lead Information ===>  ' + response1.getBody());
}   
}
public class Oauth{
public String access_Token{get; set;}
public String instance_url{get; set;}
public String id{get; set;}
public String token_type{get; set;}
public String issued_at{get; set;}
public String signature{get; set;}
} 
*/