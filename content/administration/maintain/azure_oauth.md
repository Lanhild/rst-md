# Connect Microsoft Outlook 365 to Odoo using Azure OAuth

Odoo is compatible with Microsoft's Azure OAuth for Microsoft 365. In
order to send and receive secure emails from a custom domain, all that
is required is to configure a few settings on the Azure platform and on
the back end of the Odoo database. This configuration works with either
a personal email address or an address created by a custom domain.

<div class="tip">

<div class="title">

Tip

</div>

For more information, visit [Microsoft's documentation
\<https://learn.microsoft.com/en-us/azure/
active-directory/develop/quickstart-register-app\>]() on setting up
OAuth in Azure.

</div>

<div class="seealso">

\- `/applications/general/auth/azure` -
`/applications/productivity/calendar/outlook`

</div>

## Setup in Microsoft Azure Portal

### Create a new application

To get started, go to [Microsoft's Azure
Portal](https://portal.azure.com/). Log in with the `Microsoft Outlook
Office 365` account if there is one, otherwise log in with the personal
`Microsoft account`. A user with administrative access to the Azure
Settings will need to connect and perform the following configuration.
Next, navigate to the section labeled `Manage Microsoft Entra ID`
(formally *Azure Active Directory*).

Now, click on `Add (+)`, located in the top menu, and then select `App
registration`. On the `Register an application` screen, rename the
`Name` to <span class="title-ref">Odoo</span> or something recognizable.
Under the `Supported account types` section select `Accounts in any
organizational directory (Any Microsoft Entra ID directory -
Multitenant)
and personal Microsoft accounts (e.g. Skype, Xbox)`.

Under the `Redirect URL` section, select `Web` as the platform, and then
input <span class="title-ref">https://\<odoo base
url\>/microsoft\_outlook/confirm</span> in the `URL` field. The Odoo
base URL is the canonical domain at which your Odoo instance can be
reached (e.g. mydatabase.odoo.com if you are hosted on Odoo.com) in the
URL field. Then, click `Register` and the application is created.

### API permissions

The `API permissions` should be set next. Odoo will need specific API
permissions to be able to read (IMAP) and send (SMTP) emails in the
Microsoft 365 setup. First, click the `API permissions` link, located in
the left menu bar. Next, click on the `(+) Add a Permission` button and
select `Microsoft Graph` under `Commonly Used Microsoft APIs`. After,
select the `Delegated Permissions` option.

In the search bar, search for the following `Deregulated permissions`
and click `Add permissions` for each one:

  - `SMTP.Send`
  - `IMAP.AccessAsUser.All`

<div class="note">

<div class="title">

Note

</div>

The `User.Read` permission will be added by default.

</div>

![API permissions added for the app.](azure_oauth/permissions.png)

## Assign users and groups

After adding the API permissions, navigate back to the `Overview` of the
`Application` in the top of the left sidebar menu.

Now, add users to this application. Under the `Essentials` overview
table, click on the link labeled `Managed Application in Local
Directory`, or the last option on the bottom right-hand side of the
table.

![Link to the created application and to add
users/groups.](azure_oauth/managed-application.png)

In the left sidebar menu, select `Users and Groups`. Next, click on `(+)
Add
User/Group`. Depending on the account, either a `Group` and a `User` can
be added, or only `Users`. Personal accounts will only allow for `Users`
to be added.

Under `Users` or `Groups`, click on `None Selected` and add the users or
group of users that will be sending emails from the `Microsoft account`
in Odoo. `Add` the users/groups, click `Select`, and then `Assign` them
to the application.

### Create credentials

Now that the Microsoft Azure app is set up, credentials need to be
created for the Odoo setup. These include the `Client ID` and `Client
Secret`. To start, the `Client ID` can be copied from the `Overview`
page of the app. The `Client ID` or `Application ID` is located under
the `Display Name` in the `Essentials` overview of the app.

![Application/Client ID located in the Overview of the
app.](azure_oauth/application-id.png)

Next, the `Client Secret Value` needs to be retrieved. To get this
value, click on `Certificates & Secrets` in the left sidebar menu. Then,
a `Client Secret` needs to be produced. In order to do this, click on
the `(+) New Client Secret` button.

A window on the right will populate with a button labeled `Add a client
secret`. Under `Description`, type in <span class="title-ref">Odoo
Fetchmail</span> or something recognizable, and then set the `expiration
date`.

<div class="important">

<div class="title">

Important

</div>

A new `Client Secret` will need to be produced and configured if the
first one expires. In this event, there could be an interruption of
service, so the expiration date should be noted and set to the furthest
possible date.

</div>

Next, click on `Add` when these two values are entered. A `Client Secret
Value` and `Secret ID` will be created. It is important to copy the
`Value` or `Client Secret Value` into a notepad as it will become
encrypted after leaving this page. The `Secret ID` is not needed.

![Client Secret Value or Value in the app's
credentials.](azure_oauth/secretvalue.png)

After these steps, the following items should be ready to be set up in
Odoo:

  - A client ID (`Client ID` or `Application ID`)
  - A client secret (`Value` or `Client Secret Value`)

This completes the setup on the `Microsoft Azure Portal` side.

## Setup in Odoo

### Enter Microsoft Outlook credentials

First, open the Odoo database and navigate to the `Apps` module. Then,
remove the `Apps` filter from the search bar and type in
<span class="title-ref">Outlook</span>. After that, install the module
called `Microsoft Outlook`.

Next, navigate to `Settings --> General Settings`, and under the
`Discuss` section, ensure that the checkbox for `External Email Servers`
is checked. This populates a new option for `Outlook Credentials`.

`Save` the progress.

Then, copy and paste the `Client ID` (Application ID) and `Client Secret
(Client Secret Value)` into the respective fields and `Save` the
settings.

### Configure outgoing email server

On the `General Settings` page, under the `External Email Servers`
setting, click the `Outgoing Email Servers` link to configure the
Microsoft account.

Then, create a new email server and check the box for `Outlook`. Next,
fill in the `Description` (it can be anything) and the Microsoft Outlook
email `Username`.

Then, cick on `Connect your Outlook account`.

A new window from Microsoft opens to complete the `authorization
process`. Select the appropriate email address that is being configured
in Odoo.

![Permission page to grant access between newly created app and
Odoo.](azure_oauth/verify-outlook.png)

Then, allow Odoo to access the Microsoft account by clicking on `Yes`.
After this, the page will navigate back to the newly configured
`Outgoing Mail Server` in Odoo. The configuration automatically loads
the `token` in Odoo, and a tag stating `Outlook Token Valid` appears in
green.

Finally, click `Test Connection`. A confirmation message should appear.
The Odoo database can now send safe, secure emails through Microsoft
Outlook using OAuth authentication.

<div class="tip">

<div class="title">

Tip

</div>

To extend the server's use, set a `mail.force.smtp.from` system
parameter so that email is sent from a default *from email address* for
all emails sent from the database. The value of the system parameter
should be the `username` being configured in Microsoft Outlook.

</div>

<div class="note">

<div class="title">

Note

</div>

The `System Parameters` can be accessed by activating
`../../applications/general/developer_mode` in the `Settings -->
Technical
--> Parameters --> System Parameters` menu.

</div>

<div class="seealso">

\- `../../applications/general/email_communication/email_domain`

</div>
