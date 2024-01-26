# Use lots to manage groups of products

*Lots* are one of the two ways to identify and track products in Odoo. A
lot usually indicates a specific batch of an item that was received, is
currently stored, or was shipped from a warehouse, but can also pertain
to a batch of products manufactured in-house, as well.

Manufacturers assign lot numbers to groups of products that have common
properties; this can lead to multiple goods sharing the same lot number.
This helps to identify a number of products in a single group, and
allows for end-to-end traceability of these products through each step
in their lifecycles.

Lots are useful for products that are manufactured or received in large
quantities (such as clothes or food), and can be used to trace a product
back to a group. This is especially useful when managing product recalls
or expiration dates.

<div class="seealso">

`/applications/inventory_and_mrp/inventory/management/lots_serial_numbers/serial_numbers`

</div>

## Enable lots & serial numbers

To track products using lots, the *Lots & Serial Numbers* feature must
be enabled. Go to the `Inventory app --> Configuration --> Settings`,
scroll down to the `Traceability` section, and click the box next to
`Lots & Serial Numbers`. Then, click the `Save` button to save changes.

![Enabled lots and serial numbers feature in inventory
settings.](lots/lots-enabled-lots-setting.png)

## Track products by lots

Once the `Lots & Serial Numbers` setting has been activated, individual
products can now be configured to be tracked using lots. To do this, go
to the `Inventory app -->
Products --> Products`, and choose a product.

Once on the product form, click `Edit` to make changes to the form.
Then, click the `Inventory` tab. In the `Traceability` section, click
`By Lots`. Then, click `Save` to save changes. Existing or new lot
numbers can now be assigned to newly-received or manufactured batches of
this product.

<div class="important">

<div class="title">

Important

</div>

If a product has stock on-hand prior to activating tracking by lots or
serial numbers, an inventory adjustment might need to be performed to
assign lot numbers to the existing stock.

</div>

![Enabled tracking by lots feature on product
form.](lots/lots-tracking-product-form.png)

### Create new lots for products already in stock

New lots can be created for products already in stock with no assigned
lot number. To do this, go to the `Inventory app --> Products -->
Lots/Serial Numbers`, and click `Create`. Doing so reveals a separate
page where a new `Lot/Serial Number` is generated automatically.

<div class="tip">

<div class="title">

Tip

</div>

While Odoo automatically generates a new `Lot/Serial Number` to follow
the most recent number, it can be edited and changed to any desired
number, by clicking the line under the `Lot/Serial Number` field, and
changing the generated number.

</div>

Once the new `Lot/Serial Number` is generated, click the blank field
next to `Product` to reveal a drop-down menu. From this menu, select the
product to which this new number will be assigned.

This form also provides the option to adjust the `Quantity`, assign a
unique `Internal Reference` number (for traceability purposes), and
assign this specific lot or serial number configuration to a specific
website in the `Website` field (if working in a multi-website
environment).

A detailed description of this specific lot or serial number can also be
added in the `Description` tab below.

When all desired configurations are complete, click the `Save` button to
save all changes.

![New lot number creation form with assigned
product.](lots/lots-new-lot-number.png)

After a new lot number has been created, saved, and assigned to the
desired product, navigate back to the product form in the `Inventory`
app, by going to `Products -->
Products`, and selecting the product to which this newly-created lot
number was just assigned.

On that product's detail form, click the `Lot/Serial Numbers` smart
button to view the new lot number. When additional quantity of this
product is received or manufactured, this new lot number can be selected
and assigned to it.

## Manage lots for shipping and receiving

Lot numbers can be assigned for both **incoming** and **outgoing**
goods. For incoming goods, lot numbers are assigned directly on the
purchase order form. For outgoing goods, lot numbers are assigned
directly on the sales order form.

### Manage lots on receipts

Assigning lot numbers to **incoming** goods can be done directly from
the purchase order (PO).

