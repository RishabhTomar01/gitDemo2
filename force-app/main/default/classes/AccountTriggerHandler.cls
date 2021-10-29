public class AccountTriggerHandler {
	/*public static void PutMrOnName(List<Account> accountList){
        for(Account ac: accountList ){
            ac.Name = 'mr.'+ac.Name;
        }
    }
    
    public static void preventDuplicateName(List<Account> accountList){
        
        for(Account ac : accountList){
            List<Account> allAccountList = new List<Account>([Select Id, Name, Phone From Account where Name =: ac.Name]);
            if(allAccountList.size() > 0){
                ac.Name.addError('Name already exist');
            }
        }
    }
    public static void preventDuplicatePhone(List<Account> accountList){
        
        for(Account ac : accountList){
            List<Account> allAccountList = new List<Account>([Select Id, Name, Phone From Account where Phone =: ac.Phone]);
            if(allAccountList.size() > 0){
                ac.Phone.addError('Phone already exist');
            }
        }
    }
    
    public static void createNoOfContact(List<Account> accountList){
        Map<Id, Decimal> accountMap= new Map<Id, Decimal>();
        List<Contact> contactList = new List<contact>();
        for(Account ac : accountList){
           accountMap.put(ac.Id,ac.no_of_Contact__c);
        }

        If(accountMap!= null && accountMap.size() > 0){
            for(Id acct : accountMap.Keyset()){
                for(Integer i=1; i<=accountMap.get(acct); i++){
                    Contact con=new Contact();
                    con.LastName = 'Contact'+i;
                    con.AccountId = acct;
                    contactList.add(con);
                }
            }
        }
        insert contactList;
    } 
    public static void storeOwnerInSalesRep(List<Account> accountList){
        set<Id> ownerId= new set<Id>();
        for(Account acc : accountList){
            ownerId.add(acc.OwnerId);
        }
        
        Map<Id, User> userMap = new Map<Id, User>([Select Id, Name from User Where Id =: ownerId]);
        for(Account act: accountList){
            User usr = userMap.get(act.OwnerId);
            act.Sales_Rep__c = usr.Name;
        }
    }*/
    public static void updateNamePhone(List<Account> accountList, Map<Id, Account> accountMap){
        if(accountList != null){
            for(Account acc : accountList){
                if(acc.phone != accountMap.get(acc.id).phone){
                    acc.Name = acc.Name + acc.phone; 
                }
            }
        }
    }
}