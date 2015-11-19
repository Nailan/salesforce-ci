public with sharing class ci_ApexTestResultQueries {
	public static String SELECT_BY_PARENT_JOB_ID = 'SELECT ApexClassId, Message, MethodName, Outcome, StackTrace'
		+ ' FROM ApexTestResult WHERE AsyncApexJobId = : parentJobId';

	private ci_ApexTestResultQueries() {}
}