public class AccountComponentController {
    @AuraEnabled
    public static List<Account> accountList(){
       List<Account> acc = new List<Account>([Select Id, Name, Phone, Industry from Account]);
        return acc;
    }
}