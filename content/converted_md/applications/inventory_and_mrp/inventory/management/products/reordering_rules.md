# Reordering rules

<div id="inventory/management/reordering_rules">

Reordering rules are used to keep forecasted stock levels above a
certain threshold without exceeding a specified upper limit. This is
accomplished by specifying a minimum quantity that stock should not fall
below and a maximum quantity that stock should not exceed.

</div>

Reordering rules can be configured for each product based on the route
used to replenish it. If a product uses the *Buy* route, then a Request
for Quotation (RFQ) is created when the reordering rule is triggered. If
a product uses the *Manufacture* route, then a Manufacturing Order (MO)
is created instead. This is the case regardless of the selected
replenishment route.

## Configure products for reordering rules

In order to use reordering rules for a product, it must first be
correctly configured. Begin by navigating to `Inventory --> Products -->
Products`, then select an existing product, or create a new one by
clicking `Create`.

First, on the `General Information` tab, make sure that the `Product
Type` is set to `Storable Product`. This is necessary because Odoo only
tracks stock quantities for storable products, and this number is used
to trigger reordering rules.

![Set the Product Type as Storable.](reordering_rules/product-type.png)

Next, click on the `Inventory` tab and select one or more routes from
the `Routes` section. Doing so tells Odoo which route to use to
replenish the product.

![Select one or more routes on the Inventory
tab.](reordering_rules/select-routes.png)

If the product is reordered using the `Buy` route, confirm that the `Can
be
Purchased` checkbox is enabled under the product name. This makes the
`Purchase` tab appear. Click on the `Purchase` tab, and specify at least
one vendor, and the price that they sell the product for, so that Odoo
knows which company the product should be purchased from.

![Specify a vendor and price on the Purchase
tab.](reordering_rules/specify-vendor.png)

If the product is replenished using the `Manufacture` route, it needs to
have at least one Bill of Materials (BoM) associated with it. This is
necessary because Odoo only creates manufacturing orders for products
with a `BoM (Bill of Materials)`.

If a `BoM (Bill of Materials)` does not already exist for the product,
select the `Bill of Materials` smart button at the top of the product
form, then click `Create` to configure a new `BoM (Bill of Materials)`.

![The Bill of Materials smart button on a product
form.](reordering_rules/bom-smart-button.png)

## Create new reordering rules

To create a new reordering rule, navigate to `Inventory -->
Configuration -->
Reordering Rules`, then click `Create`, and fill out the new line as
follows:

  - `Product`: The product that is replenished by the rule.
  - `Location`: The location where the product is stored.
  - `Min Quantity`: The minimum quantity that can be forecasted without
    the rule being triggered. When forecasted stock falls below this
    number, a replenishment order for the product is created.
  - `Max Quantity`: The maximum quantity that stock is replenished up
    to.
  - `Multiple Quantity`: Specify if the product should be replenished in
    batches of a certain quantity (e.g., a product could be replenished
    in batches of 20).
  - `UoM`: The unit of measure used for reordering the product. This
    value can simply be <span class="title-ref">Units</span> or a
    specific unit of measurement for weight, length, etc.

![The form for creating a new reordering
rule.](reordering_rules/reordering-rule-form.png)

<div class="tip">

<div class="title">

Tip

</div>

Reordering rules can also be created from each product form. To do so,
navigate to `Inventory --> Products --> Products`, then select a
product. Click on `Reordering Rules --> Create`, then fill out the new
line as detailed above.

</div>

Once a reordering rule has been created for a product, if its forecasted
quantity is below the rule's minimum quantity when the scheduler runs, a
replenishment order for the product is automatically generated. By
default, the scheduler runs once each day.

<div class="tip">

<div class="title">

Tip

</div>

To manually trigger a reordering rule before the scheduler runs, select
`Inventory
--> Operations --> Run Scheduler`. Then, select the green `Run
Scheduler` button on the pop-up that appears. Be aware that this also
triggers any other scheduled actions.

</div>

If the `Buy` route is selected, then an `RFQ (Request for Quotation)` is
generated. To view and manage `RFQs (Requests for Quotation)`, navigate
to `Purchase -->
Orders --> Requests for Quotation`.

If the `Manufacture` route is selected, then an `MO (Manufacturing
Order)` is generated. To view and manage `MOs (Manufacturing Orders)`,
navigate to `Manufacturing --> Operations --> Manufacturing Orders`.

## Set a preferred route for reordering

Odoo allows for multiple routes to be selected under the `Inventory` tab
on each product form. For instance, it is possible to select both `Buy`
and `Manufacture`, thus enabling the functionality of both routes.

Odoo also enables users to set a preferred route for a product's
reordering rule. This is the route that the rule defaults to if multiple
are selected. To select a preferred route, begin by navigating to
`Inventory --> Configuration --> Reordering Rules`.

By default, the `Preferred Route` column is hidden on the `Reordering
Rules` page. Enable it by selecting the `⋮ (three-dot)` option button on
the right side of the page and checking the `Preferred Route` checkbox.
Doing so reveals the `Preferred Route` column.

Click inside of the column on the row of a reordering rule and a
drop-down menu shows all available routes for that rule. Select one to
set it as the preferred route.

![Select a preferred route from the
drop-down.](reordering_rules/select-preferred-route.png)

<div class="important">

<div class="title">

Important

</div>

If multiple routes are enabled for a product but no preferred route is
set for its reordering rule, the product is reordered using the selected
route that is listed first on the `Inventory` tab of the product form.

</div>
