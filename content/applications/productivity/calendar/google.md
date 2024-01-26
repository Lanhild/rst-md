# Synchronize Google calendar with Odoo

Synchronize Google Calendar with Odoo to see and manage meetings from
both platforms (updates go in both directions). This integration helps
organize schedules, so a meeting is never missed.

<div class="seealso">

\- `/applications/general/auth/google` -
`/administration/maintain/google_oauth`

</div>

## Setup in Google

### Select (or create) a project

Create a new Google API project and enable the Google Calendar API.
First, go to the [Google API
Console](https://console.developers.google.com) and log into the Google
account.

<div class="note">

<div class="title">

Note

</div>

If this is the first time visiting this page, Google will prompt the
user to enter a country and agree to the Terms of Service. Select a
country from the drop-down list and agree to the `ToS (Terms of
Service)`.

</div>

Next, click `Select a project` and select (or create) an API project to
configure OAuth in, and store credentials. Click `New Project`.

![Create a new API project to store
credentials.](google/new-api-project.png)

<div class="tip">

<div class="title">

Tip

</div>

Give the API Project a clear name, like "Odoo Sync", so it can be easily
identified.

</div>

### Enable Google calendar API

Now, click on `Enabled APIs and Services` in the left menu. Select
`Enabled APIs
and Services` again if the `Search bar` doesn't appear.

![Enable APIs and Services on the API
Project.](google/enable-apis-services.png)

After that, search for <span class="title-ref">Google Calendar
API</span> using the search bar and select `Google
Calendar API` from the search results. Click `Enable`.

![Enable the Google Calendar API.](google/enable-google-cal-api.png)

### OAuth consent screen

Now that the API project has been created, OAuth should be configured.
To do that, click on `OAuth consent` in the left menu and then select
the `User Type`.

<div class="warning">

<div class="title">

Warning

</div>

*Personal* Gmail Accounts are only allowed to be **External** User Type,
which means Google may require an approval, or for *Scopes* to be added
on. However, using a *Google WorkSpace* account allows for **Internal**
User Type to be used.

Note, as well, that while the API connection is in the *External*
testing mode, then no approval is necessary from Google. User limits in
this testing mode is set to 100 users.

</div>

In the second step, `OAuth Consent Screen`, type
<span class="title-ref">Odoo</span> in the `App name` field, select the
email address for the `User support email` field, and type the email
address for the `Developer contact information` section. Then, click
`Save and
Continue`.

Skip the third step, `Scopes`, by clicking `Save and Continue`.

Next, if continuing in testing mode (External), add the email addresses
being configured under the `Test users` step, by clicking on `Add
Users`, and then the `Save and
Continue` button. A summary of the app registration appears.

Finally, scroll to the bottom, and click on `Back to Dashboard`.

Now, the OAuth consent has been configured, and it's time to create
credentials.

### Create credentials

The *Client ID* and the *Client Secret* are both needed to connect
Google Calendar to Odoo. This is the last step in the Google console.
Begin by clicking `Credentials` in the left menu. Then, click `Create
Credentials`, and select `OAuth client ID`, Google will open a guide to
create credentials.

Under `Create OAuth Client ID`, select `Website application` for the
`Application Type` field, and type <span class="title-ref">My Odoo
Database</span> for the `Name`.

  - Under the `Authorized JavaScript Origins` section, click `+ Add URI`
    and type the company's Odoo full `URL (Uniform Resource Locator)`
    address.
  - Under the `Authorized redirect URIs` section, click `+ Add URI` and
    type the company's Odoo `URL (Uniform Resource Locator)` address
    followed by
    <span class="title-ref">/google\_account/authentication</span>.
    Finally, click `Create`.

![Add the authorized JavaScript origins and the authorized redirect
URIs.](google/uri.png)

A `Client ID` and `Client Secret` will appear, copy these to a notepad.

## Setup in Odoo

Once the *Client ID* and the *Client Secret* are located, open the Odoo
database and go to `Settings --> General Settings --> Integrations -->
Google Calendar`. Check the box next to `Google Calendar`.

![The Google Calendar checkbox in General
Settings.](google/settings-google-cal.png)

Next, copy and paste the *Client ID* and the *Client Secret* from the
Google Calendar API credentials page into their respective fields below
the `Google Calendar` checkbox. Then, click `Save`.

## Sync calendar in Odoo

Finally, open the `Calendar` app in Odoo and click on the `Google` sync
button to sync Google Calendar with Odoo.

![Click the Google sync button in Odoo Calendar to sync Google Calendar
with Odoo.](google/sync-google.png)

<div class="note">

<div class="title">

Note

</div>

When syncing Google Calendar with Odoo for the first time, the page will
redirect to the Google Account. From there, select the `Email Account`
that should have access, then select `Continue` (should the app be
unverifed), and finally select `Continue` (to give permission for the
transfer of data)\`.

</div>

![Give Odoo permission to access Google
Calendar.](google/trust-odoo.png)

Now, Odoo Calendar is successfully synced with Google Calendar\!

<div class="warning">

<div class="title">

Warning

</div>

Odoo highly recommends testing the Google calendar synchronization on a
test database and a test email address (that is not used for any other
purpose) before attempting to sync the desired Google Calendar with the
user's production database.

Once a user synchronizes their Google calendar with the Odoo calendar:

  - Creating an event in Odoo causes Google to send an invitation to all
    event attendees.
  - Deleting an event in Odoo causes Google to send a cancellation to
    all event attendees.
  - Adding a contact to an event causes Google to send an invitation to
    all event attendees.
  - Removing a contact from an event causes Google to send a
    cancellation to all event attendees.

Events can be created in Google Calendar without sending a notification
by selecting `Don't Send` when prompted to send invitation emails.

</div>
