/**
* Tests run results processor. Implemented as a scheuled job to process
* results after tests execution.	
*/
public with sharing class ci_TestsResultsProcessor implements Schedulable {
	private ci_Settings settings;

	public ci_TestsResultsProcessor() {
		settings = ci_Settings.getInstance();
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

	public void processTestResults(){
		//TODO: implement this part
		/*
		* 1. Init TestsReport with parent job id
		* 2. Provide this report to Email service to send the email
		*/
	}
}