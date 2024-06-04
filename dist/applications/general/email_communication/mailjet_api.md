# Mailjet API

Odoo is compatible with Mailjet's
`API (Application Programming Interface)` for mass mailing. Set up a
dedicated mass mailing server through Mailjet by configuring settings in
the Mailjet account and the Odoo database. In some circumstances,
settings need to be configured on the custom domain's
`DNS (Domain Name System)` settings as well.

## Set up in Mailjet

### Create API credentials

To get started, sign in to the [Mailjet Account
Information](https://app.mailjet.com/account) page. Next, navigate to
the `Senders & Domains` section and click on `SMTP and
SEND API Settings`.

<img src="mailjet_api/api-settings.png" class="align-center"
alt="SMTP and Send API Settings link in the Senders &amp; Domains section of Mailjet." />

Then, copy the `SMTP (Simple Mail Transfer Protocol)` configuration
settings onto a notepad. They can be found under the
`Configuration (SMTP only)` section. The `SMTP (Simple
Mail Transfer Protocol)` configuration settings include the server
address, the security option needed (Use
`SSL (Secure Sockets Layer)`/`TLS (Transport Layer Security)`), and the
port number. The settings are needed to configure Mailjet in Odoo, which
is covered in the `last section <maintain/mailjet-api/odoo-setup>`.

<div class="seealso">

[Mailjet: How can I configure my SMTP
parameters?](https://documentation.mailjet.com/hc/articles/360043229473)

</div>

> [!IMPORTANT]
> Odoo blocks <span class="title-ref">port 25</span> on Odoo Online and
> Odoo.sh databases. `See reference here
> <email_servers/restriction>`.

<img src="mailjet_api/smtp-config.png" class="align-center"
alt="SMTP configuration from Mailjet." />

Next, click on the button labeled `Retrieve your API credentials` to
retrieve the Mailjet API credentials.

Then, click on the eye icon to reveal the `API key`. Copy this key to a
notepad, as this serves as the `Username` in the Odoo configuration.
Next, click on the `Generate Secret Key` button to generate the
`Secret Key`. Copy this key to a notepad, as this serves as the
`Password` in the Odoo configuration.

### Add verified sender address(es)

The next step is to add a sender address or a domain to the Mailjet
account settings so that the email address or domain is approved to send
emails using Mailjet's servers. First, navigate to the [Mailjet Account
Information](https://app.mailjet.com/account) page. Next, click on the
`Add a Sender Domain or Address` link under the `Senders & Domains`
section.

<img src="mailjet_api/add-domain-email.png" class="align-center"
alt="Add a sender domain or address in the Mailjet interface." />

Determine if a sender's email address or the entire domain needs to be
added to the Mailjet settings. It may be easier to configure the domain
as a whole if `DNS (Domain Name System)` access is available. Jump to
the `Add a domain <maintain/mailjet-api/add-domain>` section for steps
on adding the domain.

> [!NOTE]
> Either all email addresses of the Odoo database users who are sending
> emails using Mailjet's servers need to be configured or the domain(s)
> of the users' email addresses can be configured.

By default, the email address originally set up in the Mailjet account
is added as a trusted sender. To add another email address, click on the
button labeled `Add a sender address`. Then, add the email address that
is configured to send from the custom domain.

At minimum the following email addresses should be set up in the
provider and verified in Mailjet:

- notifications@yourdomain.com
- bounce@yourdomain.com
- catchall@yourdomain.com

> [!NOTE]
> Replace <span class="title-ref">yourdomain</span> with the custom
> domain for the Odoo database. If there isn't one, then use the
> `mail.catchall.domain` system parameter.

After that, fill out the `Email Information` form, making sure to select
the appropriate email type: transactional email or mass emails. After
completing the form, an activation email is sent to the email address
and the trusted sender can be activated.

It is recommended to set up the
`SPF (Sender Policy Framework)`/`DKIM (DomainKeys
Identified Mail)`/`DMARC (Domain-based Message Authentication, Reporting, and
Conformance)` settings on the domain of the sender.

<div class="seealso">

[Mailjet's SPF/DKIM/DMARC documentation
\<https://documentation.mailjet.com/hc/articles/
360042412734-Authenticating-Domains-with-SPF-DKIM\>]()

</div>

> [!IMPORTANT]
> If the database is not using a custom domain, then in order to verify
> the sender's address, a temporary alias (of the three email addresses
> mentioned above) should be set up in Odoo CRM to create a lead. Then,
> the database is able to receive the verification email and verify the
> accounts.

### Add a domain

By adding an entire domain to the Mailjet account, all the sender
addresses related to that domain are automatically validated for sending
emails using Mailjet servers. First, navigate to the [Mailjet Account
Information](https://app.mailjet.com/account) page. Next, click on
`Add a Sender Domain or Address` link under the `Senders & Domains`
section. Then, click on `Add domain` to add the custom domain.

> [!NOTE]
> The domain needs to be added to the Mailjet account and then validated
> through the `DNS
> (Domain Name System)`.

After that, fill out the `Add a new Domain` page on Mailjet and click
`Continue`.

After adding the domain, a validation page will populate. Unless the
Odoo database is on-premise (in which case, choose `Option 1`), choose
`Option 2: Create a DNS Record`. Copy the TXT record information to a
notepad and then navigate to the domain's `DNS (Domain
Name System)` provider to complete validation.

<img src="mailjet_api/host-value-dns.png" class="align-center"
alt="The TXT record information to input on the domain&#39;s DNS." />

#### Setup in the domain's DNS

After getting the TXT record information from the Mailjet account, add a
TXT record to the domain's `DNS (Domain Name System)`. This process
varies depending on the `DNS (Domain Name
System)` provider. Consult the provider for specific configuration
processes. The TXT record information consists of the `Host` and
`Value`. Paste these into the corresponding fields in the TXT record.

#### Return to Mailjet account information

After adding the TXT record to the domain's `DNS (Domain Name System)`,
navigate back to the Mailjet account. Then, navigate to
`Account Information --> Add a Sender Domain or
Address`, click the gear icon next to `Domain`, and select `Validate`.

This action can also be done by going to the [Sender domains & addresses
\<https://app.mailjet.com/ account/sender\>]() page on the Mailjet
account information and clicking on `Manage`.

Next, click `Check Now` to validate the TXT record that was added on the
domain. A success screen will appear if the domain is configured
correctly.

<img src="mailjet_api/check-dns.png" class="align-center"
alt="Check DNS record in Mailjet." />

After successfully setting up the domain, there is an option to
`Authenticate this domain
(SPF/DKIM)`. This button populates `SPF (Sender Policy Framework)` &
`` DKIM (DomainKeys
Identified Mail) records to input into the :abbr:`DNS (Domain Name System) ``
provider.

<div class="seealso">

[Mailjet's SPF/DKIM/DMARC documentation
\<https://documentation.mailjet.com/hc/articles/
360042412734-Authenticating-Domains-with-SPF-DKIM\>]()

</div>

<img src="mailjet_api/authenticate.png" class="align-center"
alt="Authenticate the domain with SPF/DKIM records in Mailjet." />

## Set up in Odoo

To complete the setup, navigate to the Odoo database and go to the
`Settings`. With `developer-mode` turned on, go to the
`Technical Menu --> Email --> Outgoing
Mail Servers`. Then, create a new outgoing server configuration by
clicking on the `Create` button.

Next, input the <span class="title-ref">SMTP server</span>
(in-v3.mailjet.com), <span class="title-ref">port number</span> (587 or
465), and <span class="title-ref">Security (SSL/TLS)</span> that was
copied earlier from the Mailjet account. They can also be found
[here](https://app.mailjet.com/account/setup). It is recommended to use
`SSL (Secure Sockets
Layer)`/`TLS (Transport Layer Security)` even though Mailjet may not
require it.

For the `Username`, input the `API KEY`. For the `Password`, input the
`SECRET KEY` that was copied from the Mailjet account to the notepad
earlier. These settings can be found on
`Mailjet -->  Account Settings --> SMTP and SEND API
Settings`.

Then, if the Mailjet server is used for mass emailing, set the
`Priority` value higher than that of any transactional email server(s).
Finally, save the settings and `Test the
Connection`.

<img src="mailjet_api/server-settings.png" class="align-center"
alt="Odoo outgoing email server settings." />

> [!IMPORTANT]
> In order for the notifications feature to work using Mailjet, there
> are three settings that need to be set in Odoo.
>
> 1.  The `From Filter` needs to be set on the server configuration. It
>     is recommended to set it as a domain and not a full email address.
>     It should match the domain in the two proceeding steps. More
>     information can be referenced `here
>     <email_communication/from_filter>`.
> 2.  The `mail.default.from` system parameter must have the value
>     <span class="title-ref">notifications@yourdomain.com</span>.
> 3.  The `mail.default.from_filter` system parameter must have the
>     value <span class="title-ref">yourdomain.com</span>. Replace
>     <span class="title-ref">yourdomain</span> with the custom domain
>     for the Odoo database. If there isn't one, then use the
>     `mail.catchall.domain` system parameter.
>
> For more information see
> `Using a default email address <email_communication/default>`.
>
> The `System Parameters` can be accessed by activating the
> `developer mode
> <developer-mode>`.

Once the setup is complete, the Odoo database is ready to use the
Mailjet email server for mass mailing or transactional emails!
