# Using inventory valuation

<div id="inventory/reporting/using_inventory_val">

*Inventory valuation* is a quintessential accounting procedure that
calculates the value of on-hand stock. Once determined, the inventory
valuation amount is then incorporated into a company's overall value.

</div>

In Odoo, this process can be conducted manually— by warehouse employees
physically counting the products— or automatically through the database.

<div class="seealso">

`Inventory valuation
configuration<inventory/inventory_valuation_config>`

</div>

## Understand the basics of inventory valuation

In order to understand how moving products in and out of stock affects
the company's overall value, consider the following product and stock
moves scenario below.

### Receive a product

For example, consider an physical product, a simple *table*, which is
categorized as <span class="title-ref">Office Furniture</span> in the
product form's `Product Category` field.

Navigate to the the product category itself by going to `Inventory app
-->
Configuration --> Product Categories`, and on the form, set the `Costing
Method` as <span class="title-ref">First In First Out (FIFO)</span> and
the `Inventory Valuation` field as
<span class="title-ref">Automated</span>.

<div class="tip">

<div class="title">

Tip

</div>

Alternatively access the `Product Categories` dashboard by clicking on
the `internal link` arrow on the individual product's form, by hovering
over the `Product Category` field.

</div>

Next, assume 10 tables are purchased at a price of $10.00, each. The `PO
(Purchase Order)` for those tables will show the subtotal of the
purchase as $100, plus any additional costs or taxes.

![Purchase order with 10 tables products valued at $10
each.](using_inventory_valuation/purchase-order.png)

After selecting `Validate` on the `PO (Purchase Order)`, use the
`Valuation` smart button to view how the value of inventory was
impacted.

![Valuation smart button on a
receipt.](using_inventory_valuation/valuation-smart-button.png)

<div class="important">

<div class="title">

Important

</div>

`Developer mode <developer-mode>` must be turned on to see the
*Valuation* smart button.

</div>

<div class="tip">

<div class="title">

Tip

</div>

The `consignment
</applications/inventory_and_mrp/inventory/management/misc/owned_stock>`
feature allows ownership to items in stock. Thus, products owned by
other companies are not accounted for in the host company's inventory
valuation.

</div>

The `Stock Valuation` dashboard then displays valuation of all products
in the shipment, along with their quantities and valuation. In the
example of 10 tables being purchased, the `Total Value` column of the
dashboard would display a calculated valuation of $100.

![Stock valuation page depicting the products within a
shipment.](using_inventory_valuation/stock-valuation-product.png)

In Odoo, automatic inventory valuation records are also recorded in the
*Accounting* app. To access these accounting entries, navigate to
`Accounting --> Journal Entries`, and look for inventory valuation
entries with the <span class="title-ref">STJ</span> prefix in the
`Journal` and `Number` columns, respectively.

![Accounting entry for the inventory valuation of 10
tables.](using_inventory_valuation/inventory-valuation-entry.png)

### Deliver a product

In the same logic, when a table is shipped to a customer and leaves the
warehouse, the stock valuation decreases. The `Valuation` smart button
on the `DO (Delivery Order)`, likewise, displays the stock valuation
record as it does on a `PO (Purchase Order)`

![Decreased stock valuation after a product is
shipped.](using_inventory_valuation/decreased-stock-valuation.png)

### The inventory valuation report

To view the current value of all products in the warehouse, go to
`Inventory app -->
Reporting --> Inventory Valuation`. The records in the table are
organized by product, and selecting a product's drop-down menu displays
detailed records with the `Date`, `Quantity`, and `Total Value` of the
inventory.

![Inventory valuation report showing multiple
products.](using_inventory_valuation/inventory-valuation-products.png)

<div class="note">

<div class="title">

Note

</div>

The `Inventory At Date` button, located in the top-left corner of the
`Stock
Valuation` dashboard, shows the inventory valuation of products
available during a prior specified date.

</div>

#### Update product unit price

For any company: lead times, supply chain failures, and other risk
factors can contribute to invisible costs. Although Odoo attempts to
accurately represent the stock value, *manual valuation* serves as an
additional tool to update the unit price of products.

<div class="important">

<div class="title">

Important

</div>

Manual valuation is intended for products that can be purchased and
received for a cost greater than 0, or have product categories set with
`Costing Method` set as either <span class="title-ref">Average Cost
(AVCO)</span> or <span class="title-ref">First In First Out
(FIFO)</span>.

</div>

![Add manual valuation of stock value to a
product.](using_inventory_valuation/add-manual-valuation.png)

Create manual valuation entries on the `Stock Valuation` dashboard by
first navigating to `Inventory app --> Reporting --> Inventory
Valuation`, and then click the little gray drop-down icon to the left of
a product's name, to then reveal stock valuation line items below as
well as a teal `+ (plus)` button on the right.

Click the teal `+ (plus)` button to open up the `Product Revaluation`
form, where updates to the calculation of inventory valuation can be
made, by increasing or decreasing the unit price of each product.

![Product revaluation form adding a value of $1.00 with the reason being
inflation.](using_inventory_valuation/product-revaluation.png)
