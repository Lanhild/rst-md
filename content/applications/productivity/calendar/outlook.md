# Outlook Calendar synchronization

Synchronizing a user's Outlook Calendar with Odoo is useful for keeping
track of their tasks and appointments across all related applications.

<div class="seealso">

\- `/applications/general/auth/azure` -
`/administration/maintain/azure_oauth`

</div>

## Register the application with Microsoft Azure

To sync the Outlook Calendar with Odoo's Calendar, a Microsoft Azure
account is needed. Creating an account is free for users who have never
tried or paid for Azure. For more information, [click
here](https://azure.microsoft.com/en-us/free/?WT.mc_id=A261C142F).

Refer to [Microsoft's documentation
\<https://docs.microsoft.com/en-us/azure/active-directory/
develop/quickstart-create-new-tenant\>]() on how to set up an Microsoft
Entra ID (formally called *Microsoft Azure Active Directory (Azure
AD)*), which is a representation of an organization to manage and
register apps.

Then, [Register an Application
\<https://docs.microsoft.com/en-us/azure/active-directory/develop/
quickstart-register-app\>](), choosing the appropriate `Supported
account type`. Users who wish to connect their Outlook calendar to Odoo
should select the `Accounts in any
organizational directory (Any Microsoft Entra ID directory -
Multitenant) and personal Microsoft
accounts (e.g. Skype, Xbox)` option for `Supported account types`.

When configuring the `Redirect URI`, choose `Web` and copy the Odoo
database URI (URL) followed by
<span class="title-ref">/microsoft\_account/authentication</span>.

<div class="example">

Enter
<span class="title-ref">https://www.companyname.odoo.com/microsoft\_account/authentication</span>
for the `Redirect URI`.

</div>

![The "Supported account type" and "Redirect URI" settings in the
Microsoft Entra ID portal.](outlook/azure-register-application.png)

For more information on the restrictions and limitations of URIs, [check
this page \<https://docs.
microsoft.com/en-us/azure/active-directory/develop/reply-url\>]().

Regarding the application credentials, the user *must* add a client
secret, which allows Odoo to authenticate itself, requiring no
interaction from the user's side. `Certificates` are optional.

To do add a client secret, click `Add a certificate or secret` and then
click `New client secret`. Next, type a `Description` and select when
the client secret `Expires`.

Since resetting the synchronization can be tricky, Odoo recommends
setting the maximum allowed expiration date for the client secret (24
months), so there is no need to re-synchronize soon. Finally, click
`Add` to generate the client secret (`Secret ID`).

## Configuration in Odoo

In the Odoo database, go to `Settings --> General Settings -->
Integrations` and activate the `Outlook Calendar` setting.

![The "Outlook Calendar" setting activated in
Odoo.](outlook/outlook-calendar-setting.png)

From the Microsoft Azure portal, under the `Overview` section of the
application, copy the `Application (Client) ID`, and paste it into the
`Client ID` field in Odoo.

![The "Client ID" in the Microsoft Azure portal.](outlook/client-id.png)

In the Microsoft Azure portal, under the `Certificates & secrets`
section, copy the `Client Secret Value` and paste it into the `Client
Secret` field in Odoo.

![The "Client Secret" token to be copied from Microsoft to
Odoo.](outlook/client-secret-value.png)

Finally, on the Odoo `Settings --> General Settings` page, click `Save`.

## Sync with Outlook

<div class="warning">

<div class="title">

Warning

</div>

Odoo highly recommends testing the Outlook calendar synchronization on a
test database and a test email address (that is not used for any other
purpose) before attempting to sync the desired Outlook Calendar with the
user's production database.

If the user has any past, present, or future events on their Odoo
calendar before syncing their Outlook calendar, Outlook will treat the
events pulled from Odoo's calendar during the sync as new events,
causing an email notification to be sent from Outlook to all the event
attendees.

To avoid unwanted emails being sent to all past, present, and future
event attendees, the user must add the events from the Odoo calendar to
the Outlook calendar before the first ever sync, delete the events from
Odoo, and then start the sync.

Even after synchronizing the Odoo Calendar with the Outlook calendar,
Outlook will still send a notification to all event participants every
time an event is edited (created, deleted, unarchived, or event
date/time changed), with no exceptions. This is a limitation that cannot
be fixed from Odoo's side.

After one user syncs their Outlook calendar to the Odoo database,
unwanted email notifications are unavoidable because the first
synchronized user's events will be in the Odoo Calendar. If the Odoo
database is shared amongst multiple users, and another user wants to
sync their Outlook calendar with Odoo Calendar, Outlook will again pull
the existing Odoo Calendar events during the sync and treat them as new
events, causing Outlook to send email invitations to all event
attendees.

In summary, once a user synchronizes their Outlook calendar with the
Odoo calendar:

  - Creating an event in Odoo causes Outlook to send an invitation to
    all event attendees.
  - Deleting an event in Odoo causes Outlook to send a cancellation to
    all event attendees.
  - Unarchiving an event in Odoo causes Outlook to send an invitation to
    all event attendees.
  - Archiving an event in Odoo causes Outlook to send a cancellation to
    all event attendees.
  - Adding a contact to an event causes Outlook to send an invitation to
    all event attendees.
  - Removing a contact from an event causes Outlook to send a
    cancellation to all event attendees.

</div>

### Sync Odoo Calendar and Outlook

In the Odoo database, go to the `Calendar` module and click the
`Outlook` sync button. The page will redirect to a Microsoft login page,
and the user is asked to log in to their account, if they are not
already, and grant the required permissions.

![The "Outlook" sync button in Odoo
Calendar.](outlook/outlook-sync-button.png)

The synchronization is a two-way process, meaning that events are
reconciled in both accounts (Outlook and Odoo).

<div class="note">

<div class="title">

Note

</div>

All users that want to use the synchronization simply need to `sync
their calendar with
Outlook <outlook/sync>`. The configuration of Microsoft's Azure account
is only done once, as Microsoft Entra ID tenants' Client IDs and Client
Secrets are unique, and represent an organization that helps the user to
manage a specific instance of Microsoft cloud services for their
internal and external users.

</div>

<div class="seealso">

\- `../../sales/crm/optimize/outlook_extension` - `google`

</div>
