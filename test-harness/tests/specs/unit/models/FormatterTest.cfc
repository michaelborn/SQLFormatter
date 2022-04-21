/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component
	extends="tests.specs.unit.BaseModelTest"
	model="SQLFormatter.models.Formatter"
{

	function run(){

		describe( "models/Formatter Suite", function(){
			it( "can initialize", function() {
                expect( isInstanceOf( variables.model, "SQLFormatter.models.Formatter" ) ).toBeTrue();
			});

            it( "can load sql-formatter library", function() {
				var SQLFormatter = variables.model.getSQLFormatter();
				expect( isNull( SQLFormatter ) ).toBeFalse();
				expect( isObject( SQLFormatter ) ).toBeTrue();
            });

			it( "can format SQL", function() {
				var uglySQL = "SELECT * FROM pages ORDER BY [name]";
				var result = variables.model.format( uglySQL );
				expect( result ).toBeTypeOf( "string" )
								.notToBe( "SELECT * FROM pages ORDER BY [name]" );
			});

			it( "can set SQL dialect to format", function() {
				var uglySQL = "SELECT * FROM pages ORDER BY 'name'";
				
				var postgresFormat = variables.model
						.of( "postgresql" )
						.format( uglySQL );

				var mysqlFormat = getInstance( "Formatter@sqlFormatter" )
						.of( "mysql" )
						.format( uglySQL );

				expect( postgresFormat ).toBeTypeOf( "string" )
										.notToBe( uglySQL )
										.toBe( mysqlFormat );
			});

			it( "accepts a FormatConfig", function() {
				var uglySQL = "SELECT * FROM pages WHERE name IN (?, ?, ?) ORDER BY 'name'";

				var config = getInstance( "ConfigBuilder@sqlFormatter" )
								.setIndent("__") // Defaults to two spaces
								.setUppercase(true) // Defaults to false (not safe to use when SQL dialect has case-sensitive identifiers)
								.setLinesBetweenQueries(2) // Defaults to 1
								.setMaxColumnLength(100) // Defaults to 50
								.setParams([ "a", "b", "c" ]) // Map or List. See Placeholders replacement.
								.build();

				var formatted = variables.model.format( uglySQL, config );
				expect( formatted ).toBe( "SELECT
__*
FROM
__pages
WHERE
__name IN (a, b, c)
ORDER BY
__'name'" );
			});

			xit( "inserts named placeholders", function() {
				var uglySQL = "SELECT * FROM users WHERE name = :name AND age = :age";

				var config = getInstance( "ConfigBuilder@sqlFormatter" )
								.setIndent("__") // Defaults to two spaces
								.setUppercase(true) // Defaults to false (not safe to use when SQL dialect has case-sensitive identifiers)
								.setLinesBetweenQueries(2) // Defaults to 1
								.setMaxColumnLength(100) // Defaults to 50
								.setParams({ "name" : "Michael", "age" : "17" }) // Map or List. See Placeholders replacement.
								.build();

				var formatted = variables.model
								.of( "postgresql" )
								.format( uglySQL, config );
				// writeOutput( "<pre>#formatted#</pre>" );
				expect( formatted ).toBe( "SELECT
__*
FROM
__users
WHERE
__name = 'Michael'
__AND age = '17'" );
			});
		});

	}

}
