/**
* Service interface to work with TestReports.
*/
public interface ci_TestReportService {
	/**
	* Generates instance of @ci_TestReport.cls from test execution results.
	*
	* @param parentJobId id of parent job for test execution.
	* @return instance of @ci_TestReport.cls.
	*/
	ci_TestReport generateTestReportFromTestRun(String parentJobId);
}