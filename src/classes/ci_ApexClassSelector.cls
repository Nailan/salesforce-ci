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
		List<List<SObject>> searchResult = search.query(ci_ApexClassQueries.ALL_TEST_CLASSES);
		return extractApexClassesFromSearchResult(searchResult);
	}

	public List<ApexClass> getApexClassesById(List<String> ids) {
		return Database.query(ci_ApexClassQueries.SELECT_CLASSES_BY_ID);
	}

	private List<ApexClass> extractApexClassesFromSearchResult(List<List<SObject>> searchResult) {
		List<ApexClass> result =  new List<ApexClass>();
		if (searchResult == null || searchResult.size() == 0) {
			return result;
		}
		for (SObject sobj: searchResult.get(0)) {
			result.add((ApexClass) sobj);
		}
		return result;
	}
}