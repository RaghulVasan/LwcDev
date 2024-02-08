public with sharing class ITCompanyUtility {
    public static String giveMeTheDayToday() {
        return DateTime.now().format('E');
    }
}