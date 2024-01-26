# Pay several bills at once

Odoo offers the possibility of grouping multiple bills' payments into
one, facilitating the reconciliation process.

<div class="seealso">

\- `/applications/inventory_and_mrp/purchase/manage_deals/manage` -
`/applications/finance/accounting/bank/reconciliation/use_cases`

</div>

## Group payments

To register the payment of multiple bills at once, go to `Accounting app
-->
Vendors --> Bills`. Then, select the bills you wish to register a
payment for by **ticking** the boxes next to the bills. When done,
either click `Register Payment` or `Action --> Register Payment`.

![Register payment button.](multiple/register-payment-button.png)

<div class="note">

<div class="title">

Note

</div>

Payments can only be registered for `posted` bills.

</div>

When registering the payments, a **pop-up window** appears. From here,
you can either create **separate payments** for each bill all at once by
clicking `Create Payment`, *or* create one payment by combining **all**
bills' payments. To **combine** all payments, tick the `Group Payments`
box.

<div class="note">

<div class="title">

Note

</div>

The `Group Payments` option only appears when selecting two or more
bills.

</div>

![Group payments options when registering a
payment.](multiple/multiple-group-payments.png)

When selecting `Group Payments`, the `amount, currency, date and memo`
are all set automatically, but you can modify them according to your
needs.

### Partial group payments with cash discounts

In case of **partial group payments with cash discounts**, you can
follow the steps found on the `cash discount documentation page
</applications/finance/accounting/receivables/customer_invoices/cash_discounts>`.
Make sure to apply the `payment terms
</applications/finance/accounting/receivables/customer_invoices/payment_terms>`
to the **bills** *instead* of the invoices.

<div class="seealso">

`/applications/finance/accounting/receivables/customer_invoices/payment_terms`

</div>
