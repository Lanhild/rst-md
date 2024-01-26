# Online signatures for order confirmations

The Odoo *Sales* application provides customers with the ability to
confirm orders via an online signature directly on the sales order. Once
the sales order is electronically signed by the customer, the
salesperson attached to the sales order is automatically notified that
the order is confirmed.

## Activate online signatures

To activate the *online signature* feature, go to `Sales app -->
Configuration -->
Settings`, scroll to the `Quotations & Orders` heading, and activate the
`Online
Signature` feature by checking the box beside it. Then, click the `Save`
button in the top-left corner.

![How to enable online signature in Odoo Sales
settings.](get_signature_to_validate/signature-setting.png)

<div class="note">

<div class="title">

Note

</div>

On quotation templates, the `Online Signature` feature is located under
the `Confirmation` tab.

![How to enable online signature on a quotation
template.](get_signature_to_validate/signature-confirmation-tab.png)

On standard quotations, the `Online Signature` feature is located under
the `Other Info` tab.

![How to enable online signature on standard
quotations.](get_signature_to_validate/signature-other-info-tab.png)

</div>

## Order confirmations with online signatures

When quotations are sent to clients, there's an option for them to `Sign
& Pay` directly on the quotation in the online customer portal. When
clicked, clients have the option to draw a signature, fill in the field
with an automated signature, or load a file from their computer.

![How to confirm an order with a signature on Odoo
Sales.](get_signature_to_validate/signature-validate-order.png)

Once signed, the various payment method options become available. Then,
when the quotation is paid and confirmed, a delivery order is
automatically created (if the Odoo *Inventory* app is installed).

<div class="seealso">

`/applications/sales/sales/send_quotations/quote_template`

</div>
