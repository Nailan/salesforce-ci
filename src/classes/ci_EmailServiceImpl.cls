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
		String emailTemplate = Page.ci_EmailTemplate
			.getContent().toString();
		String emailBody = emailTemplate
			.replaceAll('@totalTestsNumber@', String.valueOf(report.getTotalTestsNumber()))
			.replaceAll('@failedTestsNumber@',  String.valueOf(report.getFailedTestsNumber()))
			.replaceAll('@passedTestsNumber@', String.valueOf(report.getPassedTestsNumber()));
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		mail.setHtmlBody(emailBody);
		mail.setSubject('Tests');
		mail.setToAddresses(new String [] {'p.demeshchik@gmail.com'});
		mail.setSenderDisplayName('Salesforce CI');
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
	}

}