Global class soapAccountManipulator {
    webService static Id createAccount(String Name, String Phone){
        Account acc = new Account();
        acc.Name = Name;
        acc.Phone = Phone;
        
        Insert acc;
        return acc.Id;
    }
   
    
    webservice static void deleteAccount(String Name, String Phone, String Industry){
        List<Account> accountList = new List<Account>([Select 
                                                       	Id, Name, Industry
                                                      from 
                                                       	Account
                                                      where 
                                                      	Name =: Name AND Phone =:Phone 
                                                       AND Industry=: Industry]);
        delete accountList;
    }

    webservice static Account getAccountById(String Id){
        Account acc = [Select Id,Name, industry from Account where Id =: Id];
        return acc;
    }
}