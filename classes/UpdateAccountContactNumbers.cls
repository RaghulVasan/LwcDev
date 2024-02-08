/****
    Class Name         : UpdateAccountContactNumbers
    Name               : Raghul Prasath.S
    Decrption          : Update All accounts to be updated with unique random number. Contact should also have the same number as their accounts
    Created Date       : 07/08/2023
    Last Modified Date : 08/08/2023
    Summary            : Random Numbers in Account & Contact.
****/

public class UpdateAccountContactNumbers {

    public static void updateNumbers() {
        List<Account> accountsToUpdate = new List<Account>();
        List<Contact> contactsToUpdate = new List<Contact>();

        // retriev all existing accounts and contacts from the database and storing them in allAccounts and allContacts lists.
        List<Account> allAccounts = [SELECT Id FROM Account];
        List<Contact> allContacts = [SELECT Id, AccountId FROM Contact];

        // Generate and update random numbers for accounts and contacts
        for (Account acc : allAccounts) {
            acc.CustomRandomNumber__c = generateRandomNumber();
            accountsToUpdate.add(acc);
        }

        for (Contact con : allContacts) {
            for (Account acc : allAccounts) {
                if (con.AccountId == acc.Id) {
                    con.CustomRandomNumber__c = acc.CustomRandomNumber__c;
                    contactsToUpdate.add(con);
                    break; // Once a matching account is found, exit the loop
                }
            }
        }

        //DML operation to Update records to Accounts and Contacts
        update accountsToUpdate;
        update contactsToUpdate;
    }
    // Create a Method named generateRandomNumber with This method generates and returns a random number between 0 and 100 using some inbuild math calculations. 
    public static Integer generateRandomNumber() {
        return Math.round(Math.random() * 100);
    }
}
