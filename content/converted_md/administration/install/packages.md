# Packaged installers

Odoo provides packaged installers for Debian-based Linux distributions
(Debian, Ubuntu, etc.), RPM-based Linux distributions (Fedora, CentOS,
RHEL, etc.), and Windows for the Community and Enterprise editions.

Official **Community** nightly packages with all relevant dependency
requirements are available on the [nightly
server](https://nightly.odoo.com).

<div class="note">

<div class="title">

Note

</div>

Nightly packages may be difficult to keep up to date.

</div>

Official **Community** and **Enterprise** packages can be downloaded
from the [Odoo download page](https://www.odoo.com/page/download).

<div class="note">

<div class="title">

Note

</div>

It is required to be logged in as a paying customer or partner to
download the Enterprise packages.

</div>

## Linux

### Prepare

Odoo needs a [PostgreSQL](https://www.postgresql.org/) server to run
properly.

<div class="tabs">

<div class="group-tab">

Debian/Ubuntu

The default configuration for the Odoo 'deb' package is to use the
PostgreSQL server on the same host as the Odoo instance. Execute the
following command to install the PostgreSQL server:

``` console
$ sudo apt install postgresql -y
```

</div>

<div class="group-tab">

Fedora

Make sure that the <span class="title-ref">sudo</span> command is
available and well configured and, only then, execute the following
command to install the PostgreSQL server:

``` console
$ sudo dnf install -y postgresql-server
$ sudo postgresql-setup --initdb --unit postgresql
$ sudo systemctl enable postgresql
$ sudo systemctl start postgresql
```

</div>

</div>

<div class="warning">

<div class="title">

Warning

</div>

<span class="title-ref">wkhtmltopdf</span> is not installed through
**pip** and must be installed manually in
[version 0.12.5](https://github.com/wkhtmltopdf/wkhtmltopdf/releases/tag/0.12.5)
for it to support headers and footers. Check out the [wkhtmltopdf
wiki](https://github.com/odoo/odoo/wiki/Wkhtmltopdf) for more details on
the various versions.

</div>

### Repository

Odoo S.A. provides a repository that can be used to install the
**Community** edition by executing the following commands:

<div class="tabs">

<div class="group-tab">

Debian/Ubuntu

``` console
$ wget -q -O - https://nightly.odoo.com/odoo.key | sudo gpg --dearmor -o /usr/share/keyrings/odoo-archive-keyring.gpg
$ echo 'deb [signed-by=/usr/share/keyrings/odoo-archive-keyring.gpg] https://nightly.odoo.com/{CURRENT_MAJOR_BRANCH}/nightly/deb/ ./' | sudo tee /etc/apt/sources.list.d/odoo.list
$ sudo apt-get update && sudo apt-get install odoo
```

Use the usual <span class="title-ref">apt-get upgrade</span> command to
keep the installation up-to-date.

</div>

<div class="group-tab">

Fedora

``` console
$ sudo dnf config-manager --add-repo=https://nightly.odoo.com/{CURRENT_MAJOR_BRANCH}/nightly/rpm/odoo.repo
$ sudo dnf install -y odoo
$ sudo systemctl enable odoo
$ sudo systemctl start odoo
```

</div>

</div>

<div class="note">

<div class="title">

Note

</div>

Currently, there is no nightly repository for the Enterprise edition.

</div>

### Distribution package

Instead of using the repository, packages for both the **Community** and
**Enterprise** editions can be downloaded from the [Odoo download
page](https://www.odoo.com/page/download).

<div class="tabs">

<div class="group-tab">

Debian/Ubuntu

<div class="note">

<div class="title">

Note

</div>

Odoo {CURRENT\_MAJOR\_VERSION} 'deb' package currently supports [Debian
Buster](https://www.debian.org/releases/buster/) and
[Ubuntu 18.04](https://releases.ubuntu.com/18.04) or above.

</div>

Once downloaded, execute the following commands **as root** to install
Odoo as a service, create the necessary PostgreSQL user, and
automatically start the server:

``` console
# dpkg -i <path_to_installation_package> # this probably fails with missing dependencies
# apt-get install -f # should install the missing dependencies
# dpkg -i <path_to_installation_package>
```

<div class="warning">

<div class="title">

Warning

</div>

\- The <span class="title-ref">python3-xlwt</span> Debian package,
needed to export into the XLS format, does not exist in Debian Buster
nor Ubuntu 18.04. If needed, install it manually with the following:

``` console
$ sudo pip3 install xlwt
```

\- The <span class="title-ref">num2words</span> Python package - needed
to render textual amounts - does not exist in Debian Buster nor Ubuntu
18.04, which could cause problems with the
<span class="title-ref">l10n\_mx\_edi</span> module. If needed, install
it manually with the following:

``` console
$ sudo pip3 install num2words
```

</div>

</div>

<div class="group-tab">

Fedora

<div class="note">

<div class="title">

Note

</div>

Odoo {CURRENT\_MAJOR\_VERSION} 'rpm' package supports Fedora 36.

</div>

Once downloaded, the package can be installed using the 'dnf' package
manager:

``` console
$ sudo dnf localinstall odoo_{CURRENT_MAJOR_BRANCH}.latest.noarch.rpm
$ sudo systemctl enable odoo
$ sudo systemctl start odoo
```

</div>

</div>

## Windows

> 
> 
> <div class="warning">
> 
> <div class="title">
> 
> Warning
> 
> </div>
> 
> Windows packaging is offered for the convenience of testing or running
> single-user local instances but production deployment is discouraged
> due to a number of limitations and risks associated with deploying
> Odoo on a Windows platform.
> 
> </div>

1.  Download the installer from the [nightly
    server](https://nightly.odoo.com) (Community only) or the Windows
    installer from the [Odoo download
    page](https://www.odoo.com/page/download) (any edition.

2.  Execute the downloaded file.
    
    <div class="warning">
    
    <div class="title">
    
    Warning
    
    </div>
    
    On Windows 8 and later, a warning titled *Windows protected your PC*
    may be displayed. Click **More Info** and then **Run anyway** to
    proceed.
    
    </div>

3.  Accept the [UAC](https://en.wikipedia.org/wiki/User_Account_Control)
    prompt.

4.  Go through the installation steps.

Odoo launches automatically at the end of the installation.
