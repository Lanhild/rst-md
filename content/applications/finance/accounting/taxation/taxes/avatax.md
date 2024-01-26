# Avatax integration

Avatax is a tax calculation provider that can be integrated in Odoo.

## Credential configuration

To integrate Avatax with Odoo, go to `Accounting --> Configuration -->
Settings -->
Taxes` and add your Avatax credentials in the `Avatax` section.

<div class="tip">

<div class="title">

Tip

</div>

If you do not yet have credentials, click on `How to Get Credentials`.

</div>

![Configure Avatax settings](avatax/avatax-configuration-settings.png)

## Tax mapping

The Avatax integration is available on Sale Orders and Invoices with the
included Avatax fiscal position.

Before using the integration, specify an `Avatax Category` on the
product categories.

![Specify Avatax Category on products](avatax/avatax-category.png)

Avatax Categories may be overridden or set on individual products as
well.

![Override product categories as
needed](avatax/override-avatax-product-category.png)

## Address validation

Manually validate customer addresses by clicking the `Validate address`
link in the customer form view.

![Validate customer addresses](avatax/validate-customer-address.png)

If preferred, choose to keep the newly validated address or the original
address in the wizard that pops up.

![Address validation wizard](avatax/choose-customer-address.png)

## Tax calculation

Automatically calculate taxes on Odoo quotations and invoices with
Avatax by confirming the documents. Alternatively, calculate the taxes
manually by clicking the `Compute taxes
using Avatax` button while these documents are in draft mode.

Use the `Avalara Code` field that's available on customers, quotations,
and invoices to cross-reference data in Odoo and Avatax.

<div class="seealso">

\- `fiscal_positions`

</div>
