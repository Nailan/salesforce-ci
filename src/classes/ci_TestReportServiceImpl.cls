public with sharing class ci_TestReportServiceImpl implements ci_TestReportService {
	private static ci_TestReportServiceImpl instance;

	private ci_TestReportServiceImpl() {}

	public static ci_TestReportServiceImpl getInstance() {
		if (instance == null) {
			instance = new ci_TestReportServiceImpl();
		}
		return instance;
	}

	public ci_TestReport generateTestReportFromTestRun(String parentJobId) {
		//TODO: implement
		return null;
	}
}