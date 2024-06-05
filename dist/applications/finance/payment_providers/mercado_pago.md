# Mercado Pago

[Mercado Pago](https://www.mercadopago.com/) is an online payment
provider covering several countries, currencies and payment methods in
Latin America.

## Configuration on Mercado Pago Dashboard

1.  Log into the [Mercado Pago
    Dashboard](https://www.mercadopago.com.mx/developers/panel) and
    select your application or create a new one.
2.  Select `Credenciales de producción` in the left part of the
    application page, then select the industry, optionally enter your
    domain, and click `Activar credenciales
    de producción`.
3.  Copy the `Access token` and save it for later.

> [!TIP]
> If you are trying Mercado Pago as a test, select
> `Credienciales de prueba` in the left part of the application page,
> then copy the test `Access token`.

![Production and testing credentials in Mercado Pago.](mercado_pago/mp-credentials.png)

## Configuration on Konvergo ERP

1.  `Navigate to the payment provider Mercado Pago <payment_providers/add_new>`
    and change its state to `Enabled`.
2.  In the `Credentials` tab, fill in the `Access Token` with the value
    you saved at the
    `payment_providers/mercado_pago/configure_dashboard` step.
3.  Configure the rest of the options to your liking.

<div class="seealso">

\- `../payment_providers` - [Mercado Pago Konvergo ERP
webinar](https://www.youtube.com/watch?v=CX8vPHMb1ic)

</div>
