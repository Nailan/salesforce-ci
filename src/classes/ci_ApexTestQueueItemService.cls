public interface ci_ApexTestQueueItemService {

	/**
	* Creates a list of ApexTestQueueItems from list of ApexClasses and inserts it.
	* @param testClasses list of test classes to create ApexTestQueueItems.
	*
	* @return id of parent asynch job.
	*/
	String createApexTestQueueItemsFromTestClasses(List<ApexClass> testClasses);
}