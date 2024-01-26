# How to list a product?

<div id="ebay-connector/listing">

In order to list a product on eBay and Odoo there are two methods in
Odoo to do so:

</div>

1.  Make a product in Odoo and list the item eBay.
      - Click `List Item on eBay` in the top menu of the product
        template. The product template can be accessed by navigating to
        `Sales app --> Products --> Product` and selecting the
        individual product.
2.  List the item on eBay, then create the product in Odoo, and finally
    link product to the item on eBay.
      - Click `Link With Existing eBay Listing` in the top menu on the
        product template.The product template can be accessed by
        navigating to `Sales app --> Product -->
        Product` and selecting the individual product.

<div class="note">

<div class="title">

Note

</div>

If an order comes in and the listing from the order is not linked to a
product, eBay will create a consumable product.product in its place.
These consumables should be altered on the *sales order* while in draft
state to represent a storable product, and then the user can link to the
listing as they come in.

</div>

<div class="seealso">

To learn more about the eBay connector visit these pages as well:

  - `setup`
  - `linking_listings`
  - `troubleshooting`

</div>

## Listing without variation

Access the product template by navigating to `Sales app --> Products -->
Product` and selecting the individual product.

In order to list a product, select the `Sell on eBay` field on a product
template. `Sell on eBay` is either in an `eBay` tab or under the
`Product
name`. Click `Save` if necessary.

![The eBay template form listed in the product template in
Odoo.](manage/manage-ebay-template.png)

When the `Use Stock Quantity` field is checked, the quantity set on eBay
will be the Odoo *Forecast Quantity* (Odoo *Inventory* app).

The `Description Template` allows the administrator to use templates in
listings. The default template only use the `eBay Description` field of
the product. HTML can be used inside the `Description Template` and in
the `eBay Description` in Odoo 14. Starting in Odoo 15, the powerbox
feature is available to use in the template and description. Simply type
a forward slash <span class="title-ref">/</span> to reveal a menu with
formatting, layout, and text options. To add an image, type
<span class="title-ref">/image</span>.

To use images in the listing, another option is to add them as
*Attachments* on the product template.

<div class="seealso">

For more information on template configuration in Odoo visit:
`../../../general/email_communication/email_template`.

</div>

## Listing with variations

When the `Sell on eBay` is checked on a product containing variations
with `Fixed Price` as `Listing Type`, the eBay form is slightly
different. Go to the `Variants` tab to or click `Configure Variants` in
the top menu to configure the variant settings. Pricing can be
configured for each variation.

When the `Listing Type` is changed to `Fixed Price`, Odoo presents a
variant table at the bottom of the `eBay` tab, in which the `Fixed
Price` can be entered, and the decision to `Publish on eBay` can be made
for specific variants, along with other options.

![The fixed price listing type in the eBay tab on a product form in Odoo
sales.](manage/fixed-listing-price.png)

## Product identifiers

Products identifiers such as EAN, UPC, Brand or MPN are required in most
of the eBay categories.

### EAN and UPC identifiers

The module manages the EAN and UPC identifiers with the `Barcode` field
of the product variant. If the `Barcode` field is empty or is value is
not valid, the EAN and UPC values will be set as 'Does not apply' as
recommended by eBay.

Barcodes can be found on the product template, under the the `General
Information` tab. Access the product template, first, by navigating to
`Sales app --> Products -->
Product` and selecting the individual product.

### Listing with item specifics

In order to add item specifics, one should create a product attribute
with a single value in the `Attributes & Variants` tab on the product
form. Examples of item specifics include:
<span class="title-ref">MPN</span> or
<span class="title-ref">Brand</span>. The Brand and MPN values are
working as item specifics and should be defined in the `Attributes &
Variants` tab on the product form. If these values are not set, 'Does
not apply' will be used for the eBay listing.

## Process invoices and payments

### Posting payment

When eBay orders are placed they are always paid for up front, via the
eBay site. At no point will users pay for items on eBay through Odoo.
Therefore, once orders are synced into Odoo from eBay they are already
paid for. Odoo's invoicing and payment functionalities are not utilized.
However, invoices need to be created and marked as Paid to “close” the
*Sales Order*.

Users can opt to mass create and post invoices in batches. To do so,
navigate to Quotations in the list view by going to `Sales app -->
Orders --> Quotations`. In the upper right corner, select the list view
icon. Hover over the icons to reveal the name of each. Then check the
boxes on the left that invoices should be made for and go to the
`Action` menu or ⚙️ \[Gear icon\] . Click on `Create Invoices`.

A pop-up will appear and click on the `Create and view invoice` button.
A new screen will populate with the newly created invoices. Next, select
all of them by clicking on the box icon next to `Number` in the header
row of the list, this will select all the records. Then navigate to the
`Action` menu and click `Post entries`. Following this step, a pop-up
will appear and click on `Post journal entries`. This will take the
invoices out of *draft* and set them to *posted*.

### Reconciling payments

Users typically utilize PayPal to receive payment from eBay, and then
send lump sums from PayPal into their bank account. To reconcile this
income, users can reconcile the one PayPal transfer with all related
invoices.

First navigate to the `Accounting Dashboard` by going to the `Accounting
app --> Dashboard --> Bank`. `Create` a new transaction and enter the
`Label` as <span class="title-ref">eBay Sales</span>. Fill out the
`Amount` and enter a `Statement` date in. Click on `Create and edit`.

For the `Ending Balance` field, enter the same account that was entered
for the `Amount` above. Click on `Save`. Next, open the new balance that
needs to be reconciled. Under the tab marked: `Match Existing Entries`
select the entries that are included in this balance.

After adding all the necessary entries, click `Validate` to complete the
reconciliation. To verify the payment, navigate to `Customers -->
Invoices` and select the desired customer invoice. The *Paid* label
should appear under the `Payment Status` column.

<div class="seealso">

\- `/applications/sales/sales/ebay_connector/troubleshooting` -
`/applications/sales/sales/ebay_connector/linking_listings` -
`/applications/sales/sales/ebay_connector/setup`

</div>
