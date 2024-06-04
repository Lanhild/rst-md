# Outlook Plugin

Outlook allows for third-party applications to connect in order to
execute database actions from emails. Odoo has a plugin for Outlook that
allows for the creation of an opportunity from the email panel.

## Configuration

The Outlook `Mail Plugin <../mail_plugins>` needs to be configured both
on Odoo and Outlook.

### Enable Mail Plugin

First, enable the *Mail Plugin* feature in the database. Go to
`Settings --> General
Settings --> Integrations`, enable `Mail Plugin`, and `Save` the
configuration.

### Install the Outlook Plugin

Download (`Save Page As --> Web Page XML only`) the following XML file
to upload later:
<https://download.odoocdn.com/plugins/outlook/manifest.xml>.

Next, open the Outlook mailbox, and select any email. After completing
this, click on the `More actions` button in the upper right-side and
select `Get Add-ins`.

<img src="outlook/more-actions.png" class="align-center"
alt="More actions button in Outlook" />

> [!TIP]
> For locally installed versions of Microsoft Outlook, access the
> `Get Add-ins` menu item while in preview mode (**not** with a message
> open). First, click on the `...
> (ellipsis)` icon in the upper right of the previewed message, then
> scroll down, and click on `Get Add-ins`.

Following this step, select the `My add-ins` tab on the left-side.

<img src="outlook/my-add-ins.png" class="align-center"
alt="My add-ins in Outlook" />

Under `Custom add-ins` towards the bottom, click on
`+ Add a custom add-in`, and then on `Add from file...`

<img src="outlook/custom-add-ins.png" class="align-center"
alt="Custom add-ins in Outlook" />

For the next step, attach the
<span class="title-ref">manifest.xml</span> file downloaded above, and
press `OK`. Next, read the warning and click on `Install`.

<img src="outlook/add-in-warning.png" class="align-center"
alt="Custom add-in installation warning in Outlook" />

### Connect the database

Now, Outlook will be connected to the Odoo database. First, open any
email in the Outlook mailbox, click on the `More actions` button in the
upper right-side, and select `Odoo for
Outlook`.

<img src="outlook/odoo-for-outlook.png" class="align-center"
alt="Odoo for Outlook add-in button" />

The right-side panel can now display **Company Insights**. At the
bottom, click on `Login`.

<img src="outlook/panel-login.png" class="align-center"
alt="Logging in the Odoo database" />

> [!NOTE]
> Only a limited amount of **Company Insights** (*Lead Enrichment*)
> requests are available as a trial database. This feature requires
> `prepaid credits <mail_plugins/pricing>`.

> [!TIP]
> If, after a short while, the panel is still empty, it is possible that
> the browser cookie settings prevented it from loading. Note that these
> settings also change if the browser is in "Incognito" mode.
>
> To fix this issue, configure the browser to always allow cookies on
> Odoo's plugin page.
>
> For Google Chrome, change the browser cookie settings by following the
> guide at: <https://support.google.com/chrome/answer/95647> and adding
> <span class="title-ref">download.odoo.com</span> to the list of
> `Sites that can always use cookies`.
>
> Once this is complete, the Outlook panel needs to be opened again.

Now, enter the Odoo database URL and click on `Login`.

<img src="outlook/enter-database-url.png" class="align-center"
alt="Entering the Odoo database URL" />

Next, click on `Allow` to open the pop-up window.

<img src="outlook/new-window-warning.png" class="align-center"
alt="New window pop-up warning" />

If the user isn't logged into the database, enter the credentials. Click
on `Allow` to let the Outlook Plugin connect to the database.

<img src="outlook/odoo-permission.png" class="align-center"
alt="Allowing the Outlook Plugin to connect to a database" />

### Add a shortcut to the plugin

By default, the Outlook Plugin can be opened from the *More actions*
menu. However, to save time, it's possible to add it next to the other
default actions.

In the Outlook mailbox, click on `Settings`, then on `View all Outlook
settings`.

<img src="outlook/all-outlook-settings.png" class="align-center"
alt="Viewing all Outlook settings" />

Now, select `Customize actions` under `Mail`, click on `Odoo for
Outlook`, and then `Save`.

<img src="outlook/customize-actions.png" class="align-center"
alt="Odoo for Outlook customized action" />

Following this step, open any email; the shortcut should be displayed.

<img src="outlook/odoo-outlook-shortcut.png" class="align-center"
alt="Odoo for Outlook customized action" />

### Using the plugin

Now that the plug-in is installed and operational, all that needs to be
done to create a lead is to click on the
<span class="title-ref">O</span> \[Odoo icon\] or navigate to
`More actions` and click on `Odoo
for Outlook`. The side panel will appear on the right-side, and under
`Opportunities` click on `New`. A new window with the created
opportunity in the Odoo database will populate.
