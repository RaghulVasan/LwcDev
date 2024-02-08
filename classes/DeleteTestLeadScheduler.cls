public with sharing class DeleteTestLeadScheduler implements Schedulable {
    public void execute(schedulableContext context) {
        List<Lead> leadToDelete = [SELECT Id, Name FROM Lead WHERE Name LIKE '%TEST%' limit 300 ];

        if (!leadToDelete.isEmpty()){
            delete leadToDelete;
        }

        string emailSubject= 'Lead Delete';
        string emailbody = 'Hello';
        List <User> adminUser= [SELECT Id FROM User Where Profile.Name='System Administartor'];
        List<String> adminEmails= new List<string>();
        for (user admin: adminUser){
            adminEmails.add(admin.email);
        }
        Messaging.SingleEmailMessage email= new Messaging.SingleEmailMessage();
        email.setToAddresses(adminEmails);
        email.setSubject(emailSubject);
        email.setPlainTextBody(emailbody);
        Messaging.sendEmail(new List<Messaging.email>{email});
        system.debug('Deleted'+ leadToDelete.size());
        // else{
        //     system.debug('No leads found');
        // }
    }
    
}