To create a `PO (purchase order)`, go to `Purchase app --> Create`.
Doing so reveals a new, blank request for quotation (RFQ) form.

On this `RFQ (request for quotation)`, fill out the necessary
information by adding a `Vendor`, and adding the desired products to the
`Product` lines, by clicking `Add a product` (under the `Products` tab).

Choose the desired quantity of the product to order by changing the
number in the `Quantity` column.

Once the `RFQ (request for quotation)` has been filled out, click
`Confirm Order`. When the `RFQ (request for quotation)` is confirmed, it
becomes a `Purchase Order`, and a `Receipt` smart button appears. Click
the `Receipt` smart button to be taken to the warehouse receipt form.

<div class="note">

<div class="title">

Note

</div>

Clicking `Validate` before assigning a lot number to the ordered product
quantities will result in a `User Error` pop-up. The pop-up requires
entry of a lot or serial number for the ordered products. The `RFQ
(request for quotation)` **cannot** be validated without a lot number
being assigned.

</div>

![Add lot/serial number user error
popup.](lots/lots-user-error-popup.png)

From here, click the `Additional Options` menu, represented by a
`hamburger
(four horizontal lines)` icon, located to the right of the `Unit of
Measure` column in the `Operations` tab). Clicking that icon reveals a
`Detailed Operations` pop-up.

In this pop-up, configure a number of different fields, including the
assignation of a lot number, under the `Lot/Serial Number Name` column,
located at the bottom of the pop-up.

There are two ways to assign lot numbers: **manually** and
**copy/paste**.

  - **Manually assign lot numbers**: Click `Add a line` and choose the
    location the products will be stored in under the `To` column. Then,
    type a new `Lot Number Name` and set the `Done` quantity.
    
    > ![Assign lot number detailed operations
    > popup.](lots/lots-assign-lot-number-popup.png)
    > 
    > <div class="note">
    > 
    > <div class="title">
    > 
    > Note
    > 
    > </div>
    > 
    > If quantities should be processed in multiple locations and lots,
    > click `Add a line` and type a new `Lot Number Name` for additional
    > quantities. Repeat until the `Quantity Done` matches the `Demand`.
    > 
    > </div>

  - **Copy/paste lot numbers from a spreadsheet**: Populate a
    spreadsheet with all of the lot numbers received from the supplier
    (or manually chosen to assign upon receipt). Then, copy and paste
    them in the `Lot/Serial Number Name` column. Odoo will automatically
    create the necessary number of lines based on the amount of numbers
    pasted in the column. From here, the `To` locations and `Done`
    quantities can be manually entered in each of the lot number lines.
    
    > ![List of lot numbers copied on excel
    > spreadsheet.](lots/lots-excel-spreadsheet.png)

Once all product quantities have been assigned a lot number, click
`Confirm` to close the pop-up. Then, click `Validate`.

A `Traceability` smart button appears upon validating the receipt. Click
the `Traceability` smart button to see the updated `Traceability
Report`, which includes: a `Reference` document, the `Product` being
traced, the `Lot/Serial #` assigned, and more.

### Manage lots on delivery orders

Assigning lot numbers to **outgoing** goods can be done directly from
the sales order (SO).

To create an `SO (sales order)`, go to the `Sales app --> Create`. Doing
so reveals a new, blank quotation form.

On this blank quotation form, fill out the necessary information by
adding a `Customer`, and adding products to the `Product` lines (in the
`Order Lines` tab) by clicking `Add a product`.

Then, choose the desired quantity to sell by changing the number in the
`Quantity` column.

Once the quotation has been filled out, click the `Confirm` button to
confirm the quotation. When the quotation is confirmed, it becomes an
`SO (sales order)`, and a `Delivery` smart button appears.

Click the `Delivery` smart button to view the warehouse receipt form for
that specific `SO (sales order)`.

From here, click the `Additional Options` menu, represented by a
<span class="title-ref">hamburger</span> icon (four horizontal lines,
located to the right of the `Unit of Measure` column in the `Operations`
tab). Clicking that icon reveals a `Detailed Operations` pop-up.

