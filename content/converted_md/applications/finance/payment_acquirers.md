  - show-content

# Payment Acquirers (Credit Cards, Online Payment)

<div class="toctree" data-titlesonly="">

payment\_acquirers/wire\_transfer payment\_acquirers/adyen
payment\_acquirers/authorize payment\_acquirers/paypal
payment\_acquirers/stripe

</div>

Odoo embeds several **payment acquirers** that allow your customers to
pay on their *Customer Portals* or your *eCommerce website*. They can
pay Sales Orders, invoices, or subscriptions with recurring payments
with their favorite payment methods such as **Credit Cards**.

Offering several payment methods increases the chances of getting paid
in time, or even immediately, as you make it more convenient for your
customers to pay with the payment method they prefer and trust.

![Pay online in the customer portal and select which payment acquirer to
use.](payment_acquirers/online-payment.png)

<div class="note">

<div class="title">

Note

</div>

Odoo apps delegate the handling of sensitive information to the
certified payment acquirer so that you don't ever have to worry about
PCI compliance.

This means that no sensitive information (such as credit card numbers or
credentials) is stored on Odoo servers or Odoo databases hosted
elsewhere. Instead, Odoo apps use a unique reference number to the data
stored safely in the payment acquirers' systems.

</div>

## Payment Acquirers

From an accounting perspective, we can distinguish two types of payment
acquirers: the payments that go directly on the bank account and follow
the usual reconciliation workflow, and the payment acquirers that are
third-party services and require you to follow another accounting
workflow.

### Bank Payments

  - `Wire Transfer <payment_acquirers/wire_transfer>`  
    When selected, Odoo displays your payment information with a payment
    reference. You have to approve the payment manually once you have
    received it on your bank account.

  - `SEPA Direct Debit
    <../finance/accounting/receivables/customer_payments/batch_sdd>`  
    Your customers can sign a SEPA Direct Debit mandate online and get
    their bank account charged directly.

### Online Payment Providers

|                                               | Redirection to the acquirer website | Payment from Odoo | Save Cards | Capture Amount Manually |
| --------------------------------------------- | ----------------------------------- | ----------------- | ---------- | ----------------------- |
| `Adyen
<payment_acquirers/adyen>`             | ✔                                   |                   |            |                         |
| Alipay                                        | ✔                                   |                   |            |                         |
| `Authorize.Net
<payment_acquirers/authorize>` | ✔                                   | ✔                 | ✔          | ✔                       |
| Buckaroo                                      | ✔                                   |                   |            |                         |
| Ingenico                                      | ✔                                   | ✔                 | ✔          |                         |
| `PayPal
<payment_acquirers/paypal>`           | ✔                                   |                   |            |                         |
| PayUMoney                                     | ✔                                   |                   |            |                         |
| SIPS                                          | ✔                                   |                   |            |                         |
| Stripe                                        | ✔                                   | ✔                 | ✔          |                         |

<div class="note">

<div class="title">

Note

</div>

Some of these Online Payment Providers can also be added as `Bank
Accounts
<../finance/accounting/bank/setup/bank_accounts>`, but this is **not**
the same process as adding them as Payment Acquirers. Payment Acquirers
allow customers to pay online, and Bank Accounts are added and
configured on your Accounting app to do a bank reconciliation, which is
an accounting control process.

</div>

## Configuration

Some of the features described in this section are available only with
some Payment Acquirers. Refer to `the table above
<payment_acquirers/online_providers>` for more details.

### Add a new Payment Acquirer

To add a new Payment acquirer and make it available to your customers,
go to `Accounting / Website --> Configuration --> Payment Acquirers`,
look for your payment acquirer, install the related module, and activate
it. To do so, open the payment acquirer and change its state from
*Disabled* to *Enabled*.

![Click on install, then on activate to make the payment acquirer
available on Odoo.](payment_acquirers/activation.png)

<div class="warning">

<div class="title">

Warning

</div>

We recommend using the *Test Mode* on a duplicated database or a test
database. The Test Mode is meant to be used with your test/sandbox
credentials, but Odoo generates Sales Orders and Invoices as usual. It
isn't always possible to cancel an invoice, and this could create some
issues with your invoices numbering if you were to test your payment
acquirers on your main database.

</div>

#### Credentials tab

