public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Account> accountsWithContacts() {
        return [ SELECT Name,
               (SELECT Id, FirstName, LastName FROM Contacts)
               FROM Account LIMIT 10];
    }
}