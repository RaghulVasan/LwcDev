Global  with sharing class SfWebService {
    webService static List<Account> getAccount(String AccountName)
     {
         List<Account> matchingAccounts= [SELECT Id, Name FROM Account WHERE Name =: AccountName ];
         return matchingAccounts;
    }
}P