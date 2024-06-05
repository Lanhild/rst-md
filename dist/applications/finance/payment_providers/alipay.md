# Alipay

[Alipay](https://www.alipay.com/) is an online payments platform
established in China by Alibaba Group.

> [!WARNING]
> The provider Alipay is deprecated. It is recommended to use `asiapay`
> instead.

## Configuration

<div class="seealso">

\- `payment_providers/add_new`

</div>

### Credentials tab

Konvergo ERP needs your **API Credentials** to connect with your Alipay account,
which comprise:

- **Account**: Depending on where you are situated
  - <span class="title-ref">Express Checkout</span> if your are a
    Chinese Merchant.
  - <span class="title-ref">Cross-border</span> if you are not.
- **Alipay Seller Email**: Your public Alipay partner email (for express
  checkout only).
- **Merchant Partner ID**: The public partner ID solely used to identify
  the account with Alipay.
- **MD5 Signature Key**: The signature key.

You can copy your credentials from your Alipay account, and paste them
in the related fields under the **Credentials** tab.

To retrieve them, log into your Alipay account, they are on the front
page.

> [!IMPORTANT]
> If you are trying Alipay as a test, in the *sandbox*, change the
> **State** to *Test Mode*. We recommend doing this on a test Konvergo ERP
> database, rather than on your main database.

<div class="seealso">

\- `../payment_providers`

</div>
