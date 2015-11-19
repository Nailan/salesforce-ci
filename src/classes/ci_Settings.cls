public with sharing class ci_Settings {
	private static ci_Settings instance;
	private Salesforce_CI_Settings__c setting;

	private ci_Settings() {
		List<Salesforce_CI_Settings__c> allSettings = Salesforce_CI_Settings__c.getAll().values();
		if (allSettings == null || allSettings.size() == 0) {
			setting = new Salesforce_CI_Settings__c();
			setting.Name = ci_Dictionary.SETTINGS_NAME;
			setting.Tests_Execution_Time_Minutes__c = ci_Dictionary.SETTINGS_DEFAULT_TEST_EXECUTION_TIME_MINUTES;
			insert setting;
		}
		if (allSettings.size() == 1) {
			setting = allSettings.get(0);
		} 
		if (allSettings.size() > 1 ) {
			throw new ci_WrongSettingsException('Duplicate Salesforce CI setting found');
		}
	}

	public static ci_Settings getInstance() {
		if (instance == null) {
			instance = new ci_Settings();
		}
		return instance;
	}

	public String getParentJobId() {
		return setting.Parent_Job_Id__c;
	}

	public void setParentJobId(String parentJobId) {
		setting.Parent_Job_Id__c = parentJobId;
		update setting;
	}

	public Integer getTestExecutionTimeInMunutes() {
		try {
			return Integer.valueOf(setting.Tests_Execution_Time_Minutes__c);
		} catch (Exception e) {
			throw new ci_WrongSettingsException('Wrong Test Excecution Time settings');
		}
	}

}