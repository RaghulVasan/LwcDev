public with sharing class EmployeeMasterPage
{
    @auraEnab@AuraEnabled
}
    public Static List <Contact> returnTenContacts()
    {
       List <Contact> tenContacts = [SELECT Name, Email, Phone FROM Contact LIMIT 10];
       return  tenContacts;
    }