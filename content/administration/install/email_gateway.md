# Email gateway

The Odoo mail gateway allows you to inject directly all the received
emails in Odoo.

Its principle is straightforward: your SMTP server executes the
"mailgate" script for every new incoming email.

The script takes care of connecting to your Odoo database through
XML-RPC, and send the emails via the
<span class="title-ref">MailThread.message\_process()</span> feature.

## Prerequisites

  - Administrator access to the Odoo database.
  - Your own mail server such as Postfix or Exim.
  - Technical knowledge on how to configure an email server.

## For Postfix

In you alias config (`/etc/aliases`):

``` text
email@address: "|/odoo-directory/addons/mail/static/scripts/odoo-mailgate.py -d <database-name> -u <userid> -p <password>"
```

<div class="note">

<div class="title">

Note

</div>

Resources

  - [Postfix](http://www.postfix.org/documentation.html)
  - [Postfix aliases](http://www.postfix.org/aliases.5.html)
  - [Postfix virtual](http://www.postfix.org/virtual.8.html)

</div>

## For Exim

``` text
*: |/odoo-directory/addons/mail/static/scripts/odoo-mailgate.py -d <database-name> -u <userid> -p <password>
```

<div class="note">

<div class="title">

Note

</div>

Resources

  - [Exim](https://www.exim.org/docs.html)

</div>

<div class="tip">

<div class="title">

Tip

</div>

If you don't have access/manage your email server, use `inbound messages
<email_communication/inbound_messages>`.

</div>
