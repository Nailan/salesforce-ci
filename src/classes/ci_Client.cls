/**
* Main class of CI application. 
*/
public with sharing class ci_Client {
	private ci_ApexClassSelector classSelector;
	private ci_ApexTestQueueItemService queueItemService;
	private ci_Settings settings;

	public ci_Client() {
		classSelector = ci_ApexClassSelector.getInstance();
		queueItemService = ci_ApexTestQueueItemServiceImpl.getInstance();
		settings = ci_Settings.getInstance();
	}

	public void runAllTests() {
		List<ApexClass> allTestClasses = classSelector.getAllTestClasses();
		String parentJobId = queueItemService.createApexTestQueueItemsFromTestClasses(allTestClasses);
		settings.setParentJobId(parentJobId);
		new ci_TestsRunResultsProcessor().scheduleTestsResultsProcessing();
	}
}