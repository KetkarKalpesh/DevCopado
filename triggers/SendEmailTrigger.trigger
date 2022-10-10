trigger SendEmailTrigger on Account (after insert) {
    senEmailOnAccCreationClass.sendEmail(trigger.new);
}