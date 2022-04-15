component accessors="true" {

    property name="SqlFormatter";

    /**
     * Constructor.
     * 
     * Also ensures the sql-formatter library is reachable from CFML.
     */
    public Formatter function init(){
        setSQLFormatter( getJavaClass( "com.github.vertical_blank.sqlformatter.SqlFormatter" ) );
        return this;
    }

    /**
     * Format SQL with the set dialect or `configuration` argument.
     * 
     * Not chainable.
     *
     * @sql messy SQL string to format.
     */
    public string function format( required string sql ){
        return getSQLFormatter().format( arguments.sql );
    }

    /**
     * Set the dialect to use when formatting SQL.
     * 
     * @cite https://github.com/vertical-blank/sql-formatter#dialect
     * @dialect SQL dialect name. Support dialects are `sql`, `mariadb`, `mysql`, `postgresql`, `db2`, `plsql`, `n1ql`, `redshift`, `spark`, `tsql`.
     */
    public Formatter function of( required string dialect ){
        getSQLFormatter().of( arguments.dialect );
        return this;
    }

    /**
     * Test for SQLFormatter availability and throw an error if not available.
     * Used in module initialization.
     */
    private function getJavaClass( required string className ){
        try {
            return initJavaLib( arguments.className);
        } catch( any exception ){
            throw(
                message      = "Cannot load sql-formatter class; is the sql-formatter jar loaded?",
                type         = "SQLFormatter.MissingJarException",
                detail       = "Trying to load #arguments.className# gave us an exception: #exception.message#",
                extendedInfo = serializeJSON( exception )
            );
        }
    }

    /**
     * Grab java class from sql-formatter jar.
     * Perhaps future iterations will utilize JavaLoader
     * OR the lucee-only `context` path to the .jar file.
     */
    private any function initJavaLib( required string className ){
        return createObject(
            type = "java",
            className = arguments.className
        );
    }
}