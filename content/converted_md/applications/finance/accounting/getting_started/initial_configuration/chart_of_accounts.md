# Chart of accounts

The **chart of accounts (COA)** is the list of all the accounts used to
record financial transactions in the general ledger of an organization.

The accounts are usually listed in the order of appearance in the
financial reports. Most of the time, they are listed as follows :

  - Balance Sheet accounts:
      - Assets
      - Liabilities
      - Equity
  - Profit & Loss:
      - Income
      - Expense

When browsing your chart of accounts, you can filter the accounts by
number, in the left column, and also group them by `Account Type`.

![Group the accounts by type in Odoo
Accounting](chart_of_accounts/chart-of-accounts.png)

## Configuration of an account

The country you select at the creation of your database (or additional
company on your database) determines which **fiscal localization
package** is installed by default. This package includes a standard
chart of accounts already configured according to the country's
regulations. You can use it directly or set it according to your
company's needs.

<div class="warning">

<div class="title">

Warning

</div>

It is not possible to modify the **fiscal localization** of a company
once a journal entry has been posted.

</div>

To create a new account, go to `Accounting --> Configuration --> Chart
of Accounts`, click on `Create`, and fill out the form.

### Code and name

Each account is identified by its **code** and **name**, which also
indicates the account's purpose.

### Type

Correctly configuring the **account type** is critical as it serves
multiple purposes:

  - Information on the account's purpose and behavior
  - Generate country-specific legal and financial reports
  - Set the rules to close a fiscal year
  - Generate opening entries

To configure an account type, open the `Type` field's drop-down selector
and select the right type among the following list:

<table style="width:79%;">
<colgroup>
<col style="width: 22%" />
<col style="width: 20%" />
<col style="width: 36%" />
</colgroup>
<thead>
<tr class="header">
<th>Report</th>
<th>Category</th>
<th>Account Types</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Balance Sheet</p>
<blockquote>
<ul>
<li></li>
<li></li>
</ul>
</blockquote></td>
<td><blockquote>
<dl>
<dt>Assets</dt>
<dd><ul>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
</ul>
</dd>
</dl>
</blockquote>
<dl>
<dt>--------------+</dt>
<dd><dl>
<dt>Liabilities</dt>
<dd><ul>
<li></li>
<li></li>
<li></li>
</ul>
</dd>
</dl>
</dd>
<dt>--------------+</dt>
<dd><dl>
<dt>Equity</dt>
<dd><ul>
<li></li>
</ul>
</dd>
</dl>
</dd>
</dl></td>
<td><blockquote>
<p>Receivable</p>
</blockquote>
<dl>
<dt>-------------------------+</dt>
<dd><p>Bank and Cash</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Current Assets</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Non-current Assets</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Prepayments</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Fixed Assets</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Payable</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Credit Card</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Current Liabilities</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Non-current Liabilities</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Equity</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Current Year Earnings</p>
</dd>
</dl></td>
</tr>
<tr class="even">
<td><p>Profit &amp; Loss</p>
<blockquote>
<ul>
<li></li>
</ul>
</blockquote></td>
<td><blockquote>
<dl>
<dt>Income</dt>
<dd><ul>
<li></li>
</ul>
</dd>
</dl>
</blockquote>
<dl>
<dt>--------------+</dt>
<dd><dl>
<dt>Expense</dt>
<dd><ul>
<li></li>
<li></li>
</ul>
</dd>
</dl>
</dd>
</dl></td>
<td><blockquote>
<p>Income</p>
</blockquote>
<dl>
<dt>-------------------------+</dt>
<dd><p>Other Income</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Expense</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Depreciation</p>
</dd>
<dt>-------------------------+</dt>
<dd><p>Cost of Revenue</p>
</dd>
</dl></td>
</tr>
<tr class="odd">
<td>Other</td>
<td>Other</td>
<td>Off-Balance Sheet</td>
</tr>
</tbody>
</table>

#### Assets, deferred expenses, and deferred revenues automation

Some **account types** display a new field **to automate** the creation
of `assets
<assets-automation>` entries, `deferred expenses
<deferred-expenses-automation>` entries, and `deferred revenues
<deferred-revenues-automation>` entries.

You have three choices for the `Automation` field:

1.  `No`: this is the default value. Nothing happens.
2.  `Create in draft`: whenever a transaction is posted on the account,
    a draft entry is created, but not validated. You must first fill out
    the corresponding form.
3.  `Create and validate`: you must also select a **model**. Whenever a
    transaction is posted on the account, an entry is created and
    immediately validated.

### Default taxes

Select a **default tax** that will be applied when this account is
chosen for a product sale or purchase.

### Tags

Some accounting reports require **tags** to be set on the relevant
accounts. By default, you can choose among the tags that are used by the
*Cash Flow Statement*.

### Account groups

**Account groups** are useful to list multiple accounts as
*sub-accounts* of a bigger account and thus consolidate reports such as
the **Trial Balance**. By default, groups are handled automatically
based on the code of the group. For example, a new account
<span class="title-ref">131200</span> is going to be part of the group
<span class="title-ref">131000</span>.

### Create account groups manually

<div class="note">

<div class="title">

Note

</div>

Regular users should not need to create account groups manually. The
following section is only intended for rare and advanced use cases.

</div>

To create a new account group, `developer mode <developer-mode>` and
head to `Accounting app --> Configuration --> Account Groups`. Here,
create a new group and enter the `name, code prefix, and company` to
which that group account should be available. Note that you must enter
the same code prefix in both `From` and `to` fields.

![Account groups creation.](chart_of_accounts/account-groups.png)

To display your **Trial Balance** report with your account groups, go to
`Accounting
app-->Reporting-->Trial Balance`, then open the `Options` menu and
select `Hierarchy and Subtotals`.

![Account Groups in the Trial Balance in Odoo
Accounting](chart_of_accounts/trial-balance.png)

### Allow reconciliation

Some accounts, such as accounts made to record the transactions of a
payment method, can be used for the reconciliation of journal entries.

For example, an invoice paid with a credit card can be marked as `paid`
if reconciled with its payment. Therefore, the account used to record
credit card payments needs to be configured as **allowing
reconciliation**.

To do so, check the `Allow Reconciliation` box in the account's
settings, and save.

### Deprecated

It is not possible to delete an account once a transaction has been
recorded on it. You can make them unusable by using the **Deprecated**
feature.

To do so, check the `Deprecated` box in the account's settings, and
save.

<div class="seealso">

\* `../cheat_sheet` \* `../../payables/supplier_bills/assets` \*
`../../payables/supplier_bills/deferred_expenses` \*
`../../receivables/customer_invoices/deferred_revenues` \*
`../../../fiscal_localizations`

</div>
