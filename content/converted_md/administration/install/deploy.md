# System configuration

This document describes basic steps to set up Odoo in production or on
an internet-facing server. It follows `installation <../install>`, and
is not generally necessary for a development systems that is not exposed
on the internet.

<div class="warning">

<div class="title">

Warning

</div>

If you are setting up a public server, be sure to check our `security`
recommendations\!

</div>

## dbfilter

Odoo is a multi-tenant system: a single Odoo system may run and serve a
number of database instances. It is also highly customizable, with
customizations (starting from the modules being loaded) depending on the
"current database".

This is not an issue when working with the backend (web client) as a
logged-in company user: the database can be selected when logging in,
and customizations loaded afterwards.

However it is an issue for non-logged users (portal, website) which
aren't bound to a database: Odoo needs to know which database should be
used to load the website page or perform the operation. If multi-tenancy
is not used that is not an issue, there's only one database to use, but
if there are multiple databases accessible Odoo needs a rule to know
which one it should use.

That is one of the purposes of `--db-filter <odoo-bin --db-filter>`: it
specifies how the database should be selected based on the hostname
(domain) that is being requested. The value is a [regular
expression](https://docs.python.org/3/library/re.html), possibly
including the dynamically injected hostname (`%h`) or the first
subdomain (`%d`) through which the system is being accessed.

For servers hosting multiple databases in production, especially if
`website` is used, dbfilter **must** be set, otherwise a number of
features will not work correctly.

### Configuration samples

  - Show only databases with names beginning with 'mycompany'

in `the configuration file <reference/cmdline/config_file>` set:

``` ini
[options]
dbfilter = ^mycompany.*$
```

  - Show only databases matching the first subdomain after `www`: for
    example the database "mycompany" will be shown if the incoming
    request was sent to `www.mycompany.com` or `mycompany.co.uk`, but
    not for `www2.mycompany.com` or `helpdesk.mycompany.com`.

in `the configuration file <reference/cmdline/config_file>` set:

``` ini
[options]
dbfilter = ^%d$
```

<div class="note">

<div class="title">

Note

</div>

Setting a proper `--db-filter <odoo-bin --db-filter>` is an important
part of securing your deployment. Once it is correctly working and only
matching a single database per hostname, it is strongly recommended to
block access to the database manager screens, and to use the
`--no-database-list` startup parameter to prevent listing your
databases, and to block access to the database management screens. See
also [security](#security).

</div>

## PostgreSQL

By default, PostgreSQL only allows connection over UNIX sockets and
loopback connections (from "localhost", the same machine the PostgreSQL
server is installed on).

UNIX socket is fine if you want Odoo and PostgreSQL to execute on the
same machine, and is the default when no host is provided, but if you
want Odoo and PostgreSQL to execute on different machines\[1\] it will
need to [listen to network
interfaces](https://www.postgresql.org/docs/9.6/static/runtime-config-connection.html)\[2\],
either:

  - Only accept loopback connections and [use an SSH
    tunnel](https://www.postgresql.org/docs/9.6/static/ssh-tunnels.html)
    between the machine on which Odoo runs and the one on which
    PostgreSQL runs, then configure Odoo to connect to its end of the
    tunnel
  - Accept connections to the machine on which Odoo is installed,
    possibly over ssl (see [PostgreSQL connection
    settings](https://www.postgresql.org/docs/9.6/static/runtime-config-connection.html)
    for details), then configure Odoo to connect over the network

### Configuration sample

  - Allow tcp connection on localhost
  - Allow tcp connection from 192.168.1.x network

in `/etc/postgresql/9.5/main/pg_hba.conf` set:

``` text
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
host    all             all             192.168.1.0/24          md5
```

in `/etc/postgresql/9.5/main/postgresql.conf` set:

``` text
listen_addresses = 'localhost,192.168.1.2'
port = 5432
max_connections = 80
```

### Configuring Odoo

Out of the box, Odoo connects to a local postgres over UNIX socket via
port 5432. This can be overridden using `the database options
<reference/cmdline/server/database>` when your Postgres deployment is
not local and/or does not use the installation defaults.

The `packaged installers <packages>` will automatically create a new
user (`odoo`) and set it as the database user.

  - The database management screens are protected by the `admin_passwd`
    setting. This setting can only be set using configuration files, and
    is simply checked before performing database alterations. It should
    be set to a randomly generated value to ensure third parties can not
    use this interface.

  - All database operations use the `database options
    <reference/cmdline/server/database>`, including the database
    management screen. For the database management screen to work
    requires that the PostgreSQL user have `createdb` right.

  - Users can always drop databases they own. For the database
    management screen to be completely non-functional, the PostgreSQL
    user needs to be created with `no-createdb` and the database must be
    owned by a different PostgreSQL user.
    
    <div class="warning">
    
    <div class="title">
    
    Warning
    
    </div>
    
    the PostgreSQL user *must not* be a superuser
    
    </div>

#### Configuration sample

  - connect to a PostgreSQL server on 192.168.1.2
  - port 5432
  - using an 'odoo' user account,
  - with 'pwd' as a password
  - filtering only db with a name beginning with 'mycompany'

in `the configuration file <reference/cmdline/config_file>` set:

``` ini
[options]
admin_passwd = mysupersecretpassword
db_host = 192.168.1.2
db_port = 5432
db_user = odoo
db_password = pwd
dbfilter = ^mycompany.*$
```

### SSL Between Odoo and PostgreSQL

Since Odoo 11.0, you can enforce ssl connection between Odoo and
PostgreSQL. in Odoo the db\_sslmode control the ssl security of the
connection with value chosen out of 'disable', 'allow', 'prefer',
'require', 'verify-ca' or 'verify-full'

[PostgreSQL
Doc](https://www.postgresql.org/docs/current/static/libpq-ssl.html)

## Builtin server

Odoo includes built-in HTTP, cron, and live-chat servers, using either
multi-threading or multi-processing.

The **multi-threaded** server is a simpler server primarily used for
development, demonstrations, and its compatibility with various
operating systems (including Windows). A new thread is spawned for every
new HTTP request, even for long-running requests such as long polling.
Extra daemonic cron threads are spawned too. Due to a Python limitation
(GIL), it doesn't make the best use of the hardware.

The multi-threaded server is the default server, also for docker
containers. It is selected by leaving the `--workers <odoo-bin
--workers>` option out or setting it to `0`.

The **multi-processing** server is a full-blown server primarily used
for production. It is not liable to the same Python limitation (GIL) on
resource usage and hence makes the best use of the hardware. A pool of
workers is created upon server startup. New HTTP requests are queued by
the OS until there are workers ready to process them. An extra
event-driven HTTP worker for the live chat is spawned on an alternative
port. Extra cron workers are spawned too. A configurable process reaper
monitors resource usage and can kill/restart failed workers.

The multi-processing server is opt-in. It is selected by setting the
`--workers
<odoo-bin --workers>` option to a non-null integer.

<div class="note">

<div class="title">

Note

</div>

Because it is highly customized for Linux servers, the multi-processing
server is not available on Windows.

</div>

### Worker number calculation

  - Rule of thumb : (\#CPU \* 2) + 1
  - Cron workers need CPU
  - 1 worker \~= 6 concurrent users

### memory size calculation

  - We consider 20% of the requests are heavy requests, while 80% are
    simpler ones
  - A heavy worker, when all computed field are well designed, SQL
    requests are well designed, ... is estimated to consume around 1GB
    of RAM
  - A lighter worker, in the same scenario, is estimated to consume
    around 150MB of RAM

Needed RAM = \#worker \* ( (light\_worker\_ratio \*
light\_worker\_ram\_estimation) + (heavy\_worker\_ratio \*
heavy\_worker\_ram\_estimation) )

### LiveChat

In multi-processing, a dedicated LiveChat worker is automatically
started and listens on the `--longpolling-port <odoo-bin
--longpolling-port>`. By default, the HTTP requests will keep accessing
the normal HTTP workers instead of the LiveChat one. You must deploy a
proxy in front of Odoo and redirect incoming requests whose path starts
with `/longpolling` to the LiveChat worker. You must also start Odoo in
`--proxy-mode <odoo-bin --proxy-mode>` so it uses the real client
headers (such as hostname, scheme, and IP) instead of the proxy ones.

### Configuration sample

  - Server with 4 CPU, 8 Thread
  - 60 concurrent users
  - 60 users / 6 = 10 \<- theorical number of worker needed
  - (4 \* 2) + 1 = 9 \<- theorical maximal number of worker
  - We'll use 8 workers + 1 for cron. We'll also use a monitoring system
    to measure cpu load, and check if it's between 7 and 7.5 .
  - RAM = 9 \* ((0.8\*150) + (0.2\*1024)) \~= 3Go RAM for Odoo

in `the configuration file <reference/cmdline/config_file>`:

``` ini
[options]
limit_memory_hard = 1677721600
limit_memory_soft = 629145600
limit_request = 8192
limit_time_cpu = 600
limit_time_real = 1200
max_cron_threads = 1
workers = 8
```

## HTTPS

Whether it's accessed via website/web client or web service, Odoo
transmits authentication information in cleartext. This means a secure
deployment of Odoo must use HTTPS\[3\]. SSL termination can be
implemented via just about any SSL termination proxy, but requires the
following setup:

  - Enable Odoo's `proxy mode <odoo-bin --proxy-mode>`. This should only
    be enabled when Odoo is behind a reverse proxy
  - Set up the SSL termination proxy ([Nginx termination
    example](https://nginx.com/resources/admin-guide/nginx-ssl-termination/))
  - Set up the proxying itself ([Nginx proxying
    example](https://nginx.com/resources/admin-guide/reverse-proxy/))
  - Your SSL termination proxy should also automatically redirect
    non-secure connections to the secure port

### Configuration sample

  - Redirect http requests to https
  - Proxy requests to odoo

in `the configuration file <reference/cmdline/config_file>` set:

``` ini
proxy_mode = True
```

in `/etc/nginx/sites-enabled/odoo.conf` set:

``` nginx
#odoo server
upstream odoo {
  server 127.0.0.1:8069;
}
upstream odoochat {
  server 127.0.0.1:8072;
}

# http -> https
server {
  listen 80;
  server_name odoo.mycompany.com;
  rewrite ^(.*) https://$host$1 permanent;
}

server {
  listen 443 ssl;
  server_name odoo.mycompany.com;
  proxy_read_timeout 720s;
  proxy_connect_timeout 720s;
  proxy_send_timeout 720s;

  # Add Headers for odoo proxy mode
  proxy_set_header X-Forwarded-Host $host;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_set_header X-Forwarded-Proto $scheme;
  proxy_set_header X-Real-IP $remote_addr;

  # SSL parameters
  ssl_certificate /etc/ssl/nginx/server.crt;
  ssl_certificate_key /etc/ssl/nginx/server.key;
  ssl_session_timeout 30m;
  ssl_protocols TLSv1.2;
  ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
  ssl_prefer_server_ciphers off;

  # log
  access_log /var/log/nginx/odoo.access.log;
  error_log /var/log/nginx/odoo.error.log;

  # Redirect longpoll requests to odoo longpolling port
  location /longpolling {
    proxy_pass http://odoochat;
  }

  # Redirect requests to odoo backend server
  location / {
    proxy_redirect off;
    proxy_pass http://odoo;
  }

  # common gzip
  gzip_types text/css text/scss text/plain text/xml application/xml application/json application/javascript;
  gzip on;
}
```

## Odoo as a WSGI Application

It is also possible to mount Odoo as a standard
[WSGI](https://wsgi.readthedocs.org/) application. Odoo provides the
base for a WSGI launcher script as `odoo-wsgi.example.py`. That script
should be customized (possibly after copying it from the setup
directory) to correctly set the configuration directly in
`odoo.tools.config` rather than through the command-line or a
configuration file.

However the WSGI server will only expose the main HTTP endpoint for the
web client, website and webservice API. Because Odoo does not control
the creation of workers anymore it can not setup cron or livechat
workers

### Cron Workers

Starting one of the built-in Odoo servers next to the WSGI server is
required to process cron jobs. That server must be configured to only
process crons and not HTTP requests using the `--no-http <odoo-bin
--no-http>` cli option or the `http_enable = False` configuration file
setting.

On Linux-like systems, using the multi-processing server over the
multi-threading one is recommended to benefit from better hardware usage
and increased stability, i.e., using the `--workers=-1 <odoo-bin
--workers>` and `--max-cron-threads=n
<odoo-bin --max-cron-threads>` cli options.

### LiveChat

Using a gevent-compatible WSGI server is required for the correct
operation of the live chat feature. That server should be able to handle
many simultaneous long-lived HTTP requests but doesn't need a lot of
processing power. All requests whose path starts with `/longpolling`
should be directed to that server. A regular (thread/process-based) WSGI
server should be used for all other requests.

The Odoo cron server can also be used to serve the live chat requests.
Just drop the `--no-http <odoo-bin --no-http>` cli option from the cron
server and make sure requests whose path starts with `/longpolling` are
directed to this server, either on the `--http-port <odoo-bin
--http-port>` (multi-threading server) or on the `--longpolling-port
<odoo-bin --longpolling-port>` (multi-processing server).

## Serving Static Files

For development convenience, Odoo directly serves all static files in
its modules. This may not be ideal when it comes to performances, and
static files should generally be served by a static HTTP server.

Odoo static files live in each module's `static/` folder, so static
files can be served by intercepting all requests to
`/{MODULE}/static/{FILE}`, and looking up the right module (and file) in
the various addons paths.

<div class="todo">

test whether it would be interesting to serve filestored attachments via
this, and how (e.g. possibility of mapping ir.attachment id to filestore
hash in the database?)

</div>

## Security

For starters, keep in mind that securing an information system is a
continuous process, not a one-shot operation. At any moment, you will
only be as secure as the weakest link in your environment.

So please do not take this section as the ultimate list of measures that
will prevent all security problems. It's only intended as a summary of
the first important things you should be sure to include in your
security action plan. The rest will come from best security practices
for your operating system and distribution, best practices in terms of
users, passwords, and access control management, etc.

When deploying an internet-facing server, please be sure to consider the
following security-related topics:

  - Always set a strong super-admin admin password, and restrict access
    to the database management pages as soon as the system is set up.
    See `db_manager_security`.

  - Choose unique logins and strong passwords for all administrator
    accounts on all databases. Do not use 'admin' as the login. Do not
    use those logins for day-to-day operations, only for
    controlling/managing the installation. *Never* use any default
    passwords like admin/admin, even for test/staging databases.

  - Do **not** install demo data on internet-facing servers. Databases
    with demo data contain default logins and passwords that can be used
    to get into your systems and cause significant trouble, even on
    staging/dev systems.

  - Use appropriate database filters ( `--db-filter <odoo-bin
    --db-filter>`) to restrict the visibility of your databases
    according to the hostname. See `db_filter`. You may also use `-d
    <odoo-bin -d>` to provide your own (comma-separated) list of
    available databases to filter from, instead of letting the system
    fetch them all from the database backend.

  - Once your `db_name` and `db_filter` are configured and only match a
    single database per hostname, you should set `list_db` configuration
    option to `False`, to prevent listing databases entirely, and to
    block access to the database management screens (this is also
    exposed as the `--no-database-list <odoo-bin --no-database-list>`
    command-line option)

  - Make sure the PostgreSQL user (`--db_user <odoo-bin --db_user>`) is
    *not* a super-user, and that your databases are owned by a different
    user. For example they could be owned by the `postgres` super-user
    if you are using a dedicated non-privileged `db_user`. See also
    `setup/deploy/odoo`.

  - Keep installations updated by regularly installing the latest
    builds, either via GitHub or by downloading the latest version from
    <https://www.odoo.com/page/download> or <http://nightly.odoo.com>

  - Configure your server in multi-process mode with proper limits
    matching your typical usage (memory/CPU/timeouts). See also
    `builtin_server`.

  - Run Odoo behind a web server providing HTTPS termination with a
    valid SSL certificate, in order to prevent eavesdropping on
    cleartext communications. SSL certificates are cheap, and many free
    options exist. Configure the web proxy to limit the size of
    requests, set appropriate timeouts, and then enable the `proxy mode
    <odoo-bin --proxy-mode>` option. See also `https_proxy`.

  - If you need to allow remote SSH access to your servers, make sure to
    set a strong password for **all** accounts, not just
    <span class="title-ref">root</span>. It is strongly recommended to
    entirely disable password-based authentication, and only allow
    public key authentication. Also consider restricting access via a
    VPN, allowing only trusted IPs in the firewall, and/or running a
    brute-force detection system such as
    <span class="title-ref">fail2ban</span> or equivalent.

  - Consider installing appropriate rate-limiting on your proxy or
    firewall, to prevent brute-force attacks and denial of service
    attacks. See also `login_brute_force` for specific measures.
    
    Many network providers provide automatic mitigation for Distributed
    Denial of Service attacks (DDOS), but this is often an optional
    service, so you should consult with them.

  - Whenever possible, host your public-facing demo/test/staging
    instances on different machines than the production ones. And apply
    the same security precautions as for production.

  - If your public-facing Odoo server has access to sensitive internal
    network resources or services (e.g. via a private VLAN), implement
    appropriate firewall rules to protect those internal resources. This
    will ensure that the Odoo server cannot be used accidentally (or as
    a result of malicious user actions) to access or disrupt those
    internal resources. Typically this can be done by applying an
    outbound default DENY rule on the firewall, then only explicitly
    authorizing access to internal resources that the Odoo server needs
    to access. [Systemd IP traffic access
    control](http://0pointer.net/blog/ip-accounting-and-access-lists-with-systemd.html)
    may also be useful to implement per-process network access control.

  - If your public-facing Odoo server is behind a Web Application
    Firewall, a load-balancer, a transparent DDoS protection service
    (like CloudFlare) or a similar network-level device, you may wish to
    avoid direct access to the Odoo system. It is generally difficult to
    keep the endpoint IP addresses of your Odoo servers secret. For
    example they can appear in web server logs when querying public
    systems, or in the headers of emails posted from Odoo. In such a
    situation you may want to configure your firewall so that the
    endpoints are not accessible publicly except from the specific IP
    addresses of your WAF, load-balancer or proxy service. Service
    providers like CloudFlare usually maintain a public list of their IP
    address ranges for this purpose.

  - If you are hosting multiple customers, isolate customer data and
    files from each other using containers or appropriate "jail"
    techniques.

  - Setup daily backups of your databases and filestore data, and copy
    them to a remote archiving server that is not accessible from the
    server itself.

  - Deploying Odoo on Linux is strongly recommended over Windows. Should
    you choose nevertheless to deploy on a Windows platform, a thorough
    security hardening review of the server should be conducted and is
    outside of the scope of this guide.

### Blocking Brute Force Attacks

For internet-facing deployments, brute force attacks on user passwords
are very common, and this threat should not be neglected for Odoo
servers. Odoo emits a log entry whenever a login attempt is performed,
and reports the result: success or failure, along with the target login
and source IP.

The log entries will have the following form.

Failed login:

    2018-07-05 14:56:31,506 24849 INFO db_name odoo.addons.base.res.res_users: Login failed for db:db_name login:admin from 127.0.0.1

Successful login:

    2018-07-05 14:56:31,506 24849 INFO db_name odoo.addons.base.res.res_users: Login successful for db:db_name login:admin from 127.0.0.1

These logs can be easily analyzed by an intrusion prevention system such
as <span class="title-ref">fail2ban</span>.

For example, the following fail2ban filter definition should match a
failed login:

    [Definition]
    failregex = ^ \d+ INFO \S+ \S+ Login failed for db:\S+ login:\S+ from <HOST>
    ignoreregex =

This could be used with a jail definition to block the attacking IP on
HTTP(S).

Here is what it could look like for blocking the IP for 15 minutes when
10 failed login attempts are detected from the same IP within 1 minute:

    [odoo-login]
    enabled = true
    port = http,https
    bantime = 900  ; 15 min ban
    maxretry = 10  ; if 10 attempts
    findtime = 60  ; within 1 min  /!\ Should be adjusted with the TZ offset
    logpath = /var/log/odoo.log  ;  set the actual odoo log path here

### Database Manager Security

`setup/deploy/odoo` mentioned `admin_passwd` in passing.

This setting is used on all database management screens (to create,
delete, dump or restore databases).

If the management screens must not be accessible at all, you should set
`list_db` configuration option to `False`, to block access to all the
database selection and management screens.

<div class="warning">

<div class="title">

Warning

</div>

It is strongly recommended to disable the Database Manager for any
internet-facing system\! It is meant as a development/demo tool, to make
it easy to quickly create and manage databases. It is not designed for
use in production, and may even expose dangerous features to attackers.
It is also not designed to handle large databases, and may trigger
memory limits.

On production systems, database management operations should always be
performed by the system administrator, including provisioning of new
databases and automated backups.

</div>

Be sure to setup an appropriate `db_name` parameter (and optionally,
`db_filter` too) so that the system can determine the target database
for each request, otherwise users will be blocked as they won't be
allowed to choose the database themselves.

If the management screens must only be accessible from a selected set of
machines, use the proxy server's features to block access to all routes
starting with `/web/database` except (maybe) `/web/database/selector`
which displays the database-selection screen.

If the database-management screen should be left accessible, the
`admin_passwd` setting must be changed from its `admin` default: this
password is checked before allowing database-alteration operations.

It should be stored securely, and should be generated randomly e.g.

``` console
$ python3 -c 'import base64, os; print(base64.b64encode(os.urandom(24)))'
```

which will generate a 32 characters pseudorandom printable string.

## Supported Browsers

Odoo supports all the major desktop and mobile browsers available on the
market, as long as they are supported by their publishers.

Here are the supported browsers:

  - Google Chrome
  - Mozilla Firefox
  - Microsoft Edge
  - Apple Safari

<div class="warning">

<div class="title">

Warning

</div>

Please make sure your browser is up-to-date and still supported by its
publisher before filing a bug report.

</div>

<div class="note">

<div class="title">

Note

</div>

Since Odoo 13.0, ES6 is supported. Therefore, IE support is dropped.

</div>

1.  to have multiple Odoo installations use the same PostgreSQL
    database, or to provide more computing resources to both software.

2.  technically a tool like [socat](http://www.dest-unreach.org/socat/)
    can be used to proxy UNIX sockets across networks, but that is
    mostly for software which can only be used over UNIX sockets

3.  or be accessible only over an internal packet-switched network, but
    that requires secured switches, protections against [ARP
    spoofing](https://en.wikipedia.org/wiki/ARP_spoofing) and precludes
    usage of WiFi. Even over secure packet-switched networks, deployment
    over HTTPS is recommended, and possible costs are lowered as
    "self-signed" certificates are easier to deploy on a controlled
    environment than over the internet.
