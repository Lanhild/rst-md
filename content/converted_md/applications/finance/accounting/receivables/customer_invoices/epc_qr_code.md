# EPC QR codes

European Payments Council quick response codes, or **EPC QR codes**, are
two-dimensional barcodes that customers can scan with their **mobile
banking applications** to initiate a **SEPA credit transfer (SCT)** and
pay their invoices instantly.

In addition to bringing ease of use and speed, it greatly reduces typing
errors that would potentially make for payment issues.

<div class="note">

<div class="title">

Note

</div>

This feature is only available for companies in several European
countries such as Austria, Belgium, Finland, Germany, and the
Netherlands.

</div>

<div class="seealso">

\- `../../bank/setup/bank_accounts` - [Odoo Academy: QR Code on Invoices
for European Customers](https://www.odoo.com/r/VuU)

</div>

## Configuration

Go to `Accounting --> Configuration --> Settings` and activate the `QR
Codes` feature in the `Customer Payments` section.

### Configure your bank account's journal

Make sure that your `Bank Account` is correctly configured in Odoo with
your IBAN and BIC.

To do so, go to `Accounting --> Configuration --> Journals`, open your
bank journal, then fill out the `Account Number` and `Bank` under the
`Bank Account
Number` column.

![Bank account number column in the bank
journal](epc_qr_code/bank-journal.png)

## Issue invoices with EPC QR codes

EPC QR codes are added automatically to your invoices. Customers whose
bank supports making payments via EPC QR codes will be able to scan the
code and pay the invoice.

Go to `Accounting --> Customers --> Invoices`, and create a new invoice.

Before posting it, open the `Other Info` tab. Odoo automatically fills
out the `Recipient Bank` field with your IBAN.

<div class="note">

<div class="title">

Note

</div>

In the `Other Info` tab, the account indicated in the `Recipient Bank`
field is used to receive your customer's payment. Odoo automatically
populates this field with your IBAN by default and uses it to generate
the EPC QR code.

</div>

When the invoice is printed or previewed, the QR code is included at the
bottom.

![QR code on a customer invoice](epc_qr_code/invoice-qr-code.png)

<div class="tip">

<div class="title">

Tip

</div>

If you want to issue an invoice without an EPC QR code, remove the IBAN
indicated in the `Recipient Bank` field, under the `Other Info` tab of
the invoice.

</div>
