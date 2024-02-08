public class UpdateUniqueAccountContactNumbers {
        public static void updateNumbers() {
            List<Account> accountsToUpdate = new List<Account>();
            List<Contact> contactsToUpdate = new List<Contact>();
            Set<Integer> generatedNumbers = new Set<Integer>();
    
            // Retrieve all accounts and contacts
            List<Account> allAccounts = [SELECT Id FROM Account];
            List<Contact> allContacts = [SELECT Id, AccountId FROM Contact];
    
            // Generate and update unique random numbers for accounts
            for (Account acc : allAccounts) {
                Integer randomNumber;
                do {
                    randomNumber = generateRandomNumber();
                } while (generatedNumbers.contains(randomNumber));
                generatedNumbers.add(randomNumber);
                acc.CustomRandomNumber__c = randomNumber;
                accountsToUpdate.add(acc);
            }
    
            // Generate and update unique random numbers for contacts
            for (Contact con : allContacts) {
                Integer randomNumber;
                do {
                    randomNumber = generateRandomNumber();
                } while (generatedNumbers.contains(randomNumber));
                generatedNumbers.add(randomNumber);
                con.CustomRandomNumber__c = randomNumber;
                contactsToUpdate.add(con);
            }
    
            // Update records
            update accountsToUpdate;
            update contactsToUpdate;
        }
    
        public static Integer generateRandomNumber() {
            return Math.round(Math.random() * 100);
        }
    }
    