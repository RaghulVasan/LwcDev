public with sharing class DisplayEmployees {
    @AuraEnabled
    public static contact createContact(String firstName, String lastName, String email, String phone) {
         contact newContact=new Contact();
         newContact.firstname=firstName;
         newcontact.lastName=lastName;
         newcontact.email=email;
         newcontact.phone=phone;
         insert newContact;
         return newContact;
    }
}