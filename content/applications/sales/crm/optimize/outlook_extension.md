# Outlook Extension

The **Odoo CRM Extension** is a connector that bridges your Outlook
mailbox with your Odoo database. This extension allows you to:

  - Create leads from emails sent to your mailbox.
  - Centralize Prospects' emails into a CRM.
  - Search and store insights on your contacts.

![Overview of the Outlook Extension in
Outlook](outlook_extension/outlook-extension-overview.png)

<div class="note">

<div class="title">

Note

</div>

This extension is compatible with the Web version of Outlook as well as
the desktop apps.

</div>

<div class="important">

<div class="title">

Important

</div>

The Outlook Extension uses *Partner Autocomplete IAP credits* to search
and store insights on your contacts. See the `Pricing section
<outlook_extension/pricing>` below for more information.

</div>

## Configuration

The Outlook Extension requires to be configured both in Odoo and in
Outlook.

### Enable the feature on your database

To enable this feature on your Odoo database, go to `CRM -->
Configuration --> Lead
Generation`, enable **Outlook CRM Extension**, and click on *Save*.

### Install the add-in on Outlook

You can install the Outlook Extension as a **Custom Add-in**. To do so,
follow these steps:

<div class="important">

<div class="title">

Important

</div>

| URL of the **Odoo for Outlook** add-in's manifest file: |
`https://download.odoo.com/plugins/outlook/manifest.xml`

<div class="todo">

add copy button when the feature is added to the doc

</div>

</div>

1.  Connect to your Outlook mailbox, open any email, and click on the
    *More actions* button, displayed as three little dots.
    
    ![The button "More actions" in
    Outlook](outlook_extension/outlook-extension-more-actions.png)

2.  Click on *Get add-ins*.
    
    ![List of actions in Outlook, including the installation of new
    add-ins](outlook_extension/outlook-extension-get-add-ins.png)

3.  In the new window, select the tab named *My add-ins*, click on *+
    Add a custom add-in*, and then on *Add from URL...*
    
    ![Installation of a custom add-in in
    Outlook](outlook_extension/outlook-extension-custom-add-ins.png)

4.  Outlook prompts you to **enter the URL of the add-in's manifest
    file**. To do so, copy the following URL, paste it in the box, and
    click on *OK*.  
    `https://download.odoo.com/plugins/outlook/manifest.xml`
    
    ![Getting a custom add-in in Outlook by providing the manifest
    file's URL](outlook_extension/outlook-extension-add-in-url.png)

5.  Outlook warns you that Microsoft hasn’t verified the add-in. Click
    on *Install* to complete the installation.

<div class="note">

<div class="title">

Note

</div>

The *Odoo for Outlook* add-in is not listed yet on Outlook's add-ins
list. This is why it is currently necessary to install it as a *custom
add-in*.

</div>

### Add a shortcut to open the extension

By default, you can open the **Odoo for Outlook** extension from the
*More actions* menu. This section explains how to move the launcher next
to the other default actions.

![Odoo for Outlook extension as a default action in the
mailbox](outlook_extension/outlook-extension-default-actions.png)

1.  In your Outlook mailbox, click on *Settings*, then on *View all
    Outlook settings*.

2.  Go to `Settings --> Mail --> Customize actions --> Message surface`,
    select *Odoo for Outlook*, and click on *Save*.
    
    ![add Odoo for Outlook extension as a default action in the message
    surface](outlook_extension/outlook-extension-customize-actions.png)

### Connect to your database

1.  Open **Odoo for Outlook** from any email. This opens the extension
    as a panel on the right side of your screen.

2.  Click on *login* at the bottom of the extension.

3.  Insert your database's URL then click on *Login*.
    
    ![Connection to an Odoo database from the Outlook
    extension](outlook_extension/outlook-extension-database-url.png)

4.  Log into your database by entering your credentials. Skip this step
    if you are already logged in with this browser.

5.  A message asks you if you want to let Outlook access your Odoo
    database. Click on *Allow* to complete the connection.
    
    <div class="important">
    
    <div class="title">
    
    Important
    
    </div>
    
    Make sure first to `enable the feature on your database
    <outlook_extension/enable-feature>`. Failing to do so would result
    in an *error 404 message*.
    
    </div>

<div class="note">

<div class="title">

Note

</div>

The extension displays some information, even if you do not connect it
to any Odoo database. Note that only a limited amount of contact
enrichment requests are available as a trial, as this feature requires
prepaid credits. See the `Pricing section <outlook_extension/pricing>`
below for more information.

</div>

## Pricing

The extension is **free** and doesn't require any purchase to be
installed and used.

However, this extension provides you with *Lead Enrichment* in the
**Company Insights** section. This service is part of a paid service
known as **Lead Generation**.

The extension allows you to test this service for free, whether you
connect the extension to a database or not. After a while, the extension
asks you to buy credits to keep using this additional service.

!["Could not auto-complete the company: not enough credits\!" warning
message in the
Outlook&#10;extension](outlook_extension/outlook-extension-credits-message.png)

<div class="tip">

<div class="title">

Tip

</div>

You can buy more *Lead Generation* credits to keep using this service or
disregard this message and keep using the extension for free without
*Lead Enrichment*.

</div>

### In-App Purchase

*Lead Generation* is an *In-App Purchase (IAP)* service, which requires
prepaid credits to be used. Each request consumes one credit.  
To buy credits, go to `Settings --> Contacts --> Partner Autocomplete or
Odoo IAP --> View My Services` and select a package.

<div class="note">

<div class="title">

Note

</div>

\- If you run out of credits, the only information populated when
clicking on the suggested company is the website link and logo. - If you
are on Odoo Online and have the Enterprise version, you benefit from
free trial credits to test the feature. - Learn about our *Privacy
Policy* [here](https://iap.odoo.com/privacy#header_2).

</div>

<div class="seealso">

\- `../../../general/in_app_purchase` - [Odoo Tutorials: Lead
Enrichment](https://www.odoo.com/r/p73)

</div>
