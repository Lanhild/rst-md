# SIPS

[SIPS](https://sips.worldline.com/) is an online payments solution from
the multinational Worldline.

## Configuration

<div class="seealso">

\- `payment_providers/add_new`

</div>

### Credentials tab

Konvergo ERP needs your **API Credentials** to connect with your SIPS account,
which comprise:

- **Merchant ID**: The ID solely used to identify the merchant account
  with SIPS.
- **Secret Key**: The key to sign the merchant account with SIPS.
- **Secret Key Version**: The version of the key, pre-filled.
- **Interface Version**: Pre-filled, don't change it.

You can copy your credentials from your SIPS environment info
documentation, in the section **PROD**, and paste them in the related
fields under the **Credentials** tab.

> [!IMPORTANT]
> If you are trying SIPS as a test, with the *TEST* credentials, change
> the **State** to *Test Mode*. We recommend doing this on a test Konvergo ERP
> database, rather than on your main database.

<div class="seealso">

\- `../payment_providers`

</div>
