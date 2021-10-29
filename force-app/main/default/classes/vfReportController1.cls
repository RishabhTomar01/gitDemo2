public class vfReportController1 {
    
    private final User user;
    //currently logged in user name
    public String userName = UserInfo.getName(); 
    public vfReportController1() {
        //querying for currently looged in user
        user = [SELECT Name FROM User
                WHERE Id = :UserInfo.getUserId()];
        System.debug('user Information====>'+user);
    }
    //returning the id and name of the user to vf page
    public User getUser(){
        return user;
    }
    
    public PageReference validateAndRedirect(){
        
        //showing the name of currrently logged in user in 2nd filter
        String url = '/00O5g00000DN3Xn?pv1='+userName;
        PageReference retURL = new PageReference(url);
        retURL.setRedirect(true);
        return retURL;
        //return new PageReference('');
    }
    
}