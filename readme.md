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

For database-specific syntax, you can set the dialect using `.of()`:

```js
var prettySQL = getInstance( "Formatter@SQLFormatter" )
                    .of( "postgres" )
                    .format( "SELECT COUNT(*) FROM users" );
```

See [SQLFormatter on GitHub](https://github.com/vertical-blank/sql-formatter) for more info.

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

## Thanks

Special thanks to the [SQLFormatter library](https://github.com/vertical-blank/sql-formatter). I could'na dunnit without ya. 😉

## CONTRIBUTING

All contributions welcome! Fixing typos or adding tests are especially easy ways to help out.

To get started hacking on SQLFormatter:

1. Clone the module - `git clone git@github.com:michaelborn/sqlFormatter.git`
2. Install dependencies - `box install`
3. Start up a Lucee server - `box server start serverConfigFile=server-lucee@5.json`
4. Write code
5. Run tests - `box testbox run`
6. Push up a [pull request](https://github.com/michaelborn/sqlFormatter/pulls)

## The Good News

> For all have sinned, and come short of the glory of God ([Romans 3:23](https://www.kingjamesbibleonline.org/Romans-3-23/))

> But God commendeth his love toward us, in that, while we were yet sinners, Christ died for us. ([Romans 5:8](https://www.kingjamesbibleonline.org/Romans-5-8))

> That if thou shalt confess with thy mouth the Lord Jesus, and shalt believe in thine heart that God hath raised him from the dead, thou shalt be saved. ([Romans 10:9](https://www.kingjamesbibleonline.org/Romans-10-9/))
 
## Repository

Copyright 2022 (and on) - [Michael Born](https://michaelborn.me/)

* [Homepage](https://github.com/michaelborn/sqlFormatter)
* [Issue Tracker](https://github.com/michaelborn/sqlFormatter/issues)
* [New BSD License](https://github.com/michaelborn/sqlFormatter/blob/master/LICENSE)