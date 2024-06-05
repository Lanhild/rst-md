# AvaTax use

AvaTax is a tax calculation software that can be integrated with Konvergo ERP in
the United States and Canada. Once the `integration setup <../avatax>`
is complete, the calculated tax is simple and automatic.

## Tax calculation

Automatically calculate taxes on Konvergo ERP quotations and invoices with
AvaTax by confirming the documents during the sales flow. Alternatively,
calculate the taxes manually by clicking the
`Compute taxes using Avatax` button while these documents are in draft
mode.

> [!TIP]
> Clicking the `Compute taxes using Avatax` button recalculates taxes if
> any product lines are edited on the invoice.

<img src="avatax_use/calculate-avatax.png" class="align-center"
alt="Sales quotation with the confirm and compute taxes using AvaTax buttons highlighted." />

The tax calculation is triggered during the following `automatic trigger
<avatax/automatic-triggers>` and
`manual trigger <avatax/manual-triggers>` circumstances.

### Automatic triggers

- When the sales rep sends the quote by email with `Send by email`
  button (pop-up).
- When the customer views the online quote on the portal.
- When a quote is confirmed and becomes a sales order.
- When the customer views the invoice on the portal.
- When a draft invoice is validated.
- When the customer views the subscription in the portal.
- When a subscription generates an invoice.
- When the customer gets to the last screen of the eCommerce checkout.

### Manual triggers

- `Compute taxes using Avatax` button at the bottom of the quote.
- `Compute taxes using Avatax` button at the top of the invoice.

> [!TIP]
> Use the `Avalara Partner Code` field that is available on customer
> records, quotations, and invoices to cross-reference data in Konvergo ERP and
> AvaTax. This field is located under the `Other info` tab of the sales
> order or quotation in the `Sales` section.
>
> On the customer record, navigate to *Contacts app* and select a
> contact. Then open the `Sales & Purchase` tab and the
> `Avalara Partner Code` under the `Sales` section.

> [!IMPORTANT]
> The `Automatic Tax Mapping (AvaTax)` fiscal position is also applied
> on those Konvergo ERP documents, like subscriptions.

<div class="seealso">

\- `../fiscal_positions`

</div>

## AvaTax synchronization

Synchronization occurs with AvaTax, when the *invoice* is created in
Konvergo ERP. This means the sales tax is recorded with Avalara (AvaTax software
developer).

To do so, navigate to `Sales app --> Orders --> Quotations`. Select a
quotation from the list.

After confirming a quotation and validating the delivery, click
`Create Invoice`. Indicate whether it is a `Regular invoice`,
`Down payment (percentage)`, or `Down payment (fixed amount)`.

Then click `Create and view invoice`. The recorded taxes can be seen in
the `Journal Items` tab of the invoice. There will be different taxes
depending on the location of the `Delivery Address`.

<img src="avatax_use/journal-items.png" class="align-center"
alt="Journal items highlighted on a invoice in Konvergo ERP." />

Finally, press the `Confirm` button to complete the invoice and
synchronize with the AvaTax portal.

> [!WARNING]
> An invoice cannot be `Reset to draft` because this causes
> de-synchronization with the AvaTax Portal. Instead, click
> `Add credit note` and state: <span class="title-ref">Sync with AvaTax
> Portal</span>. See this documentation:
> `../../../accounting/customer_invoices/credit_notes`.

## Fixed price discounts

Add a fixed price discount to a valuable customer by click `Add a line`
on the customer's invoice. Add the product discount and set the `Price`
to either a positive or negative value. To recalculate the taxes, click
`Compute taxes using Avatax`.

> [!TIP]
> Tax calculation can even be done on negative subtotals and credit
> notes.

## Logging

It is possible to log Avalara/*AvaTax* actions in Konvergo ERP for further
analysis, or verification of functionality. Logging is accessible
through the *AvaTax* settings.

To start logging *AvaTax* actions, first, navigate to the
`Accounting app -->
Configuration --> Settings`.

Then, in the `Taxes` section, under the `AvaTax` settings, click
`Start logging for 30 minutes`.

Upon starting the log process, Konvergo ERP will log all Avalara/*AvaTax*
actions performed in the database.

To view the logs, click on `Show logs` to the right of the
`Start logging for 30
minutes`. This reveals a detailed list of Avalara/*AvaTax* actions. This
list is sortable by the following columns:

- `Created on`: timestamp of the *AvaTax* calculation.
- `Created by`: numeric value of the user in the database.
- `Database name`: name of the database.
- `Type`: two values can be chosen for this field, `Server` or `Client`.
- `Name`: Avalara service name. In this case, it will be *AvaTax*.
- `Level`: by default, this will be <span class="title-ref">INFO</span>.
- `Path`: indicates the path taken to make the calculation.
- `Line`: indicates the line the calculation is made on.
- `Function`: indicates the calculation taken on the line.

<img src="avatax_use/logging.png" class="align-center"
alt="Avalara logging page with top row of list highlighted." />

Click into the log line to reveal another field, called `Message`.

This field populates a raw transcription of the transaction, which
involves the creation (or adjustment) of a sales invoice using the
Avalara *AvaTax* API.

The transaction includes details, such as addresses for shipping from
and to, line items describing the products or services, tax codes, tax
amounts, and other relevant information.

The `Message` contains the calculated taxes for different jurisdictions
and confirms the creation (or adjustment) of the transaction.

> [!TIP]
> Custom fields can be made using Konvergo ERP *Studio*. Click the
> `fa-ellipsis-v` `(ellipsis)` menu to the far-right of the header row.
> Then click `fa-plus` `Add custom field`. This action opens Konvergo ERP
> *Studio*.

> [!IMPORTANT]
> Konvergo ERP *Studio* requires a *custom* pricing plan. Consult the database's
> customer success manager for more information on switching plans. Or
> to see if Konvergo ERP *Studio* is included in the database's current pricing
> plan. See this documentation: `../../../../studio`.

<div class="seealso">

\- `../avatax` - `avalara_portal` - [US Tax Compliance: Avatax elearning
video](https://www.odoo.com/slides/slide/us-tax-compliance-avatax-2858?fullscreen=1) -
`../fiscal_positions`

</div>
