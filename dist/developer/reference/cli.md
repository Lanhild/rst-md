# Command-line interface (CLI)

The CLI `command-line interface` offers several functionalities related
to Konvergo ERP. You can use it to `run the server <reference/cmdline/server>`,
`launch Konvergo ERP as a Python console
environment <reference/cmdline/shell>`,
`scaffold an Konvergo ERP module <reference/cmdline/scaffold>`,
`populate a database <reference/cmdline/populate>`, or
`count the number of lines of code
<reference/cmdline/cloc>`.

> [!IMPORTANT]
> The command to use to call the CLI depends on how you installed Konvergo ERP.
> In the examples below, we assume that you are
> `running Konvergo ERP from source </administration/on_premise/source>` with
> the `odoo-bin` file. If you installed Konvergo ERP
> `from a distribution package
> </administration/on_premise/packages>` or with
> [Docker](https://hub.docker.com/_/odoo/), you must adapt the command.
>
> <div class="tabs">
>
> <div class="tab">
>
> Run Konvergo ERP from source
>
> 1.  Navigate to the root of the directory where you downloaded the
>     source files of Konvergo ERP Community.
> 2.  Run all CLI commands with `./odoo-bin`
>
> </div>
>
> <div class="tab">
>
> Konvergo ERP was installed from a distribution package
>
> When Konvergo ERP was installed, an executable named
> <span class="title-ref">odoo</span> was added to your user's PATH.
> Replace all occurrences of `odoo-bin` with `odoo` in the examples
> below.
>
> </div>
>
> <div class="tab">
>
> Konvergo ERP was installed with Docker
>
> Please refer to the [documentation of the official Docker image of
> Konvergo ERP](https://hub.docker.com/_/odoo/).
>
> </div>
>
> </div>

## Help & version

<div class="program">

odoo-bin

</div>

<div class="option">

-h, --help

shows help text with all available options

</div>

<div class="option">

--version

shows Konvergo ERP version e.g. "Konvergo ERP Server {BRANCH}"

</div>

> [!TIP]
> You can enable auto-completion in your shell by running
>
> ``` bash
> echo "complete -W '`./odoo-bin --help | \
>   sed -e 's/[^a-z_-]\(-\+[a-z0-9_-]\+\)/\n\1\n/' | \
>   grep -- '^-' | sort | uniq | tr '\n' ' '`' odoo-bin" >> ~/.bash_completion
> ```

## Running the server

<div class="program">

odoo-bin

</div>

<div class="option">

-d \<database\>, --database \<database\>

database(s) used when installing or updating modules. Providing a
comma-separated list restrict access to databases provided in list.

For advanced database options, take a look
`below <reference/cmdline/server/database>`.

</div>

<div class="option">

-i \<modules\>, --init \<modules\>

comma-separated list of modules to install before running the server
(requires `-d`).

</div>

<div class="option">

-u \<modules\>, --update \<modules\>

comma-separated list of modules to update before running the server. Use
`all` for all modules. (requires `-d`).

</div>

<div class="option">

--addons-path \<directories\>

comma-separated list of directories in which modules are stored. These
directories are scanned for modules.

</div>

<div class="option">

--upgrade-path \<upgrade_path\>

specify an additional upgrade path.

</div>

<div class="option">

--load \<modules\>

list of server-wide modules to load. Those modules are supposed to
provide features not necessarily tied to a particular database. This is
in contrast to modules that are always bound to a specific database when
they are installed (i.e. the majority of Konvergo ERP addons). Default is
`base,web`.

</div>

<div class="option">

-c \<config\>, --config \<config\>

path to an alternate `configuration file <reference/cmdline/config>`. If
not defined, Konvergo ERP checks `ODOO_RC` environmental variable and default
location `{$HOME}/.odoorc`. See configuration file section
`below <reference/cmdline/config>`.

</div>

<div class="option">

-D \<data-dir-path\>, --data-dir \<data-dir-path\>

directory path where to store Konvergo ERP data (eg. filestore, sessions). If
not specified, Konvergo ERP will fallback to a predefined path. On Unix systems
its one defined in `$XDG_DATA_HOME` environmental variable or
`~/.local/share/Konvergo ERP` or `/var/lib/Konvergo ERP`.

</div>

<div class="option">

-s, --save

saves the server configuration to the current configuration file
(`{$HOME}/.odoorc` by default, and can be overridden using `-c`).

</div>

<div class="option">

--without-demo

disables demo data loading for modules installed comma-separated, use
`all` for all modules. Requires `-d` and `-i`.

</div>

<div class="option">

--pidfile=\<pidfile\>

path to a file where the server pid will be stored

</div>

<div class="option">

--stop-after-init

stops the server after its initialization.

</div>

<div class="option">

--geoip-db \<path\>

Absolute path to the GeoIP database file.

</div>

## Testing Configuration

<div class="option">

--test-enable

runs tests after module installation

</div>

<div class="option">

--test-file \<file\>

runs a python test file

</div>

<div class="option">

--test-tags \[-\]\[tag\]\[/module\]\[:class\]\[.method\]

Comma-separated list of specs to filter which tests to execute. Enable
unit tests if set.

Example: <span class="title-ref">--test-tags
:TestClass.test_func,/test_module,external</span>

- The <span class="title-ref">-</span> specifies if we want to include
  or exclude tests matching this spec.
- The tag will match tags added on a class with a
  `~odoo.tests.common.tagged` decorator (all
  `test classes <reference/testing>` have
  <span class="title-ref">standard</span> and
  <span class="title-ref">at_install</span> tags until explicitly
  removed, see the decorator documentation).
- <span class="title-ref">\*</span> will match all tags.
- If tag is omitted on include mode, its value is
  <span class="title-ref">standard</span>.
- If tag is omitted on exclude mode, its value is
  <span class="title-ref">\*</span>.
- The module, class, and method will respectively match the module name,
  test class name and test method name.

Filtering and executing the tests happens twice: right after each module
installation/update and at the end of the modules loading. At each stage
tests are filtered by <span class="title-ref">--test-tags</span> specs
and additionally by dynamic specs
<span class="title-ref">at_install</span> and
<span class="title-ref">post_install</span> correspondingly.

</div>

<div class="option">

--screenshots

Specify directory where to write screenshots when an HttpCase.browser_js
test fails. It defaults to `/tmp/odoo_tests/{db_name}/screenshots`

</div>

<div class="option">

--screencasts

Enable screencasts and specify directory where to write screencasts
files. The `ffmpeg` utility needs to be installed to encode frames into
a video file. Otherwise frames will be kept instead of the video file.

</div>

### Database

<div class="option">

-r \<user\>, --db_user \<user\>

database username, used to connect to PostgreSQL.

</div>

<div class="option">

-w \<password\>, --db_password \<password\>

database password, if using [password
authentication](https://www.postgresql.org/docs/12/static/auth-methods.html#AUTH-PASSWORD).

</div>

<div class="option">

--db_host \<hostname\>

host for the database server

- `localhost` on Windows
- UNIX socket otherwise

</div>

<div class="option">

--db_port \<port\>

port the database listens on, defaults to 5432

</div>

<div class="option">

--db-filter \<filter\>

hides databases that do not match `<filter>`. The filter is a [regular
expression](https://docs.python.org/3/library/re.html), with the
additions that:

- `%h` is replaced by the whole hostname the request is made on.

- `%d` is replaced by the subdomain the request is made on, with the
  exception of `www` (so domain `odoo.com` and `www.odoo.com` both match
  the database `odoo`).

  These operations are case sensitive. Add option `(?i)` to match all
  databases (so domain `odoo.com` using `(?i)%d` matches the database
  `Konvergo ERP`).

Since version 11, it's also possible to restrict access to a given
database listen by using the --database parameter and specifying a
comma-separated list of databases

When combining the two parameters, db-filter supersedes the
comma-separated database list for restricting database list, while the
comma-separated list is used for performing requested operations like
upgrade of modules.

``` bash
$ odoo-bin --db-filter ^11.*$
```

Restrict access to databases whose name starts with 11

``` bash
$ odoo-bin --database 11firstdatabase,11seconddatabase
```

Restrict access to only two databases, 11firstdatabase and
11seconddatabase

``` bash
$ odoo-bin --database 11firstdatabase,11seconddatabase -u base
```

Restrict access to only two databases, 11firstdatabase and
11seconddatabase, and update base module on one database:
11firstdatabase. If database 11seconddatabase doesn't exist, the
database is created and base modules is installed

``` bash
$ odoo-bin --db-filter ^11.*$ --database 11firstdatabase,11seconddatabase -u base
```

Restrict access to databases whose name starts with 11, and update base
module on one database: 11firstdatabase. If database 11seconddatabase
doesn't exist, the database is created and base modules is installed

</div>

<div class="option">

--db-template \<template\>

when creating new databases from the database-management screens, use
the specified [template
database](https://www.postgresql.org/docs/12/static/manage-ag-templatedbs.html).
Defaults to `template0`.

</div>

<div class="option">

--pg_path \</path/to/postgresql/binaries\>

Path to the PostgreSQL binaries that are used by the database manager to
dump and restore databases. You have to specify this option only if
these binaries are located in a non-standard directory.

</div>

<div class="option">

--no-database-list

Suppresses the ability to list databases available on the system

</div>

<div class="option">

--db_sslmode

Control the SSL security of the connection between Konvergo ERP and PostgreSQL.
Value should be one of 'disable', 'allow', 'prefer', 'require',
'verify-ca' or 'verify-full' Default value is 'prefer'

</div>

<div class="option">

--unaccent

Try to enable the unaccent extension when creating new databases

</div>

### Emails

<div class="option">

--email-from \<address\>

Email address used as \<FROM\> when Konvergo ERP needs to send mails

</div>

<div class="option">

--from-filter \<address or domain\>

Define which email address the SMTP configuration will apply to. The
field can be a domain name or an entire email address, or it can remain
empty. If the sender's email address does not match this set filter,
then the email will be encapsulated using a combination of the two
system parameters: `mail.default.from` and `mail.catchall.domain`. For
example, "Admin" \<admin@example.com\> =\> "Admin"
\<notifications@mycompany.com\>.

</div>

<div class="option">

--smtp \<server\>

Address of the SMTP server to connect to in order to send mails

</div>

<div class="option">

--smtp-port \<port\>

</div>

<div class="option">

--smtp-ssl

If set, odoo should use SSL/STARTSSL SMTP connections

</div>

<div class="option">

--smtp-user \<name\>

Username to connect to the SMTP server

</div>

<div class="option">

--smtp-password \<password\>

Password to connect to the SMTP server

</div>

<div class="option">

--smtp-ssl-certificate-filename \<path/to/cert.pem\>

An SSL certificate is to be used for authentication. If set, then
<span class="title-ref">smtp-ssl-private-key</span> is required.

</div>

<div class="option">

--smtp-ssl-private-key-filename \<path/to/key.pem\>

An SSL private key is used for authentication. If set, then
<span class="title-ref">smtp-ssl-certificate</span> is required.

</div>

### Internationalisation

Use these options to translate Konvergo ERP to another language. See i18n
section of the user manual. Option '-d' is mandatory. Option '-l' is
mandatory in case of importation

<div class="option">

--load-language \<languages\>

specifies the languages (separated by commas) for the translations you
want to be loaded

</div>

<div class="option">

-l, --language \<language\>

specify the language of the translation file. Use it with --i18n-export
or --i18n-import

</div>

<div class="option">

--i18n-export \<filename\>

export all sentences to be translated to a CSV file, a PO file or a TGZ
archive and exit.

</div>

<div class="option">

--i18n-import \<filename\>

import a CSV or a PO file with translations and exit. The '-l' option is
required.

</div>

<div class="option">

--i18n-overwrite

overwrites existing translation terms on updating a module or importing
a CSV or a PO file.

</div>

<div class="option">

--modules

specify modules to export. Use in combination with --i18n-export

</div>

### Advanced Options

#### Developer features

<div class="option">

--dev \<feature,feature,...,feature\>

comma-separated list of features. For development purposes only. Do not
use it in production. Possible features are:

- `all`: all the features below are activated
- `xml`: read QWeb template from xml file directly instead of database.
  Once a template has been modified in database, it will be not be read
  from the xml file until the next update/init. Particularly, templates
  are not translated on using this option.
- `reload`: restart server when python file are updated (may not be
  detected depending on the text editor used)
- `qweb`: break in the evaluation of QWeb template when a node contains
  `t-debug='debugger'`
- `(i)p(u)db`: start the chosen python debugger in the code when an
  unexpected error is raised before logging and returning the error.
- `werkzeug`: display the full traceback on the frontend page in case of
  exception

</div>

#### HTTP

<div class="option">

--no-http

do not start the HTTP or long-polling workers (may still start
`cron <reference/actions/cron>` workers)

> [!WARNING]
> has no effect if `--test-enable` is set, as tests require an
> accessible HTTP server

</div>

<div class="option">

--http-interface \<interface\>

TCP/IP address on which the HTTP server listens, defaults to `0.0.0.0`
(all addresses)

</div>

<div class="option">

-p \<port\>

</div>

<div class="option">

--http-port \<port\>

Port on which the HTTP server listens, defaults to 8069.

</div>

<div class="option">

--gevent-port \<port\>

TCP port for websocket connections in multiprocessing or gevent mode,
defaults to 8072. Not used in default (threaded) mode.

</div>

<div class="option">

--proxy-mode

enables the use of `X-Forwarded-*` headers through [Werkzeug's proxy
support](https://werkzeug.palletsprojects.com/en/0.16.x/middleware/proxy_fix/#module-werkzeug.middleware.proxy_fix).

It ignores all `X-Forwarded-*` headers in case `X-Forwarded-Host` is
missing from the request.

It always gets the real IP from the last entry of the `X-Forwarded-For`
chain. Configure your web server accordingly using directives such as
nginx's
[set_real_ip_from](https://nginx.org/en/docs/http/ngx_http_realip_module.html)
in case there are other trusted proxies along the chain that must be
ignored.

`X-Forwarded-Proto` and `X-Forwarded-Host` are used to update the
request root URL, which in turn is used to update the `web.base.url`
system parameter upon a successful admin authentication. This system
parameter is used to generate all links for the current database; see
`domain-name/web-base-url`.

> [!WARNING]
> proxy mode *must not* be enabled outside of a reverse proxy scenario

</div>

<div class="option">

--x-sendfile

delegates serving attachments files to the static web server and sets
both `X-Sendfile` (apache) and `X-Accel-*` (nginx) http headers on
stream responses. See `deploy/streaming` for web server configuration.

</div>

#### Logging

By default, Konvergo ERP displays all logging of
[level](https://docs.python.org/3/library/logging.html#logging.Logger.setLevel)
`INFO`, `WARNING` and `ERROR`. All logs independently of the level are
output on `stderr`. Various options are available to redirect logging to
other destinations and to customize the verbosity.

<div class="option">

--logfile \<file\>

sends logging output to the specified file instead of `stderr`. On Unix,
the file [can be managed by external log rotation
programs](https://docs.python.org/3/library/logging.handlers.html#watchedfilehandler)
and will automatically be reopened when replaced

</div>

<div class="option">

--syslog

logs to the system's event logger: [syslog on
unices](https://docs.python.org/3/library/logging.handlers.html#sysloghandler)
and [the Event Log on
Windows](https://docs.python.org/3/library/logging.handlers.html#nteventloghandler).

Neither is configurable

</div>

<div class="option">

--log-db \<dbname\>

logs to the `ir.logging` model (`ir_logging` table) of the specified
database. The database can be the name of a database in the "current"
PostgreSQL, or [a PostgreSQL
URI](https://www.postgresql.org/docs/12/static/libpq-connect.html#AEN38208)
for e.g. log aggregation.

</div>

<div class="option">

--log-handler \<handler-spec\>

`{LOGGER}:{LEVEL}`, enables `LOGGER` at the provided `LEVEL` e.g.
`odoo.models:DEBUG` will enable all logging messages at or above `DEBUG`
level in the models.

- The colon `:` is mandatory
- The logger can be omitted to configure the root (default) handler
- If the level is omitted, the logger is set to `INFO`

The option can be repeated to configure multiple loggers e.g.

``` console
$ odoo-bin --log-handler :DEBUG --log-handler werkzeug:CRITICAL --log-handler odoo.fields:WARNING
```

</div>

<div class="option">

--log-web

enables DEBUG logging of HTTP requests and responses, equivalent to
`--log-handler=odoo.http:DEBUG`

</div>

<div class="option">

--log-sql

enables DEBUG logging of SQL querying, equivalent to
`--log-handler=odoo.sql_db:DEBUG`

</div>

<div class="option">

--log-level \<level\>

Shortcut to more easily set predefined levels on specific loggers.
"real" levels (`critical`, `error`, `warn`, `debug`) are set on the
`odoo` and `werkzeug` loggers (except for `debug` which is only set on
`odoo`).

Konvergo ERP also provides debugging pseudo-levels which apply to different sets
of loggers:

`debug_sql`  
sets the SQL logger to `debug`

equivalent to `--log-sql`

`debug_rpc`  
sets the `odoo` and HTTP request loggers to `debug`

equivalent to `--log-level debug --log-request`

`debug_rpc_answer`  
sets the `odoo` and HTTP request and response loggers to `debug`

equivalent to `--log-level debug --log-request --log-response`

> [!NOTE]
> In case of conflict between `--log-level` and `--log-handler`, the
> latter is used

</div>

#### Multiprocessing

<div class="option">

--workers \<count\>

if `count` is not 0 (the default), enables multiprocessing and sets up
the specified number of HTTP workers (sub-processes processing HTTP and
RPC requests).

> [!NOTE]
> multiprocessing mode is only available on Unix-based systems

A number of options allow limiting and recycling workers:

<div class="option">

--limit-request \<limit\>

Number of requests a worker will process before being recycled and
restarted.

Defaults to *8196*.

</div>

<div class="option">

--limit-memory-soft \<limit\>

Maximum allowed virtual memory per worker in bytes. If the limit is
exceeded, the worker is killed and recycled at the end of the current
request.

Defaults to *2048MiB (2048\*1024\*1024B)*.

</div>

<div class="option">

--limit-memory-hard \<limit\>

Hard limit on virtual memory in bytes, any worker exceeding the limit
will be immediately killed without waiting for the end of the current
request processing.

Defaults to *2560MiB (2560\*1024\*1024B)*.

</div>

<div class="option">

--limit-time-cpu \<limit\>

Prevents the worker from using more than \<limit\> CPU seconds for each
request. If the limit is exceeded, the worker is killed.

Defaults to *60*.

</div>

<div class="option">

--limit-time-real \<limit\>

Prevents the worker from taking longer than \<limit\> seconds to process
a request. If the limit is exceeded, the worker is killed.

Differs from `--limit-time-cpu` in that this is a "wall time" limit
including e.g. SQL queries.

Defaults to *120*.

</div>

</div>

<div class="option">

--max-cron-threads \<count\>

number of workers dedicated to `cron <reference/actions/cron>` jobs.
Defaults to *2*. The workers are threads in multi-threading mode and
processes in multi-processing mode.

For multi-processing mode, this is in addition to the HTTP worker
processes.

</div>

## Configuration file

<div class="program">

odoo-bin

</div>

Most of the command-line options can also be specified via a
configuration file. Most of the time, they use similar names with the
prefix `-` removed and other `-` are replaced by `_` e.g.
`--db-template` becomes `db_template`.

Some conversions don't match the pattern:

- `--db-filter` becomes `dbfilter`
- `--no-http` corresponds to the `http_enable` boolean
- logging presets (all options starting with `--log-` except for
  `--log-handler` and `--log-db`) just add content to `log_handler`, use
  that directly in the configuration file
- `--smtp` is stored as `smtp_server`
- `--database` is stored as `db_name`
- `--i18n-import` and `--i18n-export` aren't available at all from
  configuration files

<div id="reference/cmdline/config_file">

The default configuration file is `{$HOME}/.odoorc` which can be
overridden using `--config <odoo-bin -c>`. Specifying
`--save <odoo-bin -s>` will save the current configuration state back to
that file. The configuration items relative to the command-line are to
be specified in the section `[options]`.

</div>

Here is a sample file:

``` ini
[options]
db_user=odoo
dbfilter=odoo
```

## Shell

The Konvergo ERP command line also allows launching Konvergo ERP as a Python console
environment, enabling direct interaction with the `orm <reference/orm>`
and its functionalities.

``` console
$ odoo-bin shell
```

<div class="example">

Adding an exclamation mark to all contacts' names:

``` python
In [1]: records = env["res.partner"].search([])

In [2]: records
Out[2]: res.partner(14, 26, 33, 21, 10)

In [3]: for partner in records:
   ...:     partner.name = "%s !" % partner.name
   ...:

In [4]: env.cr.commit()
```

> [!IMPORTANT]
> By default, the shell is running in transaction mode. This means that
> any change made to the database is rolled back when exiting the shell.
> To commit changes, use <span class="title-ref">env.cr.commit()</span>.

</div>

<div class="option">

--shell-interface (ipythonbpython\|python)

Specify a preferred REPL to use in shell mode. This shell is started
with the <span class="title-ref">env</span> variable already initialized
to be able to access the ORM and other Konvergo ERP modules.

</div>

<div class="seealso">

`reference/orm/environment`

</div>

## Scaffolding

<div class="program">

odoo-bin scaffold

</div>

Scaffolding is the automated creation of a skeleton structure to
simplify bootstrapping (of new modules, in the case of Konvergo ERP). While not
necessary it avoids the tedium of setting up basic structures and
looking up what all starting requirements are.

Scaffolding is available via the `odoo-bin scaffold` subcommand.

``` console
$ odoo-bin scaffold my_module /addons/
```

<div class="option">

name (required)

the name of the module to create, may munged in various manners to
generate programmatic names (e.g. module directory name, model names, …)

</div>

<div class="option">

destination (default=current directory)

directory in which to create the new module, defaults to the current
directory

</div>

<div class="option">

-t \<template\>

a template directory, files are passed through
[jinja2](https://jinja.palletsprojects.com/) then copied to the
`destination` directory

</div>

This will create module *my_module* in directory */addons/*.

## Database Population

<div class="program">

odoo-bin populate

</div>

Konvergo ERP CLI supports database population features. If the feature is
`implemented on a given model <reference/performance/populate/methods>`,
it allows automatic data generation of the model's records to test your
modules in databases containing non-trivial amounts of records.

``` console
$ odoo-bin populate
```

<div class="option">

--models

list of models for which the database should be filled

</div>

<div class="option">

--size (smalllarge)

population size, the actual records number depends on the model's
<span class="title-ref">\_populate_sizes</span> attribute. The generated
records content is specified by the `~odoo.models._populate_factories`
method of a given model (cf. the `populate` folder of modules for
further details).

</div>

<div class="seealso">

`reference/performance/populate`

</div>

## Cloc

<div class="program">

odoo-bin cloc

</div>

Konvergo ERP Cloc is a tool to count the number of relevant lines written in
Python, Javascript, CSS, SCSS, or XML. This can be used as a rough
metric for pricing maintenance of extra modules.

### Command-line options

<div class="option">

-d \<database\>, --database \<database\>

</div>

Process the code of all extra modules installed on the provided
database, and of all server actions and computed fields manually created
in the provided database.  
The `--addons-path` option is required to specify the path(s) to the
module folder(s).  
If combined with `--path`, the count will be that of the sum of both
options' results (with possible overlaps). At least one of these two
options is required to specify which code to process.

``` console
$ odoo-bin cloc --addons-path=addons -d my_database
```

<div class="seealso">

\- `reference/cmdline/cloc/database-option`

</div>

<div class="option">

-p \<path\>, --path \<path\>

</div>

Process the files in the provided path.  
If combined with `--database`, the count will be that of the sum of both
options' results (with possible overlaps). At least one of these two
options is required to specify which code to process.

``` console
$ odoo-bin cloc -p addons/account
```

Multiple paths can be provided by repeating the option.

``` console
$ odoo-bin cloc -p addons/account -p addons/sale
```

<div class="seealso">

\- `reference/cmdline/cloc/path-option`

</div>

<div class="option">

--addons-path \<directories\>

</div>

Comma-separated list of directories in which modules are stored. These
directories are scanned for modules.  
Required if the `--database` option is used.

<div class="option">

-c \<directories\>

</div>

Specify a configuration file to use in place of the `--addons-path`
option.

``` console
$ odoo-bin cloc -c config.conf -d my_database
```

<div class="option">

-v, --verbose

</div>

Show the details of lines counted for each file.

### Processed files

#### With the `--database` option

Konvergo ERP Cloc counts the lines in each file of extra installed modules in a
given database. In addition, it counts the Python lines of server
actions and custom computed fields that have been directly created in
the database or imported. Finally, it counts the lines of code of
Javascript, CSS, and SCSS files, and of QWeb views from imported
modules.

Some files are excluded from the count by default:

- The manifest (`__manifest__.py` or `__openerp__.py`)
- The contents of the folder `static/lib`
- The tests defined in the folder `tests` and `static/tests`
- The migrations scripts defined in the folder `migrations` and
  <span class="title-ref">upgrades</span>
- The XML files declared in the `demo` or `demo_xml` sections of the
  manifest

For special cases, a list of files that should be ignored by Konvergo ERP Cloc
can be defined per module. This is specified by the `cloc_exclude` entry
of the manifest:

``` python
"cloc_exclude": [
    "lib/common.py", # exclude a single file
    "data/*.xml",    # exclude all XML files in a specific folder
    "example/**/*",  # exclude all files in a folder hierarchy recursively
    "**/*.scss",     # exclude all scss file from the module
]
```

The pattern `**/*` can be used to ignore an entire module. This can be
useful to exclude a module from maintenance service costs.  
For more information about the pattern syntax, see
[glob](https://docs.python.org/3/library/pathlib.html#pathlib.Path.glob).

#### With the `--path` option

This method works the same as with the `--database option
<reference/cmdline/cloc/database-option>` if a manifest file is present
in the given folder. Otherwise, it counts all files.

### Identifying Extra Modules

To distinguish between standard and extra modules, Konvergo ERP Cloc uses the
following heuristic: modules that are located (real file system path,
after following symbolic links) in the same parent directory as the
`base`, `web` or `web_enterprise` standard modules are considered
standard. Other modules are treated as extra modules.

### Error Handling

Some file cannot be counted by Konvergo ERP Cloc. Those file are reported at the
end of the output.

#### Max file size exceeded

Konvergo ERP Cloc rejects any file larger than 25MB. Usually, source files are
smaller than 1 MB. If a file is rejected, it may be:

- A generated XML file that contains lots of data. It should be excluded
  in the manifest.
- A JavaScript library that should be placed in the `static/lib` folder.

#### Syntax Error

Konvergo ERP Cloc cannot count the lines of code of a Python file with a syntax
problem. If an extra module contains such files, they should be fixed to
allow the module to load. If the module works despite the presence of
those files, they are probably not loaded and should therefore be
removed from the module, or at least excluded in the manifest via
`cloc_exclude`.

## TSConfig Generator

<div class="program">

odoo-bin tsconfig

</div>

When working on javascript, there are ways to help your editor providing
you with powerful auto-completion. One of those ways is the use of a
tsconfig.json file. Originally meant for typescript, editors can use its
information with plain javascript also. With this config file, you will
now have full auto-completion across modules.

The command to generate this files takes as many unnamed arguments as
you need. Those are relative paths to your addon directories. In the
example below, we move up one folder to save the tsconfig file in the
folder containing community and enterprise.

``` console
$ community/odoo-bin tsconfig --addons-path community/addons,community/odoo/addons,enterprise > tsconfig.json
```
