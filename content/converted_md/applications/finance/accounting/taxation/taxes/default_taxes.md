# Default taxes

**Default Taxes** define which `taxes <taxes>` are automatically
selected when there is no other indication about which tax to use. For
example, Odoo prefills the **Taxes** field with the Default Taxes when
you create a new product or add a new line on an invoice.

![Odoo fills out the Tax field automatically according to the Default
Taxes](default_taxes/default-taxes-invoice-line.png)

<div class="important">

<div class="title">

Important

</div>

`Fiscal Positions <fiscal_positions>` take the Default Tax into account.
Therefore, if a Fiscal Position is applied to an invoice, Odoo applies
the related tax instead of the Default Taxes, as mapped in the Fiscal
Position.

</div>

## Configuration

**Default Taxes** are automatically set up according to the country
selected at the creation of your database, or when you set up a `fiscal
localization package <fiscal_localizations/packages>` for your company.

To change your **Default Taxes**, go to `Accounting --> Configuration
--> Settings
--> Taxes --> Default Taxes`, select the appropriate taxes for your
default **Sales Tax** and **Purchase Tax**, and click on *Save*.

![Define which taxes to use by default on
Odoo](default_taxes/default-taxes-configuration.png)

<div class="note">

<div class="title">

Note

</div>

Databases with multiple companies: the Default Taxes values are
company-specific.

</div>

<div class="seealso">

  - `taxes`
  - `fiscal_positions`
  - `../../../fiscal_localizations`

</div>
