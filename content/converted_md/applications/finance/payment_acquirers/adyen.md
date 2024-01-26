  - show-content

# Adyen

<div class="toctree" data-titlesonly="">

adyen/install\_pay\_by\_link\_patch

</div>

[Adyen](https://www.adyen.com/) is a Dutch company that offers several
online payment possibilities.

<div class="seealso">

\- `adyen/install_pay_by_link_patch` - `payment_acquirers/add_new` -
`../payment_acquirers`

</div>

<div class="note">

<div class="title">

Note

</div>

Adyen works only with customers processing **more** than **10 million
annually** or invoicing a **minimum** of **1.000** transactions **per
month**.

</div>

## Configuration

### Credentials tab

Odoo needs your **API Credentials** to connect with your Adyen account,
which comprise:

  - **Merchant Account**: The code of the merchant account to use with
    Adyen.
  - `API Key <adyen/api_key>`: The API key of the webservice user.
  - `HMAC Key <adyen/hmac_key>`: The HMAC key of the webhook.
  - `Checkout API URL <adyen/urls>`: The base URL for the Checkout API
    endpoints.

You can copy your credentials from your Adyen account, and paste them in
the related fields under the **Credentials** tab.

<div class="important">

<div class="title">

Important

</div>

If you are trying Adyen as a test, with a *test account*, change the
**State** to *Test Mode*. We recommend doing this on a test Odoo
database, rather than on your main database.

</div>

#### API Key

In order to retrieve the API Key, log into your Adyen account, go to
`Developers --> API Credentials`. - If you already have an API user,
open it. - If you don't have an API user yet, click on **Create new
credential**. Go to `Authentication` and get or generate your **API
Key**. Be careful to copy your API key as you'll not be allowed to get
it later without generating a new one.

#### HMAC key

In order to retrieve the HMAC Key, you'll need to configure a
<span class="title-ref">Standard Notification</span> webhook. For this,
log into your Adyen account then go to `Developers --> Webhooks --> Add
webhook
--> Add Standard notification`.

![Configure a webhook.](adyen/add-webhook.png)

There, in `General --> Server Configuration --> URL`, enter your server
address followed by
<span class="title-ref">/payment/adyen/notification</span> and in
`General --> Server Configuration
--> Method`, select <span class="title-ref">HTTP Post</span>.

![Enter the notification URL.](adyen/webhook-url.png)

Then continue in `Security --> HMAC Key --> Generate new HMAC key`. Be
careful to copy it as you'll not be allowed to get it later without
generating a new one.

You have to save the webhook to finalize its creation.

#### URLs

To retrieve the URLs, log into your Adyen account, go to `Developers -->
API URLs`. Pick one of the URLs listed next to **Checkout API** as your
**Checkout API URL**.

![Get the links for the different API.](adyen/api-urls.png)
