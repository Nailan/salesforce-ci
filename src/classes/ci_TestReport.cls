/**
* DTO class represents tests run results report.
*/
public with sharing class ci_TestReport {
	private List<ci_ApexTestClassResult> testClassesResults;
	private Integer failedTestsNumber = 0;
	private Integer passedTestsNumber = 0;
	private Integer totalTestsNumber = 0;

	public ci_TestReport(List<ci_ApexTestClassResult> testResults) {
		this.testClassesResults = testResults;
		initStatistics(testResults);
	}

	private void initStatistics(List<ci_ApexTestClassResult> testResults) {
		for (ci_ApexTestClassResult classResult: testResults) {
			for (ApexTestResult testResult: classResult.getResults()) {
				if (ci_Dictionary.TEST_STATUS_COMPILATION_FAILED.equalsIgnoreCase(testResult.Outcome)
					|| ci_Dictionary.TEST_STATUS_FAILED.equalsIgnoreCase(testResult.Outcome)) {
					failedTestsNumber ++;
				} else {
					passedTestsNumber ++;
				}
				totalTestsNumber ++;
			}
		}
	}

	public Integer getFailedTestsNumber() {
		return failedTestsNumber;
	}

	public Integer getPassedTestsNumber() {
		return passedTestsNumber;
	}

	public Integer getTotalTestsNumber() {
		return totalTestsNumber;
	}

	public List<ci_ApexTestClassResult> getTestClassesResults() {
		return testClassesResults;
	}
}