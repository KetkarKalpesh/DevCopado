public with sharing class FetchContactClass {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(String contactName) {
        string keyString = '%' + contactName + '%';
        return [SELECT ID, LastName, Email FROM Contact WHERE LastName LIKE: keyString LIMIT:8];
    }
}
