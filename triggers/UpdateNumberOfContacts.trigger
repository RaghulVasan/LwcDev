trigger UpdateNumberOfContacts on Contact (after insert, after update, after delete) 
    {
    Set<Id> accountIds = new Set<Id>();
    if (Trigger.isInsert || Trigger.isUpdate) 
    {
        for (Contact con : Trigger.new) 
        {
            if (con.AccountId != null) 
            {
                accountIds.add(con.AccountId);

            }
            if (Trigger.isUpdate) 
            {
                if (Trigger.oldMap.get(con.Id).AccountId != con.AccountId) 
                {
                    accountIds.add(Trigger.oldMap.get(con.Id).AccountId);

                }
            }
        }

    } 
    else if (Trigger.isDelete) 
    {

        for (Contact con : Trigger.old) 
        {
            if (con.AccountId != null) 
            {
                accountIds.add(con.AccountId);
            }
        }
    }

    List<Account> accountsToUpdate = new List<Account>();
    for (Id accountId : accountIds) {
        Integer contactCount = [SELECT COUNT() FROM Contact WHERE AccountId = :accountId];
        Account acc = new Account(Id = accountId,NumberOfEmployees = contactCount);
        accountsToUpdate.add(acc);
    }
    if (!accountsToUpdate.isEmpty()) 
    {
        update accountsToUpdate;
    }
}