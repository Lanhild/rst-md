# Units of measure, packages, and packagings

In Odoo, there are a variety of ways to specify the amount of products
being bought, stocked, and sold. *Units of measure*, *packages*, and
*packagings* are all available to streamline inventory flows, allowing
for a variety of configurations for products as they enter and leave the
warehouse.

## Units of measure

A *unit of measure (UoM)* refers to any of the different standards used
to measure and handle a quanitifiable amount of products, such a units,
weight, time, or size. Different `UoMs (Units
of Measure)` for weight, for example, can be kilos, pounds, ounces,
grams, and so on.

In Odoo, stock management and purchasing from suppliers are streamlined
by specifying different `UoMs (Units of Measure)` for both buying and
selling products.

![Specify unit of measure for selling a product vs
purchasing.](usage/uom-on-product-form.png)

Once a product has a default `Unit of Measure` and `Purchase Unit of
Measure` set on the product form, Odoo automatically converts the
different units in the product's purchase/sales orders and the
corresponding delivery orders/receipts.

The only condition is that all of the units have to be in the *same
category* (unit, weight, volume, length, etc.).

<div class="example">

On the product form for <span class="title-ref">Rope</span>, the
following fields are set as:

  - `Unit of Measure` in <span class="title-ref">ft</span> (feet), and
  - `Purchase Unit of Measure` in <span class="title-ref">cm</span>
    (centimeters).

Because the vendor sells rope in <span class="title-ref">cm</span>, the
purchase `UoM` is used to represent the quantity on the `PO (Purchase
Order)`, which is also in centimeters.

![Display purchase order for the product, rope, in
centimeters.](usage/purchase-rope-in-cm.png)

</div>

After confirming the `PO (Purchase Order)`, the quantity of product
(found under the now visible `Demand` column) is converted from the
purchase `UoM (Unit of Measure)` to the `Unit of Measure`. Then, when
the product is received by clicking the `Validate` button, the quantity
in `Done` is automatically adjusted to match the `Demand` column.

<div class="example">

On the *receipt* for <span class="title-ref">Rope</span>, the quantities
are automatically converted from <span class="title-ref">500 cm</span>
that was requested on the purchase order, to
<span class="title-ref">16.40 ft</span> to match the internal/stock
`Unit of
Measure` value.

![Rope quantity is converted from cm to ft during warehouse
reception.](usage/receive-rope-in-ft.png)

</div>

<div class="seealso">

`Use Different Units of Measure
<inventory/management/products/units_of_measure>`

</div>

## Packages

Packages are a physical container that holds one or several products
from a picking, typically used for outgoing deliveries or internal
transfers. Packages can be a reusable or disposable (shipping) box, and
are **not** specific to a product.

Reusable boxes temporarily hold products during a picking to be brought
to either a packing or shipping area. Disposable boxes are the actual
shipping containers (e.g. cardboard boxes, envelopes, shipping bags,
etc). These are used to ship the products out to customers.

Multiple items in a sales order (SO) can be separated into different
packages to accommodate the products. For example, an `SO (Sales Order)`
that has 20 boxes of pencils and 4 boxes of erasers can be separated
into two separate packages, each containing 10 boxes of pencils and 2
boxes of erasers.

<div class="note">

<div class="title">

Note

</div>

Products do *not* have to be divided equally. Products can be divided
into as many packages that are needed to accommodate the `SO (Sales
Order)`.

</div>

In Odoo, the quantity of products in each package needs to be recorded,
so there is a full history for each product, including which package
each item is shipped out in.

To use this method, ensure the `Packages` option is enabled, by
navigating to `Inventory app --> Configuration --> Settings -->
Operations`. Click the `Packages` check box, and then `Save` to activate
the feature.

On a delivery order, assign which package to use by clicking on the `≣
(Detailed
Operations)` icon to the right of each product in the `Operations` tab.

![Find detailed operations icon to the right on the product
line.](usage/detailed-operations-icon.png)

Clicking the `≣ (Detailed Operations)` icon of a product reveals a
pop-up window. In this window, the `Product` name, `Demand`, and
`Quantity Done` are clearly displayed above the customizable product
line.

Here, the warehouse location the product is coming from can be modified,
in addition to the `Source Package` and `Destination Package`, which
represents what package(s) the product(s) will be packaged into.

Click `Add a line` to include each additional package used. Enter the
desired amount in the `Done` field to specify the amount of products
that will go into the `Destination Package`.

### Multiple packages in a single delivery

Although a `DO (Delivery Order)` is typically associated with a single
package, orders can be split by clicking the `≣ (Detailed Operations)`
icon next to the products on an `SO
(Sales Order)` line. This opens the `Detailed Operations` window with an
editable table to specify which products are intended for which package.

<div class="example">

To package 10 boxes of pencils with 2 boxes of erasers from the same `SO
(Sales Order)`, begin by navigating to the `DO (Delivery Order)`. Then,
select the `≣ (four
horizontal lines)` icon to the right of the product,
<span class="title-ref">Box of Pencils</span>. Clicking the icon opens
the `Detailed Operations` window that is used to detail how products,
like the 20 <span class="title-ref">Box of Pencils</span>, are packaged.

