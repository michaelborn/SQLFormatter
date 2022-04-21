component accessors="true" {

	property name="SQLFormatter" inject="javaloader:com.github.vertical_blank.sqlformatter.SqlFormatter";

	/**
	 * Constructor.
	 */
	public Formatter function init(){
		return this;
	}

	/**
	 * Format SQL with the set dialect or `configuration` argument.
	 *
	 * Not chainable.
	 *
	 * @sql messy SQL string to format.
     * @formatConfig instance of com.github.vertical_blank.sqlformatter.core.FormatConfig.
	 *
	 * @return prettified SQL string
	 */
	public string function format( required string sql, any formatConfig ){
		var formatter = getSQLFormatter();
		// .extend( function( dialect ) { return dialect.namedPlaceholderTypes( ":" ); } );
		if ( !isNull( arguments.formatConfig ) ) {
			return formatter.format( arguments.sql, arguments.formatConfig );
		}
		return formatter.format( arguments.sql );
	}

	/**
	 * Set the dialect to use when formatting SQL.
	 *
	 * @cite    https://github.com/vertical-blank/sql-formatter#dialect
	 * @dialect SQL dialect name. Support dialects are `sql`, `mariadb`, `mysql`, `postgresql`, `db2`, `plsql`, `n1ql`, `redshift`, `spark`, `tsql`.
	 */
	public Formatter function of( required string dialect ){
		getSQLFormatter().of( arguments.dialect );
		return this;
	}

}
