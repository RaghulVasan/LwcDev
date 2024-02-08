public with sharing class AccountController {
    @AuraEnabled(cacheable=true )
    public static List<Contact> getContactsByAccountName(String accountName) {
        return [SELECT Id, Name FROM Contact WHERE Account.Name = :accountName];
    }
}