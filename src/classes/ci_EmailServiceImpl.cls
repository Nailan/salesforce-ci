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
		//TODO: implement this method
	}

}