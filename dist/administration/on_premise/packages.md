# Packaged installers

Konvergo ERP provides packaged installers for Debian-based Linux distributions
(Debian, Ubuntu, etc.), RPM-based Linux distributions (Fedora, CentOS,
RHEL, etc.), and Windows for the Community and Enterprise editions.

Official **Community** nightly packages with all relevant dependency
requirements are available on the [nightly
server](https://nightly.odoo.com).

> [!NOTE]
> Nightly packages may be difficult to keep up to date.

Official **Community** and **Enterprise** packages can be downloaded
from the [Konvergo ERP download page](https://www.odoo.com/page/download).

> [!NOTE]
> It is required to be logged in as a paying on-premise customer or
> partner to download the Enterprise packages.

## Linux

### Prepare

Konvergo ERP needs a [PostgreSQL](https://www.postgresql.org/) server to run
properly.

<div class="tabs">

<div class="group-tab">

Debian/Ubuntu

The default configuration for the Konvergo ERP 'deb' package is to use the
PostgreSQL server on the same host as the Konvergo ERP instance. Execute the
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

> [!WARNING]
> <span class="title-ref">wkhtmltopdf</span> is not installed through
> **pip** and must be installed manually in [version
> 0.12.6](https://github.com/wkhtmltopdf/packaging/releases/tag/0.12.6.1-3)
> for it to support headers and footers. Check out the [wkhtmltopdf
> wiki](https://github.com/odoo/odoo/wiki/Wkhtmltopdf) for more details
> on the various versions.

### Repository

Konvergo ERP S.A. provides a repository that can be used to install the
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

> [!NOTE]
> Currently, there is no nightly repository for the Enterprise edition.

### Distribution package

Instead of using the repository, packages for both the **Community** and
**Enterprise** editions can be downloaded from the [Konvergo ERP download
page](https://www.odoo.com/page/download).

<div class="tabs">

<div class="group-tab">

Debian/Ubuntu

> [!NOTE]
> Konvergo ERP {CURRENT_MAJOR_VERSION} 'deb' package currently supports [Debian
> Buster](https://www.debian.org/releases/buster/) and [Ubuntu
> 18.04](https://releases.ubuntu.com/18.04) or above.

Once downloaded, execute the following commands **as root** to install
Konvergo ERP as a service, create the necessary PostgreSQL user, and
automatically start the server:

``` console
# dpkg -i <path_to_installation_package> # this probably fails with missing dependencies
# apt-get install -f # should install the missing dependencies
# dpkg -i <path_to_installation_package>
```

> [!WARNING]
> - The <span class="title-ref">python3-xlwt</span> Debian package,
> needed to export into the XLS format, does not exist in Debian Buster
> nor Ubuntu 18.04. If needed, install it manually with the following:
>
> ``` console
> $ sudo pip3 install xlwt
> ```
>
> \- The <span class="title-ref">num2words</span> Python package -
> needed to render textual amounts - does not exist in Debian Buster nor
> Ubuntu 18.04, which could cause problems with the
> <span class="title-ref">l10n_mx_edi</span> module. If needed, install
> it manually with the following:
>
> ``` console
> $ sudo pip3 install num2words
> ```

</div>

<div class="group-tab">

Fedora

> [!NOTE]
> Konvergo ERP {CURRENT_MAJOR_VERSION} 'rpm' package supports Fedora 36.

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

> > [!WARNING]
> > Windows packaging is offered for the convenience of testing or
> > running single-user local instances but production deployment is
> > discouraged due to a number of limitations and risks associated with
> > deploying Konvergo ERP on a Windows platform.

1.  Download the installer from the [nightly
    server](https://nightly.odoo.com) (Community only) or the Windows
    installer from the [Konvergo ERP download
    page](https://www.odoo.com/page/download) (any edition.

2.  Execute the downloaded file.

    > [!WARNING]
    > On Windows 8 and later, a warning titled *Windows protected your
    > PC* may be displayed. Click **More Info** and then **Run anyway**
    > to proceed.

3.  Accept the [UAC](https://en.wikipedia.org/wiki/User_Account_Control)
    prompt.

4.  Go through the installation steps.

Konvergo ERP launches automatically at the end of the installation.
