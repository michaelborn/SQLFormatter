/**
 * The base model test case will use the 'model' annotation as the instantiation path
 * and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
 * responsibility to update the model annotation instantiation path and init your model.
 */
component extends="tests.specs.unit.BaseModelTest" model="SQLFormatter.models.ConfigBuilder" {

	function run(){
		describe( "ConfigBuilder", function(){
			it( "can initialize", function(){
				expect( isInstanceOf( variables.model, "SQLFormatter.models.ConfigBuilder" ) ).toBeTrue();
			} );

			it( "builds a FormatConfig", function(){
				var config = variables.model.build();
				expect( isObject( config ) ).toBeTrue();
			} );

			it( "throws on invalid options", function(){
				expect( function(){
					variables.model.setUppercase( "please" );
				} ).toThrow();

				expect( function(){
					variables.model.setLinesBetweenQueries( 2.5 );
				} ).toThrow( "sqlFormatter.ConfigBuilder.InvalidTypeException" );

				expect( function(){
					variables.model.setMaxColumnLength( 80.8 );
				} ).toThrow( "sqlFormatter.ConfigBuilder.InvalidTypeException" );
			} );

			it( "can set advanced formatting config", function(){
				var config = variables.model
					.setIndent( "<TAB>" ) // Defaults to two spaces
					.setUppercase( true ) // Defaults to false (not safe to use when SQL dialect has case-sensitive identifiers)
					.setLinesBetweenQueries( 2 ) // Defaults to 1
					.setMaxColumnLength( 100 ) // Defaults to 50
					.setParams( [ "a", "b", "c" ] ) // Map or List. See Placeholders replacement.
					.build();

				expect( config.indent ).toBe( "<TAB>" );
				expect( config.uppercase ).toBeTrue();
				expect( config.linesBetweenQueries ).toBe( 2 );
				expect( config.maxColumnLength ).toBe( 100 );
			} );
		} );
	}

}
