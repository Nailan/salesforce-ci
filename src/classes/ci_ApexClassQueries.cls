public with sharing class ci_ApexClassQueries {
	public static final String ALL_TEST_CLASSES = 'FIND \'*@isTest*\' RETURNING ApexClass';
	public static final String SELECT_CLASSES_BY_ID = 'SELECT Id, Name, Body FROM ApexClass WHERE Id in :ids';

	private ci_ApexClassQueries() {}
}