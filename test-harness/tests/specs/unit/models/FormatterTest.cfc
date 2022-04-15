/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="tests.specs.BaseModuleTest" model="SQLFormatter.models.Formatter"{

	function beforeAll(){
		super.beforeAll();

		// setup the model
		super.setup();

		// init the model object
		model.init();
		
		// wire me up!
		getWirebox().autowire( model );
	}

	function run(){

		describe( "models/Formatter Suite", function(){
			it( "can initialize", function() {
                expect( isInstanceOf( variables.model, "SQLFormatter.models.Formatter" ) ).toBeTrue();
			});

            it( "throws if sql-formatter jar is not found", function() {
                var mockFormatter = getMockBox().createMock( "SQLFormatter.models.Formatter" );
                mockFormatter.$( method = "initJavaLib", callback = () => {
                    throw( type = "ClassNotFoundException" );
                } );
                expect( function() {
                    mockFormatter.init();
                } ).toThrow( "SQLFormatter.MissingJarException" );
            });

            it( "can load sql-formatter library", function() {
                var mockFormatter = getMockBox().createMock( "SQLFormatter.models.Formatter" );
                expect( function() {
                    var SQLFormatter = mockFormatter.getSQLFormatter();
                    expect( isObject( SQLFormatter ) ).toBeTrue();
                } ).notToThrow( "SQLFormatter.MissingJarException" );
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
				
				// we need to reinit due to `.of()` causing the underlying Formatter class to mutate.
				var mysqlFormat = new SQLFormatter.models.Formatter()
						.of( "postgresql" )
						.format( uglySQL );

				expect( postgresFormat ).toBeTypeOf( "string" )
										.notToBe( uglySQL )
										.toBe( mysqlFormat );
			});

		});

	}

}
