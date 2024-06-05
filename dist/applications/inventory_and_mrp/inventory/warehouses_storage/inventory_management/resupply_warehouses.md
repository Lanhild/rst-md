# Resupply from another warehouse

A common use case for multiple warehouses is to have one central
warehouse that resupplies multiple shops, and in this case, each shop is
considered a local warehouse. When a shop wants to replenish a product,
the product is ordered to the central warehouse. Konvergo ERP allows the user to
easily set which warehouse(s) can resupply another warehouse.

## Configuration

To resupply from another warehouse, first go to
`Inventory --> Configuration -->
Settings --> Warehouse` and activate `Multi-Step Routes`. Then, click
`Save` to apply the setting.

<img src="resupply_warehouses/virtual-warehouses-settings.png"
class="align-center"
alt="Enable Multi-Step Routes in Inventory settings." />

View all the configured warehouses by going to
`Inventory --> Configuration -->
Warehouses`.

Create a new warehouse by clicking `Create`. Then, give the warehouse a
name and a `Short Name`. Finally, click `Save` to finish creating the
warehouse.

After that, go back to the `Warehouses` page and open the warehouse that
will be resupplied by the second warehouse. Then, click `Edit`. In the
`Warehouse
Configuration` tab, locate the `Resupply From` field, and check the box
next to the second warehouse's name. If the warehouse can be resupplied
by more than one warehouse, make sure to check those warehouses' boxes
too. Finally, click `Save` to apply the setting. Now, Konvergo ERP knows which
warehouses can resupply this warehouse.

<img src="resupply_warehouses/resupply-from-second-warehouse.png"
class="align-center"
alt="Supply one warehouse with another in the Warehouse Configuration tab." />

## Set route on a product

After configuring which warehouse(s) to resupply from, a new route is
now available on all product forms. The new route appears as
`Supply Product from [Warehouse Name]` under the `Inventory` tab on a
product form. Use the `Supply Product from [Warehouse
Name]` route with a reordering rule or the make to order (MTO) route to
replenish stock by moving the product from one warehouse to another.

<img src="resupply_warehouses/product-resupply-route-settings.png"
class="align-center"
alt="Route setting which enables a product to resupplied from a second warehouse." />

When a product's reordering rule is triggered and the product has the
`Supply Product
from [Warehouse Name]` route set, Konvergo ERP automatically creates two
pickings. One picking is a *delivery order* from the second warehouse,
which contains all the necessary products, and the second picking is a
*receipt* with the same products for the main warehouse. The product
move from the second warehouse to the main warehouse is fully tracked in
Konvergo ERP.

On the picking/transfer records created by Konvergo ERP, the `Source Document`
is the product's reordering rule. The location between the delivery
order and the receipt is a transit location.

<img
src="resupply_warehouses/resupply-receipts-from-reordering-rule.png"
class="align-center"
alt="A reordering rule automatically creates two receipts for stock between warehouses." />

<img src="resupply_warehouses/second-warehouse-delivery-order.png"
class="align-center"
alt="A warehouse order for resupplying one warehouse&#39;s stock with another." />

<img src="resupply_warehouses/second-warehouse-stock-receipt.png"
class="align-center"
alt="A receipt for stock received to one warehouse from another." />
