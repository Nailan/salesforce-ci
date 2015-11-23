/**
* Tests run results processor. Implemented as a scheuled job to process
* results after tests execution.	
*/
public with sharing class ci_TestResultsProcessor implements Schedulable {
	private ci_Settings settings;
	private ci_ApexTestClassResultService testClassService;
	private ci_EmailService emailService;

	public ci_TestResultsProcessor() {
		settings = ci_Settings.getInstance();
		emailService = ci_EmailServiceImpl.getInstance();
		testClassService = ci_ApexTestClassResultServiceImpl.getInstance();
	}

	public void scheduleTestsResultsProcessing() {
		String jobName = ci_Dictionary.SCHEDULED_JOB_NAME + String.valueOf(Math.rint(Math.random() * 1000));
		Datetime sysTime = system.now();
		String cronExp = '' + sysTime.second() + ' ' + (sysTime.minute() 
			+ settings.getTestExecutionTimeInMunutes())
			+ ' ' + sysTime.hour() + ' ' + sysTime.day() + ' ' + sysTime.month() + ' ? ' + sysTime.year();

		system.schedule(jobName, cronExp, new ci_TestResultsProcessor());
	}

	public void execute(SchedulableContext context) {
		try {
			processTestResults();
		} catch(Exception e) {
			throw e;
		} finally {
			System.abortJob(context.getTriggerID());
		}
	}

	public void processTestResults() {
		List<ci_ApexTestClassResult> results = testClassService
			.retrieveApexTestClassResultsFromTestRun(settings.getParentJobId());
		ci_TestReport report = new ci_TestReport(results);
		emailService.sendReport(report);
	}
}