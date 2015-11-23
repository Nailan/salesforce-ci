public with sharing class ci_ApexTestQueueItemQueries {
	public static String SELECT_BY_ID = 'select id, ParentJobId from ApexTestQueueItem where id = :id';

	private ci_ApexTestQueueItemQueries() {
	}
}