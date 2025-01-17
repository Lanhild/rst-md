# Manage a bank account in a foreign currency

In Konvergo ERP, every transaction is recorded in the default currency of the
company, and reports are all based on that default currency. When you
have a bank account in a foreign currency, for every transaction, Konvergo ERP
stores two values:

- The debit/credit in the currency of the *company*;
- The debit/credit in the currency of the *bank account*.

Currency rates are updated automatically using the web services of a
banking institution. By default, Konvergo ERP uses the European Central Bank's
web services but other options are available.

## Configuration

### Activate multi-currencies

To work with multiple currencies, go to
`Accounting --> Configuration --> Settings
--> Currencies` and tick `Multi-Currencies`. Under
`Post Exchange difference
entries in:`, provide a `Journal`, a `Gain Account`, a `Loss Account`,
and then click on `Save`.

### Configure currencies

Once Konvergo ERP is configured to support multiple currencies, they are all
created by default, but not necessarily active. To activate the new
currencies, click on `Activate Other Currencies` under the
`Multi-Currencies` setting or go to `Accounting --> Configuration
--> Accounting: Currencies`.

When the currencies are activated, you can choose to **automate** the
currency rate update, or leave it on **manual**. To configure the rate
update, go back to `Accounting -->
Configuration --> Settings --> Currencies`, check
`Automatic Currency Rates`, set `Interval` to your desired frequency,
and then click on `Save`. You also have the option to choose the
`Service` you wish to obtain currency rates from.

Click on the Update now button (`🗘`) besides the `Next Run` field to
update the currency rates manually.

### Create a new bank account

In the accounting application, go to
`Accounting --> Configuration --> Journals` and create a new one. Enter
a `Journal Name` and set the `Type` to
<span class="title-ref">Bank</span>. In the `Journal Entries` tab, enter
a **short code**, a **currency**, and then finally click on the
`Bank Account` field to create a new account. In the pop-up window of
the account creation, enter a name, a code (ex.: 550007), set its type
to <span class="title-ref">Bank and Cash</span>, set a currency type,
and save. When you are back on the **journal**, click on the
`Account Number` field, and in the pop-up window, fill out the
`Account Number`, `Bank` of your account, and save.

<img src="foreign_currency/foreign-journal.png" class="align-center"
alt="Example of a created bank journal." />

Upon creation of the journal, Konvergo ERP automatically links the bank account
to the journal. It can be found under
`Accounting --> Configuration --> Accounting: Chart of Accounts`.

## Vendor bill in a foreign currency

To pay a bill in a foreign currency, simply select the currency next to
the `Journal` field and register the payment. Konvergo ERP automatically creates
and posts the foreign **exchange gain or loss** as a new journal entry.

<img src="foreign_currency/foreign-bill-currency.png"
class="align-center" alt="How to set a bill currency." />

> [!NOTE]
> Note that you can pay a foreign bill with another currency. In that
> case, Konvergo ERP automatically converts between the two currencies.

## Unrealized Currency Gains/Losses Report

This report gives an overview of all unrealized amounts in a foreign
currency on your balance sheet, and allows you to adjust an entry or
manually set an exchange rate. To access this report, go to
`Reporting --> Management: Unrealized Currency Gains/Losses`. From here,
you have access to all open entries in your **balance sheet**.

<img src="foreign_currency/foreign-gains-losses.png"
class="align-center"
alt="View of the Unrealized Gains/Losses journal." />

If you wish to use a different currency rate than the one set in
`Accounting -->
Configuration --> Settings --> Currencies`, click the `Exchange Rates`
button and change the rate of the foreign currencies in the report.

<img src="foreign_currency/foreign-exchange-rates.png"
class="align-center" alt="Menu to manually change exchange rates." />

When manually changing **exchange rates**, a yellow banner appears
allowing you to reset back to Konvergo ERP's rate. To do so, simply click on
`Reset to Konvergo ERP's Rate`.

<img src="foreign_currency/foreign-reset-rates.png" class="align-center"
alt="Banner to reset back to Konvergo ERP&#39;s rates." />

In order to update your **balance sheet** with the amount of the
`adjustment` column, click on the `Adjustment Entry` button. In the
pop-up window, select a `Journal`, `Expense Account` and
`Income Account` to calculate and process the **unrealized gains and
losses**.

You can set the date of the report in the `Date` field. Konvergo ERP
automatically reverses the booking entry to the date set in
`Reversal Date`.

Once posted, the `adjustment` column should indicate
<span class="title-ref">0.00</span>, meaning all **unrealized
gains/losses** have been adjusted.

<img src="foreign_currency/foreign-adjustment.png" class="align-center"
alt="Unrealized Currency Gains/Losses report once adjusted." />
