# Record exchange rates at payments

## Overview

Any company doing international trade faces the case where the payments
are in a different currency.

After receiving their payments, you have the option to convert the
amount into your company currency. Multi currency payment implies rates
fluctuations. The rate differences are automatically recorded by Odoo.

## Configuration

### Enable multi-currencies

In the accounting module, Go to `Configuration --> Settings` and flag
**Allow multi currencies**, then click on **apply**.

![image](exchange/exchange_rate03.png)

Configure the currency rates in `Configuration --> Currencies`. Write
down the rate and make sure the currency is active.

![image](exchange/exchange_rate02.png)

In this document, the base currency is **Euro** and we will record
payments in **Dollars**.

![image](exchange/exchange_rate08.png)

<div class="tip">

<div class="title">

Tip

</div>

You can automatically fetch the currency rates from the **European
Central Bank** or from **Yahoo**. Please read the document :
`how_it_works`.

</div>

### Configure your journal

In order to register payments in other currencies, you have to **remove
the currency constraint** on the journal. Go to the accounting
application, Click on **More** on the journal and **Settings**.

![image](exchange/exchange_rate06.png)

Check if the **Currency** field is empty or in the foreign currency in
which you will register the payments. If a currency is filled in, it
means that you can register payments only in this currency.

![image](exchange/exchange_rate10.png)

## Record a payment in a different currency

In the **Accounting** application, go to `Sales --> Payments`. Register
the payment and indicate that it was done in the foreign currency. Then
click on **confirm**.

![image](exchange/exchange_rate05.png)

The journal entry has been posted but not allocated.

Go back to your invoice (`Sales --> Customer Invoices`) and click on
**Add** to allocate the payment.

![image](exchange/exchange_rate04.png)

## Record a bank statement in a different currency

Create or import the bank statement of your payment. The **Amount** is
in the company currency. There are two complementary fields, the
**Amount currency**, which is the amount that was actually paid and the
**Currency** in which it was paid.

![image](exchange/exchange_rate07.png)

When reconciling it, Odoo will directly match the payment with the right
**Invoice**. You will get the invoice price in the invoice currency and
the amount in your company currency.

![image](exchange/exchange_rate09.png)

## Check the exchange rate differences

Go to `Adviser --> Journal Entries` and look for the **Exchange
difference** journal entries. All the exchange rates differences are
recorded in it.

![image](exchange/exchange_rate01.png)

<div class="tip">

<div class="title">

Tip

</div>

The Exchange difference journal can be changed in your accounting
settings.

</div>

<div class="seealso">

\* `../../bank/reconciliation/reconciliation_models` \*
`../../bank/reconciliation/use_cases`

</div>
