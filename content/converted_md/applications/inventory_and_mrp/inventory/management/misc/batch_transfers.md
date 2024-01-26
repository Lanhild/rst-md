# Process Batch Transfers

Batch picking allows a single picker to handle a batch of orders,
reducing the number of times he must visit the same location. In Odoo,
it means you can regroup several transfers into the same batch transfer,
then process it, either via the barcode application or in the form view.

## Create a Batch Transfer

To activate the batch picking option, go to `Inventory
--> Configuration --> Configuration` and enable *Batch Pickings*.

![View of the inventory settings. Process to enable the batch pickings
option in the Odoo Inventory
app](batch_transfers/batch_transfers_01.png)

Then, go to `Inventory --> Operations --> Batch
Transfers` and hit the create button.

![View of the new menu, Batch Transfers, under
operations](batch_transfers/batch_transfers_02.png)

Now, determine the batch transfer responsible and the type of transfers
you want to include in the batch. To add the types of transfers, click
on *Add a line*.

![View of a Batch Transfers
form](batch_transfers/batch_transfers_03.png)

In the example below, a filter was applied to only see the transfers
that are in the *Pick* step. After that, the different transfers that
needed to be included in the batch transfer were selected.

![View of the list of transfers to choose for a single batch transfer
and how to add them&#10;to the batch
transfer](batch_transfers/batch_transfers_04.png)

To see the products to pick for the different transfers, click on
*Select*. If *Multi-locations* has been activated, the document also
shows the locations they have been reserved from.

![View of a batch transfer list. Products to pick with their source and
target locations](batch_transfers/batch_transfers_05.png)

## Create a Batch Transfer from the Transfers List View

From the *Transfers List View*, select transfers that should be included
in the Batch. Then, select *Add to batch* from the *Action* list.

![View of the process to add transfers to a batch transfer from the
transfers list view](batch_transfers/batch_transfers_06.png)

Next, determine if you want to add the transfers to an existing draft
batch transfer or create a new one.

![Option to add a responsible to a batch transfer so it can be
confirmed](batch_transfers/batch_transfers_07.png)

## Process a Batch Transfer

While gathering the products, you can edit the batch transfer and update
the *Quantity done* for each product. Once everything has been picked,
select *Validate* so the different transfers contained in the batch are
validated too.

![View of an in progress batch
transfer](batch_transfers/batch_transfers_08.png)

In case all the products cannot be picked, you can create backorders for
each individual transfer which couldn’t be completely processed.

![How to handle batch transfers with unavailable products. Creation of a
backorder inside&#10;of a batch
transfer](batch_transfers/batch_transfers_09.png)

![View of how backorders are handled in Odoo's batch
transfers](batch_transfers/batch_transfers_10.png)

## Process a Batch Transfer from the Barcode app

Enter the *Barcode* application, select the *Batch Transfers* menu.

![View of the Odoo Barcode app
dashboard](batch_transfers/batch_transfers_11.png)

Then, you can enter the batch transfer on which you want to work. Batch
transfers can easily be grouped per responsible if necessary.

![View of the batch transfers dashboard inside of the Barcode
app](batch_transfers/batch_transfers_12.png)

In the batch transfer, products are classified per location. The source
document is visible on each line and a color-code helps differentiate
them.

![View of an in progress batch transfer with the Odoo Barcode
application](batch_transfers/batch_transfers_13.png)

To see the products to pick from another location, click on the *Next*
button.

![View of a ready and completed batch transfer inside of the Odoo
Barcode application](batch_transfers/batch_transfers_14.png)

Once all the products have been picked, click on *Validate* (on the last
page) to mark the batch transfer as done.
