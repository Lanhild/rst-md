# Pay with SEPA

SEPA, the Single Euro Payments Area, is a payment-integration initiative
of the European Union to simplify bank transfers denominated in euros.
SEPA allows you to send payment orders to your bank to automate bank
wire transfers.

SEPA is supported by the banks of the 27 EU member states, as well as:

EFTA countries:

- Iceland;
- Liechtenstein;
- Norway;
- Switzerland.

Non-EEA SEPA countries:

- Andorra;
- Monaco;
- San Marino;
- United Kingdom;
- Vatican City State.

Non-EEA territories:

- Saint-Pierre-et-Miquelon;
- Guernsey;
- Jersey;
- Isle of Man.

When paying a bill in Konvergo ERP, you can select SEPA mandates as a payment
option. At the day's end, you can generate the SEPA file containing all
bank wire transfers and send it to the bank.

By default, the file follows the SEPA Credit Transfer
**'pain.001.001.03'** specifications. This is a well-defined standard
among banks. However, for Swiss and German companies, other formats are
used **'pain.001.001.03.ch.02'** for Switzerland and
**'pain.001.003.03'** for Germany.

Once the payments are processed by your bank, you can directly import
the account statement in Konvergo ERP. The bank reconciliation process will
seamlessly match the SEPA orders you sent to your bank with actual bank
statements.

## Configuration

### Activate SEPA Credit Transfer (SCT)

To pay suppliers with SEPA, you must activate the **SEPA Credit
Transfer** setting. To do so, go to
`Accounting --> Configuration --> Settings --> Vendor Payments: SEPA Credit Transfer
(SCT)`. By activating the setting and filling out your company data, you
will be able to use the SCT option when paying your vendor.

> [!NOTE]
> According to the localization package installed, the **SEPA Direct
> Debit** and **SEPA Credit Transfer** modules may be installed by
> default. If not, they need to be `installed <general/install>`.

### Activate SEPA payment methods on banks

From the accounting dashboard, click on the drop-down menu (`⋮`) on your
bank journal and select `Configuration`. Click the `Outgoing Payments`
tab, and, if not already present, add `SEPA Credit Transfer` under
`Payment Method`.

Make sure to specify the IBAN account number (domestic account numbers
do not work with SEPA) and the BIC (bank identifier code) in the
`Journal Entries` tab.

### Registering payments

You can register and vendor payments made with SEPA. To do so, go to
`Accounting -->
Vendors --> Payments`. When creating your payment, select
`SEPA Credit Transfer` as the `Payment Method`.

The first time you pay a vendor with SEPA, you have to fill in the
`Recipient Bank
Account` field with the bank name, IBAN, and BIC (Bank Identifier Code).
Konvergo ERP automatically verifies if the IBAN format is respected.

For future payments to this vendor, Konvergo ERP will automatically suggest you
the bank account, but it remains possible to select a new one.

Once your payment is registered, do not forget to confirm it. You can
also pay vendor bills from the bill directly using the
`Register Payment` button at the top of a vendor bill. The form is the
same, but the payment is directly linked to the bill and will be
automatically reconciled with it.
