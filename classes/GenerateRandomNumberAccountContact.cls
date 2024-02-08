public with sharing class GenerateRandomNumberAccountContact implements Database.Batchable<sObject> {
    public GenerateRandomNumberAccountContact() {

    }
    public static Integer generateRandomNumber() {

        Integer randomNumber = (Integer)Math.floor(Math.random() * 10001);

        return randomNumber;

    }

   

    public Database.QueryLocator start(Database.BatchableContext BC) {

        String query = 'SELECT Id FROM Account WHERE Custom_Random_Number__c = null LIMIT 1';

        return Database.getQueryLocator(query);

    }

   

    public void execute(Database.BatchableContext BC, List<Account> scope) {

        if (scope.isEmpty()) {

           return;

        }

        Integer randomNumber = generateRandomNumber();

        List<Account> accountsToUpdate = new List<Account>();

        for (Account acc : scope) {

            acc.CustomRandomNumber__c = randomNumber;

            accountsToUpdate.add(acc);

        }

        insert accountsToUpdate;

        List<Contact> contactsToUpdate = new List<Contact>();

        for (Account acc : scope) {

            Contact con = new Contact();

            con.AccountId = acc.Id;

            con.CustomRandomNumber__c = randomNumber;

            contactsToUpdate.add(con);

        }

        insert contactsToUpdate;

        System.debug('Generated and stored random number: ' + randomNumber);

    }

 

    public void finish(Database.BatchableContext BC) {

 

    }
}