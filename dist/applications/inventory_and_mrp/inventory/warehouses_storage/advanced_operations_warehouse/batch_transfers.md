# Batch picking

<div id="inventory/misc/batch_picking">

*Batch picking* enables a single picker to handle multiple orders at
once, reducing the time needed to navigate to the same location in a
warehouse.

</div>

When picking in batches, orders are grouped and consolidated into a
picking list. After the picking, the batch is taken to an output
location, where the products are sorted into their respective delivery
packages.

<div class="seealso">

`Use Barcode app for pickings <inventory/management/barcode_picking>`

</div>

Since orders *must* be sorted at the output location after being picked,
this picking method suits businesses with a few products that are
ordered often. Storing high-demand items in easily accessible locations
can increase the number of orders that are fulfilled efficiently.

## Configuration

To activate the batch picking option, begin by going to
`Inventory app -->
Configuration --> Settings`. Under the `Operations` section, check the
`Batch
Transfers` box.

<img src="batch_transfers/batch-transfer-checkbox.png"
class="align-center"
alt="Enable the *Batch Transfers* in Inventory &gt; Configuration &gt; Settings." />

Since batch picking is a method to optimize the *pick* operation in
Konvergo ERP, the `Storage
Locations` and `Multi-Step Routes` options under the `Warehouse` heading
must also be checked on this settings page. When finished, click `Save`.

<img src="batch_transfers/locations-routes-checkbox.png"
class="align-center"
alt="Enable *Storage Locations* and *Multi-Step Routes* Inventory &gt; Configuration &gt; Settings." />

Lastly, enable the warehouse picking feature, by navigating to the
warehouse settings page, which is accessible from
`Inventory app --> Configuration --> Warehouses`.

From here, select the desired warehouse from the list. Then, from the
radio options available for `Outgoing Shipments`, select either the
`Send goods in output and then deliver
(2 steps)` or
`Pack goods, send goods in output and then deliver (3 steps)`.

<div class="seealso">

\- `Delivery in two steps <inventory/receipts_delivery_two_steps>` -
`Delivery in three steps <inventory/delivery_three_steps>`

</div>

<img src="batch_transfers/set-2-or-3-step-shipment.png"
class="align-center"
alt="Set up 2-step or 3-step outgoing shipments." />

## Create batch transfers

Manually create batch transfers directly from the
`Inventory app --> Operations -->
Batch Transfers` page. Click the `New` button to begin creating a batch
transfer.

On the batch transfer form, fill the following fields out accordingly:

- `Responsible`: employee assigned to the picking. Leave this field
  blank if *any* worker can fulfill this picking.
- `Operation Type`: from the drop-down menu, select the operation type
  under which the picking is categorized.
- `Scheduled Date`: specifies the date by which the `Responsible` person
  should complete the transfer to the output location.

Next, in the `Transfers` list, click `Add a line` to open the `Add:
Transfers` window.

If the `Operation Type` field was filled, the list will filter transfer
records matching the selected `Operation Type`.

Click the `New` button to create a new transfer.

Once the transfer records are selected, click `Confirm` to confirm the
batch picking.

<div class="example">

A new batch transfer assigned to the `Responsible`,
<span class="title-ref">Joel Willis</span>, for the
<span class="title-ref">Pick</span> `Operation Type`. The
`Scheduled Date` is set to <span class="title-ref">August 11</span>.

<img src="batch_transfers/batch-transfer-form.png" class="align-center"
alt="View of *Batch Transfers* form." />

Clicking the `Add a line` button opens the `Add:Transfers` window,
displaying only pickings. This is because the `Operation Type` was set
to <span class="title-ref">Pick</span> on the batch transfer form.

Click the checkbox to the left of the transfers,
<span class="title-ref">WH/PICK/00001</span> and
<span class="title-ref">WH/PICK/00002</span>, to include them in the new
transfer. Then, click the `Select` button to close the `Add:Transfers`
window.

<img src="batch_transfers/add-transfers-window.png" class="align-center"
alt="Select multiple transfers from the *Add:Transfers* window." />

</div>

### Add batch from transfers list

Another method of creating batch transfers is available using the
`Add to batch` option in a list. Navigate to the
`Inventory app --> Operations` drop-down menu, and select any of the
`Transfers` to open a filtered list of transfers.

<img src="batch_transfers/transfers-drop-down.png" class="align-center"
alt="Show all transfer types in a drop-down menu: Receipts, Deliveries, Internal Transfers,
Manufacturings, Batch Transfers, Dropships." />

On the transfers list, select the checkbox to the left of the selected
transfers to add in a batch. Next, navigate to the `Actions ⚙️ (gear)`
button, and click `Add to batch` from the resulting drop-down menu.

