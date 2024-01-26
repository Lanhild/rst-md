# Adyen

Connecting an **Adyen payment terminal** allows you to offer a fluid
payment flow to your customers and ease the work of your cashiers.

<div class="note">

<div class="title">

Note

</div>

Adyen works only with businesses processing **more** than **10 million
annually** or invoicing a **minimum** of **1,000** transactions **per
month**.

</div>

## Configuration

Start by creating your Adyen account on [Adyen's
website](https://www.adyen.com/). Then, board your terminal following
the steps described on your terminal's screen.

<div class="seealso">

\- [Adyen Docs - Payment terminal quickstart
guides](https://docs.adyen.com/point-of-sale/user-manuals).

</div>

### Configure the payment method

First, go to `Point of Sale --> Configuration --> Settings --> Payment
Terminals`, and enable `Adyen`. Then, go to `Configuration --> Payment
Methods` and create a new payment method. Select `Adyen` in the `Use a
Payment Terminal` field.

<div class="note">

<div class="title">

Note

</div>

The selected journal **must** be a bank journal for the `Use a payment
terminal` field to appear.

</div>

Finally, fill the mandatory fields with an `Adyen API key`, and an
`Adyen
Terminal Identifier`.

#### Generate an Adyen API key

The **Adyen API key** is a key used to authenticate your requests. To
generate an API key, go to your **Adyen account**.

Then, go to `Developers --> API credentials`. Create a new credential or
click on an existing one.

Click on `Generate an API key` and copy-paste that key onto the Odoo
mandatory field.

<div class="seealso">

\- [Adyen Docs - API
credentials](https://docs.adyen.com/development-resources/api-credentials#generate-api-key).

</div>

#### Locate the Adyen terminal identifier

The **Adyen Terminal Identifier** is your terminal's serial number,
which is used to identify the hardware.

To find this number, go to your **Adyen account**. Then, go to `Point of
Sale
--> Terminals`, select the terminal to link, and copy-paste its serial
number onto the Odoo mandatory field.

#### Set the Event URLs

For Odoo to know when a payment is made, you must set the terminal
**Event URLs**. To do so,

1.  log in to [Adyen's website](https://www.adyen.com/);
2.  go to `Adyen's dashboard --> Point of Sale --> Terminals` and select
    the connected terminal;
3.  from the terminal settings, click `Integrations`;
4.  set the `Switch to decrypted mode to edit this setting` field as
    `Decrypted`;
5.  click the **pencil icon** button and enter your server address,
    followed by <span class="title-ref">/pos\_adyen/notification</span>
    in the `Event URLs` field; and
6.  click `Save` at the bottom of the screen to save the changes.

## Add a new payment method

To add a new **payment method** to a point of sale, go to `Point of Sale
-->
Configuration --> Point of Sale`. Then, select the POS and go to
`Payments -->
Payment Methods`, and add your new method for Adyen.

## Pay with a payment terminal

When processing a payment, select `Adyen` as the payment method. Check
the amount and click on `Send`. Once the payment is successful, the
status changes to `Payment
Successful`.

<div class="note">

<div class="title">

Note

</div>

\- | In case of connection issues between Odoo and the payment terminal,
force the payment by clicking on `Force Done`, which allows you to
validate the order. | This option is only available after receiving an
error message informing you that the connection failed. - To cancel the
payment request, click on `cancel`.

</div>
