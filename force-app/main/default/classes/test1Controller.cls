public class test1Controller{
    List<Account> acct = [select name, phone, industry from account where name = 'kapil sharma'];
    
    public List<account> getAccount(){
        return acct;
    }
}