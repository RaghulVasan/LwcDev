public with sharing class BatchAccountUpdate implements Database.Batchable<sObject>{
    public batchAccountUpdate() {
    }
    public Database.QueryLocator start(Database.BatchableContext context) {
      String accountsToUpdate = 'SELECT Id, Updated__c from Account WHERE Updated__c=false';
      return Database.getQueryLocator(accountsToUpdate);
    }
    public void execute(Database.BatchableContext context, List<sObject> accountsToUpdate) {
        for(Account accountToUpdate : (List<Account>)accountsToUpdate){
            accountToUpdate.Updated__c = true;
        }
        update accountsToUpdate;
    }
    public void finish(Database.BatchableContext context){
    }
}