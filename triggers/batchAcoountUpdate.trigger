trigger batchAcoountUpdate on Account (after insert) {
List<Account> accountsToUpdate = new List<Account>();
    for(Account accountToUpdate: trigger.new){
        accountToUpdate.description = 'Test';
        accountsToUpdate.add(accountToUpdate);
    }
    update accountsToUpdate;

}