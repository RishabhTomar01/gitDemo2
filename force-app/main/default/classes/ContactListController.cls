public class ContactListController {
	@AuraEnabled
    public static List<Contact> getContactList(String accountId){
        List<Contact> contactList = [select Id, Firstname,LastName, Phone, Email from contact where AccountId =: accountId];
        return contactList;
    }
    
    @AuraEnabled
    public static String createContact(Contact contObj){   
        
        System.debug('contact ==> '+contObj.FirstName);
        insert contObj;
        return contObj.Id;
    
    }
}