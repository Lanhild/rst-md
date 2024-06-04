# Use subscriptions in the eCommerce shop

Subscription products can be sold in the Odoo *eCommerce* shop just like
regular sales products.

However, by default, the eCommerce product page only displays the
shortest recurrence period listed in the `Time-based pricing` tab of the
product form. For example, if a subscription product has *monthly* and
*yearly* recurrence periods configured, then only the monthly price
appears on the eCommerce page for that product by default.

To add more recurrence periods to the eCommerce product page, create a
*product variant* for each recurrence period.

<div class="seealso">

\-
`Configure subscription products </applications/sales/subscriptions/products>` -
`Product variants </applications/sales/sales/products_prices/products/variants>`

</div>

## Create recurrence periods as product variants

To set up each recurrence period as a product variant, go to
`Subscriptions -->
Subscriptions --> Products` and select a product. In the
`Attributes & Variants` tab, click `Add a line`.

Create an `Attribute` called <span class="title-ref">Billing
Period</span> (or something similar) by typing in the name and clicking
`Create`. This attribute name appears as the option heading on the
product page of the eCommerce shop.

Next, create `Values` that correspond to the recurrence periods that are
configured in the `Time-based pricing` tab of the product form. Type in
the name of the recurrence period, then click `Create`. These value
names appear as selectable options on the product page of the eCommerce
shop.

<img src="ecommerce/recurrence-period-attributes-variants.png"
class="align-center"
alt="Recurrence periods configured as product variants in the &quot;Attributes &amp; Variants&quot; tab of
the product form." />

Click on the `☁️ (cloud)` icon at the top of the page to save manually.
After saving, a `Product Variants` column appears on the
`Time-based pricing` tab. Assign the product variants to their
corresponding recurrence periods and prices.

<img src="ecommerce/product-variants-time-based-pricing.png"
class="align-center"
alt="Product variants on the &quot;Time-based pricing&quot; tab of the product form." />

The product variants are now available for selection on the eCommerce
product page.

<img src="ecommerce/recurrence-period-ecommerce.png"
class="align-center"
alt="Recurrence periods configured as product variants on the eCommerce product page." />
