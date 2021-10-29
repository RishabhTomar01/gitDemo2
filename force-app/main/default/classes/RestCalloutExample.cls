public class RestCalloutExample {
    public static Decimal currencyConverter(Decimal dollar){
        Decimal inr = 0.0;
        HTTP http = new HTTP();
		HTTPRequest request = new HTTPRequest();
        request.setEndpoint('http://api.exchangeratesapi.io/v1/latest?62e0d75765a6628f02b03487aae1d813');
        request.setMethod('GET');
        
        HTTPResponse response = http.send(request);
        Map<String, Object> jsonBody = (Map<String, Object>)Json.deserializeUntyped(response.getBody());
        System.debug('json bodyyy  ==>'+jsonBody);
        Map<String, Object> rates = (Map<String, Object>)jsonBody.get('rates');
        decimal conversionRate = (decimal)rates.get('INR');
         inr = dollar*conversionRate;
        return inr;
    }
}