# Going live

Once you have finished all the web design and development work, it's
time to deploy it on a development or production database.

## Module import

### Odoo SaaS

Follow these steps the first time you import a module:

1.  Create a ZIP file of your module.
2.  Connect to the project database.
3.  Enable the `developer mode <developer-mode>`.
4.  Go to `Apps`, search for
    <span class="title-ref">base_import_module</span>, and install it if
    necessary.
5.  Click on `Import Module` in the menu.
6.  Upload your ZIP file, tick `Force init`, and click the `Import App`
    button.

If you need to re-import a module after making some changes, follow the
same steps, but before importing the module, open the developer menu and
select `Become Superuser`. To leave the Superuser mode, log out and log
back in.

> [!WARNING]
> The ZIP file size must be less than 50 MB.

<div class="seealso">

\- [Odoo eLearning: Register a Free Domain
Name](https://www.odoo.com/slides/slide/register-a-free-domain-name-1663)

</div>

### Odoo.sh

Go to `Apps` and click on `Update Apps List` in the menu. Search for
your module in the list and install it.

<div class="seealso">

`Introduction to Odoo.sh <../../../administration/odoo_sh/overview/introduction>`

</div>
