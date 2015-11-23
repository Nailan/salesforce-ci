public with sharing class ci_ApexTestResultSelector {
	private static ci_ApexTestResultSelector instance;

	private ci_ApexTestResultSelector() {}

	public static ci_ApexTestResultSelector getInstance() {
		if (instance == null) {
			instance = new ci_ApexTestResultSelector();
		}
		return instance;
	}

	public List<ApexTestResult> getTestResultsByParentJobId(String parentJobId) {
		List<SObject> queryResult = Database.query(ci_ApexTestResultQueries.SELECT_BY_PARENT_JOB_ID);
		List<ApexTestResult> results = new List<ApexTestResult>();
		for(SObject sobj: queryResult) {
			results.add((ApexTestResult) sobj);
		}
		return results;
	}
}