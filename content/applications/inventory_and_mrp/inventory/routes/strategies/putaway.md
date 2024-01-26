# Putaway rules

Putaway is the process of routing products to appropriate storage
locations upon shipment arrival. Odoo can accomplish this seamlessly
using *putaway rules*, which dictate how products move through specified
warehouse locations.

Upon shipment arrival, operations are generated based on putaway rules
to efficiently move products to specified locations and ensure easy
retrieval. Putaway rules can also prevent volatile substances from being
stored in close proximity by directing them to different locations
determined by the warehouse manager.

<div class="seealso">

\- `How push rules work <inventory/routes/concepts/use-routes/push>` -
`Warehouse locations <inventory/warehouses/location-definition>`

</div>

## Enable putaway rules

Begin by navigating to `Inventory app --> Configuration --> Settings`,
then activate the `Multi-Step Routes` checkbox under the `Warehouse`
heading. By doing so, the `Storage Locations` setting is automatically
enabled as well. Finally, click `Save`.

![In configs, for the Inventory app, check multi-step routes box to
enable Putaway rules.](putaway/multi-step-routes.png)

## Put away products

Putaway rules are commonly used to move products to specific locations
for easy retrieval. Thus, products are grouped in the same *product
category* when a single putaway rule captures the group's storage needs.

To manage where specific products are routed for storage, navigate to
`Inventory app
--> Configuration --> Putaway Rules`. Use the `Create` button to
configure a new putaway rule on a `Product` or `Product Category` that
the rule affects.

In the same line, the `When product arrives in` location is where the
putaway rule is triggered to create an operation to move the product to
the `Store to` location. The `Store to` location must be a sublocation
of the first (e.g. <span class="title-ref">WH/Stock/Fruits</span> is a
specific, named location inside <span class="title-ref">WH/Stock</span>
to make the products stored here easier to find).

<div class="example">

Ensure all apples are stored in the fruits section by filling the field
`Store to` with the location
<span class="title-ref">WH/Stock/Fruits</span> when the `Product`,
<span class="title-ref">Apple</span> arrives in
<span class="title-ref">WH/Stock</span>. Repeat this for all products
and hit `Save`.

![Create putaway rules for apples and
carrots.](putaway/create-putaway-rules.png)

</div>

<div class="note">

<div class="title">

Note

</div>

It is also possible to create and manage putaway rules for a single
product by going to the product page and clicking the `Putaway Rules`
smart button at the top of the page. If the button is not visible at
first glance, select the `More` button at the top right to view
additional smart buttons.

</div>

<div id="inventory/routes/strategies/putaway/internal-stock-moves">

<div class="tip">

<div class="title">

Tip

</div>

Check whether putaway rules work as intended using the summary of
internal product movements. In the `Inventory` app, select `Reporting
--> Product Moves` and enable the `Internal` search filter on the
`Filters` drop-down menu under the search bar at the top of the page. In
this view, confirm that products are moved to the `Store to` location
detailed in the putaway rule. More details in `this section
<inventory/routes/strategies/putaway/wrong-location>`.

</div>

</div>

### Use putaway rules

Once a putaway rule is configured, the product it specifies is
automatically routed to the `Store to` location upon arriving in the
`When product arrives in` location.

For example, on a putaway rule with the `When product arrives in`
location set to <span class="title-ref">WH/Stock</span>, internal stock
moves are automatically created when products first enter the warehouse.
To trigger this putaway rule, begin by creating a `purchase order
<inventory/purchase/manage_deals/manage>` (PO) to bring products into
the warehouse.

To create a `Request for Quotation` (RFQ), go to the `Purchase` app, and
click `Create`. Then, add products to the `RFQ (Request for Quotation)`
by clicking `Add a line`, and selecting the desired product(s) from the
drop-down menu in the `Product` column.

Once ready, click `Confirm`. Doing so turns the `RFQ (Request for
Quotation)` into a `PO (Purchase Order)`. Next, click `Send by Email` to
send the `PO (Purchase
Order)` to the vendor, if needed.

![View purchase order for apples and
carrots.](putaway/purchase-apples-and-carrots.png)

Begin receiving the incoming shipment by selecting the `Receipt` smart
button on the `PO (Purchase Order)`. Click `Receive products` and then
`Validate` to move products into the warehouse. Since the putaway rule
is set to trigger when products arrive in stock, internal transfers are
automatically created when products arrive in the `Destination
Location`, <span class="title-ref">WH/Stock</span>. This ensures
products entering the warehouse are stored in specific locations
suitable for their storage needs.

![In the WH reception operation, receive package of apples and
carrots.](putaway/receive-incoming-stock.png)

## Verify stock moves

Confirm whether the putaway rule worked as intended and that the
products have been moved to the correct location using the `Stock On
Hand` dashboard. View all products in stock in `Inventory app -->
Reporting --> Inventory Report`. By default, the products are grouped by
location.

Select a product's collapsable drop-down menu, which displays the
current location(s) of the product. Then, select a `Location` drop-down
menu to view a list of all stock movements in and out of each location.
Each of these lines are records of a stock move, called a *stock move
line*.

![Verify stock moves triggered by putaway rule in the Inventory
Report.](putaway/destination-locations.png)

### Trace products in wrong locations

