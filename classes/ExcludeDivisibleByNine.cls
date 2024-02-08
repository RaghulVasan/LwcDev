public with sharing class ExcludeDivisibleByNine {
    
    public static void notDivisibleByNine() {
        for (Integer i = 1; i <= 100; i++) {
            if (Math.mod(i, 9) != 0) {
                System.debug(i);
            }
        }
    }
    
    public static Integer sumOfTwoNumbers(Integer number1, Integer number2)
     {
        Integer sum = number1 + number2;
        return sum;
    }
    
    public static void generateNumberPyramid() {
        Integer rows = 5;
        Integer num = 1;

        for (Integer i = 1; i <= rows; i++) {
            for (Integer k = 1; k <= rows - i; k++) {
                System.debug(' ');
            }
            
            for (Integer j = 1; j <= i; j++) {
                System.debug(num + ' ');
                num++;
            }

            System.debug('\n');
        }
    }

    public static void reverseString() {
        String inputName = 'Raghul';
        String reverseName = inputName.reverse();
        System.debug('Reversed Name = ' + reverseName);
    }

    public static Lead createLeadRecord(String lastName, String email) {
        if (lastName.contains('test')) {
            return null;
        }

        Lead leadRecordToInsert = new Lead(LastName = lastName, Email = email);
        insert leadRecordToInsert;
        return leadRecordToInsert;
    }

    public static Lead birthday(String lastName, String email,String company, Date dateOfBirth) {
        if (dateOfBirth == null) {
            Date myDate = Date.newInstance(1990, 01, 01);
            dateOfBirth = myDate;
        }

        Lead leadRecordToInsert = new Lead(LastName = lastName, Email = email, company = company, Date_of_Birth__c = dateOfBirth);
        insert leadRecordToInsert;
        return leadRecordToInsert;
    }

    public static void insertContactWheneverAccountIsCreated(String lastName)
    {
        // Create a new Account record.
        Account newAccountRecord = new Account();
        newAccountRecord.Name = lastName;
        // Insert the Account record into the database.
        insert newAccountRecord;

        // Create a new Contact record associated with the Account.
        Contact newContactRecordAssociatedWithAccount = new Contact();
        // Set the AccountId and LastName attributes of the Contact.
        newContactRecordAssociatedWithAccount.AccountId = newAccountRecord.Id;
        newContactRecordAssociatedWithAccount.LastName = lastName;
        // Insert the Contact record into the database.
        insert newContactRecordAssociatedWithAccount;
    }

    // Method to create multiple Lead records in bulk and insert them into the database.
    public static void createLeadsInBulk(Integer numbers)
    {
        // Create a list to store multiple Lead records.
        List<Lead> listOfLeadThatCreatedInBulk = new List<Lead>();
       
        // Loop to create the specified number of Lead records.
        for (Integer i = 1; i <= numbers; i++)
        {
            // Create a new Lead record.
            Lead newLeadRecord = new Lead();
            // Set the FirstName,LastName,Email and Company attributes of the Lead.
            newLeadRecord.FirstName='Test';
            newLeadRecord.LastName = 'Test' + i;
            newLeadRecord.Company = '4iapps';
            newLeadRecord.Email='test.test'+i+'@4iapps.com';
            // Add the Lead record to the list.
            listOfLeadThatCreatedInBulk.add(newLeadRecord);
        }
        // Output the list of Lead records to the debug log.
        system.debug(listOfLeadThatCreatedInBulk);
        // Insert all the Lead records in the list into the database.
        insert listOfLeadThatCreatedInBulk;
    }
}
