public with sharing class ValidateAddressOnAccount implements Queueable, Database.AllowsCallouts
 {
     Id accountId;
     public ValidateAddressOnAccount(Id accountId)
    {
            this.accountId=accountId;
    }
    public void execute (QueueableContext context)
    {
            Account currentAccount = [Select BillingStreet,BillingCity,BillingPostalCode,BillingState,BillingCountry,By_Pass_Address_Validation__c

                                     From Account

                                     Where Id=:accountId];

 

    Http httpConnection = new Http();
    HttpRequest request = new HttpRequest();
    HttpResponse response = new HttpResponse();

                                    request.setEndpoint('https://maps.googleapis.com/maps/api/place/findplacefromtext/json?key=AIzaSyC4SOeANsk58rU8e5iVcp4CGx5RvolFLlY&input='+currentAccount.BillingStreet+currentAccount.BillingState+'&inputtype=textquery&fields=formatted_address');

                                    request.setHeader('Accept','application/JSON');

                                    request.setHeader('Content-Length','0');

                                    request.setMethod('POST');

                                    //request.setBody();

                                    response = httpConnection.send(request);

            if (response.getStatusCode()==200)

            {

                String body = response.getBody();

                GoogleMapsWrapperData resultsParsed = (GoogleMapsWrapperData) Json.deserialize(body,ValidateAddressOnAccount.GoogleMapsWrapperData.class);

                currentAccount.BillingStreet = resultsParsed.candidates.get(0).formatted_address;

               

            }

            currentAccount.By_Pass_Address_Validation__c=true;

            Update currentAccount;

 

    }

 

    public class GoogleMapsWrapperData{

        public List<FormattedAddress> candidates{get;set;}

        public String status{get;set;}

    }

 

    public class FormattedAddress{

        public string formatted_address{get;set;}

    }

}

[16:00] Sivalingaraja S @ 4i Apps

trigger AccountTrigger on Account (after insert, after update)

{

        for (Account newAccount : Trigger.new)

        {

            if (newAccount.By_Pass_Address_Validation__c==false)

            {

                System.enqueueJob(new ValidateAddressOnAccount(newAccount.Id));

            }

        }

 

       

}