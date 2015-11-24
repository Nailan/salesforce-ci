public with sharing class ci_EmailTemplateController {
	private ci_TestReport report;
	private ci_Settings settings;
	private ci_ApexTestClassResultService resultsService;

	public ci_EmailTemplateController() {
		this.settings = ci_Settings.getInstance();
		this.resultsService = ci_ApexTestClassResultServiceImpl.getInstance();
		initReport();
	}

	private void initReport() {
		this.report = new ci_TestReport(resultsService
			.retrieveApexTestClassResultsFromTestRun(settings.getParentJobId()));
	}

	public ci_TestReport getReport() {
		return this.report;
	}
}