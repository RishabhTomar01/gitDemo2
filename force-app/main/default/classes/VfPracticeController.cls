global class VfPracticeController {
    public String contactName{get; set;}
    public static Contact contact{get; set;}
    @RemoteAction
    global static contact showContact(String contactName){
        contact = [select 
                   		Id, LastName, Phone, email 
                   	from 
                   		contact
                   	where 
                   		name =: contactName];
        return contact;
    }
}