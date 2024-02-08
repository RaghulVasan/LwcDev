trigger IntegrationLogTrigger on 	Integration_Log__c (after insert) {
    for(Integration_Log__c log:trigger.new){
        system.enqueueJob(new ProcessIntegrationData(logId));
    }
}