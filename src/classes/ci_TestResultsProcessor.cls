/**
* Tests run results processor. Implemented as a scheuled job to process
* results after tests execution.	
*/
public with sharing class ci_TestResultsProcessor implements Schedulable {
	private ci_Settings settings;
	private ci_EmailService emailService;
	private ci_TestReportService reportService;

	public ci_TestResultsProcessor() {
		settings = ci_Settings.getInstance();
		emailService = ci_EmailServiceImpl.getInstance();
		reportService = ci_TestReportServiceImpl.getInstance();
	}

	public void scheduleTestsResultsProcessing() {
		String jobName = 'CI test running ' + String.valueOf(Math.rint(Math.random() * 1000));
		Datetime sysTime = system.now();
		String cronExp = '' + sysTime.second() + ' ' + sysTime.minute() 
			+ settings.getTestExecutionTimeInMunutes()
			+ ' ' + sysTime.hour() + ' ' + sysTime.day() + ' ' + sysTime.month() + ' ? ' + sysTime.year();

		system.schedule(jobName, cronExp, new ci_TestsResultsProcessor());
	}

	public void execute(SchedulableContext context) {
		processTestResults();
		System.abortJob(context.getTriggerID());
	}

	public void processTestResults() {
		ci_TestReport report = reportService.generateTestReportFromTestRun(settings.getParentJobId());
		emailService.sendReport(report);
	}
}