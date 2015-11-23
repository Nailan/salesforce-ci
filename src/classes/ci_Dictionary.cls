public with sharing class ci_Dictionary {
	public static final String TEST_STATUS_FAILED = 'Fail';
	public static final String TEST_STATUS_PASSED = 'Pass';
	public static final String TEST_STATUS_COMPILATION_FAILED = 'CompileFail';

	public static final String SETTINGS_NAME = 'Salesforce CI settings';
	public static final Integer SETTINGS_DEFAULT_TEST_EXECUTION_TIME_MINUTES = 1;

	public static final String SCHEDULED_JOB_NAME = 'CI test running '; 

	private ci_Dictionary() {}
}