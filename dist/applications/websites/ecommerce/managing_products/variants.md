# Product variants

Product variants are variations, such as different colors, materials,
etc., of the same product. These variations can differ in price and
availability from the product. Product variants can either be
`created <../../../sales/sales/products_prices/products/variants>` or
`imported <../../../sales/sales/products_prices/products/import>`.

To use product variants, enable them under
`Website --> Configuration --> Settings`, in the `Shop - Products`
section.

<div class="seealso">

\- `../managing_products/products` -
`../../../sales/sales/products_prices/products/variants` -
`../../../sales/sales/products_prices/products/import`

</div>

## Product configurator

Adding attributes and values to a product template allows the enabling
of the **product configurator** on the product page. Customers use it to
configure and select the product variant of their choice; or in the case
of multiple attributes, combine those to create a specific variant.

<img src="variants/variants-configurator.png" class="align-center"
alt="Variants configurator" />

The **display type** of each attribute used in the product configurator
can be edited through the **website builder** by clicking
`Edit --> Customize` on the product page, and then clicking on one of
the attributes. You can then select between four options:

- `Radio`
- `Pills`
- `Select`
- `Color`

<img src="variants/variants-display-type.png" class="align-center"
alt="Display type options for attributes" />

<div id="variants-configurator-backend">

Alternatively, the **display type** can be edited through
`Website --> eCommerce -->
Attributes`, selecting an **attribute**, and then choosing a
`Display Type`; or through the **product template** by going to
`eCommerce --> Products`, selecting a product, and then clicking
`Attributes and Variants`.

</div>

> [!TIP]
> Specific combinations of values can be excluded from the product
> configurator. This way, customers are unable to select the excluded
> combination of values. To do so, go to
> `Website --> eCommerce --> Products`, select a product, and go to
> `Attributes and Variants`. Then, click on an **attribute**, select a
> **value**, and in the `Exclude for` section, select a
> `Product Template` and the `Attribute Values` to exclude.

## Product specifications

Values used for each attribute are displayed as a **specification list**
at the bottom of the product page. To be visible, the **specification
list** must first be enabled on the product page by going to
`Edit --> Customize` and selecting a placement for the field
`Specification`.

<img src="variants/variants-specifications.png" class="align-center"
alt="Specifications list on the product page" />

> [!TIP]
> The product **specification list** can also be used on products
> without variants. For that, make sure to have no values combination.
> Products with single values for their attributes do not generate
> variants.

## Filter catalog by attributes

Customers **can** filter the **catalog** based on product attributes and
values, allowing them to `filter <ecommerce-browsing>` the catalog based
only on the attribute(s) of their choice.

To enable **attributes filtering**, go to `Edit --> Customize` from your
**main shop page** and click on one of the `Categories` in the left
column. Here, enable either `Left`, `Top`, or **both**, in the
`Attributes` field.

<img src="variants/variants-categories.png" class="align-center"
alt="Categories buttons" />
