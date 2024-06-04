# Thailand

## Configuration

`Install <general/install>` the `🇹🇭 Thailand` localization package to
get all the features of the Thai localization:

| Name                            | Technical name                                 | Description                                                           |
|---------------------------------|------------------------------------------------|-----------------------------------------------------------------------|
| `Thailand - Accounting`         | <span class="title-ref">l10n_th</span>         | Default `fiscal localization package <fiscal_localizations/packages>` |
| `Thailand - Accounting Reports` | <span class="title-ref">l10n_th_reports</span> | Country-specific accounting reports                                   |

![Thailand localization modules](thailand/modules.png)

## Chart of accounts and taxes

Odoo's fiscal localization package for Thailand includes the following
taxes:

- VAT 7%
- VAT-exempted
- Withholding tax
- Withholding income tax

## Tax report

Odoo allows users to generate Excel files to submit their VAT to the
**Revenue Department** of Thailand.

### Sales and purchase tax report

To generate a sales and purchase tax report, go to
`Accounting --> Reporting --> Tax
Report`. Select a specific time or time range on the tax report, and
click `VAT-202-01 (xlsx)` for purchase tax and `VAT-202-02 (xlsx)` for
sales tax.

![Thai purchase and sales taxes reports](thailand/tax-report.png)

### Withholding PND tax report

PND report data displays the summarized amounts of the applicable
**withholding corporate income tax returns (domestic)** from vendor
bills under the `PND53 (TH)` and `PND3 (TH)` tax reports. It is
installed by default with the Thai localization.

![PND tax reports](thailand/pnd-report.png)

> [!NOTE]
> Withholding corporate income tax returns (domestic) is the tax used in
> case the company has withheld the tax from “**Personal (PND3)**” or
> “**Corporate (PND53)**” services provided such as rental, hiring,
> transportation, insurance, management fee, consulting, etc.

The PND tax report allows users to generate a CSV file for bills to
upload on the [RDprep for Thailand e-Filling
application](https://efiling.rd.go.th/rd-cms/).

To generate a PND CSV file, go to
`Accounting --> Reporting --> Tax Report`, select a specific time or
time range on the tax report, and click `PND3` or `PND53`.

This generates the `Tax Report PND3.csv` and `Tax Report PND53.csv`
files that lists all the vendor bill lines with the applicable
withholding tax.

![PND3 and PND53 CSV files](thailand/pnd3-pnd53.png)

> [!WARNING]
> Odoo cannot generate the PND or PDF report or **withholding tax
> certificate** directly. The generated `Tax Report PND3.csv` and
> `Tax Report PND53.csv` files must be exported to an external tool to
> convert them into a **withholding PND** report or a **PDF** file.

## Tax invoice

The **tax invoice PDF** report can be generated from Odoo through the
**Invoicing** module. Users have the option to print PDF reports for
normal invoices and tax invoices. To print out **tax invoices**, users
can click on `Print Invoices` in Odoo. Regular invoices can be printed
as **commercial invoices** by clicking on `Cog button (⚙️) --> Print -->
Commercial Invoice`.

![Commercial invoice printing](thailand/tax-invoice.png)

### Headquarter/Branch number settings

You can inform a company's **Headquarters** and **Branch number** in the
**Contacts** app. Once in the app, open the **contact form** of the
company and under the `Sales & Purchase` tab:

- If the contact is identified as a branch, input the **Branch number**
  in the `Company ID` field.
- If the contact is a **Headquarters**, leave the `Company ID` field
  **blank**.

![Company Headquarter/Branch number](thailand/contact.png)

> [!TIP]
> This information is used in the **tax invoice** PDF report and PND
> **tax report** export.
