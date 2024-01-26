# Online payment order confirmation

With Odoo *Sales*, online payments can be used to get automatic
confirmation on orders.

## Enable online payment

Go to `Sales app --> Configuration --> Settings`, scroll to the
`Quotations
\& Orders` heading, and activate the `Online Payment` feature by
checking the box next to it, and clicking `Save`.

![How to enable online payment on Odoo
Sales.](get_paid_to_validate/online-payment-setting.png)

After checking the box beside the `Online Payment` feature, a link to
the `Payment Acquirers` appears beneath it. Click that link to reveal
the entire `Payment Acquirers` page.

![Payment acquirers page in the Odoo Sales
application.](get_paid_to_validate/payment-acquirers.png)

On the `Payment Acquirers` page, payment acquirers can be selected and
configured. Before creating (or modifying) a payment acquirer, be sure
to review the documentation related to the ways payment acquirers can be
used with Odoo, such as:

  - `../../../finance/payment_acquirers/paypal`
  - `../../../finance/payment_acquirers/authorize`
  - `../../../finance/payment_acquirers`

<div class="note">

<div class="title">

Note

</div>

On quotation templates, the `Online Payment` feature is located under
the `Confirmation` tab.

On standard quotations, the `Online Payment` feature is located under
the `Other Info` tab.

</div>

## Register a payment

After opening quotations from the email they receive, customers are
presented with different options to make online payments, in the `Pay
with` section.

![How to register a payment on Odoo
Sales.](get_paid_to_validate/validate-order.png)

<div class="tip">

<div class="title">

Tip

</div>

Clicking the `Customer Preview` smart button on the quotation form
provides a preview of the quotation as the customer sees it, along with
the various online payment options they can choose from.

</div>

<div class="seealso">

`quote_template`

</div>
