# Snailmail

Sending direct mail can be an effective strategy for grabbing people's
attention, especially when their email inboxes are overflowing. With
Odoo, you have the ability to send invoices and follow-up reports
through postal mail worldwide, all from within your database.

## Configuration

Go to `Accounting --> Configuration --> Settings --> Customer invoices`
section to activate `Snailmail`.

To make it a by-default feature, select `Send by Post` in the `Default
Sending
Options` section.

![Under settings enable the snailmail feature in Odoo
Accounting](snailmail/setup-snailmail.png)

## Send invoices by post

Open your invoice, click on `Send & Print` and select `Send by Post`.
Make sure your customer’s address is set correctly, including the
country, before sending the letter.

<div class="important">

<div class="title">

Important

</div>

Your document must respect the following rules to pass the validation
before being sent:

  - Margins must be **5 mm** on all sides. As Odoo forces the outer
    margins by filling them with white before sending the snailmail, it
    can results in the user's custom being cut off if it protrudes into
    the margins. To check the margins, go to `Settings --> General
    Settings` and scroll down to the `Business Documents` section, and
    open the external link.
  - A square of **15mm by 15mm** on the bottom left corner has to stay
    clear.
  - The postage area has to stay clear (click `here
    <snailmail/snailmail-template.pdf>` to get more info about the
    area).
  - Pingen (Odoo Snailmail service provider) scans the area to process
    the address, so if something gets written outside the area, it is
    not counted as part of the address.

</div>

## Pricing

Snailmail is an `../../../../general/in_app_purchase` service that
requires prepaid stamps (=credits) to work. Sending one document
consumes one stamp.

To buy stamps, go to `Accounting --> Configuration --> Settings -->
Customer
invoices: Snailmail`, click on `Buy credits`, or go to `Settings -->
In-App
Purchases: Odoo IAP`, and click on `View my Services`.

<div class="tip">

<div class="title">

Tip

</div>

\- If you are on Odoo Online and have the Enterprise version, you
benefit from free trial credits to test the feature. - Click
[here](https://iap.odoo.com/privacy#header_4) to know about our *Privacy
Policy*.

</div>
