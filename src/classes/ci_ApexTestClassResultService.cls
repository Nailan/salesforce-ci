public interface ci_ApexTestClassResultService {
	/**
	* Retrieves list of ci_ApexTestClassResult from tests execution results.
	*
	* @param parentJobId id of parent job for test execution.
	* @return list of ci_ApexTestClassResult.
	*/
	List<ci_ApexTestClassResult> retrieveApexTestClassResultsFromTestRun(String parentJobId);
}