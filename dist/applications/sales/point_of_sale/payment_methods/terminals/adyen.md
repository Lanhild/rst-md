# Adyen

Connecting an **Adyen payment terminal** allows you to offer a fluid
payment flow to your customers and ease the work of your cashiers.

> [!IMPORTANT]
> - Adyen payment terminals do not require an
> `IoT Box </applications/general/iot>`. - Adyen terminals can be used
> in many countries, but not worldwide. Check the [List of countries
> supported by
> Adyen](https://docs.adyen.com/point-of-sale/what-we-support/supported-languages/). -
> Adyen works only with businesses processing more than **\$10 million
> annually** or invoicing a minimum of **1,000 transactions per month**.

<div class="seealso">

\- [List of payment methods supported by
Adyen](https://docs.adyen.com/point-of-sale/what-we-support/payment-methods/) -
[List of Adyen
terminals](https://docs.adyen.com/point-of-sale/what-we-support/select-your-terminals/)

</div>

## Configuration

Start by creating your Adyen account on [Adyen's
website](https://www.adyen.com/). Then, board your terminal following
the steps described on your terminal's screen.

<div class="seealso">

[Adyen Docs - Payment terminal quickstart
guides](https://docs.adyen.com/point-of-sale/user-manuals)

</div>

### Generate an Adyen API key

The **Adyen API key** is used to authenticate requests from your Adyen
terminal. To generate an API key, go to your
`Adyen account --> Developers --> API credentials`, and **create** new
credentials or select **existing** ones. Click `Generate an API key` and
save the key to paste it into the Odoo `Adyen API key` field at
`the payment method creation
<adyen/method-creation>`.

<div class="seealso">

\- [Adyen Docs - API
credentials](https://docs.adyen.com/development-resources/api-credentials#generate-api-key).

</div>

### Locate the Adyen terminal identifier

The **Adyen Terminal Identifier** is the terminal's serial number, which
is used to identify the hardware.

To find this number, go to your
`Adyen account --> Point of Sale --> Terminals`, select the terminal to
link with, and save its serial number to paste it into the Odoo
`Adyen Terminal Identifier` field at `the payment method creation
<adyen/method-creation>`.

### Set the Event URLs

For Odoo to know when a payment is made, you must configure the terminal
**Event URLs**. To do so,

1.  Log in to [Adyen's website](https://www.adyen.com/);
2.  Go to `Adyen's dashboard --> Point of Sale --> Terminals` and select
    the connected terminal;
3.  From the terminal settings, click `Integrations`;
4.  Set the `Switch to decrypted mode to edit this setting` field as
    `Decrypted`;
5.  Click the **pencil icon** button and enter your server address,
    followed by <span class="title-ref">/pos_adyen/notification</span>
    in the `Event URLs` field;
6.  Click `Save` at the bottom of the screen to save changes.

### Configure the payment method

Enable the payment terminal
`in the application settings <configuration/settings>` and
`create the related payment method <../../payment_methods>`. Set the
journal type as `Bank` and select `Adyen` in the
`Use a Payment Terminal` field.

Finally, fill in the mandatory fields with your
`Adyen API key <adyen/api>`, `Adyen
Terminal Identifier <adyen/identifier>`, and `Adyen Merchant Account`.

![image](adyen/payment-method.png)

Once the payment method is created, you can select it in your POS
settings. To do so, go to the `POS' settings <configuration/settings>`,
click `Edit`, and add the payment method under the `Payments` section.

## Pay with a payment terminal

When processing a payment, select `Adyen` as the payment method. Check
the amount and click on `Send`. Once the payment is successful, the
status changes to `Payment
Successful`.

> [!NOTE]
> - \| In case of connection issues between Odoo and the payment
> terminal, force the payment by clicking on `Force Done`, which allows
> you to validate the order. \| This option is only available after
> receiving an error message informing you that the connection failed. -
> To cancel the payment request, click on `cancel`.
