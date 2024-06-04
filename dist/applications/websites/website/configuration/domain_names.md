# Domain names

Domain names are text-based addresses identifying online locations, such
as websites. They provide a more memorable and recognizable way for
people to navigate the internet than numerical IP addresses.

**Odoo Online** and **Odoo.sh** databases use a **subdomain** of the
<span class="title-ref">odoo.com</span> **domain** by default (e.g.,
<span class="title-ref">mycompany.odoo.com</span>).

However, you can use a custom domain name instead by
`registering a free domain name
<domain-name/register>` (only available for Odoo Online databases) or by
`configuring a
domain name you already own <domain-name/existing>`.

<div class="seealso">

[Odoo Tutorials: Register a free domain name
\[video\]](https://www.odoo.com/slides/slide/register-a-free-domain-name-1663)

</div>

## Register a free domain name with Odoo

To register a one-year free domain name for your Odoo Online database,
sign in to your account and go to the [database
manager](https://www.odoo.com/my/databases). Click the gear icon (`⚙️`)
next to the database name and select `Domain Names`.

![Accessing a database's domain names configuration](domain_names/domain-names.png)

Search for the desired domain name and check its availability.

![Searching for an available domain name](domain_names/domain-search.png)

> [!TIP]
> Ensure the Website app is installed if the domain name registration
> option does not appear.

Select the desired domain name, fill in the `Domain Owner` form, and
click `Register`. The chosen domain name is directly linked to the
database.

![Filling in the domain owner information](domain_names/domain-owner.png)

Next, you should
`map your domain name to your Odoo website <domain-name/website-map>`.

> [!IMPORTANT]
> A verification email from
> <span class="title-ref">noreply@domainnameverification.net</span> will
> be sent to the email address provided in the `Domain Owner` form. It
> is essential to verify your email address to keep the domain active
> and receive the renewal quote before expiration.

The domain name registration is free for the first year. After this
period, Odoo will continue to manage the domain in partnership with
**Gandi.net**, the domain name registrar, and you will be charged
[Gandi.net's renewal rate](https://www.gandi.net/en/domain). Odoo sends
a renewal quotation every year to the email address mentioned in the
`Domain Owner` form several weeks before the expiration date of the
domain. The domain is renewed automatically when the quotation is
confirmed.

> [!NOTE]
> - The offer is only available for **Odoo Online** databases. - The
> offer is limited to **one** domain name per client. - The offer is
> limited to the registration of a **new** domain name. - The offer is
> available to *One App Free* plans. Ensure that your website contains
> enough original content for Odoo to verify that your request is
> legitimate and respects [Odoo's Acceptable Use
> Policy](https://www.odoo.com/acceptable-use). Given the high number of
> requests, it can take Odoo several days to review them.

### DNS records

To manage your free domain name `DNS (domain name system)` records, open
the [database manager](https://www.odoo.com/my/databases), click the
gear icon (`⚙️`) next to the database name, select `Domain Names`, and
click `DNS`.

- `A`: the A record holds the IP address of the domain. It is
  automatically created and **cannot** be edited or deleted.
- `CNAME`: CNAME records forward one domain or subdomain to another
  domain. One is automatically created to map the
  <span class="title-ref">www.</span> subdomain to the database. If the
  database is renamed, the CNAME record **must** also be renamed.
- `MX`: MX records instruct servers on where to deliver emails.
- `TXT`: TXT records can be used for different purposes (e.g., to verify
  domain name ownership).

Any modification to the DNS records can take up to **72 hours** to
propagate worldwide on all servers.

> [!NOTE]
> [Submit a support ticket](https://www.odoo.com/help) if you need
> assistance to manage your domain name.

### Mailbox

The one-year free domain name offer does **not** include a mailbox.
There are two options to link your domain name with a mailbox.

#### Use a subdomain

You can create a subdomain (e.g.,
<span class="title-ref">subdomain.yourdomain.com</span>) to use as an
alias domain for the database. It allows users to create records in the
database from emails received on their
<span class="title-ref">email@subdomain.yourdomain.com</span> alias.

To do so, open the [database
manager](https://www.odoo.com/my/databases), click the gear icon (`⚙️`)
next to the database name, and go to `Domain Names --> DNS --> Add
DNS record --> CNAME`. Next, enter the desired subdomain in the `Name`
field (e.g., <span class="title-ref">subdomain</span>), the original
database domain with a period at the end (e.g.,
<span class="title-ref">mycompany.odoo.com.</span>) in the `Content`
field, and click `Add record`.

Then, add the alias domain as your *own domain* by clicking
`Use my own domain`, entering the alias domain (e.g.,
<span class="title-ref">subdomain.yourdomain.com</span>), clicking
`Verify`, and then `I confirm, it's done`.

Finally, go to your database and open the `Settings`. Enable
`Custom Email
Servers`, enter the `Alias Domain` (e.g.,
<span class="title-ref">subdomain.yourdomain.com</span>) and click
`Save`.

#### Use an external email provider

To use an external email provider, you should configure an MX record. To
do so, open the [database manager](https://www.odoo.com/my/databases),
click the gear icon (`⚙️`) next to the database name, click
`Domain Names --> DNS --> Add DNS record --> MX`. The values you should
enter for the `Name`, `Content`, and `Priority` fields depend on the
external email provider.

<div class="seealso">

\- [Google Workspace: MX record
values](https://support.google.com/a/answer/174125?hl=en) - [Outlook and
Exchange Online: Add an MX record for
email](https://learn.microsoft.com/en-us/microsoft-365/admin/get-help-with-domains/create-dns-records-at-any-dns-hosting-provider?view=o365-worldwide#add-an-mx-record-for-email-outlook-exchange-online)

</div>

## Configure an existing domain name

If you already have a domain name, you can use it for your Odoo website.

> [!WARNING]
> It is strongly recommended to follow **in order** these three steps to
> avoid any `SSL
> certificate validation <domain-name/ssl>` issues:
>
> 1.  `Add a CNAME record <domain-name/cname>`
> 2.  `Map your domain name to your Odoo database <domain-name/db-map>`
> 3.  `Map your domain name to your Odoo website <domain-name/website-map>`

### Add a CNAME record

Adding a CNAME record to forward your domain name to the address of your
Odoo database is required.

<div class="tabs">

<div class="group-tab">

Odoo Online

The CNAME record's target address should be your database's address as
defined at its creation (e.g.,
<span class="title-ref">mycompany.odoo.com</span>).

</div>

<div class="group-tab">

Odoo.sh

The CNAME record's target address should be the project's main address,
which can be found on Odoo.sh by going to `Settings --> Project Name`,
or a specific branch (production, staging or development) by going to
`Branches --> select the
branch --> Settings --> Custom domains`, and clicking
`How to set up my domain?`. A message indicates which address your CNAME
record should target.

</div>

</div>

The specific instructions depend on your DNS hosting service.

<div class="seealso">

\- [GoDaddy: Add a CNAME
record](https://www.godaddy.com/help/add-a-cname-record-19236) -
[Namecheap: How to create a CNAME record for your
domain](https://www.namecheap.com/support/knowledgebase/article.aspx/9646/2237/how-to-create-a-cname-record-for-your-domain) -
[OVHcloud: Add a new DNS
record](https://docs.ovh.com/us/en/domains/web_hosting_how_to_edit_my_dns_zone/#add-a-new-dns-record) -
[Cloudflare: Manage DNS
records](https://support.cloudflare.com/hc/en-us/articles/360019093151)

</div>

> [!IMPORTANT]
> Odoo only supports subdomains. To use your naked domain name
> `(a domain name without any
> subdomains or prefixes)`
> (<span class="title-ref">yourdomain.com</span>), create a redirection
> 301 to redirect visitors to
> <span class="title-ref">www.yourdomain.com</span>.

<div class="example">

You own the domain name <span class="title-ref">yourdomain.com</span>,
and your Odoo Online database's address is
<span class="title-ref">mycompany.odoo.com</span>. You want to access
your Odoo database primarily with the domain
<span class="title-ref">www.yourdomain.com</span> and also with the
naked domain <span class="title-ref">yourdomain.com</span>.

To do so, create a CNAME record for the
<span class="title-ref">www</span> subdomain, with
<span class="title-ref">mycompany.odoo.com</span> as the target. Next,
create a redirect (301 permanent or visible redirect) to redirect
visitors from <span class="title-ref">yourdomain.com</span> to
<span class="title-ref">wwww.yourdomain.com</span>.

</div>

### Map a domain name to an Odoo database

> [!WARNING]
> Ensure you have `added a CNAME record <domain-name/cname>` to your
> domain name's DNS **before** mapping your domain name to your Odoo
> database.
>
> Failing to do so may prevent the validation of the
> `SSL certificate <domain-name/ssl>` and could result in a *certificate
> name mismatch* error. Web browsers often display this as a warning,
> such as *"Your connection is not private"*.
>
> If you encounter this error after mapping the domain name to your
> database, wait up to five days, as the validation may still happen. If
> not, you can [submit a support ticket](https://www.odoo.com/help),
> including screenshots of your CNAME records.

<div class="tabs">

<div class="group-tab">

Odoo Online

Open the [database manager](https://www.odoo.com/my/databases), click
the gear icon (`⚙️`) next to the database name, and go to
`Domain Names --> Use my
own domain`. Then, enter the domain name (e.g.,
<span class="title-ref">yourdomain.com</span>), click `Verify` and
`I confirm, it's done`.

![Mapping a domain name to an Odoo Online database](domain_names/map-database-online.png)

</div>

<div class="group-tab">

Odoo.sh

On Odoo.sh, go to
`Branches --> select your branch --> Settings --> Custom
domains`, type the domain name to add, then click `Add domain`.

![Mapping a domain name to an Odoo.sh branch](domain_names/map-database-sh.png)

<div class="seealso">

`Odoo.sh branches: settings tab <odoosh-gettingstarted-branches-tabs-settings>`

</div>

</div>

</div>

#### SSL encryption (HTTPS protocol)

**SSL encryption** allows visitors to navigate a website through a
secure connection, which appears as the *https://* protocol at the
beginning of a web address rather than the non-secure *http://*
protocol.

Odoo generates a separate SSL certificate for each domain
`mapped to a database
<domain-name/db-map>` using [Let's Encrypt's certificate authority and
ACME protocol](https://letsencrypt.org/how-it-works/).

> [!NOTE]
> - Certificate generation may take up to 24 hours. - Several attempts
> to validate your certificate are made for five days after you map your
> domain name to your database. - If you use another service, you can
> keep using it or change to Odoo's.

> [!IMPORTANT]
> No SSL certificate is generated for naked domains
> `(domain names without any subdomains
> or prefixes)`.

#### Web base URL of a database

> [!NOTE]
> If the Website app is installed on your database, skip this section
> and continue from the
> `Map a domain name to a website <domain-name/website-map>` section.

The *web base URL* or root URL of a database affects your main website
address and all the links sent to your customers (e.g., quotations,
portal links, etc.).

To make your custom domain name the *web base URL* of your database,
access your database using your custom domain name and log in as an
administrator `(a user part of the Settings access right
group under Administration)`.

> [!IMPORTANT]
> If you access your database with the original Odoo address (e.g.,
> <span class="title-ref">mycompany.odoo.com</span>), the *web base URL*
> of your database will be updated accordingly. To prevent the automatic
> update of the *web base URL* when an administrator logs in to the
> database, activate the `developer mode
> <developer-mode>`, go to
> `Settings --> Technical --> System Parameters --> New`, and enter
> <span class="title-ref">web.base.url.freeze</span> as the `Key` and
> <span class="title-ref">True</span> as the `Value`.

> [!NOTE]
> You can also set the web base URL manually. To do so, activate the
> `developer mode
> <developer-mode>`, go to
> `Settings --> Technical --> System Parameters`, and search for the
> <span class="title-ref">web.base.url</span> key (create it if
> necessary) and enter the full address of your website as the value
> (e.g., <span class="title-ref">https://www.yourdomain.com</span>). The
> URL must include the protocol <span class="title-ref">https://</span>
> (or <span class="title-ref">http://</span>) and *not* end with a slash
> (<span class="title-ref">/</span>).

### Map a domain name to an Odoo website

Mapping your domain name to your website is different than mapping it to
your database:

- It defines your domain name as the main one for your website, helping
  search engines to index your website correctly.
- It defines your domain name as the base URL for your database,
  including portal links sent by email to your customers.
- If you have multiple websites, it maps your domain name to the
  appropriate website.

Go to `Website --> Configuration --> Settings`. If you have multiple
websites, select the one you want to configure. In the `Domain` field,
enter the address of your website (e.g.,
<span class="title-ref">https://www.yourdomain.com</span>) and `Save`.

> [!WARNING]
> Mapping your domain name to your Odoo website prevents Google Search
> from indexing your original database address (e.g.,
> <span class="title-ref">mycompany.odoo.com</span>).
>
> If both addresses are already indexed, it may take some time before
> the indexation of the second address is removed from Google Search.
> You can use the [Google Search
> Console](https://search.google.com/search-console/welcome) to fix the
> issue.

> [!NOTE]
> If you have multiple websites and companies on your database, make
> sure to select the right `Company` under
> `Website --> Configuration --> Settings`. Doing so indicates Odoo
> which URL to use as the `base URL <domain-name/web-base-url>`
> according to the company in use.
