@RestResource(urlMapping='/accounts/*')
global with sharing class accountRest {
    @HTTPGet
    global static Account getAccountById(){
        RestRequest request = restContext.request;
        String accountId = request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
		Account result = [Select Id, Name, Phone from account where Id = :accountId Limit 1];
        return result;
    }
    @HttpDelete
    global static account deleteAccount(){
        RestRequest request = restContext.request;
        String accountId = request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
        Account result = [Select Id,Name,Phone from account where id = :accountId Limit 1];
        delete result;
        return null;
    }
    @HttpPost
    global static Id createAccount(String name, String phone){
        Account acc = new Account();
        acc.Name = name;
        acc.Phone = phone;
        
        insert acc;
        return acc.Id;
    }
    @HttpPut
    global static Id upsertAccount(String Id,  String name, String phone){
        Account acc = new Account();
        acc.Id = Id;
        acc.Name = name;
        acc.Phone = phone;
        
        upsert acc;
        return acc.Id;
    }
}