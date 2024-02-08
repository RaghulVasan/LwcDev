public with sharing class ProcessIntegrationData implements queueable,Database.AllowsCallouts {
    ID logId;
    public ProcessIntegrationData (ID logId) {
        this.logId = logId;
    }
    public void execute(queueablecontext context){
        system.debug(logId);
        Integration_Log__c logRecord= [SELECT Id,Request_Body__c,Response_Body__C FROM 	Integration_Log__c Where ID=:logId];
        HttpRequest request= new HttpRequest();
        Http httpConnection = new Http();
        HttpResponse response= new HttpResponse();
        request.setEndpoint('https://www.toptal.com/developers/postbin/1691559519858-7679351752158?hello=world');
        request.setMethod('POST');
        request.setbody(logRecord.Request_Body__c);
        response = httpConnection.send(request);
        system.debug(response.getBody());
        system.debug(response.getstatusCode());
        logrecord.Response_Body__C = response.getBody();
        if(response.getstatusCode()== 200){
            logRecord.Is_successful__c = true;
        }
        update logRecord;
    }
}