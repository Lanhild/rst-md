# Unsplash

**Unsplash** is a recognized stock photography library integrated with
Odoo.

If your database is hosted on **Odoo Online**, you can access Unsplash
pictures without configuration.

If your database is hosted on **Odoo.sh or on-premise**, proceed as
follows:

1.  To **generate an Unsplash access key**, create or sign in to an
    [Unsplash account](https://unsplash.com).
2.  Access your [applications
    dashboard](https://unsplash.com/oauth/applications), click
    `New Application`, select all checkboxes, and click `Accept terms`.
3.  In the pop-up window, enter your `Application Name`, starting with
    the prefix <span class="title-ref">Odoo:</span> (e.g.,
    <span class="title-ref">Odoo: connection</span>), so Unsplash
    recognizes it as an Odoo instance. Then, add a `Description` and
    click `Create application`.
4.  On the application details page, scroll down to the `Keys` section
    and copy the `Access Key` and `Application ID`.
5.  In Odoo, go to `General Settings` and enable the `Unsplash Image
    Library` feature. Then, enter the Unsplash `Access Key` and
    `Application ID`.

> [!WARNING]
> As a non-Odoo Online user, you are limited to a test key with a
> maximum of 50 Unsplash requests per hour.
