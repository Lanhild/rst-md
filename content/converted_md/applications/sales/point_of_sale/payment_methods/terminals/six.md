# SIX

Connecting a SIX payment terminal allows you to offer a fluid payment
flow to your customers and ease the work of your cashiers.

<div class="warning">

<div class="title">

Warning

</div>

\- Starting in July 2022, it will **not** be possible anymore to connect
and use a Six payment terminal in PoS. - Even though Worldline has
recently acquired SIX Payment Services and both companies use Yomani
payment terminals, the firmware they run is different. Terminals
received from Worldline are therefore not compatible with this
integration.

</div>

## Configuration

### Configure the Payment Method

First, make sure that the `POS Six` module is installed. For this, go to
`Apps`, remove the `Apps` filter, and search for *POS Six*.

![The POS Six module.](six/pos-six-module.png)

Back in `Point of Sale --> Configuration --> Payment Methods`, create a
new payment method for SIX, select the payment terminal option `SIX`,
and enter the payment terminal IP address.

![Create a new payment method for the SIX payment
terminal.](six/new-payment-method.png)

## Pay with a Payment Terminal

In the `PoS (Point of Sale)` interface, at the moment of the payment,
select a payment method using a payment terminal. Verify that the amount
in the tendered column is the one that has to be sent to the payment
terminal and click on `Send`. To cancel the payment request, click on
`Cancel`.

![The PoS interface.](six/pos-send-payment.png)

When the payment is done, the status will change to `Payment
Successful`. If needed, reverse the last transaction by clicking on
`Reverse`.

![The Reverse button on the PoS interface.](six/pos-reverse-payment.png)

If there is any issue with the payment terminal, you can still force the
payment using the `Force Done` button. This will allow you to validate
the order in Odoo even if there are connection issues between the
payment terminal and Odoo.
