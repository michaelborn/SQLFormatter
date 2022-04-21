/**
* My Event Handler Hint
*/
component{

	// Demo page
	any function index( event,rc, prc ){
		var uglySQL = "SELECT id,fname,lname FROM users where fullName='Michael Born' and age = 'infinite'";
		var prettySQL = getInstance( "Formatter@SQLFormatter" )
							.format( uglySQL );

		event.setView(
			view = "main/index",
			args = {
				prettySQL: prettySQL,
				uglySQL  : uglySQL
			}
		);
	}

}