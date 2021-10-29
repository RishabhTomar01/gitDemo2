public class CompanyEmployeeController {
    @AuraEnabled
    public static Account checkAndSaveAccount(String name, String phone, String industry){
        Account acc = new Account();
        acc.name = name;
        acc.Phone = phone;
        acc.Industry = industry;
        Insert acc;
        return acc;
    }
    
    @AuraEnabled
    public static Contact checkAndSaveContact(String fName, String lName, String eml, String phn, String id){
        contact con = new contact();
        con.AccountId = id;
        con.FirstName = fName;
        con.LastName = lName;
        con.Phone = phn;
        con.Email = eml;
        System.debug('oye hoye');
        insert con;
        System.debug('inserted');
        return con;
        
    }
    @AuraEnabled
    public static Contact saveContact(Contact Contact) {
        
        Account accRec = [select Id, Name from account where name =: contact.AccountId limit 1];
        if(accRec == null){
            account acc=new account();
            acc.Name = Contact.AccountId;
            Insert acc;
            Contact.AccountId = acc.Id;
            
        }
        else{ 
            contact.AccountId = accRec.Id;
        }
        
        upsert Contact;
        return Contact;
    }
    
}