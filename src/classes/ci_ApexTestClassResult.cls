/**
* DTO class to encapsulate test results for test class.
*/
public with sharing class ci_ApexTestClassResult {
	public ApexClass clazz;
	public List<ApexTestResult> results;

	public ci_ApexTestClassResult(ApexClass clazz, List<ApexTestResult> results) {
		this.clazz = clazz;
		this.results = results;
	}

	public ApexClass getClazz() {
		return clazz;
	}

	public List<ApexTestResult> getResults() {
		return results;
	}
}