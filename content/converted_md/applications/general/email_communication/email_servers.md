# Send and receive emails in Odoo with an email server

## Odoo Online or Odoo.sh users

Since **Odoo sets up its own mail servers for the database**, outgoing
and incoming emails already work out-of-the-box. So for **Odoo Online**
and **Odoo.sh** customers, nothing needs to be done\!

Unless an external mail server is required to send large batches of mass
mailing, simply use the standard online Odoo database normally since it
has already been preconfigured for email.

## Scope of this documentation

This document is **mainly dedicated to Odoo on-premise users** who don't
benefit from an out-of-the-box solution to send and receive emails in
Odoo, unlike [Odoo Online \<https://www.odoo. com/trial\>]() and
[Odoo.sh](https://www.odoo.sh).

The following sections below contain information on how to integrate an
external email server with Odoo.

<div class="warning">

<div class="title">

Warning

</div>

If no one in the company is used to managing email servers, Odoo Online
and Odoo.sh are strongly recommended. Those Odoo hosting types' email
systems work instantly and are monitored by professionals. Nevertheless,
a company can use their own email server if they want to manage the
email server's reputation themselves.

</div>

<div class="note">

<div class="title">

Note

</div>

Office 365 email servers don't easily allow the sending of external
emails from hosts like Odoo. Refer to [Microsoft's documentation
\<https://support.office.com/en-us/article/How-to-set-up-a-
multifunction-device-or-application-to-send-email-using-Office-365-69f58e99-c550-4274-ad18-
c805d654b4c4\>]() to make it work.

</div>

## Manage outbound messages

As a system admin, go to `Settings --> General Settings --> Discuss` in
Odoo, and enable the `External Email Servers` option. Then, click
`Save`. Next, click `Outgoing Email Servers` and click `Create` to
create a new outgoing mail server record in Odoo. Reference the SMTP
data of the external email server. Once all the information has been
filled out, click `Test Connection`.

Here is a typical configuration for a G Suite server.

![The typical G Suite configuration on
Odoo.](email_servers/outgoing-server.png)

Then, go back to `Settings --> General Settings --> Discuss` and set the
email domain name in the `Alias Domain` name. Finally, click `Save` to
finish setting up the email server.

<div class="note">

<div class="title">

Note

</div>

If an <span class="title-ref">\[AUTHENTICATION FAILED\] Invalid
credentials (Failure)</span> warning appears when `Test Connection` is
clicked for a Gmail address, activate the `Less secure
app access` option. A direct link can be [accessed here
\<https://myaccount.google.com/ lesssecureapps?pli=1\>]().

In addition to that, enable the `IMAP setting` on the Gmail account.

</div>

### Use an Office 365 server

An Office 365 server can be used if the database's hosting type is
**Odoo on-premise**. Office 365 SMTP relays are not compatible with Odoo
Online or Odoo.sh unless Odoo is configured to `force the outgoing
"From" address <email_communication/default_from>`.

Please refer to [Microsoft's documentation
\<https://support.office.com/en-us/article/How-to-set-up-
a-multifunction-device-or-application-to-send-email-using-Office-365-69f58e99-c550-4274-ad18-
c805d654b4c4\>]() to configure an SMTP relay for the Odoo database's IP
address.

### Use a G Suite server

A G Suite server can be used for any Odoo hosting type. To do so, set up
the SMTP relay service. The configuration steps are explained in
<span class="title-ref">Google documentation
\<https://support.google.com /a/answer/2956491?hl=en\></span>\_\_.

### Restriction

Please note that port 25 is blocked for security reasons on Odoo Online
and Odoo.sh platforms. Try using ports 465, 587, or 2525 instead.

### Use a default "From" email address

Sometimes, an email's "From" (outgoing) address can belong to a
different domain, and that can be a problem.

For example, if a customer with the email address
*mary@customer.example.com* responds to a message, Odoo will try to
redistribute that same email to the other subscribers in the thread.
However, if the domain *customer.example.com* forbids that kind of usage
for security, the email that Odoo is trying to redistribute would get
rejected by some recipients' email servers.

To avoid that problem, make sure all emails use a "From" address from
the same authorized domain.

If the MTA supports [SRS (Sender Rewriting Scheme)
\<https://en.wikipedia.org/wiki/Sender\_Rewriting \_Scheme\>](), SRS can
be enabled to handle these situations. However, that is more complex and
requires more technical knowledge that is not meant to be covered by
this documentation.

Instead, Odoo can be configured to do something similar by itself:

1.  Set the `Alias Domain` name in the `Settings --> General Settings
    --> Discuss`.
    
    ![Setting the domain alias configuration on
    Odoo.](email_servers/alias-domain.png)

2.  Turn on `developer mode </applications/general/developer_mode>`.

3.  Go to `Settings --> Technical --> Parameters --> System Parameters`.

4.  Add one system parameter from the following list:
    
      - To use the same "From" address for *all* outgoing messages, use
        the key <span class="title-ref">mail.force.smtp.from</span> and
        set that address as value (such as
        <span class="title-ref">outgoing@mycompany.example.com</span>).
      - To keep the original "From" address for emails that use the same
        domain, but change it for emails that use a different domain,
        use the key
        <span class="title-ref">mail.dynamic.smtp.from</span> and set
        the value as the email address that should be used in those
        cases (such as
        <span class="title-ref">outgoing@mycompany.example.com</span> ).

## Manage inbound messages

Odoo relies on generic email aliases to fetch incoming messages.

  - **Reply messages** of messages sent from Odoo are routed to their
    original discussion thread (and to the inbox of all its followers)
    by the catchall alias (**catchall@**).
  - **Bounced messages** are routed to **bounce@** in order to track
    them in Odoo. This is especially used in [Odoo Email
    Marketing](https://www.odoo.com/page/email-marketing) to opt-out
    invalid recipients.
  - **Original messages**: Several business objects have their own alias
    to create new records in Odoo from incoming emails:
      - Sales Channel (to create Leads or Opportunities in [Odoo
        CRM](https://www.odoo.com/page/crm)),
      - Support Channel (to create Tickets in [Odoo
        Helpdesk](https://www.odoo.com/page/helpdesk)),
      - Projects (to create new Tasks in <span class="title-ref">Odoo
        Project \<https://www.odoo.com/page
        /project-management\></span>\_\_),
      - Job Positions (to create Applicants in
        <span class="title-ref">Odoo Recruitment
        \<https://www.odoo.com/page /recruitment\></span>\_\_),
      - etc.

Depending on the mail server, there might be several methods to fetch
emails. The easiest and most recommended method is to manage one email
address per Odoo alias in the mail server.

  - Create the corresponding email addresses in the mail server
    (catchall@, bounce@, sales@, etc.).

  - Set the `Alias Domain` name in `Settings --> General Settings -->
    Discuss`.

  - If the database's hosting type is Odoo on-premise, create an
    `Incoming Mail Server` in Odoo for each alias. This can be done from
    the General Settings as well. Fill out the form according to the
    email provider's settings. Leave the `Actions to Perform on Incoming
    Mails` field blank. Once all the information has been filled out,
    click on `TEST &
    CONFIRM`.
    
    ![Incoming mail server configuration on
    Odoo.](email_servers/incoming-server.png)

  - If the database's hosting type is Odoo Online or Odoo.sh,
    redirecting incoming messages to Odoo's domain name instead of the
    external email server is recommended. That way, incoming messages
    can be received without delay. Odoo Online only fetches incoming
    messages of external servers once every hour. Redirections for all
    email addresses should be set to Odoo's domain name in the email
    server (e.g. *catchall@mydomain.ext* to
    *catchall@mycompany.odoo.com*).

All the aliases are customizable in Odoo. Object aliases can be edited
from their respective configuration view.

<div class="tip">

<div class="title">

Tip

</div>

To edit catchall and bounce aliases, first activate the `developer mode
<developer-mode>`. Then, go to `Settings --> Technical --> Parameters
--> System Parameters` to customize the aliases (*mail.catchall.alias* &
*mail.bounce.alias*).

![System parameters with catchall configuration in
Odoo.](email_servers/system-parameters.png)

</div>

By default, inbound messages are fetched every 5 minutes in Odoo
on-premise.

<div class="note">

<div class="title">

Note

</div>

This value can be changed in `developer mode <developer-mode>`. Go to
`Settings --> Technical --> Automation --> Scheduled Actions` and look
for `Mail: Fetchmail Service`.

</div>

## Set up different dedicated servers for transactional and mass mails

In Odoo a separate Mail Transfer Agent (MTA) server can be used for
transactional emails and mass mailings. Example: Use Postmark or
SendinBlue for transactional emails, and Amazon SES, Mailgun or Sendgrid
for mass mailings.

<div class="tip">

<div class="title">

Tip

</div>

A default outgoing email server is already configured. Do not create an
alternative one unless a specific external outgoing email server is
needed for technical reasons.

</div>

To do this, first activate the `developer mode <developer-mode>`, and
then go to `Settings --> Technical --> Outgoing` email servers. There,
create two email MTA server settings; one for the transactional emails
and one for the mass mailing server. Make sure to give priority to the
transactional server over the mass mailing server by providing a lower
priority number for the transactional MTA server.

Now, go to `Email Marketing --> Settings` and enable `Dedicated Server`.
With these settings, Odoo uses the server with the lower priority for
transactional emails, and the server here selected for mass mails. Note
that in this case, the domain's Sender Policy Framework (SPF) records
must be set to include both transactional and mass mail servers.
