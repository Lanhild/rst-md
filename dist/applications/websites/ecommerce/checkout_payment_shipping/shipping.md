# Shipping methods

Depending on your shipping strategy, you have the choice to either use
your `own shipping
methods <ecommerce-own-shipping>`, or use an integration with an
`existing shipping provider
<ecommerce-shipping-providers>`.

<div id="ecommerce-own-shipping">

<div class="seealso">

`../checkout_payment_shipping/checkout`

</div>

</div>

## Own shipping methods

You can create your own custom shipping methods and define rules to
compute shipping costs. To do so, go to
`Website --> Configuration --> Shipping Methods`, and either select an
**existing** shipping method, or `Create` one. When creating a shipping
method, you can choose between
`Fixed Price </applications/inventory_and_mrp/inventory/shipping_receiving/setup_configuration/delivery_method>`,
`Based on Rules </applications/inventory_and_mrp/inventory/shipping_receiving/setup_configuration/delivery_method>`,
and `Pickup in store`.

### Pickup in store

`Pickup in store` must first be **enabled** in the settings
(`Website -->
Configuration --> Settings --> Shipping section)` by checking
`On Site Payments &
Picking`. Once enabled, you can select and `Customize Pickup Sites`.
`Picking
sites` can be made **website-specific**, but are by default available
for *all* websites.

<div class="seealso">

\-
`/applications/inventory_and_mrp/inventory/shipping_receiving/setup_configuration/delivery_method` -
`/applications/inventory_and_mrp/inventory/shipping_receiving/advanced_operations_shipping/invoicing` -
`/applications/inventory_and_mrp/inventory/shipping_receiving/advanced_operations_shipping/multipack` -
`/applications/inventory_and_mrp/inventory/shipping_receiving/advanced_operations_shipping/cancel`

</div>

## Shipping providers

Another solution is to use one of the integrations with an existing
shipping provider. The advantage of using an integration is that
delivery costs are automatically computed based on each order as well as
generating shipping labels.

<div class="seealso">

\-
`../../../inventory_and_mrp/inventory/shipping_receiving/setup_configuration/third_party_shipper` -
`../../../inventory_and_mrp/inventory/shipping_receiving/setup_configuration/ups_credentials` -
`../../../inventory_and_mrp/inventory/shipping_receiving/setup_configuration/dhl_credentials` -
`../../../inventory_and_mrp/inventory/shipping_receiving/setup_configuration/labels`

</div>

## Website availability

Shipping methods can be made available on **specific** websites *only*,
if desired. To do so, go to
`Website --> Configuration --> Settings --> Shipping Methods`, and
select the desired **shipping method**. In the `Website` field, set the
website you want the shipping method to be restrained to. Leave the
field **empty** for the method to be available on *all* websites.

## Delivery method at checkout

Customers can choose the shipping method at the end of the checkout
process, at the `Confirm Order` step.

<img src="shipping/shipping-checkout.png" class="align-center"
alt="Delivery method choice at checkout" />
