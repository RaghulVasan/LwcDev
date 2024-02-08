trigger AccountTrigger on Account (after insert,after update) 
{
    List<Account> accountsToValidate = new List<Account>();
    for (Account acc : Trigger.new) {
        if (!acc.Validated__c) {
            accountsToValidate.add(acc);
        }
    }

    if (!accountsToValidate.isEmpty()) {
        System.enqueueJob(new AddressValidationQueueable(accountsToValidate[0].Id));
    }
}
