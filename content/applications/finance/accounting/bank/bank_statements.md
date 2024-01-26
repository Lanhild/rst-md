# Bank statements

Importing your bank statements in Odoo Accounting allows you to keep
track of the financial movements that occur on your bank accounts and
reconcile them with the transactions recorded in your accounting.

We recommend you use bank synchronization for more efficiency. Please
read the related documentation: `bank_synchronization`.

However, if you don't want to use bank synchronization or if your bank
is not a supported institution, you still have other options:

1.  Import the bank statement files delivered by your bank
2.  Register the bank statements manually

## Import bank statements files

Odoo supports multiple file formats to import bank statements:

  - SEPA recommended Cash Management format (CAMT.053)
  - Comma-separated values (.CSV)
  - Open Financial Exchange (.OFX)
  - Quicken Interchange Format (.QIF)
  - Belgium: Coded Statement of Account (.CODA)

To import them, go to `Accounting --> Overview --> Bank`, click on
*Import Statements*, or on the three dots, and then on *Import
Statement*.

![Import a bank statement file in Odoo
Accounting](bank_statements/bank-statements-01.png)

Next, select the file you want to import and click on *Import*.

Odoo opens an **import widget** to help you set the **Formatting
Options** and **map** the different columns you want to import.

![Register bank statements manually in Odoo
Accounting](bank_statements/bank-statements-02.png)

<div class="note">

<div class="title">

Note

</div>

Quicken Interchange Format (.QIF) is an older file format that is no
longer supported since 2005. If possible, prefer OFX files over QIF.

</div>

## Register bank statements manually

If needed, you can also record your bank statements manually.

To do so, go to `Accounting --> Overview --> Bank`, click on *Create
Statements*, or on the three dots, and then on *New Statement*.

Add a new line for each transaction written on the original bank
statement.

To ease the reconciliation process, make sure to fill out the *Partner*
field. You can also write the payments’ references in the *Label* field.

![Register bank statements manually in Odoo
Accounting](bank_statements/bank-statements-03.png)

<div class="note">

<div class="title">

Note

</div>

The *Ending Balance* and the *Computed Balance* should have the same
amount. If it is not the case, make sure that there is no mistake in the
transactions’ amounts.

</div>

<div class="seealso">

\* `bank_synchronization`

</div>

<div class="todo">

add doc link to new documentation about reconciliation

</div>
