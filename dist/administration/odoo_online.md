# Konvergo ERP Online

[Konvergo ERP Online](https://www.odoo.com/trial) provides private databases
which are fully managed and hosted by Konvergo ERP. It can be used for long-term
production or to test Konvergo ERP thoroughly, including customizations that
don't require code.

> [!NOTE]
> Konvergo ERP Online is incompatible with custom modules or the Konvergo ERP App Store.

Konvergo ERP Online databases are accessed using any web browser and do not
require a local installation.

To quickly try out Konvergo ERP, shared [demo](https://demo.odoo.com) instances
are available. No registration is required, but each instance only lives
for a few hours.

## Database management

To manage a database, go to the [database
manager](https://www.odoo.com/my/databases) and sign in as the database
administrator.

All the main database management options are available by clicking the
database name, except the upgrade option, which can be accessed by
clicking the **arrow in a circle** icon next to the database name. It is
only displayed if an upgrade is available.

![Accessing the database management options](odoo_online/database-manager.png)

- `odoo_online/upgrade`
- `odoo_online/duplicate`
- `odoo_online/rename`
- `odoo_online/download`
- `odoo_online/domains`
- `odoo_online/tags`
- `odoo_online/delete`
- `odoo_online/contact-support`
- `odoo_online/users`

## Upgrade

Trigger a database upgrade.

<div class="seealso">

For more information about the upgrade process, check out the
`Konvergo ERP Online upgrade
documentation <upgrade/request-test-database>`.

</div>

## Duplicate

Create an exact copy of the database, which can be used to perform
testing without compromising daily operations.

> [!IMPORTANT]
> - By checking `For testing purposes`, all external actions (emails,
> payments, delivery orders, etc.) are disabled by default on the
> duplicated database. - Duplicated databases expire automatically after
> 15 days. - A maximum of five duplicates can be made per database.
> Under extraordinary circumstances, contact
> [support](https://www.odoo.com/help) to raise the limit.

## Rename

Rename the database and its URL.

## Download

Download a ZIP file containing a backup of the database.

> [!NOTE]
> Databases are backed up daily as per the [Konvergo ERP Cloud Hosting
> SLA](https://www.odoo.com/cloud-sla).

## Domain names

Use a custom
`domain name </applications/websites/website/configuration/domain_names>`
to access the database via another URL.

> [!TIP]
> You can `register a domain name for free <domain-name/register>`.

## Tags

Add tags to easily identify and sort your databases.

> [!TIP]
> You can search for tags in the search bar.

## Delete

Delete a database instantly.

<div class="danger">

<div class="title">

Danger

</div>

Deleting a database means that all data is permanently lost. The
deletion is instant and applies to all users. It is recommended to
create a backup of the database before deleting it.

</div>

Carefully read the warning message and only proceed if the implications
of deleting a database are fully understood.

![The warning message displayed before deleting a database](odoo_online/delete.png)

> [!NOTE]
> - Only an administrator can delete a database. - The database name is
> immediately made available to anyone. - Deleting a database if it has
> expired or is linked to a subscription is impossible. In that case,
> contact [Konvergo ERP Support](https://www.odoo.com/help).

## Contact us

Access the [Konvergo ERP.com support page](https://www.odoo.com/help) with the
database's details already pre-filled.

## Invite / remove users

To invite users, fill out the new user's email address and click
`Invite`. To add multiple users, click `Add more users`.

![Inviting a user on a database](odoo_online/invite-users.png)

To remove users, select them and click `Remove`.

<div class="seealso">

\- `/applications/general/users` - `odoo_accounts`

</div>
