# Hosting

## Change hosting solution

The instructions to change the hosting type of a database depend on the
current solution used and to which solution the database should be
moved.

## Transferring an on-premise database

### To Odoo Online

> [!IMPORTANT]
> - Odoo Online is *not* compatible with **non-standard apps**. - The
> database's current version must be `supported <supported_versions>`.

1.  Create a `duplicate of the database <on-premise/duplicate>`.
2.  In this duplicate, uninstall all **non-standard apps**.
3.  Use the database manager to grab a *dump with filestore*.
4.  [Submit a support ticket](https://www.odoo.com/help) including the
    following:
    - your **subscription number**,
    - the **URL** you want to use for the database (e.g.,
      <span class="title-ref">company.odoo.com</span>), and
    - the **dump** as an attachment or as a link to the file (required
      for 60 MB+ files).
5.  Odoo then makes sure the database is compatible before putting it
    online. In case of technical issues during the process, Odoo might
    contact you.

> [!NOTE]
> If you have time constraints, [submit a support
> ticket](https://www.odoo.com/help) as soon as possible to schedule the
> transfer.

### To Odoo.sh

Follow the instructions found in `the Import your database section
<odoo_sh_import_your_database>` of the Odoo.sh *Create your project*
documentation.

## Transferring an Odoo Online database

> [!IMPORTANT]
> Odoo Online's `intermediary versions <supported_versions>` are not
> supported by Odoo.sh or on-premise. Therefore, if the database to
> transfer is running an intermediary version, it must be upgraded first
> to the next `major version <supported_versions>`, waiting for its
> release if necessary.
>
> <div class="example">
>
> Transferring an online database running on Odoo 16.3 would require
> first upgrading it to Odoo 17.0.
>
> </div>
>
> > [!TIP]
> > Click the gear icon (`⚙`) next to the database name on the [Odoo
> > Online database manager](https://www.odoo.com/my/databases/) to
> > display its version number.
>
> > [!WARNING]
> > If there is an active Odoo subscription linked to the database being
> > migrated, reach out to the Customer Service Manager or [submit a
> > support ticket](https://www.odoo.com/help) to complete the
> > subscription transfer.

### To on-premise

1.  Sign in to [the Odoo Online database
    manager](https://www.odoo.com/my/databases/) and click the gear icon
    (`⚙`) next to the database name to `Download` a backup. If the
    download fails due to the file being too large, [contact Odoo
    support](https://www.odoo.com/help).
2.  Restore the database from the database manager on your local server
    using the backup.

### To Odoo.sh

1.  Sign in to [the Odoo Online database
    manager](https://www.odoo.com/my/databases/) and click the gear icon
    (`⚙`) next to the database name to `Download` a backup. If the
    download fails due to the file being too large, [contact Odoo
    support](https://www.odoo.com/help).
2.  Follow the instructions found in `the Import your database section
    <odoo_sh_import_your_database>` of the Odoo.sh *Create your project*
    documentation.

## Transferring an Odoo.sh database

### To Odoo Online

> [!IMPORTANT]
> Odoo Online is *not* compatible with **non-standard apps**.

1.  Uninstall all **non-standard apps** in a staging build before doing
    it in the production build.
2.  [Create a support ticket](https://www.odoo.com/help) including the
    following:
    - your **subscription number**,
    - the **URL** you want to use for the database (e.g.,
      <span class="title-ref">company.odoo.com</span>),
    - which **branch** should be migrated,
    - in which **region** you want the database to be hosted (Americas,
      Europe, or Asia),
    - which user(s) will be the **administrator(s)**, and
    - **when** (and in which timezone) you want the database to be up
      and running.
3.  Odoo then makes sure the database is compatible before putting it
    online. In case of technical issues during the process, Odoo might
    contact you.

> [!NOTE]
> - If you have time constraints, [submit a support
> ticket](https://www.odoo.com/help) as soon as possible to schedule the
> transfer. - Select the **region** closest to most of your users to
> reduce latency. - Future **administrator(s)** must have an Odoo.com
> account. - The **date and time** you want the database to be up and
> running are helpful to organize the switch from the Odoo.sh server to
> the Odoo Online servers. - Databases are **not reachable** during
> their migration.

### To on-premise

1.  Download a
    `backup of your Odoo.sh production database <odoo_sh_branches_backups>`.
2.  Restore the database from the database manager on your local server
    using the backup.
