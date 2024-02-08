public class LeadChangeQueueable implements Queueable {
    private Lead newLead;
    private Lead oldLead;

    public LeadChangeQueueable(Lead newLead, Lead oldLead) {
        this.newLead = newLead;
        this.oldLead = oldLead;
    }

    public void execute(QueueableContext context) {
        if (newLead.Name != oldLead.Name) {
                         LeadChangeLog__c Log = new LeadChangeLog__c();
                         Log.OldLeadName__c = oldLead.Name;
                         Log.NewLeadName__c = newLead.Name;
                         Log.Modified_By__c = UserInfo.getUserId();
                         Log.Modified_Date_Time__c = DateTime.now();
                         insert Log;
        }
    }
}

   