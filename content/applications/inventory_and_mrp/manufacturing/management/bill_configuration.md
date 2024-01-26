# Create a bill of materials (BoM)

A *bill of materials* (or *BoM*) is a document that defines the quantity
of each component required to manufacture (or deliver) a finished
product. It can also include various operations types, steps, and
instructions for the individual guidelines needed to complete a
production process.

In Odoo *Manufacturing*, multiple `BoMs (Bills of Materials)` can be
linked to a product, so even product variants can have their own
specific `BoMs (Bills of Materials)`.

Correctly setting up a `BoM (Bill of Materials)` helps optimize the
manufacturing process, and saves time.

## Set up a BoM

`BoMs (Bills of Materials)` can be set up with or without operations
steps or instructions, and can include as many or as few components as
needed. The simplest setup is one without operations or instructions. In
that case, the production is solely managed with *manufacturing orders*
(MOs).

To create a `BoM (Bill of Materials)`, navigate to `Manufacturing app
-->
Products --> Bills of Materials`, and click `Create`. Then, in the
`Product` field, choose the product that will be associated with the
`BoM (Bill of Materials)`.

![Bill of materials creation
screen.](bill_configuration/bill-configuration-bom-creation.png)

There are three `BoM Types` that can be chosen for any bill of
materials:

1.  `Manufacture this product` indicates that this product is
    manufactured in-house, from start to finish using the components
    listed on the `BoM (Bill of Materials)`.
2.  `Kits` are sets of unassembled components that may be sold as
    products, and are useful for managing more complex `BoMs (Bills of
    Materials)`.
3.  `Subcontracting` outsources the production of some (or all)
    components or products to outside manufacturers. This feature needs
    to be enabled in `Manufacturing app -->
    Configuration --> Settings`, under the `Operations` section.

<div class="note">

<div class="title">

Note

</div>

A `BoM (Bill of Materials)` can also be created directly from the `BoM
(Bill of
Materials)` smart button on the product template, in which case the
`Product` field is pre-filled.

</div>

The most common `BoM Type` is `Manufacture this product`. Once the `BoM
Type` is chosen, click `Add a Line` to add all the `Components` that go
into the production of the final product, as well as the `Quantity` of
each component. Finally, click `Save` to finish creating the `BoM (Bill
of Materials)`.

<div class="tip">

<div class="title">

Tip

</div>

New components can be added, even during production, directly from the
`BoM (Bill of
Materials)`. After selecting `Add a line`, create the new component and
select `Create` or `Create and Edit`. Components can also be created by
going to `Manufacturing app --> Products --> Products`, and clicking
`Create`.

</div>

### Specify a BoM for a product variant

<div class="important">

<div class="title">

Important

</div>

To assign *product variants* to `BoMs (Bills of Materials)`, the feature
must be enabled in `Inventory --> Configuration --> Settings`, under the
`Products` section by selecting `Variants` and clicking `Save`.

</div>

`BoMs (Bills of Materials)` can also be assigned to specific *product
variants*, with two setup options available to choose from.

![Bill of materials product variants and apply on variants
options.](bill_configuration/bill-configuration-product-variants.png)

The first method is to create one `BoM (Bill of Materials)` per product
variant, by specifying the `Product Variant` every time a new `BoM (Bill
of Materials)` is created.

The second method is to create **one** master `BoM (Bill of Materials)`
that contains all components, and specify which variant each component
applies to in the `Apply on Variants` column.

<div class="seealso">

[Managing with Product
Variants](https://www.odoo.com/slides/slide/manufacturing-with-product-variants-2805)

</div>

<div class="note">

<div class="title">

Note

</div>

The `Apply on Variants` column is hidden by default and can be accessed
by clicking on the `Additional Options` menu icon at the right of the
`Components` tab.

</div>

## Set up operations steps

Some `BoMs (Bills of Materials)` require multiple operations and steps
during the manufacturing process. To create `Operations` on a `BoM (Bill
of Materials)`, first enable the `Work Orders` feature in `Manufacturing
app --> Configuration
--> Settings --> Operations`.

![An example of a Bill of Materials operation and the steps creation
tab.](bill_configuration/bill-configuration-create-operation.png)

When creating a new `BoM (Bill of Materials)`, click the `Operations`
tab and click `Add a line` to add a new operation.

In the `Create Operations` box, give the operation a name, and specify
the `Work
Center` and the `Default Duration` settings. Under the `Work Sheet` tab,
the type of `Work Sheet` can also be chosen, if assembly instructions
need to be attached.

The `Work Sheet` types that can be added are: `Text` (with a
`Description`); `PDF` files; and `Google Slide` presentations. When all
the information has been filled out, select `Save & Close`.

![Bill of materials create operations popup on operations
tab.](bill_configuration/bill-configuration-operations-popup.png)

## Add by-products to a BoM

A *by-product* is a residual product that is created during production
of a `BoM (bill of
materials)`. Unlike the finished product, there can be more than one
by-product on a `BoM
(Bill of Materials)`.

To add by-products to a `BoM (Bill of Materials)`, first enable the
`By-Products` feature in `Manufacturing app --> Configuration -->
Settings --> Operations`.

Once the feature is enabled, by-products can be added to a `BoM (Bill of
Materials)` from the `By-products` tab by clicking `Add a line`. The
by-product can be named, its `Quantity` specified, and a `Unit of
Measure` chosen.

If the `BoM (Bill of Materials)` has `Operations` steps, specify exactly
which operation the by-product is produced from in the `Produced in
Operation` field. Finally, click `Save` to save changes.

<div class="seealso">

\-
`/applications/inventory_and_mrp/manufacturing/management/kit_shipping`
-
`/applications/inventory_and_mrp/manufacturing/management/product_variants`
-
`/applications/inventory_and_mrp/manufacturing/management/routing_kit_bom`

</div>
