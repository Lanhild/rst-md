# Pro-forma invoices

A *pro-forma invoice* is an abridged or estimated invoice sent in
advance of a delivery of goods. It notes the kind and quantity of goods,
their value, and other important information, such as weight and
transportation charges.

Pro-forma invoices are commonly used as preliminary invoices with a
quotation. They are also used for customs purposes during importation.
They differ from a normal invoice in that they are not a demand (or
request) for payment.

## Activate the feature

In order to utilize pro-forma invoices, the *Pro-Forma Invoice* feature
**must** be activated. To do that, navigate to `Sales app -->
Configuration --> Settings`, and in the `Quotations & Orders` section,
click the checkbox next to `Pro-Forma Invoice`. Then, click `Save` to
save all changes.

![The Pro-Forma Invoice feature setting in the Odoo Sales
application.](proforma/pro-forma-setting.png)

## Send a pro-forma invoice

With the `Pro-Forma Invoice` feature activated, the option to send a
pro-forma invoice is now available on any quotation or sales order, via
the `Send Pro-Forma Invoice` button.

![The Send Pro-Forma Invoice button on a typical sales order in Odoo
Sales.](proforma/send-pro-forma-invoice-button.png)

When the `Send Pro-Forma Invoice` button is clicked, an email pop-up
appears. The `Recipients` field is auto-populated with the customer from
the sales order or quotation. Then, if needed, modify the `Subject`
field and the body of the email. The pro-forma invoice is automatically
added as an attachment to the email.

When ready, click `Send`, and Odoo instantly sends the email, with the
attached pro-forma invoice, to the customer.

![The email pop-up window that appears with pro-forma invoice attached
in Odoo Sales.](proforma/pro-forma-email-message-popup.png)

<div class="tip">

<div class="title">

Tip

</div>

To preview what the pro-forma invoice looks like, click on the PDF at
the bottom of the email pop-up window *before* clicking `Send`. When
clicked, the pro-forma invoice is downloaded instantly. Open that PDF to
view (and review) the pro-forma invoice.

![Sample pro-forma invoice PDF from Odoo
Sales.](proforma/pro-forma-pdf.png)

</div>