In the pop-up, a `Lot/Serial Number` will be chosen by default, with the
full `Reserved` quantity taken from that specific lot (if there is
enough stock in that particular lot).

If there is insufficient stock in that lot, or if partial quantities of
the `Demand` should be taken from multiple lots, change the quantity in
the `Done` column to only include that specific part of the total
quantity.

<div class="note">

<div class="title">

Note

</div>

The lot automatically chosen for delivery orders varies, depending on
the selected removal strategy (`FIFO (First In, First Out)`, `LIFO (Last
In, First Out)`, or `FEFO
(First Expiry, First Out)`). It will also depend on the quantity
ordered, and if there is enough quantity in one lot to fulfill the
order.

</div>

<div class="seealso">

`/applications/inventory_and_mrp/inventory/routes/strategies/removal`

</div>

Then, click `Add a line`, select an additional (different) `Lot/Serial
Number`, apply the rest of the `Done` quantities, and click `Confirm` to
close the pop-up. Lastly, click the `Validate` button to deliver the
products.

![Detailed operations popup for source lot number on sales
order.](lots/lots-detailed-operations-popup.png)

Upon validating the delivery order, a `Traceability` smart button
appears. Click the `Traceability` smart button to see the updated
`Traceability Report`, which includes a `Reference` document, the
`Product` being traced, the `Date`, and the `Lot/Serial #` assigned.

The `Traceability Report` can also include a `Reference` receipt from
the previous purchase order, if the product quantities shared the same
lot number.

## Manage lots for different operations types

In Odoo, the creation of new lots is only allowed upon **receiving**
products from a purchase order, by default. **Existing** lot numbers
cannot be used.

For sales orders, the opposite is true: new lot numbers cannot be
created on the delivery order, only existing lot numbers can be used.

To change the ability to use new (or existing) lot numbers on any
operation type, go to the `Inventory app --> Configuration -->
Operations Types`, and select the desired `Operation Type`.

For `Receipts`, found on the `Operations Types` page, the `Use
Existing Lots/Serial Numbers` option can be enabled, by clicking `Edit`,
and then clicking the checkbox beside the `Use Existing Lots/Serial
Numbers` option (in the `Traceability` section). Lastly, click the
`Save` button to save the changes.

For `Delivery Orders`, the `Create New Lots/Serial Numbers` option can
be enabled, by clicking `Edit`, and clicking the checkbox beside the
`Create New
Lots/Serial Numbers` option. Be sure to click the `Save` button to save
all changes.

![Enabled traceability setting on operations type
form.](lots/lots-operations-type-form.png)

<div class="tip">

<div class="title">

Tip

</div>

For inter-warehouse transfers involving products tracked by lots, it can
be useful to enable the `Use Existing Lots/Serial Numbers` option for
warehouse receipts.

</div>

## Lots traceability

Manufacturers and companies can refer to traceability reports to see the
entire lifecycle of a product: where (and when) it came from, where it
was stored, and who (and when) it went to.

To see the full traceability of a product, or group by lots, go to the
`Inventory app
--> Products --> Lots/Serial Numbers`. Doing so reveals the `Lots/Serial
Numbers` dashboard.

From here, products with lot numbers assigned to them will be listed by
default, and can be expanded to show the lot numbers those products have
assigned to them.

To group by lots (or serial numbers), begin by removing any filters in
the search bar. Then, click the `Group By` drop-down, select `Add Custom
Group`, and select `Lot/Serial Number` from the drop-down menu. Then,
click `Apply`.

Doing so displays all existing lots and serial numbers, and can be
expanded to show all quantities of products with that assigned number.

![Lots and serial numbers traceability
report.](lots/lots-traceability-report.png)

<div class="seealso">

`/applications/inventory_and_mrp/inventory/management/lots_serial_numbers/differences`

</div>
