public with sharing class OpportunityHelper extends UtilityHelper
{
    public static void createAccount() 
    {
        Account newAccount = new Account();
        newAccount.Name = 'Test ' + generateRandomString();
        insert newAccount;
        system.debug('Created Account ---> '+ newAccount);
    }
    
}