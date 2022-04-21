# SQLFormatter

A CFML wrapper for the Vertical Blank sql-formatter java library.

[![Release](https://github.com/michaelborn/SQLFormatter/actions/workflows/ci.yml/badge.svg)](https://github.com/michaelborn/SQLFormatter/actions/workflows/ci.yml)

## Installation

Using CommandBox:

```js
box install SQLFormatter
```

## Usage

Basic formatting is done via the `format()` method:

```js
var prettySQL = getInstance( "Formatter@SQLFormatter" )
                    .format( "SELECT COUNT(*) FROM users" );
```

For database-specific syntax, you can [choose a dialect](#dialect) using `.of()`:

```js
var prettySQL = getInstance( "Formatter@SQLFormatter" )
                    .of( "postgres" )
                    .format( "SELECT COUNT(*) FROM users" );
```

### Advanced Formatting Configuration

You can also specify advanced configuration options via the `ConfgBuilder`:

```js
var formatConfig = getInstance( "ConfigBuilder@sqlFormatter" )
                        .setIndent("    ") // Defaults to two spaces
                        .setUppercase(true) // Defaults to false (not safe to use when SQL dialect has case-sensitive identifiers)
                        .setLinesBetweenQueries(2) // Defaults to 1
                        .setMaxColumnLength(80) // Defaults to 50
                        .build();
```

You can then pass the `FormatConfig` object as the second parameter in the `Formatter.format()` method call:

```js
var prettySQL = getInstance( "Formatter@sqlFormatter" )
                    .format( "SELECT * FROM pages ORDER BY 'name'", formatConfig );
```

### Parameter Replacement

SQLFormatter supports parameter replacement using either an array of parameters or a struct of key/value params.

Specify the parameters via the `ConfigBuilder.params()` method:

```js
var prettySQL = getInstance( "Formatter@sqlFormatter" )
                    .of( "mysql" )
                    .format(
                        "SELECT * FROM pages WHERE slug IN [?, ?, ?]",
                        getInstance( "ConfigBuilder@sqlFormatter" )
                            .params( [ "a", "b", "c" ] )
                            .build()
                    );
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

## Known Issues

There is currently an issue with named placeholders - it seems the placeholders are not detected and replaced inside the SQL string, likely due to a formatting issue causing the `:name` placeholder to be space-separated. We'd appreciate any help you can offer! 😃 See [Contributing](#contributing) to get started.

## API Docs

The SQLFormatter class documentation is auto-generated via [DocBox](https://docbox.ortusbooks.com/) and hosted on Github Pages at [michaelborn.github.io/SQLFormatter/](https://michaelborn.github.io/SQLFormatter/)

## Thanks

Special thanks to the [SQLFormatter library](https://github.com/vertical-blank/sql-formatter). I could'na dunnit without ya. 😉

## Contributing

All contributions welcome! Fixing typos or adding tests are especially easy ways to help out.

To get started hacking on SQLFormatter:

1. Clone the module - `git clone git@github.com:michaelborn/sqlFormatter.git`
2. Install dependencies - `box install`
3. Start up a Lucee server - `box server start serverConfigFile=server-lucee@5.json`
4. Write code
5. Run tests - `box testbox run`
6. Push up a [pull request](https://github.com/michaelborn/sqlFormatter/pulls)

********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************

# HONOR GOES TO GOD ABOVE ALL

Because of His grace, this project exists. If you don't like this, then don't read it, its not for you.

>"Therefore being justified by faith, we have peace with God through our Lord Jesus Christ:
By whom also we have access by faith into this grace wherein we stand, and rejoice in hope of the glory of God.
And not only so, but we glory in tribulations also: knowing that tribulation worketh patience;
And patience, experience; and experience, hope:
And hope maketh not ashamed; because the love of God is shed abroad in our hearts by the
Holy Ghost which is given unto us. ." Romans 5:5

## THE DAILY BREAD

> "I am the way, and the truth, and the life; no one comes to the Father, but by me (JESUS)" Jn 14:1-12