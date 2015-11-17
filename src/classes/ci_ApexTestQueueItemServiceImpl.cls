public with sharing class ci_ApexTestQueueItemServiceImpl implements ci_ApexTestQueueItemService {
	private static ci_ApexTestQueueItemService instance;

	private ci_ApexTestQueueItemServiceImpl() {}

	public static ci_ApexTestQueueItemService getInstance() {
		if (instance == null) {
			instance = new ci_ApexTestQueueItemServiceImpl();
		}
		return instance;
	}

	public String createApexTestQueueItemsFromTestClasses(List<ApexClass> testClasses) {
		List<ApexTestQueueItem> items = new List<ApexTestQueueItem>();
		for (ApexClass clazz : testClasses) {                
            items.add(new ApexTestQueueItem(ApexClassId = clazz.Id));
    	}
    	insert items;
    	String asynchJobId = items.size() > 0 ? items[0].parentJobId : '';
    	return asynchJobId;
	}
}