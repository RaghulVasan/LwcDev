public with sharing class getTenContacts {
    @AuraEnabled
    public static List<Contact> getContactList(){
        List<Contact> tenContact = [SELECT Phone , Name
                                   w FROM Contact
                                    LIMIT 10];
        return tenContact;                          
    }
}