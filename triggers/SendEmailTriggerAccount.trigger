trigger SendEmailTriggerAccount on Account (After insert) {
    if(trigger.isAfter && trigger.isInsert){
        List<Messaging.SingleEmailMessage> emailObjs = new List<Messaging.SingleEmailMessage>();
        For(Account acc : trigger.new){
            Messaging.SingleEmailMessage emailObj = new Messaging.SingleEmailMessage();
            List<string> emailAddress = new List<string>();
            emailAddress.add(Userinfo.getUserEmail());
            emailObj.setToAddresses(emailAddress);
            emailObj.setSubject('Hi, New Account is Created! ' + acc.Name);
            emailObj.setPlainTextBody('Name: ' + acc.Name + ' Website: ' + acc.Website);
            emailObjs.add(emailObj);
        }
        Messaging.sendEmail(emailObjs);
    }
}