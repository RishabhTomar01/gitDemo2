public class LeadTriggerHandler {
    /*public static void checkEmailofContact(List<Lead> leadList){
        List<Contact> contactList= ([select Id, LastName, Email from contact]);
        
        for(Lead leadObject : leadList){
            for(Contact ct : contactList){
                if(leadObject.Email == ct.Email){
                    leadObject.Email.addError('Email is already exist in contact');
                }                
            }
        }
    }*/
    
    //doing same thing using map
    public static void checkEmailofContact(List<Lead> leadList){
        Map<String, contact> contactMap = new Map<String,Contact>();
        List<Contact> contactList= ([select Id, LastName, Email from contact]);
        for(contact ct : contactList){
            contactMap.put(ct.Email, ct);
        }
        
        for(Lead leadLoop : leadList){
            if(leadLoop != null){
                if(contactMap.containsKey(leadLoop.Email)){
                    leadLoop.Email.addError('Email is exist in contacts');
                }
            }
        }
    }
}