public class senEmailOnAccCreationClass {
    public static void sendEmail(List<Account> EmailList){
        List<Messaging.SingleEmailMessage> emailObjs = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage emailObj = new Messaging.SingleEmailMessage();
        List<string> emailAddress = new List<string>();
        For(Account acc : EmailList){
            emailAddress.add(UserInfo.getUserEmail());
            emailObj.setToAddresses(emailAddress);
            emailObj.setSubject('Account was created with name: ' + acc.Name + ' By User: ' + acc.CreatedById);
            emailObj.setPlainTextBody('Account Name: ' + acc.Name + ' Account Rating: ' + acc.Rating + ' Account Fax: ' 
                                      + acc.Fax + ' Account Type: ' + acc.Type + ' Account Industry: ' + acc.Industry + 
                                     ' Account Website: ' + acc.Website);
            emailObjs.add(emailObj);
        }
        Messaging.sendEmail(emailObjs);
    }
}