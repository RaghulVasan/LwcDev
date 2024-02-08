trigger LeadNameChangeTrigger on Lead (after update) {
    List<Lead> newLeads = new List<Lead>();
    List<Lead> oldLeads = new List<Lead>();
    
    for (Lead newLead : Trigger.new) {
        Lead oldLead = Trigger.oldMap.get(newLead.Id);
        
        if (newLead.Name != oldLead.Name) {
            newLeads.add(newLead);
            oldLeads.add(oldLead);
        }
    }
    
    if (!newLeads.isEmpty()) {
        LeadChangeQueueable queueable = new LeadChangeQueueable(newLeads[0], oldLeads[0]);
        System.enqueueJob(queueable);
    }
}
