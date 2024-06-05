# One-step manufacturing

Konvergo ERP *Manufacturing* allows users to manufacture products using one,
two, or three steps. When using one-step manufacturing, Konvergo ERP creates a
manufacturing order (MO), but does not generate transfers for the
movement of components out of inventory or finished products into stock.
Inventory counts still update based on the number of components used and
products manufactured, but the act of transferring them to and from
inventory is not tracked.

> [!TIP]
> The number of steps used in manufacturing is set at the warehouse
> level, allowing for each warehouse to use a different number of steps.
> To change the number of steps used for a specific warehouse, begin by
> navigating to `Inventory --> Configuration --> Warehouses`, and then
> select a warehouse from the `Warehouses` screen.
>
> On the `Warehouse Configuration` tab, find the `Manufacture` radio
> input field, and select one of the three options:
> `Manufacture (1 step)`, `Pick
> components and then manufacture (2 steps)`, or
> `Pick components, manufacture and then
> store products (3 steps)`.
>
> <img src="one_step_manufacturing/manufacturing-type.png"
> class="align-center"
> alt="The Manufacture radio input field on a warehouse configuration page." />

> [!IMPORTANT]
> Products must be properly configured before they can be manufactured
> in Konvergo ERP. For details on how to do so, see the documentation on how to
> `configure a product for manufacturing
> <manufacturing/management/configure-manufacturing-product>`.

## Create manufacturing order

To manufacture a product in Konvergo ERP *Manufacturing*, begin by navigating to
`Manufacturing --> Operations --> Manufacturing Orders`, and then click
`New` to create a new `MO (Manufacturing Order)`.

On the new `MO (Manufacturing Order)`, select the product to be produced
from the `Product` drop-down menu. The `Bill of Material` field
auto-populates with the associated bill of materials (BoM).

If a product has more than one configured for it, the specific can be
selected in the `Bill of Material` field, and the `Product` field
auto-populates with the associated product.

After a has been selected, the `Components` and `Work Orders` tabs
auto-populate with the components and operations specified on the . If
additional components or operations are required for the
`MO (Manufacturing Order)` being configured, add them to the
`Components` and `Work Orders` tabs by clicking `Add a line`.

## Process manufacturing order

An `MO (Manufacturing Order)` is processed by completing all of the work
orders listed under its `Work Orders` tab. This can be done on the
`MO (Manufacturing Order)` itself, or from the work order tablet view.

### Basic workflow

To complete work orders from the `MO (Manufacturing Order)` itself,
begin by navigating to `Manufacturing
--> Operations --> Manufacturing Orders`, and then select an
`MO (Manufacturing Order)`.

On the `MO (Manufacturing Order)` page, select the `Work Orders` tab.
Once work begins on the first work order that needs to be completed,
click the `Start` button for that work order. Konvergo ERP *Manufacturing* then
starts a timer that keeps track of how long the work order takes to
complete.

<img src="one_step_manufacturing/start-button.png" class="align-center"
alt="The Start button for an operation on a manufacturing order." />

When the work order is completed, click the `Done` button for that work
order. Repeat the same process for each work order listed on the
`Work Orders` tab.

<img src="one_step_manufacturing/done-button.png" class="align-center"
alt="The Done button for an operation on a manufacturing order." />

After completing all of the work orders, click `Produce All` at the top
of the screen to mark the `MO (Manufacturing Order)` as `Done`, and
register the manufactured product(s) into inventory.

### Tablet view workflow

To complete the work orders for an `MO (Manufacturing Order)` using the
tablet view, begin by navigating to
`Manufacturing --> Operations --> Manufacturing Orders`, and then select
a manufacturing order.

Next, click on the `Work Orders` tab, and then select the `📱 (tablet)`
button on the line of the first work order to be processed. This opens
the tablet view.

<img src="one_step_manufacturing/tablet-view-button.png"
class="align-center"
alt="The tablet view button for a work order on a manufacturing order." />

After opening the tablet view, Konvergo ERP *Manufacturing* automatically starts
a timer that keeps track of how long the work order takes to complete.
After completing the work order, click the `Mark as Done` button in the
top-right corner of the tablet view.

Clicking `Mark as Done` while there is at least one more work order left
to complete opens a page that lists the next work order. Click on that
work order to open it in the tablet view.

Once the final work order for the `MO (Manufacturing Order)` has been
reached, a `Mark as Done and Close MO` button appears on the tablet view
in addition to the `Mark as Done` button. Click
`Mark as Done and Close MO` to mark the `MO (Manufacturing Order)` as
`Done` and register the manufactured product(s) into inventory.

It is also possible to complete the final operation while keeping the
`MO (Manufacturing Order)` open, by clicking `Mark as Done`. In this
case, the `MO (Manufacturing Order)` can be closed later by clicking the
`Produce All` button on the order.
