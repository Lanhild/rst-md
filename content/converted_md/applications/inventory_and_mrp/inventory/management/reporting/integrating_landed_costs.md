# Landed costs: add additional costs to products

<div id="inventory/reporting/landed_costs">

When companies perform profit analyses, the data being examined must be
as accurate as possible. To ensure that, **all** costs and expenses need
to be accounted for, including the sum of expenses associated with
shipping a product, which is also known as *landed costs*.

</div>

In Odoo, the landed costs feature allows the user to add and include
additional costs on goods purchased. This includes the cost of freight,
shipping, insurance, taxes, and more.

## Enable landed costs

To use landed costs, go to the `Inventory app --> Configuration -->
Settings`, scroll down to the `Valuation` header, and click the checkbox
beside `Landed Costs` to enable the feature.

In this same section, a default accounting journal can also be set, in
which entries involving landed costs will be recorded.

To configure a default accounting journal, click the blank field next to
`Default Journal` to reveal a drop-down menu, in which an existing
journal can be selected. A new journal can be created from this
drop-down, as well, by typing the desired name of a new journal in the
blank field, and selecting either the `Create` or `Create and edit...`
option.

Clicking `Create` instantly creates the journal, which can be customized
later. Clicking `Create and edit...` reveals a pop-up window on the
`Settings` page, wherein the newly-created journal's details can be
configured right away. When the configurations are complete, click
`Save` on the pop-up window to complete the journal creation process,
and return to the `Settings` page.

After the setting has been enabled, and if a journal has been created or
applied, click the `Save` button to save all changes.

![Enabled Landed Costs feature in Inventory
settings.](integrating_landed_costs/integrating-landed-costs-settings.png)

<div class="important">

<div class="title">

Important

</div>

Landed costs can **only** be applied to products using a `FIFO (First In
First Out)` or `AVCO (Average Cost)` costing method, **and** automated
inventory valuation.

</div>

## Create a landed cost product

Landed costs can be manually entered each time a vendor bill is created.
However, some products may always have the same types of charges applied
to them, and thus, the vendor bills may always list the same landed
costs. In this case, it's beneficial to create a specific landed cost
product.

To create a landed cost product, first navigate to `Inventory app -->
Products -->
Products`, and click the `Create` button, which reveals a blank product
template page.

On the blank product template form, fill out the necessary product
information, and change the `Product Type` to `Service`.

Then, click the `Purchase` tab, and under the `Landed Costs` section,
select the checkbox beside `Is a Landed Cost`. Once selected, a new
field appears, in which a `Default Split Method` can be selected.

Clicking the blank field beside `Default Split Method` reveals a
drop-down menu. From this drop-down menu, select `Equal`, then click
`Save`.

<div class="note">

<div class="title">

Note

</div>

When the `Default Split Method` is set to `Equal`, the landed cost will
be split equally between all items included on the purchase order. If a
`PO (purchase order)` has just one item, the full amount will be applied
to this item.

</div>

![Landed costs and split method enabled on product
form.](integrating_landed_costs/integrating-landed-costs-split-method.png)

<div class="tip">

<div class="title">

Tip

</div>

Depending on the landed cost of each shipment, the price of a landed
cost product can change with each order. Therefore, a price (or cost)
should **not** be set on landed cost products.

</div>

## Create a request for quotation

Before adding a specific landed cost on a product, a new `RFQ (request
for quotation)` for that product must be created. To do that, navigate
to the `Purchase` app, and click `Create`. Doing so reveals a blank `RFQ
(request for quotation)` template form.

On the blank `RFQ (request for quotation)` template form, add a
`Vendor`, then add the desired product to the product lines (under the
`Product` tab), by clicking `Add a line`, and selecting the desired
product.

Then, fill out the remaining information on the new `RFQ (request for
quotation)`. Lastly, click `Confirm Order` to confirm the order. Once
the quotation has been confirmed, it turns into a `PO (purchase order)`.

Next, click `Receive Products` to receive the ordered products, then
click `Validate`, which reveals a pop-up. In the pop-up, select `Apply`
to set the `Done` quantities. Then, navigate back to the initial `PO
(purchase order)` (via the breadcrumbs).

## Create a vendor bill

Once goods have been received from the purchase order, a vendor bill can
be created directly from the `PO (purchase order)`. To do so, click
`Create Bill`. Doing so reveals a vendor bill draft page.

On this vendor bill draft page, the information from the `PO (purchase
order)` is automatically populated. To add a landed cost to the bill,
first click `Edit`.

Next, click `Add a line` in the `Invoice Lines` tab to add the
newly-created landed cost product to the vendor bill. And, since this
product was specifically created as a landed cost, the checkbox under
the `Landed Costs` column is selected by default.

![Landed cost added on product lines on vendor
bill.](integrating_landed_costs/integrating-landed-costs-vendor-bill.png)

<div class="important">

<div class="title">

Important

</div>

Since no `Price` was set on the product template form for the landed
cost product, it **must** be set manually on the vendor bill, in the
`Price` column.

</div>

## Create landed costs

Once all the necessary information on the bill has been filled out,
click `Create Landed
Costs` at the top of the bill.

Doing so reveals a separate page, wherein the necessary landed cost
information is entered. From this page, next to the greyed-out
`Transfers` field, the warehouse receipt that this landed cost is
associated with must be specified. To adjust the `Transfers` field,
click `Edit` to make that field accessible.

Additionally, an expenses `Account` (located in the `Additional Costs`
tab) must be selected, as well.

To see how the landed costs affect the items on the `PO (purchase
order)`, click the `Valuation Adjustments` tab. From this tab, the
`Original Value` of the purchase order and the `New Value` of the order
can be seen and compared, as well as the `Additional Landed Cost` that
was added to change the original `PO (purchase order
)`.

![Valuation adjustments tab for landed costs on vendor
bill.](integrating_landed_costs/integrating-landed-costs-valuation-adjustments.png)

Once ready, click `Validate` at the top of the page, then click `Save`
to save all changes. Finally, click back to the vendor bill form (via
the breadcrumbs).

To complete the vendor bill, click `Confirm` to confirm the bill. Then,
click the `Register Payment` button at the top of the vendor bill form.
Doing so reveals a pop-up. From this pop-up, click `Create Payment`.
Once clicked, this reveals a green *In Payment* banner at the top of the
vendor bill form.

<div class="tip">

<div class="title">

Tip

</div>

Landed costs don't always need to be created from the vendor bill. They
can also be created by going to `Inventory app --> Operations --> Landed
Costs`, and clicking `Create`.

</div>