If not done yet, go to the **Online Payment Provider**'s website, create
an account, and make sure to have the credentials required for
third-party use. Odoo requires these credentials to communicate with the
Payment Acquirer and get the confirmation of the *payment
authentication*.

The form in this section is specific to the Payment Acquirer you are
configuring. Please refer to the related documentation for more
information.

#### Configuration tab

You can change the Payment Acquirer front-end appearance by modifying
its name under the **Displayed as** field and which credit card icons to
display under the **Supported Payment Icons** field.

##### Save and reuse Credit Cards

With the **Save Cards** feature, Odoo can store **Payment Tokens** in
your database, which can be used for subsequent payments, without having
to reenter the payment details. This is particularly useful for
subscriptions' recurring payments.

##### Place a hold on a card

If the **Capture Amount Manually** field is enabled, the funds are
reserved for a few days on the customer's card, but not charged yet. You
must then go to the related Sales Order and manually *capture* the funds
before its automatic cancellation, or *void the transaction* to unlock
the funds from the customer's card.

##### Payment Flow

Choose in the **Payment Flow** field if to redirect the user to the
payment acquirer's portal to authenticate the payment, or if to stay on
the current page and authenticate the payment from Odoo.

<div class="note">

<div class="title">

Note

</div>

Some features are available only if you select *Redirection to the
acquirer website*.

</div>

<div class="warning">

<div class="title">

Warning

</div>

When configuring a payment acquirer with the payment flow `Payment from
Odoo`, the payment acquirer is visible only to people who have an
account and are logged in on the related database. To add a payment
acquirer visible to everyone, the payment flow has to be set to
`Redirection to the acquirer website`.

</div>

##### Countries

Restrict the use of the Payment Acquirer to a selection of countries.
Leave this field blank to make the Payment Acquirer available to all
countries.

##### Payment Journal

The **Payment Journal** selected for your Payment Acquirer must be a
*Bank* journal.

<div class="important">

<div class="title">

Important

</div>

In many cases, Odoo automatically creates a new **Journal** and a new
**Account** when you activate a new Payment Acquirer. Both of them are
preset to work out-of-the-box, but we strongly recommend you to make
sure these fields are correctly set according to your accounting needs,
and adapt them if necessary.

</div>

#### Messages tab

Change here the messages displayed by Odoo after a payment's
confirmation or failure.

### Multi-company environment

If you have multiple companies on your database and wish to use the same
payment acquirer for several or all of them, switch to the company on
which the payment acquirer is configured, then go to `Accounting /
Website --> Configuration --> Payment Acquirers` and select the payment
acquirer to use. Then, click `Action --> Duplicate`, and in the
`Company` field, set the company for which you want to have that payment
acquirer available. Configure the rest of the fields according to your
needs, and `Save`.

<div class="note">

<div class="title">

Note

</div>

Creating a payment acquirer from the `Create` button is not supported.
You *must* use the `Duplicate` action instead.

</div>

## Accounting perspective

The **Bank Payments** that go directly to one of your bank accounts
follow their usual reconciliation workflows. However, payments recorded
with **Online Payment Providers** require you to consider how you want
to record your payments' journal entries. We recommend you to ask your
accountant for advice.

Odoo default method is to record the payments on a *Current Assets
Account*, on a dedicated *Bank Journal*, once the *Payment
Authentication* is confirmed. At some point, you transfer the funds from
the *Payment Acquirer* to your *Bank Account*.

Here are the requirements for this to work:

  - Bank Journal
      - The Journal's **type** must be *Bank Journal*.
    
      - Select the right **Default Debit Account** and **Default Credit
        Account**.
    
      - Under the *Advanced Settings* tab, make sure that **Posting** is
        set as *Post At Payment Validation*.  
        This implies that the Journal Entry is recorded directly when
        your Odoo database receives the confirmation of the *Payment
        Authentication* from the Online Payment Provider.
  - Current Asset Account
      - The Account's **type** is *Current Assets*
      - The Account must **Allow Reconciliation**

<div class="note">

<div class="title">

Note

</div>

In many cases, Odoo automatically creates a new **Journal** and a new
**Current Asset Account** when you activate a new Payment Acquirer. You
can modify them if necessary.

</div>

<div class="seealso">

  - `../finance/accounting/receivables/customer_payments/recording`
  - `payment_acquirers/wire_transfer`
  - `payment_acquirers/authorize`
  - `payment_acquirers/paypal`

</div>
