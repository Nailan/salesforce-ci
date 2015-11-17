/**
* Service interface to send emails.
*/
public interface ci_EmailService {
	/**
	* Sends email report about tests run.
	*
	* @param report instance of ci_TestReport generated from tests run results.
	*/
	void sendReport(ci_TestReport report);
}