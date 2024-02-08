public virtual  class UtilityHelper 
{

    public static Integer generateRandomString() 
    {
        Integer randomNumber = Integer.valueof((Math.random() * 1000));
        System.debug('randomNumber is '+ randomNumber);
        return randomNumber;
    }  
public static Boolean validateLoggedInUserHasCreateAccessToObject(String objectName)
   {
            // Get the SObject type based on the object name
            Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectName);
            // Check if the object supports the create operation
            if (objectType != null && objectType.getDescribe().isCreateable()) 
            {
                // Check if the current user has create access on the object
                system.debug(objectType.getDescribe().isCreateable());
                return objectType.getDescribe().isCreateable();
                
            }
        // Return false if the object is not found or doesn't support the create operation
        return false;
   } 
}