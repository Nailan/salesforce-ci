public with sharing class ci_ApexClassSelector {
	private static ci_ApexClassSelector instance;

	private ci_ApexClassSelector() {}

	public static ci_ApexClassSelector getInstance() {
		if (instance == null) {
			instance = new ci_ApexClassSelector();
		}
		return instance;
	}

	public List<ApexClass> getAllTestClasses() {
		List<ApexClass> result =  new List<ApexClass>();
		List<List<SObject>> searchList = search.query(ci_ApexClassQueries.ALL_TEST_CLASSES);
		if (searchList != null && searchList.size() > 0) {
			result = searchList.get(0);
		}
		return result;
	}
}