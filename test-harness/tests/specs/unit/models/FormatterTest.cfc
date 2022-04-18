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

		});

	}

}
