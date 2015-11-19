public with sharing class ci_ApexTestClassResultServiceImpl implements ci_ApexTestClassResultService {
	private static ci_ApexTestClassResultServiceImpl instance;

	private ci_ApexClassSelector classSelector;
	private ci_ApexTestResultSelector testResultSelector;

	private ci_ApexTestClassResultServiceImpl() {
		classSelector = ci_ApexClassSelector.getInstance();
		testResultSelector = ci_ApexTestResultSelector.getInstance();
	}

	public static ci_ApexTestClassResultServiceImpl getInstance() {
		if (instance == null) {
			instance = new ci_ApexTestClassResultServiceImpl();
		}
		return instance;
	}

	public List<ci_ApexTestClassResult> retrieveApexTestClassResultsFromTestRun(String parentJobId) {
		List<ApexTestResult> testResults = testResultSelector.getTestResultsByParentJobId(parentJobId);
		Map<String, List<ApexTestResult>> classIdTestResultMap = new Map<String,  List<ApexTestResult>>();
		Set<String> classIdSet = new Set<String>();
		for (ApexTestResult testResult: testResults) {
			String classId = testResult.ApexClassId;
			classIdSet.add(classId);
			List<ApexTestResult> classTests;
			if (classIdTestResultMap.get(classId) == null) {
				classTests = new List<ApexTestResult>();
				
			} else {
				classTests = classIdTestResultMap.get(classId);
			}
			classTests.add(testResult);
			classIdTestResultMap.put(classId, classTests);
		}
		List<ApexClass> testClasses = classSelector.getApexClassesById(classIdSet);
		List<ci_ApexTestClassResult> resultsForClass = new List<ci_ApexTestClassResult>();
		for (ApexClass testClass: testClasses) {
			resultsForClass.add(new ci_ApexTestClassResult(testClass, classIdTestResultMap.get(testClass.Id)));
		}
		return resultsForClass;
	}
}