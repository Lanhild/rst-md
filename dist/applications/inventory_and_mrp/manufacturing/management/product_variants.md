# Managing BoMs for product variants

Konvergo ERP allows one bill of materials (BoM) to be used for multiple variants
of the same product. Having a consolidated `BoM (bill of materials)` for
a product with variants saves time by preventing the need to manage
multiple `BoMs (bills of materials)`.

## Activate product variants

To activate the product variants feature, navigate to `Inventory app -->
Configuration --> Settings`, and scroll down to the `Products` section.
Then, click the checkbox to enable the `Variants` option. After that,
click `Save` to apply the setting.

For more information on configuring product variants, refer to the
`product variants
<../../../sales/sales/products_prices/products/variants>` documentation.

<img src="product_variants/product-variants-variants-settings.png"
class="align-center"
alt="Selecting &quot;Variants&quot; from Inventory app settings." />

## Create custom product attributes

Once the product variants feature is activated, create and edit product
attributes on the `Attributes` page.

The `Attributes` page is accessible either from `Inventory app -->
Configuration --> Settings` by clicking the `Attributes` button, or by
clicking `Inventory app --> Configuration --> Attributes`.

Once on the `Attributes` page, either click into an existing attribute,
or click `Create` to create a new one. Clicking `Create` reveals a new,
blank form for customizing an attribute. For an existing attribute,
click `Edit` on its form to make changes.

Assign an `Attribute Name`, and choose a category from the `Category`
field's drop-down menu. Then, select the desired options next to the
`Display Type` and `Variants Creation Mode` fields. Once the desired
options are selected, click `Add a line` under the `Attribute Values`
tab to add a new value.

> [!TIP]
> Included on the `Value` row is a `Is custom value` checkbox. If
> selected, this value will be recognized as a custom value, which
> allows customers to type special customization requests upon ordering
> a custom variant of a product.

<div class="example" align="center"
alt="Product variant attribute configuration screen.">

.. image:: product_variants/product-variants-attribute.png

</div>

Once all desired `Values` have been added, click `Save` to save the new
attribute.

## Add product variants on the product form

Created attributes can be applied on specific variants for particular
products. To add product variants to a product, navigate to the product
form by going to `Inventory app -->
Products --> Products`. To make changes to the product, click `Edit`.
Then, click the `Variants` tab.

Under the `Attribute` header, click `Add a line` to add a new attribute,
and select one to add from the drop-down menu.

Then, under the `Values` header, click the drop-down menu to choose from
the list of existing values. Click on each desired value to add them,
and repeat this process for any additional attributes that should be
added to the product.

Once finished, click `Save` to save changes.

<img src="product_variants/product-variants-product-form.png"
class="align-center"
alt="Product form variants tab with values and attributes." />

> [!TIP]
> `BoM (bill of materials)` products with multiple variants that are
> manufactured in-house should either have a **0,0 reordering rule** set
> up, or have their replenishment routes set to *Replenish on Order
> (MTO)*.

## Apply BoM components to product variants

Next, create a new `BoM (bill of materials)`. Or, edit an existing one,
by going to `Manufacturing app --> Products --> Bills of Materials`.
Then, click `Create` to open a new `Bills of Materials` form to
configure from scratch.

Add a product to the `BoM (bill of materials)` by clicking the drop-down
menu in the `Product` field and selecting the desired product.

Then, add components by clicking `Add a line` under the `Component`
section of the `Components` tab, and choosing the desired components
from the drop-down menu.

Choose the desired values in the `Quantity` and
`Product Unit of Measure` columns. Then, choose the desired values in
the `Apply on Variants` column.

> [!NOTE]
> The `Apply on Variants` option to assign components to specific
> product variants on the `BoM (bill of materials)` is available once
> the `Variants` setting is activated from the `Inventory` application.
> If the `Apply on Variants` field is not immediately visible, activate
> it from the additional options menu (three-dots icon, to the right of
> the header row).

<img src="product_variants/product-variants-apply-on-variants.png"
class="align-center"
alt="&quot;Apply on Variants&quot; option on the additional options menu." />

Each component can be assigned to multiple variants. Components with no
variants specified are used in every variant of the product. The same
principle applies when configuring operations and by-products.

When defining variant `BoMs (bills of material)` by component
assignment, the `Product Variant` field in the main section of the
`BoM (bill of materials)` should be left blank. This field is *only*
used when creating a `BoM (bill of materials)` specifically for one
product variant.

When all desired configurations have been made to the
`BoM (bill of materials)`, click `Save` at the top of the form to save
changes.

> [!TIP]
> For components that only apply for specific variants, choose which
> operations the components should be consumed in. If the
> `Consumed in Operation` column is *not* immediately visible, activate
> it from the additional options menu (three-dots icon, to the right of
> the header row).

## Sell and manufacture variants of BoM products

To sell and manufacture variants of `BoM (bill of materials)` products
to order, navigate to `Sales app --> Create` to create a new quotation.

### Sell variant of BoM product

Once on the blank `Quotation` form, click the drop-down next to the
`Customer` field to add a customer.

Then, under the `Order Lines` tab, click `Add a product`, and select the
previously-created `BoM (bill of materials)` product with variants from
the drop-down menu. Doing so reveals a `Configure a product` pop-up.

From the pop-up window, click the desired attribute options to configure
the correct variant of the product to manufacture. Then, click the green
`+` or `-` icons next to the <span class="title-ref">1</span> to change
the quantity to sell and manufacture, if desired.

<img src="product_variants/product-variants-variant-popup.png"
class="align-center"
alt="Configure a product pop-up for choosing variant attributes." />

Once all the specifications have been chosen, click `Add`. This will
change the pop-up to a second `Configure` pop-up, where available
optional products will appear, if they have been created previously.

Once ready, click `Confirm` to close the pop-up.

Then, click `Save` to save all changes, and click `Confirm` at the top
of the `Quotation` form to create and confirm a new sales order (SO).

### Manufacture variant of BoM product

Once the `SO (sales order)` is confirmed, a `Manufacturing` smart button
appears at the top of the `SO (sales order)` form. Click the
`Manufacturing` smart button to open the `Manufacturing Order` form.

On this form, under the `Components` tab, the appropriate components for
the chosen variant are listed. And, depending on the variant, different
components will be listed. To see any mandatory or optional `Operation`
steps, click the `Work Orders` tab.

To enter the tablet view work order screen, click the `tablet icon` to
the right of the row for the desired operation to be completed.

From the tablet view, click `Mark as Done` as the operation progresses
to complete the operation steps.

Alternatively, click the `Mark as Done` button at the top of the
manufacturing order form to complete the order.

<img src="product_variants/product-variants-manufacturing-order.png"
class="align-center"
alt="Manufacturing order for variant of BoM product." />

Then, navigate back to the `SO (sales order)` via the breadcrumbs at the
top of the page.

Now that the product has been manufactured, click the `Delivery` smart
button to deliver the product to the customer. From the `Delivery Order`
form, click `Validate`, then click `Apply` to deliver the product.

To finish the sale, click back to the `SO (sales order)` via the
`breadcrumbs` at the top of the page again. Then, click `Create Invoice`
followed by `Create
Invoice` again to invoice the customer for the order.
