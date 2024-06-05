# AsiaPay

[AsiaPay](https://www.asiapay.com/) is an online payments provider
established in Hong Kong and covering several Asian countries and
payment methods.

## Configuration on AsiaPay Dashboard

1.  Log into [AsiaPay
    Dashboard](https://www.paydollar.com/b2c2/eng/merchant/index.jsp)
    and go to `Profile --> Account Information`. Copy the values of the
    `Currency` and `Secure Hash` fields and save them for later.

2.  Go to `Profile --> Payment Account Settings` and enable the options
    `Return Value Link (Datefeed)`  
    Enter your Konvergo ERP database URL followed by
    <span class="title-ref">/payment/asiapay/webhook</span> in the
    `Return Value Link (Datefeed)` text field.  
    For example:
    <span class="title-ref">https://yourcompany.odoo.com/payment/asiapay/webhook</span>.  
    Click on `Test` to check if the webhook is working correctly.

3.  Click on `Update` to finalize the configuration.

## Configuration on Konvergo ERP

1.  `Navigate to the payment provider AsiaPay <payment_providers/add_new>`
    and change its state to `Enabled`.

2.  In the `Credentials` tab, fill the `Merchant ID`, `Currency`, and
    `Secure Hash Secret` with the values you saved at the step
    `payment_providers/asiapay/configure_dashboard`.  
    By default, the payment provider AsiaPay is configured to verify the
    secret hash with the hash function
    <span class="title-ref">SHA1</span>. If a different function is
    `set on your account  <payment_providers/asiapay/configure_dashboard>`,
    activate the `developer mode  <developer-mode>` and set the same
    value to the field `Secure Hash Function` in Konvergo ERP.

3.  Configure the rest of the options to your liking.

<div class="seealso">

\- `../payment_providers`

</div>