To trace products and associated documents for warehouse operations, use
the `Product
Moves` report in `Inventory app --> Reporting --> Product Moves`. View a
product's warehouse operation history by selecting a product's drop-down
menu. Each stock move line contains details about any movement of stock,
such as manufacturing orders, inventory adjustments, or internal
transfers. Click on a stock move line to view all the information in a
comprehensive report.

The stock move line is useful because the `Reference` displays the
warehouse operation associated to the `Product`. Use the `From` and `To`
location and associated `Source` documents to trace the product path and
identify the type of operation.

<div class="tip">

<div class="title">

Tip

</div>

It is also possible to view the stock moves of a product directly from
the product page. Open the desired product page by navigating to
`Inventory --> Products --> Products` and select the product. From
there, click on the `Product Moves` smart button, then click the
product's collapsable drop-down menu from the list. This displays the
stock moves history of the product.

</div>

<div id="inventory/strategies/putaway/stock-moves">

<div class="example">

A putaway rule was purposely set up incorrectly on
<span class="title-ref">Apple</span>, so the product was moved from
<span class="title-ref">WH/Stock</span> to
<span class="title-ref">WH/Stock/Shelf 1</span> instead of the expected
location, <span class="title-ref">WH/Stock/Fruits</span>. To trace the
path the apple moved and identify the cause of the wrong stock move,
open the `Product Moves` report in `Inventory app --> Reporting -->
Product
Moves`. The apple's drop-down menu, when opened, displays a list of
stock moves of the apple. line to open a report that is useful to trace
the path the product moved and identify the cause of the wrong stock
move.

The `To` field displays where the product currently is,
<span class="title-ref">WH/Stock/Shelf 1</span>, which is the wrong
location. The `From` location is the vendor's location, which is
expected since the `Source` of the stock move is a `PO (Purchase
Order)`.

The `Reference` operation, <span class="title-ref">WH/IN/00015</span>,
which is a warehouse reception of products from the vendor, would
further explain why the apples were moved to the wrong location.

![Open stock move report](putaway/stock-move-report.png)

</div>

</div>

To follow an operation identified from the `Product Moves` report,
navigate to `Inventory --> Operations --> Transfers`. This is the page
that displays all warehouse transfers— internal or external. Search for
and click on the corresponding `Reference` operation to view the
document explaining why the product was moved to the wrong location.

<div class="tip">

<div class="title">

Tip

</div>

When there are too many records, use either the `Filters` or `Group by`
features to sort and `find desired records
<inventory/routes/strategies/putaway/use-advanced-filters>`. It is
useful to search exclusively for the receipt operation type because
putaway rules store products *into* a specific stock location.

</div>

<div class="example">

Continuing to diagnose why the product,
<span class="title-ref">Apple</span>, was placed in
<span class="title-ref">WH/Stock/Shelf 1</span>, navigate to the list of
all transfers in `Inventory --> Operations --> Transfers`. Click on the
list item where the `Reference` field matches the
<span class="title-ref">WH/IN/00015</span> operation identified in the
`previous example <inventory/strategies/putaway/stock-moves>` to open
the receipt.

![In the Transfers page in the Inventory app, select the desired
transfer to view the&#10;record.](putaway/transfers.png)

This receipt describes which products were received from the supplier,
with the affiliated `PO (Purchase Order)` linked in the `Source
Document` field. On the warehouse reception document, the field
`Destination Location` shows where the product is received upon entering
the warehouse.

Clicking on the `≣ (Detailed Operations)` icon to the right of the
product line opens a window that shows the product was moved to the
wrong location. Based on this information it can be gathered that the
putaway rule was triggered but the location was set incorrectly. Rectify
this in `Inventory --> Configuration --> Putaway Rules`.

![Click Detailed Operations button on the right of warehouse transfers
page to the right&#10;of the WH reception
document.](putaway/detailed-operations.png)

![Show putaway rule in detailed operations
popup.](putaway/automated.png)

</div>

### Advanced filter search

Keep track of and trace products on the `Product Moves` report by
navigating to `Inventory app --> Reporting --> Product Moves` and use
the `Filters` and `Group by` features to stay updated on warehouse
operations.

Transfers based on putaway rules can be found by toggling on the
`Internal` filter as mentioned in this `tip
<inventory/routes/strategies/putaway/internal-stock-moves>` previously.
Other useful filters and groupbys intended for reporting on the
company's internal operations include:

1.  Filter by `Incoming` and `To Do` to display shipments from vendors
    yet to be processed.
    
    ![Filter warehouse transfer records by Incoming shipments and
    processes ToDo.](putaway/product-moves-to-do.png)

2.  Use custom filters to search for a specific product by its name,
    `lot/serial number
    <inventory/management/lots-serial-numbers>` or barcode. Create a
    custom filter by clicking on `Filters`. Click `Add Custom Filter`,
    fill in the identifying information, and click `Apply`. Now that the
    custom filter is active, click on the `Filters` button again to
    create any additional filters.

3.  Group by `Date`: View all product moves on a specific date.

4.  Group by `From`: Create a custom filter that displays all locations
    that currently store at least 1 product. This is useful to view all
    the locations and sublocations to optimize storage space.

5.  `Favorite` the current search with filters applied. This feature is
    useful to apply the filters promptly, especially if this search is
    often used.
    
    ![Use the star button under the search bar to save current search as
    a favorite view.](putaway/save-favorites.png)
