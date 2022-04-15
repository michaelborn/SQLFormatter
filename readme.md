# SQLFormatter

A CFML wrapper for the Vertical Blank sql-formatter java library.

[![Release](https://github.com/michaelborn/SQLFormatter/actions/workflows/release.yml/badge.svg)](https://github.com/michaelborn/SQLFormatter/actions/workflows/release.yml)

See [SQLFormatter on GitHub](https://github.com/vertical-blank/sql-formatter) for more info.

## Installation

1. Install this module. `box install SQLFormatter`
2. Add the module's `lib/` directory to your application's `javaSettings.loadPaths`:

```js
this.javaSettings.loadPaths = [
    // ...
    expandPath( "/modules/SQLFormatter/lib/sql-formatter/" )
];
```

Restart your app. The CF engine should "pick up" the `sql-formatter-x.y.z.jar` jar and load it into the application.

## Usage

Basic formatting is done via the `format()` method:

```js
var prettySQL = getInstance( "Formatter@SQLFormatter" )
                    .format( "SELECT COUNT(*) FROM users" );
```

For advanced syntax, you can set the dialect using `.of()`:

```js
var prettySQL = getInstance( "Formatter@SQLFormatter" )
                    .of( "postgres" )
                    .format( "SELECT COUNT(*) FROM users" );
```

### Dialect

[Supported dialects](https://github.com/vertical-blank/sql-formatter#dialect):

* `sql` - Standard SQL
* `mariadb` - MariaDB
* `mysql` - MySQL
* `postgresql` - PostgreSQL
* `db2` - IBM DB2
* `plsql` - Oracle PL/SQL
* `n1ql` - Couchbase N1QL
* `redshift` - Amazon Redshift
* `spark` - Spark
* `tsql` - SQL Server Transact-SQL

## API Docs

The SQLFormatter class documentation is auto-generated via [DocBox](https://docbox.ortusbooks.com/) and hosted on Github Pages at [michaelborn.github.io/SQLFormatter/](https://michaelborn.github.io/SQLFormatter/)

## Contributing

I could use help with this!

## Thanks

Special thanks to the [SQLFormatter library](https://github.com/vertical-blank/sql-formatter). I could'na dunnit without ya. 😉