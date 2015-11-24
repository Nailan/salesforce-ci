public with sharing class ci_EmailServiceImpl implements ci_EmailService {
	private static ci_EmailServiceImpl instance;

	private ci_EmailServiceImpl() {}

	public static ci_EmailServiceImpl getInstance() {
		if (instance == null) {
			instance = new ci_EmailServiceImpl();
		}
		return instance;
	}

	public void sendReport(ci_TestReport report) {
		String emailBody = Page.ci_EmailTemplate
			.getContent().toString();
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		mail.setHtmlBody(emailBody);
		if (report.getFailedTestsNumber() == 0) {
			mail.setSubject('All Tests Passed');
		} else {
			mail.setSubject('Tests Failed');
		}
		mail.setToAddresses(new String [] {'p.demeshchik@gmail.com'});
		mail.setSenderDisplayName('Salesforce CI');
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
	}

}