# Luxembourg

## Standard Chart of Accounts - PCN 2020

Odoo's `fiscal localization package <fiscal_localizations/packages>` for
Luxembourg includes the current **Standard Chart of Accounts (PCN
2020)**, effective since January 2020.

## eCDF tax return

Tax returns in Luxembourg require a specific XML file to upload on the
eCDF.

To download it, go to `Accounting --> Report --> Audit Reports --> Tax
Report`, and click on `Export eCDF declaration`.

<div class="seealso">

\- `../accounting/reporting/declarations/tax_returns` - [Platform for
electronic gathering of financial data (eCDF)](http://www.ecdf.lu)

</div>

## Annual tax report

You can generate an XML file to electronically file your annual tax
report with the tax office.

To do so, go to `Accounting --> Report --> Luxembourg --> Annual Tax
Report`, click on `Create`, then define the annual period in the `Year`
field.

The **simplified annual declaration** is automatically generated. You
can manually add values in all the fields to get a **complete annual
declaration**.

![Odoo Accounting (Luxembourg localization) generates an annual tax
declaration.](luxembourg/annual-tax-report.png)

To help you complete it, you can use the information provided on the
`Tax Report`. To do so, go to `Accounting --> Report --> Audit Reports
--> Tax Report`, then click on the `Tax Report` dropdown menu and select
the type of report you want to display.

![Dropdown menu to select the type of Tax
Report](luxembourg/tax-report-types.png)

Finally, click on `Export XML` to download the XML file.

## FAIA (SAF-T)

**FAIA (Fichier d’Audit Informatisé AED)** is a standardized and
structured file that facilitates the exchange of information between the
taxpayers' accounting system and the tax office. It is the Luxembourgish
version of the OECD-recommended SAF-T (Standard Audit File for Tax).

Odoo can generate an XML file that contains all the content of an
accounting period according to the rules imposed by the Luxembourg tax
authorities on digital audit files.

### Configuration

`Install <general/install>` the module `Luxembourg Standard Audit File
for Tax` (module's technical name: `l10n_lu_saft`).

### Export FAIA file

Go to `Accounting --> Reporting --> Audit Reports --> General Ledger`,
then click on `Export SAF-T (Luxembourg)`.
