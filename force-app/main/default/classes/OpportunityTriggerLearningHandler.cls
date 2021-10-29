public class OpportunityTriggerLearningHandler {
    public static void updateAccountHot(List<Opportunity> opportunityList){
        set<Id> accountId = new set<Id>(); 
        for(Opportunity opp : opportunityList){
            if(opp.StageName == 'closed one'){
                accountId.add(opp.accountId);
            }
        }
        List<Account> accountListToUPdate = new List<Account>([select Id, Name, Rating from Account where Id =: accountId]);
        List<Account> accountList = new List<Account>();
        for(Account acc : accountListToUPdate){
            acc.Rating = 'Hot';
            accountList.add(acc);
        }
        update accountList;
    }

}