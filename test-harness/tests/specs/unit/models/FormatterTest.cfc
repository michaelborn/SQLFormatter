/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.unit.BaseModelTest" model="SQLFormatter.models.Formatter" {

	function run(){
		describe( "models/Formatter Suite", function(){
			it( "can initialize", function(){
				expect( isInstanceOf( variables.model, "SQLFormatter.models.Formatter" ) ).toBeTrue();
			} );

			it( "can load sql-formatter library", function(){
				var SQLFormatter = variables.model.getSQLFormatter();
				expect( isNull( SQLFormatter ) ).toBeFalse();
				expect( isObject( SQLFormatter ) ).toBeTrue();
			} );

			it( "can format SQL", function(){
				var uglySQL = "SELECT * FROM pages ORDER BY [name]";
				var result  = variables.model.format( uglySQL );
				expect( result ).toBeTypeOf( "string" ).notToBe( "SELECT * FROM pages ORDER BY [name]" );
			} );

			it( "can set SQL dialect to format", function(){
				var uglySQL = "SELECT * FROM pages ORDER BY 'name'";

				var postgresFormat = variables.model.of( "postgresql" ).format( uglySQL );

				var mysqlFormat = getInstance( "Formatter@sqlFormatter" ).of( "mysql" ).format( uglySQL );

				expect( postgresFormat )
					.toBeTypeOf( "string" )
					.notToBe( uglySQL )
					.toBe( mysqlFormat );
			} );

			it( "accepts a FormatConfig", function(){
				var formatted = variables.model.format(
					"SELECT * FROM pages WHERE name IN (?, ?, ?) ORDER BY 'name'",
					getInstance( "ConfigBuilder@sqlFormatter" )
						.setIndent( "__" )
						.setUppercase( true )
						.setLinesBetweenQueries( 2 )
						.setMaxColumnLength( 100 )
						.setParams( [ "a", "b", "c" ] )
						.build()
				);
				expect( formatted ).toBe(
					"SELECT
__*
FROM
__pages
WHERE
__name IN (a, b, c)
ORDER BY
__'name'"
				);
			} );

			it( "works with positional placeholders", function(){
				var formatted = variables.model
					.of( "db2" )
					.format(
						"SELECT * FROM pages WHERE slug IN (?,?,?)",
						getInstance( "ConfigBuilder@sqlFormatter" )
							.setIndent( "__" )
							.setParams( [ "a", "b", "c" ] )
							.build()
					);
				expect( formatted ).toBe(
					"SELECT
__*
FROM
__pages
WHERE
__slug IN (a, b, c)"
				);
			} );

			/**
			 * TODO: Discover why this fails and FIX IT!
			 */
			xit( "works with named placeholders", function(){
				var formatted = variables.model
					.of( "postgresql" )
					.format(
						"SELECT * FROM users WHERE name = :name AND age = :age",
						getInstance( "ConfigBuilder@sqlFormatter" )
							.setParams( { "name" : "Michael", "age" : "18" } )
							.build()
					);
				// writeOutput( "<pre>#formatted#</pre>" );
				expect( formatted ).toBe(
					"SELECT
  *
FROM
  users
WHERE
  name = 'Michael'
  AND age = '17'"
				);
			} );
		} );
	}

}
