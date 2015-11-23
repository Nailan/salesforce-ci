public with sharing class ci_ApexTestQueueItemSelector {
	private static ci_ApexTestQueueItemSelector instance;

	private ci_ApexTestQueueItemSelector() {}

	public static ci_ApexTestQueueItemSelector getInstance() {
		if (instance == null) {
			instance = new ci_ApexTestQueueItemSelector();
		}
		return instance;
	}

	public ApexTestQueueItem getQueueItemById(String id) {
		return (ApexTestQueueItem) Database.query(ci_ApexTestQueueItemQueries.SELECT_BY_ID);
	}

}