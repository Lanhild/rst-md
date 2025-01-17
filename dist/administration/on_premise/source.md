# Source install

The source 'installation' is not about installing Konvergo ERP but running it
directly from the source instead.

Using the Konvergo ERP source can be more convenient for module developers as it
is more easily accessible than using packaged installers.

It makes starting and stopping Konvergo ERP more flexible and explicit than the
services set up by the packaged installers. Also, it allows overriding
settings using `command-line parameters
<reference/cmdline>` without needing to edit a configuration file.

Finally, it provides greater control over the system's setup and allows
to more easily keep (and run) multiple versions of Konvergo ERP side-by-side.

## Fetch the sources

There are two ways to obtain the source code of Konvergo ERP: as a ZIP
**archive** or through **Git**.

### Archive

Community edition:

- [Konvergo ERP download page](https://www.odoo.com/page/download)
- [GitHub Community repository](https://github.com/odoo/odoo)
- [Nightly server](https://nightly.odoo.com)

Enterprise edition:

- [Konvergo ERP download page](https://www.odoo.com/page/download)
- [GitHub Enterprise repository](https://github.com/odoo/enterprise)

### Git

> [!NOTE]
> It is required to have [Git](https://git-scm.com/) installed, and it
> is recommended to have a basic knowledge of Git commands to proceed.

To clone a Git repository, choose between cloning with HTTPS or SSH. In
most cases, the best option is HTTPS. However, choose SSH to contribute
to Konvergo ERP source code or when following the `Getting
Started developer tutorial </developer/tutorials/getting_started>`.

<div class="tabs">

<div class="group-tab">

Linux

<div class="tabs">

<div class="tab">

Clone with HTTPS

``` console
$ git clone https://github.com/odoo/odoo.git
$ git clone https://github.com/odoo/enterprise.git
```

</div>

<div class="tab">

Clone with SSH

``` console
$ git clone git@github.com:odoo/odoo.git
$ git clone git@github.com:odoo/enterprise.git
```

</div>

</div>

</div>

<div class="group-tab">

Windows

<div class="tabs">

<div class="tab">

Clone with HTTPS

``` doscon
C:\> git clone https://github.com/odoo/odoo.git
C:\> git clone https://github.com/odoo/enterprise.git
```

</div>

<div class="tab">

Clone with SSH

``` doscon
C:\> git clone git@github.com:odoo/odoo.git
C:\> git clone git@github.com:odoo/enterprise.git
```

</div>

</div>

</div>

<div class="group-tab">

Mac OS

<div class="tabs">

<div class="tab">

Clone with HTTPS

``` console
$ git clone https://github.com/odoo/odoo.git
$ git clone https://github.com/odoo/enterprise.git
```

</div>

<div class="tab">

Clone with SSH

``` console
$ git clone git@github.com:odoo/odoo.git
$ git clone git@github.com:odoo/enterprise.git
```

</div>

</div>

</div>

</div>

> [!NOTE]
> **The Enterprise git repository does not contain the full Konvergo ERP source
> code**. It is only a collection of extra add-ons. The main server code
> is in the Community edition. Running the Enterprise version means
> running the server from the Community version with the
> <span class="title-ref">addons-path</span> option set to the folder
> with the Enterprise edition. It is required to clone both the
> Community and Enterprise repositories to have a working Konvergo ERP
> Enterprise installation.

## Prepare

### Python

Konvergo ERP requires **Python 3.7** or later to run.

<div class="tabs">

<div class="group-tab">

Linux

Use a package manager to download and install Python 3 if needed.

</div>

<div class="group-tab">

Windows

[Download the latest version of Python
3](https://www.python.org/downloads/windows/) and install it.

During installation, check **Add Python 3 to PATH**, then click
**Customize Installation** and make sure that **pip** is checked.

</div>

<div class="group-tab">

Mac OS

Use a package manager ([Homebrew](https://brew.sh/),
[MacPorts](https://www.macports.org)) to download and install Python 3
if needed.

</div>

</div>

> [!NOTE]
> If Python 3 is already installed, make sure that the version is 3.7 or
> above, as previous versions are not compatible with Konvergo ERP.
>
> <div class="tabs">
>
> <div class="group-tab">
>
> Linux
>
> ``` console
> $ python3 --version
> ```
>
> </div>
>
> <div class="group-tab">
>
> Windows
>
> ``` doscon
> C:\> python --version
> ```
>
> </div>
>
> <div class="group-tab">
>
> Mac OS
>
> ``` console
> $ python3 --version
> ```
>
> </div>
>
> </div>
>
> Verify that [pip](https://pip.pypa.io) is also installed for this
> version.
>
> <div class="tabs">
>
> <div class="group-tab">
>
> Linux
>
> ``` console
> $ pip3 --version
> ```
>
> </div>
>
> <div class="group-tab">
>
> Windows
>
> ``` doscon
> C:\> pip --version
> ```
>
> </div>
>
> <div class="group-tab">
>
> Mac OS
>
> ``` console
> $ pip3 --version
> ```
>
> </div>
>
> </div>

### PostgreSQL

Konvergo ERP uses PostgreSQL as its database management system.

<div class="tabs">

<div class="group-tab">

Linux

Use a package manager to download and install PostgreSQL (supported
versions: 12.0 or above). It can be achieved by executing the following:

``` console
$ sudo apt install postgresql postgresql-client
```

</div>

<div class="group-tab">

Windows

[Download PostgreSQL](https://www.postgresql.org/download/windows)
(supported versions: 12.0 or above) and install it.

</div>

<div class="group-tab">

Mac OS

Use [Postgres.app](https://postgresapp.com) to download and install
PostgreSQL (supported version: 12.0 or above).

> [!TIP]
> To make the command line tools bundled with Postgres.app available,
> make sure to set up the <span class="title-ref">\$PATH</span> variable
> by following the [Postgres.app CLI tools
> instructions](https://postgresapp.com/documentation/cli-tools.html).

</div>

</div>

By default, the only user is <span class="title-ref">postgres</span>. As
Konvergo ERP forbids connecting as <span class="title-ref">postgres</span>,
create a new PostgreSQL user.

<div class="tabs">

<div class="group-tab">

Linux

``` console
$ sudo -u postgres createuser -d -R -S $USER
$ createdb $USER
```

> [!NOTE]
> Because the PostgreSQL user has the same name as the Unix login, it is
> possible to connect to the database without a password.

</div>

<div class="group-tab">

Windows

1.  Add PostgreSQL's <span class="title-ref">bin</span> directory (by
    default: `C:\\Program Files\\PostgreSQL\\<version>\\bin`) to the
    <span class="title-ref">PATH</span>.
2.  Create a postgres user with a password using the pg admin gui:
    1.  Open **pgAdmin**.
    2.  Double-click the server to create a connection.
    3.  Select `Object --> Create --> Login/Group Role`.
    4.  Enter the username in the **Role Name** field (e.g.,
        <span class="title-ref">odoo</span>).
    5.  Open the **Definition** tab, enter a password (e.g.,
        <span class="title-ref">odoo</span>), and click **Save**.
    6.  Open the **Privileges** tab and switch **Can login?** to
        <span class="title-ref">Yes</span> and **Create database?** to
        <span class="title-ref">Yes</span>.

</div>

<div class="group-tab">

Mac OS

``` console
$ sudo -u postgres createuser -d -R -S $USER
$ createdb $USER
```

> [!NOTE]
> Because the PostgreSQL user has the same name as the Unix login, it is
> possible to connect to the database without a password.

</div>

</div>

### Dependencies

<div class="tabs">

<div class="group-tab">

Linux

Using **distribution packages** is the preferred way of installing
dependencies. Alternatively, install the Python dependencies with
**pip**.

<div class="tabs">

<div class="tab">

Debian/Ubuntu

On Debian/Ubuntu, the following commands should install the required
packages:

``` console
$ cd odoo #CommunityPath
$ sudo ./setup/debinstall.sh
```

The <span class="title-ref">setup/debinstall.sh</span> script will parse
the [debian/control](%7BGITHUB_PATH%7D/debian/control) file and install
the found packages.

</div>

<div class="tab">

Install with pip

> [!WARNING]
> Using pip may lead to security issues and broken dependencies; only do
> this if you know what you are doing.

As some of the Python packages need a compilation step, they require
system libraries to be installed.

On Debian/Ubuntu, the following command should install these required
libraries:

``` console
$ sudo apt install python3-pip libldap2-dev libpq-dev libsasl2-dev
```

Konvergo ERP dependencies are listed in the `requirements.txt` file located at
the root of the Konvergo ERP Community directory.

> [!NOTE]
> The Python packages in `requirements.txt` are based on their
> stable/LTS Debian/Ubuntu corresponding version at the moment of the
> Konvergo ERP release. For example, for Konvergo ERP 15.0, the
> <span class="title-ref">python3-babel</span> package version is 2.8.0
> in Debian Bullseye and 2.6.0 in Ubuntu Focal. The lowest version is
> then chosen in the `requirements.txt`.

> [!TIP]
> It can be preferable not to mix Python module packages between
> different instances of Konvergo ERP or with the system. However, it is
> possible to use [virtualenv](https://pypi.org/project/virtualenv/) to
> create isolated Python environments.

Navigate to the path of the Konvergo ERP Community installation
(`CommunityPath`) and run **pip** on the requirements file to install
the requirements for the current user.

``` console
$ cd /CommunityPath
$ pip install -r requirements.txt
```

</div>

</div>

</div>

<div class="group-tab">

Windows

Before installing the dependencies, download and install the [Build
Tools for Visual Studio](https://visualstudio.microsoft.com/downloads/).
Select **C++ build tools** in the **Workloads** tab and install them
when prompted.

Konvergo ERP dependencies are listed in the
<span class="title-ref">requirements.txt</span> file located at the root
of the Konvergo ERP Community directory.

> > [!TIP]
> > It can be preferable not to mix Python module packages between
> > different instances of Konvergo ERP or with the system. However, it is
> > possible to use [virtualenv](https://pypi.org/project/virtualenv/)
> > to create isolated Python environments.

Navigate to the path of the Konvergo ERP Community installation
(<span class="title-ref">CommunityPath</span>) and run **pip** on the
requirements file in a terminal **with Administrator privileges**:

``` doscon
C:\> cd \CommunityPath
C:\> pip install setuptools wheel
C:\> pip install -r requirements.txt
```

</div>

<div class="group-tab">

Mac OS

Konvergo ERP dependencies are listed in the
<span class="title-ref">requirements.txt</span> file located at the root
of the Konvergo ERP Community directory.

> > [!TIP]
> > It can be preferable not to mix Python module packages between
> > different instances of Konvergo ERP or with the system. However, it is
> > possible to use [virtualenv](https://pypi.org/project/virtualenv/)
> > to create isolated Python environments.

Navigate to the path of the Konvergo ERP Community installation
(<span class="title-ref">CommunityPath</span>) and run **pip** on the
requirements file:

``` console
$ cd /CommunityPath
$ pip3 install setuptools wheel
$ pip3 install -r requirements.txt
```

> [!WARNING]
> Non-Python dependencies must be installed with a package manager
> ([Homebrew](https://brew.sh/), [MacPorts](https://www.macports.org)).
>
> 1.  Download and install the **Command Line Tools**:
>
>     ``` console
>     $ xcode-select --install
>     ```
>
> 2.  Use the package manager to install non-Python dependencies.

</div>

</div>

> [!NOTE]
> For languages using a **right-to-left interface** (such as Arabic or
> Hebrew), the <span class="title-ref">rtlcss</span> package is
> required.
>
> <div class="tabs">
>
> <div class="group-tab">
>
> Linux
>
> 1.  Download and install **nodejs** and **npm** with a package
>     manager.
>
> 2.  Install \`rtlcss\`:
>
>     ``` console
>     $ sudo npm install -g rtlcss
>     ```
>
> </div>
>
> <div class="group-tab">
>
> Windows
>
> 1.  Download and install [nodejs](https://nodejs.org/en/download).
>
> 2.  Install \`rtlcss\`:
>
>     ``` doscon
>     C:\> npm install -g rtlcss
>     ```
>
> 3.  Edit the system environment's variable
>     <span class="title-ref">PATH</span> to add the folder where
>     <span class="title-ref">rtlcss.cmd</span> is located (typically:
>     `C:\\Users\\<user>\\AppData\\Roaming\\npm\\`).
>
> </div>
>
> <div class="group-tab">
>
> Mac OS
>
> 1.  Download and install **nodejs** with a package manager
>     ([Homebrew](https://brew.sh/),
>     [MacPorts](https://www.macports.org)).
>
> 2.  Install \`rtlcss\`:
>
>     ``` console
>     $ sudo npm install -g rtlcss
>     ```
>
> </div>
>
> </div>

> [!WARNING]
> <span class="title-ref">wkhtmltopdf</span> is not installed through
> **pip** and must be installed manually in [version
> 0.12.6](https://github.com/wkhtmltopdf/packaging/releases/tag/0.12.6.1-3)
> for it to support headers and footers. Check out the [wkhtmltopdf
> wiki](https://github.com/odoo/odoo/wiki/Wkhtmltopdf) for more details
> on the various versions.

## Running Konvergo ERP

Once all dependencies are set up, Konvergo ERP can be launched by running
<span class="title-ref">odoo-bin</span>, the command-line interface of
the server. It is located at the root of the Konvergo ERP Community directory.

To configure the server, either specify
`command-line arguments <reference/cmdline/server>` or a
`configuration file <reference/cmdline/config>`.

> [!TIP]
> For the Enterprise edition, add the path to the
> <span class="title-ref">enterprise</span> add-ons to the
> <span class="title-ref">addons-path</span> argument. Note that it must
> come before the other paths in
> <span class="title-ref">addons-path</span> for add-ons to be loaded
> correctly.

Common necessary configurations are:

- PostgreSQL user and password.
- Custom addon paths beyond the defaults to load custom modules.

A typical way to run the server would be:

<div class="tabs">

<div class="group-tab">

Linux

``` console
$ cd /CommunityPath
$ python3 odoo-bin --addons-path=addons -d mydb
```

Where <span class="title-ref">CommunityPath</span> is the path of the
Konvergo ERP Community installation, and <span class="title-ref">mydb</span> is
the name of the PostgreSQL database.

</div>

<div class="group-tab">

Windows

``` doscon
C:\> cd CommunityPath/
C:\> python odoo-bin -r dbuser -w dbpassword --addons-path=addons -d mydb
```

Where <span class="title-ref">CommunityPath</span> is the path of the
Konvergo ERP Community installation, <span class="title-ref">dbuser</span> is
the PostgreSQL login, <span class="title-ref">dbpassword</span> is the
PostgreSQL password, and <span class="title-ref">mydb</span> is the name
of the PostgreSQL database.

</div>

<div class="group-tab">

Mac OS

``` console
$ cd /CommunityPath
$ python3 odoo-bin --addons-path=addons -d mydb
```

Where <span class="title-ref">CommunityPath</span> is the path of the
Konvergo ERP Community installation, and <span class="title-ref">mydb</span> is
the name of the PostgreSQL database.

</div>

</div>

After the server has started (the INFO log
<span class="title-ref">odoo.modules.loading: Modules loaded.</span> is
printed), open <http://localhost:8069> in a web browser and log into the
Konvergo ERP database with the base administrator account: use
<span class="title-ref">admin</span> as the email and, again,
<span class="title-ref">admin</span> as the password.

> [!TIP]
> - From there, create and manage new
> `users <../../applications/general/users>`. - The user account used to
> log into Konvergo ERP's web interface differs from the `--db_user
> <odoo-bin -r>` CLI argument.

<div class="seealso">

`The list of CLI arguments for odoo-bin </developer/reference/cli>`

</div>