Type in <span class="title-ref">10</span> under the `Done` field to
package 10 products into the `Destination Package`. To specify the
destination package, type the name of an existing package (such as
<span class="title-ref">PACK0000006</span>) under the field,
`Destination Package`. If the package does not exist, Odoo displays the
`Create` button to create a new package. Click `Add a line` to assign
the remaining products in another package,
<span class="title-ref">PACK0000007</span>.

![Detailed operations pop-up where the amount of product going in a pack
can be specified.](usage/add-destination-package.png)

Select `Detailed Operations` on the product line for
<span class="title-ref">Box of Erasers</span> and similarly set 2 `Done`
products to <span class="title-ref">PACK0000006</span> and
<span class="title-ref">PACK0000007</span> each.

![Put in pack button to match the done amount matches the
demand.](usage/put-in-pack-button.png)

</div>

Once all the products for each line have been entered, click `Confirm`
to return to the `DO (Delivery Order)`.

The `Done` quantity on the `DO (Delivery Order)` updates as products are
selected for each package. When the `Done` amount matches the `Demand`
amount, click the `Validate` button to complete the delivery order.

<div class="tip">

<div class="title">

Tip

</div>

The `Put In Pack` button is intended to quickly package all products in
the `DO
(Delivery Order)` into one new package. The option to rename the
package, or modify its contents, is available in the `Detailed
Operations` pop-up.

</div>

Clicking on the `Packages` smart button in the upper-right corner of the
delivery order reveals a separate page, showing all the packages used in
that `DO (Delivery Order)`.

## Packagings

*Packaging* is product specific, and refers to a disposable container
that holds several units of a specific product. Unlike packages,
packagings cannot be reusable, and each specific packaging must be
defined on the individual product form.

For example, different packages for cans of soda can be configured as a
6-pack, a 12-pack, or a case of 36. Each flavor of soda would need a
<span class="title-ref">6</span>, <span class="title-ref">12</span>, and
<span class="title-ref">36</span> can packaging configured on the
individual product since packagings are product specific, not generic.

### Set up packagings

To use packagings, ensure the `Product Packagings` feature is enabled.
To do that, navigate to `Inventory app --> Configuration --> Settings`.
Then, under the `Products` heading, check the box next to `Product
Packagings`, and click `Save`.

In Odoo, product packagings are used on sales/purchase orders and
inventory transfers.

Next, to create packagings, navigate to `Inventory app --> Products -->
Products` and click on the desired product, then click `Edit` on the
product page.

Under the `Inventory` tab, scroll down to the `Packaging` section, and
click `Add a line`. Then, a pop-up window appears, in which the
following information for each packaging should be entered:

  - `Packaging`: name of packaging that appears on sales/purchase orders
    as a packaging option for the product
  - `Contained quantity`: amount of product in the packaging
  - `Barcode`: identifier used with the `Barcode app
    <barcode/operations/intro>` to trace the packaging of a product
    during stock moves or pickings. Leave blank if not in use
  - `Company`: indicates the packaging is only available at the selected
    company. Leave blank to make the packaging available across all
    companies.

<div class="example">

Create a packaging type for 6 cans of the product,
<span class="title-ref">Grape Soda</span>, by naming the `Packaging` to
<span class="title-ref">6-pack</span> and setting the `Contained
quantity` to <span class="title-ref">6</span> in the pop-up window that
appears after clicking on `Add a line`.

![Create 6-pack case for product.](usage/create-product-packages.png)

</div>

When all the necessary information has been entered, either click `Save
& Close` to save the packaging and return to the product detail form, or
`Save & New` to save the packaging and create another one in a fresh
pop-up window.

<div class="example">

View all product packagings in the `Inventory` tab of the product form.

![Show packaging and contained quantities, specified on the product page
form in the&#10;Inventory tab.](usage/display-product-packaging.png)

</div>

### View all packagings

To view all packagings that have been created, go to `Inventory app -->
Configuration
--> Product Packagings`. Doing so reveals the `Product Packagings` page
with a complete list of all packagings that have been created for all
products. Create new packagings by clicking `Create`.

<div class="example">

Two soda products, <span class="title-ref">Grape Soda</span> and
<span class="title-ref">Diet Coke</span>, have three types of packaging
configured. On the `Product Packagings` page, each product can sold as a
<span class="title-ref">6-Pack</span> that contains 6 products,
<span class="title-ref">12-Pack</span> of 12 products, or a
<span class="title-ref">Case</span> of 32 products.

![List of different packagings for products.](usage/packagings.png)

</div>

### Apply packagings

When creating a sales order in the `Sales` app, specify the packagings
that should be used for the product(s). The chosen packaging is
displayed on the `SO (Sales Order)` under the `Package` field.

<div class="example">

18 cans of the product, <span class="title-ref">Grape Soda</span>, is
packed using three 6-pack packagings.

![Assign packagings on the Sales Order
Line.](usage/packagings-sales-order.png)

</div>

<div class="tip">

<div class="title">

Tip

</div>

Packaging can be used in conjunction with Odoo `Barcode
<inventory/barcode/software>`. When receiving products from suppliers,
scanning the packaging barcode automatically adds the number of units in
the packaging to the internal count of the product.

</div>
