# Mollie

[Mollie](https://www.mollie.com/) is an online payments platform
established in the Netherlands.

## Configuration

<div class="seealso">

\- `payment_providers/add_new`

</div>

### Credentials tab

Konvergo ERP needs your **API Credentials** to connect with your Mollie account,
which comprise:

- **API Key**: The test or live API Key depending on the configuration
  of the provider.

You can copy your credentials from your Mollie account, and paste them
in the related fields under the **Credentials** tab.

To retrieve your API key, log into your Mollie account, go to
`Developers --> API keys`, and copy your Test or Live **API Key**.

> [!IMPORTANT]
> If you are trying Mollie as a test, with the Test API key, change the
> **State** to *Test Mode*. We recommend doing this on a test Konvergo ERP
> database, rather than on your main database.

<div class="seealso">

\- `../payment_providers`

</div>
