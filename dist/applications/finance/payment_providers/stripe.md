# Stripe

[Stripe](https://stripe.com/) is a United States-based online payment
solution provider allowing businesses to accept **credit cards** and
other payment methods.

<div class="seealso">

\- [List of countries supported by Stripe](https://stripe.com/global) -
[List of payment methods supported by
Stripe](https://stripe.com/payments/payment-methods)

</div>

## Create your Stripe account with Konvergo ERP

The method to acquire your credentials depends on your hosting type:

<div class="tabs">

.. group-tab:: Konvergo ERP Online

1.  `Navigate to the payment provider Stripe <payment_providers/supported_providers>`
    and click `Connect Stripe`.
2.  Go through the setup process and confirm your email address when
    Stripe sends you a confirmation email.
3.  At the end of the process, click `Agree and submit`. If all
    requested information has been submitted, you are then redirected to
    Konvergo ERP, and your payment provider is enabled.
4.  `stripe/local-payment-methods`.

<div class="group-tab">

Konvergo ERP.sh or On-premise

</div>

1.  `Navigate to the payment provider Stripe <payment_providers/supported_providers>`
    and click `Connect Stripe`.
2.  Go through the setup process and confirm your email address when
    Stripe sends you a confirmation email.
3.  At the end of the process, click `Agree and submit`; you are then
    redirected to the payment provider **Stripe** in Konvergo ERP.
4.  `Fill in your credentials <stripe/api_keys>`.
5.  `Generate a webhook <stripe/webhook>`.
6.  Select a `payment journal <payment_providers/journal>`.
7.  Set the `State` field to `Enabled`.
8.  `stripe/local-payment-methods`.

</div>

> [!TIP]
> - To use an existing Stripe account,
> `activate the Developer mode <developer-mode>` and
> `enable Stripe manually <payment_providers/add_new>`. You can then
> `Fill in your
> credentials <stripe/api_keys>`, `generate a webhook <stripe/webhook>`,
> and enable the payment provider. - You can also test Stripe using the
> `payment_providers/test-mode`. To do so, first, [log into your Stripe
> dashboard](https://dashboard.stripe.com/dashboard) and switch to the
> **Test mode**. Then, in Konvergo ERP,
> `activate the Developer mode <developer-mode>`,
> `navigate to the payment provider Stripe <payment_providers/supported_providers>`,
> `fill in your API credentials <stripe/api_keys>` with the test keys,
> and set the `State` field to `Test Mode`.

### Fill in your credentials

If your **API credentials** are required to connect with your Stripe
account, proceed as follows:

1.  Go to [the API keys page on
    Stripe](https://dashboard.stripe.com/account/apikeys), or log into
    your Stripe dashboard and go to `Developers --> API Keys`.
2.  In the `Standard keys` section, copy the `Publishable key` and the
    `Secret key` and save them for later.
3.  In Konvergo ERP,
    `navigate to the payment provider Stripe <payment_providers/supported_providers>`.
4.  In the `Credentials` tab, fill in the `Publishable Key` and
    `Secret Key` fields with the values you previously saved.

### Generate a webhook

If your **Webhook Signing Secret** is required to connect with your
Stripe account, you can create a webhook automatically or manually.

<div class="tabs">

.. tab:: Create the webhook automatically

Make sure your `Publishable and Secret keys <stripe/api_keys>` are
filled in, then click `Generate your Webhook`.

<div class="tab">

Create the webhook manually

</div>

1.  Go to the [Webhooks page on
    Stripe](https://dashboard.stripe.com/webhooks), or log into your
    Stripe dashboard and go to `Developers --> Webhooks`.
2.  In the `Hosted endpoints` section, click `Add endpoint`. Then, in
    the `Endpoint URL` field, enter your Konvergo ERP database's URL, followed
    by <span class="title-ref">/payment/stripe/webhook</span>, e.g.,
    <span class="title-ref">https://yourcompany.odoo.com/payment/stripe/webhook</span>.
3.  Click `Select events` at the bottom of the form, then select the
    following events:
    - in the `Charge` section: `charge.refunded` and
      `charge.refund.updated`;
    - in the `Payment intent` section:
      `payment_intent.amount_capturable_updated`,
      `payment_intent.succeeded` and `payment_intent.payment_failed`;
    - in the `Setup intent` section: `setup_intent.succeeded`.
4.  Click `Add events`.
5.  Click `Add endpoint`, then click `Reveal` and save your
    `Signing secret` for later.
6.  In Konvergo ERP, `navigate to the payment provider Stripe
    <payment_providers/supported_providers>`.
7.  In the `Credentials` tab, fill the `Webhook Signing Secret` field
    with the value you previously saved.

> [!NOTE]
> You can select other events, but they are currently not processed by
> Konvergo ERP.

</div>

## Enable local payment methods

Local payment methods are payment methods that are only available for
specific providers and for specific countries and currencies.

Konvergo ERP supports the following local payment methods for Stripe:

- Bancontact
- EPS
- giropay
- iDEAL
- Przelewy24 (P24)

To adapt the list of enabled payment methods, go to the `Configuration`
tab and edit the list of `Supported Payment Icons`.

> [!NOTE]
> - If a payment icon record does not exist in the database and its
> related local payment method is listed above, it is automatically
> enabled with Stripe. - If a local payment method is not listed above,
> it is not supported and cannot be enabled.

## Enable Apple Pay

To allow customers to use the Apple Pay button to pay their eCommerce
orders, go to the `Configuration` tab, enable `Allow Express Checkout`,
and click `Enable Apple Pay`.

<div class="seealso">

\-
`Express checkout and Google Pay <payment_providers/express_checkout>` -
`../payment_providers` -
`Use Stripe as a payment terminal in Point of Sale <../../sales/point_of_sale/payment_methods/terminals/stripe>`

</div>
