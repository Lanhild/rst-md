# Serial numbers and lots

Working with **serial numbers** and **lots** allows tracking your
products' movements. When products are tracked, the system identifies
their location based on their last movement.

To enable traceability, go to `Point of Sale --> Products --> Products`.
Then, select a product and check the `Tracking By Unique Serial Number`
or the `Tracking By Lots` box in the `Inventory` tab.

<img src="serial_numbers/product-form-traceability.png"
class="align-center" alt="Enable traceability settings" />

## Serial numbers and lots importation

You can import serial numbers in Point of Sale. To do so, select a
**sales order** or a **quotation** containing tracked products. Then,
agree to load the **Lots or Serial Numbers** linked to the
`SO (sales order)`.

<img src="serial_numbers/importing-sn.png" class="align-center"
width="480" alt="Pop-up window for serial number import" />

The imported tracking numbers appear below the tracked products. You can
modify them by clicking on the list-view button next to the products.

<img src="serial_numbers/pos-sn-imported.png" class="align-center"
width="480" alt="Pop-up window for serial number import" />

<div class="seealso">

\- `../shop/sales_order`

</div>

## Serial numbers and lots creation

If a tracked product is available in your POS, adding the product to the
cart opens a pop-up window where you can type or scan the product's
serial or lot numbers. To add more than one of the same tracked
products, click on **enter** to validate and start a new line.

<img src="serial_numbers/create-change-sn.png" class="align-center"
width="480" alt="adding new serial and lots numbers" />

> [!NOTE]
> - Changing a tracked product's quantity using the numpad turns the
> list-view button red. Click on it to add the missing lot and serial
> numbers. - `Lot & Serial Number(s)` are `required` on tracked products
> but not mandatory. Meaning that not attributing some or any does
> **not** prevent from completing the sale.

<div class="seealso">

\-
`/applications/inventory_and_mrp/inventory/product_management/product_tracking/serial_numbers` -
`/applications/inventory_and_mrp/inventory/product_management/product_tracking/lots`

</div>
