# Sending emails with Odoo

## Using your email domain in Odoo

Documents in Odoo (a CRM opportunity, a sales order, an invoice ...)
have a discussion thread, called *chatter*.

When you post a message in the chatter, this message is sent by email to
the followers of the document. If a follower replies to the message, the
reply updates the chatter, and Odoo relays the reply to the followers.

Emails from your users to partners (customers, vendors) are sent from
the email address of your users. Similarly, emails from partners to
users are sent from the email address of the partners. This allows you
to recognize at a glance who sent an email relayed by Odoo.

If your database is hosted on our cloud (Odoo Online or Odoo.sh), it is
not necessary to add an outgoing email server to send emails from your
custom domain. You can enjoy this feature by using the default Odoo
email server.

<div class="important">

<div class="title">

Important

</div>

The Odoo server is subject to a daily email limit to prevent abuse. The
default limit is 200 emails sent per day for databases with an
Enterprise subscription. This limit can be increased under certain
conditions. See our `FAQ <faq>` or contact support for more information.

</div>

However, it is recommended that you configure your domain name to ensure
that emails from your users reach your partners, rather than being
considered spam.

For the same reason, we recommend that you always give your users an
email address from a domain you manage, rather than a generic email
address (gmail.com, outlook.com, etc.).

## Be SPF compliant

The Sender Policy Framework (SPF) protocol allows the owner of a domain
name to specify which servers are allowed to send email from that
domain. When a server receives an incoming email, it checks whether the
IP address of the sending server is on the list of allowed IPs according
to the SPF record of the sender.

<div class="note">

<div class="title">

Note

</div>

The SPF verification is performed on the domain mentioned in the
Return-Path field of the email. In the case of an email sent by Odoo,
this domain corresponds to the value of the
<span class="title-ref">mail.catchall.domain</span> key in the database
system parameters.

See the `documentation on incoming emails
<email_communication/inbound_messages>`.

</div>

The SPF policy of a domain is set using a TXT record. How to create or
modify a TXT record depends on the provider hosting the DNS zone of your
domain name. In order for the verification to work properly, each domain
can only have one SPF record.

If your domain name does not yet have an SPF record, the content of the
record to create is as follows:

`v=spf1 include:_spf.odoo.com ~all`

If your domain name already has an SPF record, you need to update this
record (and do not create a new one).

<div class="example">

If your TXT record is <span class="title-ref">v=spf1
include:\_spf.google.com \~all</span>, you need to edit it to add
\`include:\_spf.odoo.com\`: <span class="title-ref">v=spf1
include:\_spf.odoo.com include:\_spf.google.com \~all</span>

</div>

You can check if your SPF record is valid with a free tool like
[MXToolbox SPF](https://mxtoolbox.com/spf.aspx).

## Enable DKIM

The DomainKeys Identified Mail (DKIM) allows you to authenticate your
emails with a digital signature.

When sending an email, the Odoo server includes a unique DKIM signature
in the headers. The recipient's server decrypts this signature using the
DKIM record in your domain name. If the signature and the key contained
in the record match, this guarantees that your message is authentic and
has not been altered during transport.

To enable DKIM, you must add a CNAME record to the DNS zone of your
domain name:

`odoo._domainkey IN CNAME odoo._domainkey.odoo.com.`

<div class="tip">

<div class="title">

Tip

</div>

If your domain name is <span class="title-ref">mycompany.com</span>, you
need to create a subdomain
<span class="title-ref">odoo.\_domainkey.mycompany.com</span> whose
canonical name is
<span class="title-ref">odoo.\_domainkey.odoo.com.</span>.

</div>

How to create or modify a CNAME record depends on the provider hosting
the DNS zone of your domain name. The most common providers are list
below.

You can check if your DKIM record is valid with a free tool like [DKIM
Core](https://dkimcore.org/tools/). If a selector is asked, enter
<span class="title-ref">odoo</span>.

## Check your DMARC policy

The Domain-based Message Authentication, Reporting & Conformance (DMARC)
is a protocol that unifies SPF and DKIM. The instructions contained in
the DMARC record of a domain name tell the destination server what to do
with an incoming email that fails the SPF and/or DKIM check.

There are three DMARC policies: - `p=none` - `p=quarantine` - `p=reject`

`p=quarantine` and `p=reject` instruct the server that receives an email
to quarantine that email or ignore it if the SPF and/or DKIM check
fails.

If your domain name uses DMARC and has defined one of these policies, it
is therefore imperative to be SPF compliant or to enable DKIM.

<div class="danger">

<div class="title">

Danger

</div>

Yahoo or AOL are examples of email providers with a DMARC policy set to
`p=reject`. We strongly advise against using an *@yahoo.com* or
*@aol.com* address for your users. These emails will never reach their
recipient.

</div>

`p=none` is used for the domain owner to receive reports about entities
using their domain. It should not impact the deliverability if the DMARC
check fails.

You can check the DMARC record of a domain name with a tool like
[MXToolbox DMARC](https://mxtoolbox.com/DMARC.aspx).

If one of your partners, customer or vendor, uses DMARC and has defined
one of these policies, the Odoo server cannot relay emails from this
partner to your users.

You need to `handle user notifications in Odoo
<discuss_app/notification_preferences>`, or replace the email address of
the partner with a default email address.

## SPF, DKIM & DMARC documentation of common providers

  - [OVH
    DNS](https://docs.ovh.com/us/en/domains/web_hosting_how_to_edit_my_dns_zone/)
  - [OVH
    SPF](https://docs.ovh.com/us/en/domains/web_hosting_the_spf_record/)
  - [GoDaddy TXT
    record](https://www.godaddy.com/help/add-a-txt-record-19232)
  - [GoDaddy SPF](https://www.godaddy.com/help/add-an-spf-record-19218)
  - [GoDaddy
    DKIM](https://www.godaddy.com/help/add-a-cname-record-19236)
  - [NameCheap](https://www.namecheap.com/support/knowledgebase/article.aspx/317/2237/how-do-i-add-txtspfdkimdmarc-records-for-my-domain/)
  - [CloudFlare
    DNS](https://support.cloudflare.com/hc/en-us/articles/360019093151)
  - [Google
    Domains](https://support.google.com/domains/answer/3290350?hl=en)
  - [Azure
    DNS](https://docs.microsoft.com/en-us/azure/dns/dns-getstarted-portal)

To fully test your configuration, the tool
[Mail-Tester](https://www.mail-tester.com/) will give you a full
overview of the content and configuration you have in one email sent\!
Mail-Tester can also be used for other lesser known providers.

## Use a default email address

To force the email address from which emails are sent, you need to
create one of these two keys in the System Parameters of the database:

  - If `mail.force.smtp.from` is set, all outgoing emails are sent from
    the given address. This is a requirement to use [Outlook with
    Odoo](https://docs.microsoft.com/en-us/exchange/mail-flow-best-practices/how-to-set-up-a-multifunction-device-or-application-to-send-email-using-microsoft-365-or-office-365#option-1-authenticate-your-device-or-application-directly-with-a-microsoft-365-or-office-365-mailbox-and-send-mail-using-smtp-auth-client-submission).
  - If `mail.dynamic.smtp.from` is set, the from email address is
    replaced by the given one if the domain does not match the domain
    set in <span class="title-ref">mail.catchall.domain</span>.

You access the **System Parameters** in `developer mode
<developer-mode>` in the `Settings -->
Technical --> Parameters --> System Parameters` menu.
