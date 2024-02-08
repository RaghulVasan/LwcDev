trigger LeadTrigger on Lead (after insert) {
    List<Integration_Log__c> integrationLogs = new List<Integration_Log__c>();
    
    for (Lead newLead : Trigger.new) {
        // Perform your integration logic here
        // ...
        
        // Create an Integration Log record
        Integration_Log__c log = new Integration_Log__c();
        log.Related_Lead__c = newLead.Id;
        log.Request_Body__c = newLead.FirstName+ newLead.lastname;
        integrationLogs.add(log);
    }
    
    insert integrationLogs;
}
