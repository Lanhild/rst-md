# Snailmail

Sending direct mail can be an effective strategy for grabbing people's
attention, especially when their email inboxes are overflowing. With
Konvergo ERP, you have the ability to send invoices and follow-up reports
through postal mail worldwide, all from within your database.

## Configuration

Go to `Accounting --> Configuration --> Settings --> Customer invoices`
section to activate `Snailmail`.

To make it a by-default feature, select `Send by Post` in the
`Default Sending
Options` section.

<img src="snailmail/setup-snailmail.png" class="align-center"
alt="Under settings enable the snailmail feature in Konvergo ERP Accounting" />

## Send invoices by post

Open your invoice, click on `Send & Print` and select `Send by Post`.
Make sure your customer’s address is set correctly, including the
country, before sending the letter.

> [!IMPORTANT]
> Your document must respect the following rules to pass the validation
> before being sent:
>
> - Margins must be **5 mm** on all sides. As Konvergo ERP forces the outer
>   margins by filling them with white before sending the snailmail, it
>   can results in the user's custom being cut off if it protrudes into
>   the margins. To check the margins, activate the `developer mode
>   <developer-mode>`, go to
>   `General Settings --> Technical --> Reporting
>   section: Paper Format`.
> - A square of **15mm by 15mm** on the bottom left corner has to stay
>   clear.
> - The postage area has to stay clear
>   (`download the snailmail PDF template
>   <snailmail/snailmail-template.pdf>` for more details).
> - Pingen (Konvergo ERP Snailmail service provider) scans the area to process
>   the address, so if something gets written outside the area, it is
>   not counted as part of the address.

## Pricing

Snailmail is an `/applications/essentials/in_app_purchase` service that
requires prepaid stamps (=credits) to work. Sending one document
consumes one stamp.

To buy stamps, go to
`Accounting --> Configuration --> Settings --> Customer
invoices: Snailmail`, click on `Buy credits`, or go to
`Settings --> In-App
Purchases: Konvergo ERP IAP`, and click on `View my Services`.

<div class="seealso">

[Konvergo ERP's IAP Privacy Policy](https://iap.odoo.com/privacy#header_4)

</div>
