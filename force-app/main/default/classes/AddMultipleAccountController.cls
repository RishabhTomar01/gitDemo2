public class AddMultipleAccountController {
    Account account= new Account();
    public List<Account> accountList{get; set;}
    
   public AddMultipleAccountController(){
        accountList = new list<Account>();
        accountList.add(account);
    }
    public void addAccount(){
        Account acc= new Account();
        accountList.add(acc);
    }
    public pageReference saveAccount(){
        for(Integer i=0; i< accountList.size(); i++){
            insert accountList;
        }
        return null;
    }
}