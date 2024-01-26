# Cash reconciliation

By default in Odoo, payments registered in the **cash journal** are
automatically reconciled with an **outstanding account** and their
related invoices or bills marked as *In Payment* until they are
reconciled with a bank statement. It is possible to `bypass
<cash-reconciliation-bypass>` the *In Payment* status for cash
transactions, therefore removing the need to reconcile with a bank
statement.

![In Payment status of invoice or
bill.](cash_transactions/cash-inpayment-status.png)

## Cash logs

At the start of each day, create a **cash log**. To do so, go to your
`Accounting
Dashboard` and click `New Transaction` in the `Cash` journal.

![Create a new cash log.](cash_transactions/new-transaction.png)

Enter the `Starting Balance` of your cash float and save, but do *not*
post the entry yet. Create your invoice by going to `Accounting
dashboard --> Customers --> Invoices` and confirm it. Click `Register
Payment` and select the cash `Journal`. Repeat the process for each
invoice.

![Select Cash journal upon payment
registration.](cash_transactions/cash-payment-journal.png)

Go back to your `Accounting Dashboard`, and click again on `New
transactions`. Click on the `Add a line` button in the `Transactions`
tab, and enter the total of cash earned during the day. Add a label name
according to your needs. Input the amount displayed under `Computed
Balance` in the `Ending Balance` field, and make sure it matches your
end cash float.

Once certain the **computed balance** is correct, click `Save`, `Post`,
and then `Reconcile`. This will take you to the **bank reconciliation**
page.

## Cash payments reconciliation

On the **bank reconciliation** page, search through the list for the
**cash log** transaction you created earlier. To be able to match all
cash payments, make sure no **partner** is selected in the `Select
Partner` field. If a **partner** is selected, click in the field and
delete the partner. Then, pair (or match) each cash payment with your
cash log by clicking on the payment in the `Customer/Vendor Matching`,
and `validate`.

![Cash payments
reconciliation.](cash_transactions/cash-payment-reconciliation.png)

<div class="note">

<div class="title">

Note

</div>

If your ending cash balance is **over** or **under** the computed
balance, add another `Transaction` line corresponding to the **over** or
**under** amount in order to match it later during reconciliation.

</div>

## Cash reconciliation bypass

<div id="cash-reconciliation-bypass">

<div class="important">

<div class="title">

Important

</div>

Bypassing the cash journal is recommended **only for organizations**
that do not need a cash report or do not wish to reconcile cash.

</div>

</div>

To bypass the *In Payment* status, go to `Accounting app -->
Configuration -->
Accounting: Journals` and select the `Cash` journal. Click on the
`Payments
Configuration` tab and set a <span class="title-ref">Cash</span> account
in both the `Outstanding Receipts Account` and `Outstanding Payments
Account` fields, then save. Payments registered in the **cash** journal
now bypass the *In Payment* status.

![Configuration tab of the cash
journal.](cash_transactions/cash-payments-config.png)

<div class="tip">

<div class="title">

Tip

</div>

In case you use cash to pay expenses, advance employees, are required to
keep records of cash flows, or use anything resembling a cash box, you
can benefit from creating a second **cash journal** that *does* use the
**outstanding accounts**. This way, you can both generate *and*
reconcile bank statements when closing your POS session or your books at
the end of the day.

</div>
