# Invoice online payment

To make it more convenient for your customers to pay the invoices you
issue, you can activate the **Invoice Online Payment** feature, which
adds a *Pay Now* button on their **Customer Portal**. This allows your
customers to see their invoices online and pay directly with their
favorite payment method, making the payment process much easier.

![Payment acquirer choice after having clicked on "Pay
Now"](online_payment/online-payment-acquirers.png)

## Configuration

Make sure your `Payment Acquirers are correctly configured
<payment_acquirers/configuration>`.

<div class="note">

<div class="title">

Note

</div>

By default, "`Wire Transfer
</applications/finance/payment_acquirers/wire_transfer>`" is the only
Payment Acquirer activated, but you still have to fill out the payment
details.

</div>

To activate the Invoice Online Payment, go to `Accounting -->
Configuration -->
Settings --> Customer Payments`, enable **Invoice Online Payment**, and
click on *Save*.

## Customer Portal

After issuing the invoice, click on *Send & Print* and send the invoice
by email to the customer. They will receive an email with a link that
redirects them to the invoice on their **Customer Portal**.

![Email with a link to view the invoice online on the Customer
Portal.](online_payment/online-payment-view-invoice.png)

They can choose which Payment Acquirer to use by clicking on *Pay Now*.

!["Pay now" button on an invoice in the Customer
Portal.](online_payment/online-payment-pay-now.png)

<div class="seealso">

  - `/applications/finance/payment_acquirers`

</div>
