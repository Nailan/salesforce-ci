public with sharing class ci_ApexClassQueries {
	public static final String ALL_TEST_CLASSES = 'FIND "*@isTest*" IN Body FIELDS RETURNING ApexClass';

	private ci_ApexClassQueries() {}
}