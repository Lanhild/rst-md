# Units of measure

In some cases, handling products in different units of measure is
necessary. For example, a business can buy products from a country that
uses the metric system, and then sell those products in a country that
uses the imperial system. In that case, the business needs to convert
the units.

Another case for unit conversion is when a business buys products in a
big pack from a supplier, and then sells those products in individual
units.

Odoo can be set up to use different *units of measure (UoM)* for one
product.

## Configuration

To use different units of measure in Odoo, first go to
`Inventory app -->
Configuration --> Settings`, and under the `Products` section, activate
the `Units of Measure` setting. Then, click `Save`.

<img src="uom/uom-enable-setting.png" class="align-center"
alt="Enable Units of Measure in the Inventory settings." />

## Units of measure categories

After enabling the *Units of Measure* setting, view the default units of
measure categories in
`Inventory app --> Configuration --> UoM Categories`. The category is
important for unit conversion; Odoo can convert a product's units from
one unit to another **only** if both units belong to the same category.

<img src="uom/category.png" class="align-center"
alt="Set units of measure categories." />

Each units of measure category has a reference unit. The reference unit
is highlighted in blue in the `Uom` column of the
`Units of Measure Categories` page. Odoo uses the reference unit as a
base for any new units.

To create a new unit, first select the correct category from the
`Units of Measure
Categories` page. For example, to sell a product in a box of six units,
click the `Unit` category line. Then, on the category page that appears,
click `Add a line` in the `Units of Measure` tab. Then, in the
`Unit of Measure` field, title the new unit, such as
<span class="title-ref">Box of 6</span>, then in the `Type` field,
select the appropriate size reference, such as
`Bigger than the reference Unit of Measure`.

If applicable, enter a `UNSPSC Category`, which is a globally recognized
[code managed by GS1](https://www.unspsc.org/), that **must** be
purchased in order to use.

In the `Ratio` field, enter how many individual units are in the new
`UoM (Unit of Measure)`, such as <span class="title-ref">6.00000</span>
when using the example of the <span class="title-ref">6-Pack</span>
(since a box of six is six times *bigger* than the reference unit,
<span class="title-ref">1.00000</span>).

<img src="uom/convert-products-by-unit.png" class="align-center"
alt="Convert products from one unit to another as long as they belong to the same category." />

## Specify a product's units of measure

To set units of measure on a product, first go to
`Inventory app --> Products -->
Products` and select a product to open its product form page.

In the `General Information` tab, edit the `Unit of Measure` field to
specify the unit of measure that the product is sold in. The specified
unit is also the unit used to keep track of the product's inventory and
internal transfers.

Edit the `Purchase UoM` field to specify the unit of measure that the
product is purchased in.

## Unit conversion

Odoo automatically converts unit measurements when products have
different `UoMs (Units of
Measure)` and purchase `UoMs (Units of Measure)`.

This occurs in various scenarios, including:

1.  `Vendor orders <inventory/product_replenishment/buy-in-uom>`:
    purchase `UoM (Unit of Measure)` on purchase orders (POs) converts
    to `UoM (Unit of Measure)` on internal warehouse documents
2.  `Automatic replenishment <inventory/product_replenishment/replenish>`:
    generates `POs (Purchase Orders)` when the stock levels of a product
    (tracked in `UoM (Unit of Measure)`) dips below a certain level.
    But, the `POs (Purchase Orders)` are created using the purchase
    `UoM (Unit of Measure)`
3.  `Sell products <inventory/product_replenishment/sell-in-uom>`: if a
    different `UoM (Unit of Measure)` is used on the sales order (SO),
    the quantity is converted to the warehouse's preferred
    `UoM (Unit of Measure)` on the delivery order

### Buy products in the purchase UoM

When creating a new request for quotation (RFQ) in the *Purchase* app,
Odoo automatically uses the product's specified purchase unit of
measure. If needed, manually edit the `UoM` value on the
`RFQ (Request for Quotation)`.

After the `RFQ (Request for Quotation)` is confirmed into a
`PO (Purchase Order)`, click the `Receipt` smart button at the top of
the `PO (Purchase Order)`.

Odoo automatically converts the purchase unit of measure into the
product's sales/inventory unit of measure, so the `Demand` column of the
delivery receipt shows the converted quantity.

<div class="example">

When the product's purchase `UoM` is <span class="title-ref">Box of
6</span>, and its sales/inventory unit of measure is
<span class="title-ref">Units</span>, the `PO (Purchase Order)` shows
the quantity in boxes of six, and the receipt (and other internal
warehouse documents) shows the quantity in units.

<figure>
<img src="uom/on-po.png" class="align-center" alt="uom/on-po.png" />
<figcaption>An order of three quantities is placed using the purchase
"UoM": <span class="title-ref">Box of 6</span>.</figcaption>
</figure>

<figure>
<img src="uom/on-receipt.png" class="align-center"
alt="uom/on-receipt.png" />
<figcaption>Upon warehouse receipt, the recorded quantities are in the
internal "Unit of Measure": <span
class="title-ref">Units</span>.</figcaption>
</figure>

</div>

### Replenishment

A request for quotation for a product can also be generated directly
from the product form using the `Replenish` button.

After clicking `Replenish`, a replenish assistant box pops up. The
purchase unit of measure can be manually edited in the `Quantity` field,
if needed. Then, click `Confirm` to create the
`RFQ (Request for Quotation)`.

> [!IMPORTANT]
> A `PO (Purchase Order)` can **only** be automatically generated if at
> least **one** vendor is listed in the product form's `Purchase` tab.

<img src="uom/replenish.png" class="align-center"
alt="Click Replenish button to manually replenish." />

Navigate to the created `PO (Purchase Order)` by clicking the
`Forecasted` smart button on the product form. Scroll down to the
`Forecasted Inventory` section, and in the `Requests
for quotation` line, click the `RFQ (Request for Quotation)` reference
number to open the draft `RFQ (Request for Quotation)`. If necessary,
the purchase `UoM (Unit of Measure)` can be edited directly on the
`PO (Purchase Order)`.

### Sell in a different UoM

When creating a new quotation in the *Sales* app, Odoo automatically
uses the product's specified unit of measure. If needed, the `UoM` can
be manually edited on the quotation.

After the quotation is sent to the customer, and confirmed into a sales
order (SO), click the `Delivery` smart button at the top of the
`SO (Sales Order)`. Odoo automatically converts the unit of measure into
the product's inventory unit of measure, so the `Demand` column of the
delivery shows the converted quantity.

For example, if the product's `UoM (Unit of Measure)` on the
`SO (Sales Order)` was changed to <span class="title-ref">Box of
6</span>, but its inventory unit of measure is
<span class="title-ref">Units</span>, the `SO (Sales Order)` shows the
quantity in boxes of six, and the delivery shows the quantity in units.
