public class ContactTriggerHandler {
   /* public static void changeContactParent(list<Contact> contactList){
        List<Account> AccountList = [Select id, Name from Account];
        for(Contact con : contactList){
            for (Account a: AccountList){
                if(con.lastName == a.Name){
                    con.AccountId  = a.Id;
                }    
            }
        }
    }*/
    //doing it using map
    public static void changeContactParent(list<Contact> contactList){
        List<Account> accountList = [Select Id, Name from Account];
        Map<String, Account> accountMap = new Map<String, Account>();
        for(Account ac : accountList){
            accountMap.put(ac.Name, ac);
        }
        
        for(contact ct : contactList){
            if(ct != null){
                if(accountMap.containsKey(ct.LastName)){
                    ct.AccountId = accountMap.get(ct.LastName).id ;
                }
            }
        }
    }
}