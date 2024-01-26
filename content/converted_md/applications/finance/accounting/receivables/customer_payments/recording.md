# Different ways to record a payment

In Odoo, payments can either be linked automatically to an invoice or
bill or be stand-alone records for use at a later date.

If a payment is **linked to an invoice or bill**, it reduces the amount
due of the invoice. You can have multiple payments related to the same
invoice.

If a payment is **not linked to an invoice or bill**, the customer has
an outstanding credit with your company, or your company has an
outstanding debit with a vendor. You can use those outstanding amounts
to reduce unpaid invoices/bills.

<div class="seealso">

\- `Internal transfers <../../bank/interbank>` -
`../../bank/reconciliation/use_cases` - [Odoo Tutorials: Bank
Configuration](https://www.odoo.com/slides/slide/bank-configuration-1880)

</div>

## Registering payment from an invoice or bill

When clicking on `Register payment` in a customer invoice or vendor
bill, it generates a new journal entry and changes the amount due
according to the amount of the payment. The counterpart is reflected in
an outstanding receipts or payments account. At this point, the customer
invoice or vendor bill is marked as `In payment`. Then, when the
outstanding account is reconciled with a bank statement line, the
invoice or vendor bill changes to the `Paid` status.

The information icon near the payment line displays more information
about the payment. You can access additional information, such as the
related journal, by clicking on `View`.

![See detailed information of a payment](recording/information-icon.png)

<div class="note">

<div class="title">

Note

</div>

\- The customer invoice or vendor bill should be in the status `Posted`
to register the payment. - When clicking on `Register payment`, you can
select the amount to pay and make a partial or full payment. - If your
main bank account is set as outstanding account, and the payment is made
in Odoo (not related to a bank statement), invoices and bills are
directly registered in the status `Paid`. - If you unreconciled a
payment, it still appears in your books but is no longer linked to the
invoice. - If you (un)reconcile a payment in a different currency, a
journal entry is automatically created to post the currency exchange
gains/losses (reversal) amount. - If you (un)reconcile a payment and an
invoice having cash basis taxes, a journal entry is automatically
created to post the cash basis tax (reversal) amount.

</div>

<div class="seealso">

\- `../../bank/reconciliation/use_cases`

</div>

## Registering payments not tied to an invoice or bill

When a new payment is registered via the menu `Customers / Vendors -->
Payments`, it is not directly linked to an invoice or bill. Instead, the
account receivable or the account payable are matched with the
outstanding account until they are manually matched with their related
invoice or bill.

### Matching invoices and bills with payments

A blue banner appears when you validate a new invoice or bill and there
is an outstanding payment for this specific customer or vendor. It can
easily be matched from the invoice or the bill by clicking on `ADD`
under `Outstanding Credits` or `Outstanding Debits`.

![Shows the ADD option to reconcile an invoice or a bill with a
payment](recording/add-option.png)

The invoice or bill is now marked as `In payment` until it is reconciled
with the bank statement.

<div class="seealso">

\- `../../bank/reconciliation/use_cases`

</div>

### Batch payment

Batch payments allow you to group different payments to ease
`reconciliation
<../../bank/reconciliation/use_cases>`. They are also useful when you
deposit checks to the bank or for SEPA Payments. To do so, go to
`Accounting --> Customers --> Batch Payments` or `Accounting --> Vendors
--> Batch Payments`. In the list view of payments, you can select
several payments and group them in a batch by clicking on `Action -->
Create
Batch Payment`.

<div class="seealso">

\- `../../receivables/customer_payments/batch` -
`../../receivables/customer_payments/batch_sdd`

</div>

### Payments matching

The `Payments matching` tool opens all unreconciled customer invoices or
vendor bills and gives you the opportunity to process them all one by
one, doing the matching of all their payments and invoices at once. You
can reach this tool from the `Accounting Dashboard -->
Customer Invoices / Vendor Bills`, and click on `⋮` and select `Payments
Matching`, or by going to `Accounting --> Reconciliation`.

<div class="note">

<div class="title">

Note

</div>

During the `reconciliation <../../bank/reconciliation/use_cases>`, if
the sum of the debits and credits does not match, there is a remaining
balance. This either needs to be reconciled at a later date or needs to
be written off directly.

</div>

### Batch payments matching

To reconcile several outstanding payments or invoices at once, for a
specific customer or vendor, the batch reconciliation feature can be
used. Go to `Accounting --> Reporting -->
Aged Receivable / Aged Payable`. You now see all transactions that have
not been reconciled yet, and when you select a customer or vendor, the
`Reconcile` option is displayed.

![See the reconcile option](recording/reconcile-option.png)

## Reconciling payments with bank statements

Once a payment has been registered, the status of the invoice or bill is
`In payment`. The next step is to reconcile it with the related bank
statement line to have the transaction finalized and the invoice or bill
marked as `Paid`.

<div class="seealso">

\- `../../bank/reconciliation/use_cases`

</div>
