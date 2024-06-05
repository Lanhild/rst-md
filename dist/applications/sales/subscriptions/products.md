# Subscription products

By closely integrating with the Konvergo ERP *Sales* app, the *Subscriptions*
app enables users to sell subscription products alongside regular sales
products. While regular products are sold on a one-time basis,
subscription products are sold on a renewing basis, generating recurring
revenue.

In Konvergo ERP, subscription products are also called *recurring* products.

## Configure recurrence periods

To get started with subscriptions, the *recurrence periods* must be
properly configured, as needed.

Recurrence periods are the time periods in which subscriptions renew.
They designate how often the customer pays for (and receives)
subscription products.

To configure recurrence periods, go to
`Subscriptions app --> Configuration -->
Recurrence periods`.

<img src="products/recurrence-periods-page.png" class="align-center"
alt="The recurrence periods page in Konvergo ERP Subscriptions application." />

The *Subscriptions* app comes with some basic recurrence periods already
configured:

- `Monthly`
- `Quarterly`
- `Weekly`
- `2 Weeks`
- `Yearly`
- `3 Years`
- `5 Years`

New recurrence periods can be added and/or edited at any time.

To create a new recurrence period, click `New` on the
`Recurrence Periods` page. Doing so reveals a blank recurrence period
form.

<img src="products/recurrence-period-form.png" class="align-center"
alt="A recurrence period form in Konvergo ERP Subscriptions application." />

Then, type in the `Name` and `Duration` of the recurrence period, and
select the `Unit` that defines the duration.

> [!IMPORTANT]
> The unit `Days` *cannot* be used as a recurrence period on
> subscriptions. The daily recurrence is meant for rentals, and
> **cannot** be added on recurring subscription sales orders.
>
> This limitation is there to avoid sales orders that would generate
> daily invoices.

## Product form configuration

To create a new subscription product, navigate to
`Subscriptions app --> Products -->
Products`, and click `New`.

Doing so reveals a blank product form, which can be configured and
customized in a number of ways.

> [!NOTE]
> By default, the `Recurring` option is already enabled, prompting Konvergo ERP
> to recognize it as a subscription product. Be sure to leave the
> `Recurring` and `Can be Sold` options enabled.
>
> The `Product Type` field is set to `Service` by default, as well.
> However, subscription products *can* be set to other types, if needed.

<img src="products/subscription-product-form.png" class="align-center"
alt="A basic subscription product form in Konvergo ERP Subscriptions application." />

### Time-based pricing

Once the desired fields in the `General Information` tab have been
entered, click the `Time-based pricing` tab on the product form.

<img src="products/time-based-pricing-tab.png" class="align-center"
alt="The time-based pricing tab on a subscription product form in Konvergo ERP Subscriptions." />

From here, click `Add a price` to begin defining recurring prices.

In the `Period` column, select a desired recurrence period. In the
`Pricelist` column, select a pricelist, if needed. Then, in the `Price`
column, enter the price for that recurrence period.

> [!NOTE]
> `Daily` and `Hourly` periods **cannot** be used on recurring products.
>
> <img src="products/validation-error-popup.png" class="align-center"
> alt="The validation error pop-up window that appears in Konvergo ERP Subscriptions." />

> [!NOTE]
> There is *no limit* to how many lines can be added to the
> `Time-based pricing` table.

> [!TIP]
> An existing product can be made into a subscription product, simply by
> marking it as `Recurring`, and configuring `Time-based pricing` on the
> product form.

#### Pricelists

`Pricelists <../sales/products_prices/prices/pricing>` can be used with
subscription products to give special pricing to customers included in
pricelists.

This can be configured either in the `Time-based pricing` tab of the
product form, or on the pricelist form in the *Sales* application.

To create recurring price rules for specific pricelists in the
`Time-based pricing` tab of the product form, select a pricelist in the
`Pricelist` column.

<img src="products/pricelist-time-based-pricing.png"
class="align-center"
alt="Pricelists in the &quot;Time-based pricing&quot; tab of the product form." />

When pricelists are added to the `Time-based pricing` tab, the pricelist
form in the *Sales* app is automatically updated.

Time-based pricing rules can also be configured directly on the
pricelist form.

To do this, go to `Sales app --> Products --> Pricelists`, and select a
pricelist (or click `New` to create a new pricelist).

> [!NOTE]
> Pricelists are also accessible through the Konvergo ERP *Subscriptions* app by
> following the same menu steps.

Then, on the pricelist form, under the `Time-based rules` tab, click
`Add a
line`.

<img src="products/pricelist-form-time-based-rules-tab.png"
class="align-center"
alt="The time-based rules tab on a pricelist form in Konvergo ERP Sales." />

Then, select a subscription product in the `Products` column, and select
a recurrence period in the `Period` column. Lastly, enter a `Price` for
that particular product and period. Add as many lines as needed.

When `Time-based rules` are added to the pricelist form, the `Time-based
pricing` tab of the product form is automatically updated.

<div class="seealso">

`ecommerce`

</div>
