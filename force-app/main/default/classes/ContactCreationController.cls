public class ContactCreationController {
    @AuraEnabled
    public static Contact createContact(String fName, String lName, String eml, String phn){
        contact con = new contact();
        con.FirstName = fName;
        con.LastName = lName;
        con.Phone = phn;
        con.Email = eml;
        System.debug('before insert');
        insert con;
        System.debug('connnnn==>'+con);
        return con;
        
    }
    
}