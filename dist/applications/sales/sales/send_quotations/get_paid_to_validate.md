# Online payment order confirmation

The Konvergo ERP *Sales* application provides customers with the ability to
confirm orders, via an online payment, directly on a sales order. Once
the sales order is electronically paid for by the customer, the
salesperson attached to the sales order is instantly notified that the
order is confirmed.

## Activate online payments

In order to have customers confirm orders with an online payment, the
*Online Payment* setting **must** be activated.

To activate the *Online Payment* feature, go to
`Sales app --> Configuration -->
Settings`, scroll to the `Quotations \& Orders` heading, check the box
next to the `Online Payment` feature, and click `Save`.

<img src="get_paid_to_validate/online-payment-setting.png"
class="align-center"
alt="The online payment setting in the Konvergo ERP Sales application." />

Beneath the `Online Payment` option on the *Sales* `Settings` page,
there's a `Default Quotation Validity` field. In this field, there's the
option to add a specific number of days for quotations to remain valid
by default.

To enable this feature on a standard quotation, click the checkbox for
the `Payment` feature option, located in the `Online confirmation`
field, on the `Other Info` tab.

<img src="get_paid_to_validate/online-payment-option-quotation.png"
class="align-center"
alt="The online payment setting on a standard quotation in Konvergo ERP Sales." />

To enable this feature on a quotation template, click the checkbox for
the `Payment` feature option, located in the `Online confirmation` field
of the quotation template form.

<img
src="get_paid_to_validate/online-payment-option-quotation-template.png"
class="align-center"
alt="The online payment setting on quotation template forms in Konvergo ERP Sales." />

## Payment providers

After activating the `Online Payment` feature, a link to configure
`Payment
Providers` appears beneath it.

Clicking that link reveals a separate `Payment Providers` page, in which
a large variety of payment providers can be enabled, customized, and
published.

<img src="get_paid_to_validate/payment-providers-page.png"
class="align-center" alt="Payment providers page in Konvergo ERP Sales." />

<div class="seealso">

`../../../finance/payment_providers`

</div>

## Register a payment

After opening quotations in their customer portal, customers can click
`Accept \& Pay` to confirm their order with an online payment.

<img src="get_paid_to_validate/accept-and-pay-button.png"
class="align-center"
alt="The accept and pay button on an online quotation in Konvergo ERP Sales." />

After clicking `Accept \& Pay`, customers are presented with
`Validate Order` pop-up window containing different options for them to
make online payments, in the `Pay
with` section.

<img src="get_paid_to_validate/validate-order-pay-with.png"
class="align-center"
alt="How to register a payment on a validate order pop-up window in Konvergo ERP Sales." />

> [!NOTE]
> Konvergo ERP will **only** offer payment options on the `Validate Order`
> pop-up window that have been published and configured on the
> `Payment Providers` page.

Once the customer selects their desired method of payment, they will
click the `Pay` button on the pop-up window to confirm the order. Konvergo ERP
instantly notifies the assigned salesperson upon order confirmation with
an online payment.

<img
src="get_paid_to_validate/payment-confirmation-notification-chatter.png"
class="align-center"
alt="Sample of notification that appears in the chatter when an online payment is made." />

<div class="seealso">

\- `quote_template` - `get_signature_to_validate` -
`../../../finance/payment_providers`

</div>
