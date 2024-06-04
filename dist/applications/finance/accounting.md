show-content  

# Accounting and Invoicing

**Odoo Invoicing** is a standalone invoicing app to create invoices,
send them to your customers, and manage payments.

**Odoo Accounting** is a full featured accounting app. Accountant
productivity is at the core of its development with features such as
AI-powered invoice recognition, synchronization with your bank accounts,
smart matching suggestions, etc.

<div class="seealso">

[Odoo Tutorials: Accounting](https://www.odoo.com/slides/accounting-19)

</div>

<div class="cards">

<div class="card" target="accounting/get_started" large="">

Get started

Basic concepts of accounting and initial setup of your accounting

</div>

<div class="card" target="accounting/taxes">

Taxes

Taxes, fiscal positions, and integrations

</div>

<div class="card" target="accounting/customer_invoices">

Customer invoices

Customer invoices, payment terms, and electronic invoicing

</div>

<div class="card" target="accounting/vendor_bills">

Vendor bills

Vendor bills, assets, and invoice digitization (OCR)

</div>

<div class="card" target="accounting/payments">

Payments

Invoices and bills payments (online, checks, batches) and follow-up on
invoices

</div>

<div class="card" target="accounting/bank">

Bank and cash accounts

Bank synchronization, reconciliation, and cash registers

</div>

<div class="card" target="accounting/reporting">

Reporting

Reporting, declarations, and analytic accounting

</div>

</div>

## Double-entry bookkeeping

Odoo automatically creates all the underlying journal entries for all
accounting transactions (e.g., customer invoices, vendor bills,
point-of-sales orders, expenses, inventory valuations, etc.).

Odoo uses the double-entry bookkeeping system, whereby every entry needs
a corresponding and opposite counterpart in a different account, with
one account debited and the other credited. It ensures that all
transactions are recorded accurately and consistently and that the
accounts always balance.

<div class="seealso">

`Accounting Cheat Sheet <accounting/get_started/cheat_sheet>`

</div>

## Accrual and cash basis

Both accrual and cash basis accounting are supported in Odoo. This
allows reporting income and expense either when the transaction occurs
(accrual basis) or when the payment is made or received (cash basis).

<div class="seealso">

`Cash basis <accounting/taxes/cash_basis>`

</div>

## Multi-company

Several companies can be managed within the same database. Each company
has its `chart of
accounts <accounting/get_started/chart_of_accounts>`, which is also
useful to generate consolidation reports. Users can access several
companies but can only work on a single company's accounting at a time.

## Multi-currency environment

A `multi-currency <accounting/get_started/multi_currency>` environment
with an automated exchange rate to ease international transactions is
available in Odoo. Every transaction is recorded in the company's
default currency; for transactions occurring in another currency, Odoo
stores both the value in the company's currency and the transactions'
currency value. Odoo generates currency gains and losses after
reconciling the journal items.

<div class="seealso">

`Manage a bank in a foreign currency <accounting/bank/foreign_currency>`

</div>

## International standards

Odoo Accounting supports more than 70 countries. It provides the central
standards and mechanisms common to all nations, and thanks to
country-specific modules, local requirements are fulfilled. Fiscal
positions exist to address regional specificities like the chart of
accounts, taxes, or any other requirements.

<div class="seealso">

`Fiscal localization packages <fiscal_localizations>`

</div>

## Accounts receivable and payable

By default, there is a single account for the account receivable entries
and one for the account payable entries. As transactions are linked to
your **contacts**, you can run a report per customer, vendor, or
supplier.

The **Partner Ledger** report displays the balance of your customers and
suppliers. It is available by going to
`Accounting --> Reporting --> Partner Ledger`.

## Reporting

The following financial `reports <accounting/reporting>` are available
and updated in real-time:

<table style="width:67%;">
<colgroup>
<col style="width: 18%" />
<col style="width: 48%" />
</colgroup>
<thead>
<tr class="header">
<th colspan="2"><blockquote>
<p>Financial reports</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td rowspan="5">Statement</td>
<td>Balance sheet</td>
</tr>
<tr class="even">
<td>Profit and loss</td>
</tr>
<tr class="odd">
<td>Cash flow statement</td>
</tr>
<tr class="even">
<td>Tax report</td>
</tr>
<tr class="odd">
<td>ES sales list</td>
</tr>
<tr class="even">
<td rowspan="5">Audit</td>
<td>General ledger</td>
</tr>
<tr class="odd">
<td>Trial balance</td>
</tr>
<tr class="even">
<td>Journal report</td>
</tr>
<tr class="odd">
<td>Intrastat report</td>
</tr>
<tr class="even">
<td>Check register</td>
</tr>
<tr class="odd">
<td rowspan="3">Partner</td>
<td>Partner ledger</td>
</tr>
<tr class="even">
<td>Aged receivable</td>
</tr>
<tr class="odd">
<td>Aged payable</td>
</tr>
<tr class="even">
<td rowspan="7">Management</td>
<td>Invoice analysis</td>
</tr>
<tr class="odd">
<td>Unrealized currency gains/losses</td>
</tr>
<tr class="even">
<td>Depreciation schedule</td>
</tr>
<tr class="odd">
<td>Disallowed expenses</td>
</tr>
<tr class="even">
<td>Budget analysis</td>
</tr>
<tr class="odd">
<td>Product margins</td>
</tr>
<tr class="even">
<td>1099 report</td>
</tr>
</tbody>
</table>

> [!TIP]
> `Create and customize reports <accounting/reporting/customize>` with
> Odoo's report engine.

### Tax report

Odoo computes all accounting transactions for the specific tax period
and uses these totals to calculate the tax obligation.

> [!IMPORTANT]
> Once the tax report has been generated for a period, Odoo locks it and
> prevents the creation of new journal entries involving VAT. Any
> correction to customer invoices or vendor bills has to be recorded in
> the next period.

> [!NOTE]
> Depending on the country's localization, an XML version of the tax
> report can be generated to be uploaded to the VAT platform of the
> relevant taxation authority.

## Bank synchronization

The bank synchronization system directly connects with your bank
institution to automatically import all transactions into your database.
It gives an overview of your cash flow without logging into an online
banking system or waiting for paper bank statements.

<div class="seealso">

`Bank synchronization <accounting/bank/bank_synchronization>`

</div>

## Inventory valuation

Both periodic (manual) and perpetual (automated) inventory valuations
are supported in Odoo. The available methods are standard price, average
price, `LIFO (Last-In, First-Out)` and `FIFO (First-In, First-Out).`

<div class="seealso">

`../inventory_and_mrp/inventory/warehouses_storage/inventory_valuation/inventory_valuation_config`

</div>

## Retained earnings

Retained earnings are the portion of income retained by a business. Odoo
calculates current year earnings in real-time, so no year-end journal or
rollover is required. The profit and loss balance is automatically
reported on the balance sheet report.

<div class="seealso">

`Accounting Cheat Sheet <accounting/get_started/cheat_sheet>`

</div>

## Fiduciaries

The `Accounting Firms` mode can be activated by going to `Accounting -->
Configuration --> Settings --> Accounting Firms mode`. When enabled:

- The document's sequence becomes editable on all documents;
- The `Total (tax incl.)` field appears to speed up and control the
  encoding by automating line creation with the right account and tax;
- `Invoice Date` and `Bill Date` are pre-filled when encoding a
  transaction.
- A `Quick encoding` option is available for customer invoices and
  vendor bills.

<div class="toctree" titlesonly="">

accounting/get_started accounting/taxes accounting/customer_invoices
accounting/vendor_bills accounting/payments accounting/bank
accounting/reporting

</div>