<img src="batch_transfers/add-to-batch.png" class="align-center"
alt="Use *Add to batch* button, from the *Action* button&#39;s list." />

Doing so opens an `Add to batch` pop-up window, wherein the employee
`Responsible` for the picking can be assigned.

Choose from the two radio options to add to `an existing batch transfer`
or create `a new batch transfer`.

To begin with a draft, select the `Draft` checkbox.

Conclude the process by clicking `Confirm`.

<img src="batch_transfers/add-to-batch-window.png" class="align-center"
alt="Show *Add to batch* window to create a batch transfer." />

## Process batch transfer

Handle batch transfers in the
`Inventory app --> Operations --> Batch Transfers` page.

From here, select the intended transfer from the list. Then, on the
batch transfer form, input the `Done` quantities for each product, under
the `Detailed Operations` tab. Finally, select `Validate` to complete
the picking.

> [!TIP]
> Be certain the batch transfer is complete when the `Validate` button
> is highlighted in purple. If the `Check Availability` button is
> highlighted instead, that means there are items in the batch that are
> currently *not* available in-stock.

<div id="inventory/management/batch-transfers-example">

<div class="example">

In a batch transfer involving products from pickings,
<span class="title-ref">WH/PICK/00001</span> and
<span class="title-ref">WH/PICK/00002</span>, the `Detailed Operations`
tab shows that the product, <span class="title-ref">Cabinet with
Doors</span>, has been picked because the `Done` column matches the
value in the `Reserved` column. However,
<span class="title-ref">0.00</span> quantities have been picked for the
other product, <span class="title-ref">Cable Management Box</span>.

<img src="batch_transfers/process-batch-transfer.png"
class="align-center"
alt="Show batch transfer of products from two pickings in the *Detailed Operations* tab." />

</div>

</div>

Only in-stock products are visible in the `Detailed Operations` tab.

To view the complete product list, switch to the `Operations` tab. On
this list, the `Demand` column indicates the required quantity for the
order. The `Reserved` column shows the available stock to fulfill the
order. Lastly, the `Done` column specifies the products that have been
picked, and are ready for the next step.

<div class="example">

The product, <span class="title-ref">Desk Pad</span>, from the same
batch as the `example above
<inventory/management/batch-transfers-example>`, is only visible in the
`Operations` tab because there are no `Reserved` quantities in-stock to
fulfill the batch picking.

Click the `Check Availability` button to search the stock again for
available products.

<img src="batch_transfers/operations-tab.png" class="align-center"
alt="Show unavailable reserved quantities in the *Operations* tab." />

</div>

### Create backorder

On the batch transfer form, if the `Done` quantity of the product is
*less* than the `Reserved` quantity, a pop-up window appears.

This pop-up window provides the option: `Create Backorder?`.

Clicking the `Create Backorder` button automatically creates a new batch
transfer, containing the remaining products.

Click `No Backorder` to finish the picking *without* creating another
batch picking.

Click `Discard` to cancel the validation, and return to the batch
transfer form.

<img src="batch_transfers/create-backorder.png" class="align-center"
alt="Show the *Create Backorder* pop-up." />

## Process batch transfer: Barcode app

Created batch transfers are also listed in the `Barcode` app, accessible
by selecting the `Batch Transfers` button.

By default, confirmed batch pickings appear on the `Batch Transfers`
page. On that page, click on the desired batch transfer to open the
detailed list of products for the picking.

<img src="batch_transfers/barcode-batch-transfers.png"
class="align-center"
alt="Show list of to-do batch transfers in *Barcode* app." />

For the chosen batch transfer, follow the instructions at the top of the
page in the black background. Begin by scanning the product's barcode to
record a single product for picking. To record multiple quantities,
click the `✏️ (pencil)` icon, and enter the required quantities for the
picking.

> [!NOTE]
> Products from the same order are labeled with the same color on the
> left. Completed pickings are highlighted in green.

<div class="example">

In a batch transfer for 2 <span class="title-ref">Cabinet with
Doors</span>, 3 <span class="title-ref">Acoustic Bloc Screens</span>,
and 4 <span class="title-ref">Four Person Desks</span>, the
<span class="title-ref">3/3</span> and
<span class="title-ref">4/4</span> `Units` indicate that the last two
product pickings are complete.

<span class="title-ref">1/2</span> units of the
<span class="title-ref">Cabinet with Doors</span> has already been
picked, and after scanning the product barcode for the second cabinet,
Konvergo ERP prompts the user to <span class="title-ref">Scan a serial
number</span> to record the unique serial number for
`product tracking <inventory/serial_numbers/configure>`.

<img src="batch_transfers/barcode-products.png" class="align-center"
alt="Display products to be picked in barcode view." />

</div>

Once all the products have been picked, click on `Validate` to mark the
batch transfer as `Done`.
