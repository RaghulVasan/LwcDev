public with sharing class IntegrationHelper
{
    private static final String CLIENT_SECRET = '9685E9026B7FC150E5742D2881F303C863AD05B0F03CDACB1CDF53218A302AE5';
    private static final String CLIENT_ID = '3MVG9wt4IL4O5wvIIo5rckiNPyghw4n6T.m81ve46vjB.jJ_1RyY7PLPVq6YVfv7pimG5JO_0CAFWjgUnNiAC';
    private static final String USER_ID = 'harini.b@4iapps.com';
    private static final String PASSWORD = 'Harini@30rN6hBM5ZegYMWKCpA3vmfby6';
    private static final String BASE_END_POINT = 'https://login.salesforce.com/services/oauth2/token';
    
    public static WrapperClassForAccessToken getAccessToken (){
        Http httpConnection= new Http();
        HttpRequest request= new HttpRequest();
        HttpResponse response = new HttpResponse();
        String ENDPOINT = '?grant_type=password&client_id='+CLIENT_ID+'&client_secret='+CLIENT_SECRET+'&username='+USER_ID+'&password='+PASSWORD;
        //endpoint=EncodingUtil.urlEncode(endpoint,'UTF-8');
         request.setEndpoint(BASE_END_POINT+ENDPOINT);
        request.setMethod('POST');
         response=httpConnection.send(request);
        String accessToken;
        WrapperClassForAccessToken resultParsed =new WrapperClassForAccessToken();

        if (response.getStatusCode()==200)
         {
        resultParsed =(WrapperClassForAccessToken)JSON.deserialize(response.getBody(), IntegrationHelper.WrapperClassForAccessToken.class);
        accessToken=resultParsed.access_token;
         }
        return resultParsed;
    }

    public static void CreateAccount(){
        Http HttpConn= new Http();
        HttpRequest request=new HttpRequest();
        HttpResponse response = new HttpResponse();
        String baseEndPoint=getAccessToken().instance_url;
        String endPoint=baseEndPoint+'/services/data/v58.0/sobjects/Account/';
        String bearer='Bearer '+getAccessToken().access_token;
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        request.setHeader('Authorization', bearer);
        request.setHeader('Content-Type', 'application/json');
        AccountCreation insertNewRecord = new AccountCreation();
        insertNewRecord.Name='DP World';
        String jsonBody =JSON.serialize(insertNewRecord);
        request.setBody(jsonBody);
        response=HttpConn.send(request);

        if (response.getStatusCode()==200 || response.getStatusCode()==201)
        {
            System.debug(response.getBody());
        }
    }
    public class WrapperClassForAccessToken{
        public String access_token{get; set;}
        public String instance_url{get; set;}
        public String id{get; set;}
        public String token_type{get; set;}
        public String issued_at{get; set;}
        public String signature{get; set;}
    }
    public class AccountCreation{
        public String Name{get; set;}
    }
}