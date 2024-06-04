show-content  

# Subscriptions

Odoo *Subscriptions* is used to run recurring businesses:
`sell new contracts
<subscriptions/quotations>`,
`upsell customers </applications/sales/subscriptions/upselling>`, keep
the churn under control, and `generate reports
</applications/sales/subscriptions/reports>` on the main
`KPIs (Key Performance Indicators)`: `MRR (Monthly Recurring Revenue)`,
`ARR (Annual Recurring Revenue)`, retention, churn, etc.

<div class="seealso">

\- [Odoo Tutorials:
Subscriptions](https://www.odoo.com/slides/subscription-20) -
`/applications/sales/subscriptions/products` -
`/applications/sales/subscriptions/ecommerce` -
`/applications/sales/subscriptions/plans` -
`/applications/sales/subscriptions/upselling` -
`/applications/sales/subscriptions/renewals` -
`/applications/sales/subscriptions/closing` -
`/applications/sales/subscriptions/automatic_alerts` -
`/applications/sales/subscriptions/reports`

</div>

## Subscription quotations

> [!IMPORTANT]
> Sales orders with a defined recurrence become subscriptions.

To create a new subscription, click on `New` from the *Subscription* or
the `Sales
</applications/sales>` app. You can either:

- Select a `subscription plan </applications/sales/subscriptions/plans>`
  to prefill the quotation instantly, or
- Fill out the quotation normally, making sure to select a recurrence
  and an end date if necessary and adding
  `recurrent products </applications/sales/subscriptions/products>`.

> [!TIP]
> You can define different invoice and delivery addresses by enabling
> the `Customer Addresses
> </applications/finance/accounting/customer_invoices/customer_addresses>`
> feature.

## Confirmation

Send the quotation to the customer for confirmation by clicking on
`Send by email`, or confirm it immediately by clicking on `Confirm`.

> [!TIP]
> Click on `Customer Preview` to preview the customer portal where the
> customer can view their quotation, sign and pay it, and communicate
> with you.

## Automatic payments

You can require the customer to set an automatic payment method and
pre-pay the subscription's first occurrence before they can confirm
their quotation. To do so, go to the `Other Info` tab of the quotation
and check the `Payment` option in the `Online confirmation` field.

If you leave `Payment` unchecked, the customer doesn't have to pre-pay
to start the subscription. This means that the payment is not automatic
and that the customer must pay each invoice manually.

> [!IMPORTANT]
> If the online confirmation requires a pre-payment, your customer can
> select only the
> `payment providers <payment_providers/supported_providers>` that have
> the `tokenization
> feature <payment_providers/tokenization>`. This ensures that the
> customer is automatically charged at each new period.

<div class="toctree" titlesonly="">

subscriptions/products subscriptions/ecommerce subscriptions/plans
subscriptions/upselling subscriptions/renewals subscriptions/closing
subscriptions/automatic_alerts subscriptions/reports

</div>
