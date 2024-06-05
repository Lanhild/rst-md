# Configure DNS records to send emails in Konvergo ERP

## SPAM labels overview

Sometimes, emails from Konvergo ERP are misclassified by the different email
providers and end up in spam folders. At the moment, some settings are
out of Konvergo ERP's control, notably the way the different email providers
classify Konvergo ERP's emails according to their own restriction policy and/or
limitations.

It is standard in Konvergo ERP that emails are received from
`"name of the author" <notifications@mycompany.odoo.com>`. In other
words this can be translated to:
`"name of the author" <{ICP.mail.from.filter}@{mail.catchall.domain}>`.
In this case ICP stands for
<span class="title-ref">ir.config.parameters</span>, which are the
System Parameters. Deliverability is greatly improved with the
`notifications configuration <email_servers/notifications>`.

In order for servers to accept emails from Konvergo ERP on a more regular basis,
one of the solutions is for customers to create rules within their own
mailbox. A filter can be added to the email inbox so that when email is
received from Konvergo ERP
(<span class="title-ref">notifications@mycompany.odoo.com</span>) it is
moved to the inbox. It is also possible to add the Konvergo ERP database domain
onto a safe senders list or whitelist on the receiving domain.

If an Konvergo ERP email server appears on a blacklist, notify Konvergo ERP via a [new
help ticket](https://www.odoo.com/help) and the support team will work
to get the servers removed from the blacklist.

Should the Konvergo ERP database be using a custom domain for sending emails
from Konvergo ERP there are three records that should be implemented on the
custom domain's DNS to ensure deliverability of email. This includes
setting records for `SPF (Sender Policy Framework)`,
`DKIM (DomainKeys Identified Mail)` and
`DMARC (Domain-based Message Authentication, Reporting, & Conformance)`.
Ultimately though, it is up to the discretion of the final receiving
mailbox.

## Be SPF compliant

The Sender Policy Framework (SPF) protocol allows the owner of a domain
name to specify which servers are allowed to send emails from that
domain. When a server receives an incoming email, it checks whether the
IP address of the sending server is on the list of allowed IPs according
to the sender's `SPF (Sender Policy Framework)` record.

> [!NOTE]
> The `SPF (Sender Policy Framework)` verification is performed on the
> domain mentioned in the <span class="title-ref">Return-Path</span>
> field of the email. In the case of an email sent by Konvergo ERP, this domain
> corresponds to the value of the
> <span class="title-ref">mail.catchall.domain</span> key in the
> database system parameters.

The `SPF (Sender Policy Framework)` policy of a domain is set using a
TXT record. The way to create or modify a TXT record depends on the
provider hosting the `DNS (Domain Name System)` zone of the domain name.
In order for the verification to work properly, each domain can only
have one `SPF (Sender Policy Framework)` record.

If the domain name does not yet have a `SPF (Sender Policy Framework)`
record, create one using the following input:
<span class="title-ref">v=spf1 include:\_spf.odoo.com ~all</span>

If the domain name already has a `SPF (Sender Policy Framework)` record,
the record must be updated (and do not create a new one).

<div class="example">

If the TXT record is <span class="title-ref">v=spf1
include:\_spf.google.com ~all</span>, edit it to add
\`include:\_spf.odoo.com\`: <span class="title-ref">v=spf1
include:\_spf.odoo.com include:\_spf.google.com ~all</span>

</div>

Check if the `SPF (Sender Policy Framework)` record is valid with a free
tool like [MXToolbox SPF](https://mxtoolbox.com/spf.aspx).

## Enable DKIM

The DomainKeys Identified Mail (DKIM) allows a user to authenticate
emails with a digital signature.

When sending an email, the Konvergo ERP server includes a unique
`DKIM (DomainKeys Identified Mail)` signature in the headers. The
recipient's server decrypts this signature using the `DKIM
(DomainKeys Identified Mail)` record in the database's domain name. If
the signature and the key contained in the record match, this guarantees
that the message is authentic and has not been altered during transport.

To enable `DKIM (DomainKeys Identified Mail)`, add a
`CNAME (Canonical Name)` record to the `DNS (Domain Name System)` zone
of the domain name:

<span class="title-ref">odoo.\_domainkey IN CNAME
odoo.\_domainkey.odoo.com.</span>

> [!TIP]
> If the domain name is <span class="title-ref">mycompany.com</span>,
> make sure to create a subdomain
> <span class="title-ref">odoo.\_domainkey.mycompany.com</span> whose
> canonical name is
> <span class="title-ref">odoo.\_domainkey.odoo.com.</span>.

The way to create or modify a `CNAME (Canonical Name)` record depends on
the provider hosting the `DNS (Domain Name System)` zone of the domain
name. The most common providers are
`listed below <email_communication/SPFDKIM_common_providers>`.

Check if the `DKIM (DomainKeys Identified Mail)` record is valid with a
free tool like [DKIM Core](https://dkimcore.org/tools/). If a selector
is asked, enter <span class="title-ref">odoo</span>.

## Check the DMARC policy

The Domain-based Message Authentication, Reporting, & Conformance
(DMARC) record is a protocol that unifies
`SPF (Sender Policy Framework)` and `DKIM (DomainKeys Identified Mail)`.
The instructions contained in the
`DMARC (Domain-based Message Authentication, Reporting, &
Conformance)` record of a domain name tell the destination server what
to do with an incoming email that fails the
`SPF (Sender Policy Framework)` and/or `DKIM (DomainKeys Identified
Mail)` check.

<div class="example">

DMARC: TXT record

<span class="title-ref">v=DMARC1; p=none;</span>

</div>

There are three
`DMARC (Domain-based Message Authentication, Reporting, & Conformance)`
policies:

- <span class="title-ref">p=none</span>
- <span class="title-ref">p=quarantine</span>
- <span class="title-ref">p=reject</span>

<span class="title-ref">p=quarantine</span> and
<span class="title-ref">p=reject</span> instruct the server that
receives an email to quarantine that email or ignore it if the
`SPF (Sender Policy Framework)` and/or `DKIM (DomainKeys Identified
Mail)` check fails.

If the domain name uses
`DMARC (Domain-based Message Authentication, Reporting, &
Conformance)` and has defined one of these policies, the domain must be
`SPF (Sender Policy
Framework)` compliant or enable `DKIM (DomainKeys Identified Mail)`.

> [!WARNING]
> Yahoo or AOL are examples of email providers with a
> `DMARC (Domain-based Message
> Authentication, Reporting, & Conformance)` policy set to
> <span class="title-ref">p=reject</span>. Konvergo ERP strongly advises against
> using an *@yahoo.com* or *@aol.com* address for the database users.
> These emails will never reach their recipient.

<span class="title-ref">p=none</span> is used for the domain owner to
receive reports about entities using their domain. It should not impact
the deliverability if the `DMARC (Domain-based Message Authentication,
Reporting, & Conformance)` check fails.

`DMARC (Domain-based Message Authentication, Reporting, & Conformance)`
records are comprised of tags in the form of `DNS (Domain Name System)`
records. These tags/parameters allow for reporting, such as
`RUA (Reporting URI of aggregate reports)` and `RUF (Reporting URI
for forensic reports)`, along with more precise specification like
`PCT (Percentage of
messages subjected to filtering)`,
`P (Policy for organizational domain)`, `SP (Policy
for subdomains of the OD)` `ADKIM (Alignment mode for DKIM)` &
`ASPF (Alignment mode for
SPF)`. For best practice, the the
`DMARC (Domain-based Message Authentication, Reporting, &
Conformance)` policy should not start out being too restrictive.

The following chart displays available tags:

| Tag Name | Purpose                                       | Example                                                        |
|----------|-----------------------------------------------|----------------------------------------------------------------|
| v        | Protocol version                              | <span class="title-ref">v=DMARC1</span>                        |
| pct      | Percentage of messages subjected to filtering | <span class="title-ref">pct=20</span>                          |
| ruf      | Reporting URI for forensic reports            | <span class="title-ref">ruf=mailto:authfail@example.com</span> |
| rua      | Reporting URI of aggregate reports            | <span class="title-ref">rua=mailto:aggrep@example.com</span>   |
| p        | Policy for organizational domain              | <span class="title-ref">p=quarantine</span>                    |
| sp       | Policy for subdomains of the OD               | <span class="title-ref">sp=reject</span>                       |
| adkim    | Alignment mode for DKIM                       | <span class="title-ref">adkim=s</span>                         |
| aspf     | Alignment mode for SPF                        | <span class="title-ref">aspf=r</span>                          |

Check the
`DMARC (Domain-based Message Authentication, Reporting, & Conformance)`
record of a domain name with a tool like [MXToolbox
DMARC](https://mxtoolbox.com/DMARC.aspx).

<div class="seealso">

[DMARC.org is another great resource to learn about DMARC
records.](https://dmarc.org/overview/)

</div>

## SPF, DKIM & DMARC documentation of common providers

- [OVH
  DNS](https://docs.ovh.com/us/en/domains/web_hosting_how_to_edit_my_dns_zone/)
- [OVH
  SPF](https://docs.ovh.com/us/en/domains/web_hosting_the_spf_record/)
- [GoDaddy TXT
  record](https://www.godaddy.com/help/add-a-txt-record-19232)
- [GoDaddy SPF](https://www.godaddy.com/help/add-an-spf-record-19218)
- [GoDaddy DKIM](https://www.godaddy.com/help/add-a-cname-record-19236)
- [NameCheap
  \<https://www.namecheap.com/support/knowledgebase/article.aspx/317/2237/how-do-i-add-
  txtspfdkimdmarc-records-for-my-domain/\>]()
- [CloudFlare
  DNS](https://support.cloudflare.com/hc/en-us/articles/360019093151)
- [Google
  Domains](https://support.google.com/domains/answer/3290350?hl=en)
- [Azure
  DNS](https://docs.microsoft.com/en-us/azure/dns/dns-getstarted-portal)

To fully test the configuration, use the
[Mail-Tester](https://www.mail-tester.com/) tool, which gives a full
overview of the content and configuration in one sent email. Mail-Tester
can also be used to configure records for other, lesser-known providers.

<div class="seealso">

[Using Mail-Tester to set SPF Records for specific
carriers](https://www.mail-tester.com/spf/)

</div>
