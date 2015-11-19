public with sharing class ci_ApexTestClassResultServiceImpl implements ci_ApexTestClassResultService {
	private static ci_ApexTestClassResultServiceImpl instance;
	private ci_ApexClassSelector selector;

	private ci_ApexTestClassResultServiceImpl() {
		selector = ci_ApexClassSelector.getInstance();
	}

	public static ci_ApexTestClassResultServiceImpl getInstance() {
		if (instance == null) {
			instance = new ci_ApexTestClassResultServiceImpl();
		}
		return instance;
	}

	public List<ci_ApexTestClassResult> retrieveApexTestClassResultsFromTestRun(String parentJobId) {
		//TODO: implement
		return null;
	}


}