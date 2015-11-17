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
		//TODO: implement
		return null;
	}
}