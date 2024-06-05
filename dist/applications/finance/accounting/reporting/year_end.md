# Year-end closing

Year-end closing is vital for maintaining financial accuracy, complying
with regulations, making informed decisions, and ensuring transparency
in reporting.

## Fiscal years

By default, the fiscal year is set to last 12 months and end on December
31st. However, its duration and end date can vary due to cultural,
administrative, and economic considerations.

To modify these values, go to
`Accounting --> Configuration --> Settings`. Under the `Fiscal Periods`
section, change the `Last Day` field if necessary.

If the period lasts *more* than or *less* than 12 months, enable
`Fiscal Years` and `Save`. Go back to the `Fiscal Periods` section and
click `➜ Fiscal
Years`. From there, click `Create`, give it a `Name`, and both a
`Start Date` and `End Date`.

> [!NOTE]
> Once the set fiscal period is over, Konvergo ERP automatically reverts to the
> default periodicity, taking into account the value specified in the
> `Last Day` field.

## Year-end checklist

### Before closure

Before closing a fiscal year, ensure first everything is accurate and
up-to-date:

- Make sure all bank accounts are fully
  `reconciled <../bank/reconciliation>` up to year-end, and confirm that
  the ending book balances match the bank statement balances.
- Verify that all `customer invoices <../customer_invoices>` have been
  entered and approved and that there are no draft invoices.
- Confirm that all `vendor bills  <../vendor_bills>` have been entered
  and agreed upon.
- Validate all `expenses <../../expenses>`, ensuring their accuracy.
- Corroborate that all `received payments <../payments>` have been
  encoded and recorded accurately.
- Close all `suspense accounts <bank_accounts/suspense>`.
- Book all `depreciation <../vendor_bills/assets>` and `deferred revenue
  <../customer_invoices/deferred_revenues>` entries.

### Closing a fiscal year

Then, to close the fiscal year:

- Run a `tax report <reporting/tax-report>`, and verify that all tax
  information is correct.
- Reconcile all accounts on the
  `balance sheet <reporting/balance-sheet>`:
  - Update the bank balances in Konvergo ERP according to the actual balances
    found on the bank statements.
  - Reconcile all transactions in the cash and bank accounts by running
    the `aged receivables
    <reporting/aged-receivable>` and
    `aged payables <reporting/aged-payable>` reports.
  - Audit all accounts, being sure to fully understand all transactions
    and their nature, making sure to include loans and fixed assets.
  - Optionally, run `payments matching <payments/matching>` to validate
    any open vendor bills and customer invoices with their payments.
    While this step is optional, it could assist the year-end closing
    process if all outstanding payments and invoices are reconciled,
    potentially finding errors or mistakes in the system.

Next, the accountant likely verifies balance sheet items and book
entries for:

> - year-end manual adjustments,
> - work in progress,
> - depreciation journal entries,
> - loans,
> - tax adjustments,
> - etc.

If the accountant is going through the year-end audit, they may want to
have paper copies of all balance sheet items (such as loans, bank
accounts, prepayments, sales tax statements, etc.) to compare these with
the balances in Konvergo ERP.

> [!TIP]
> During this process, it is good practice to set a
> `Journal Entries Lock Date` to the last day (inclusive) of the
> preceding fiscal year by going to `Accounting -->
> Accounting --> Lock Dates`. This way, the accountant can be confident
> that nobody changes the transactions while auditing the books. Users
> from the *accountant* access group can still create and modify
> entries.

#### Current year's earnings

Konvergo ERP uses a unique account type called **current year's earnings** to
display the amount difference between the **income** and **expenses**
accounts.

> [!NOTE]
> The chart of accounts can only contain one account of this type. By
> default, it is a 999999 account named `Undistributed Profits/Losses`.

To allocate the current year's earnings, create a miscellaneous entry to
book them to any equity account. Once done, confirm whether or not the
current year's earnings in the **balance sheet** is correctly reporting
a balance of zero. If that is the case, set an `All Users Lock Date` to
the last day of the fiscal year by going to
`Accounting --> Accounting --> Lock
Dates`.

> [!TIP]
> Install the `Irreversible Lock Date`
> (<span class="title-ref">account_lock</span>) module to make the `All
> Users Lock Date` *irreversible* once set.

> [!NOTE]
> A specific year-end closing entry is **optional** in order to close
> out the **profit and loss statement**. The reports are created in
> real-time, meaning that the profit and loss statement corresponds
> directly with the year-end date specified in Konvergo ERP. Therefore, any time
> the **income statement** is generated, the beginning date corresponds
> with the beginning of the **fiscal year** and all account balances
> should equal zero.
