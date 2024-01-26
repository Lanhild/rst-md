# Configure Amazon Connector in Odoo

## Register your Amazon account in Odoo

<div id="amazon/setup">

To register your seller account in Odoo, navigate to `Sales -->
Configuration
--> Settings --> Connectors --> Amazon Sync --> Amazon Accounts` and
click on `CREATE`.

</div>

1.  Choose a meaningful name for your account (e.g.
    <span class="title-ref">Europe</span>), and select your `Sign-up
    Marketplace`. This is the original sign-up marketplace of your
    seller account (e.g. if you created your account on Amazon Germany,
    your sign-up marketplace will be
    <span class="title-ref">amazon.de</span>)
2.  Upon saving, a button to `link with Amazon` appears. Click on it to
    be redirected to the Amazon login page, or directly to the consent
    page if you are already logged in. There, confirm that you want
    Amazon to give Odoo access to your account and related data.
3.  Amazon redirects you to Odoo, with your account registered.

Once the account is registered, the marketplaces available to this
account are synchronized and listed under the `Marketplaces` tab. If you
wish, you can remove some items from the list of synchronized
marketplaces to disable their synchronization.

## Match database products in Amazon

When an Amazon order is synchronized, up to three sales order items are
created in Odoo for each product sold on Amazon: one for the marketplace
product, one for the shipping charges (if any) and one for the gift
wrapping charges (if any).

<div id="amazon/matching">

The selection of a database product for a sales order item is done by
matching its **internal reference** with the **SKU** for marketplace
items, the **shipping code** for delivery charges, and the **gift
wrapping** code for gift wrapping charges.

</div>

For marketplace products, pairings are saved as **Amazon Offers** which
are listed under the **Offers** stat button on the account form. Offers
are automatically created when the pairing is established and are used
for subsequent orders to lookup SKUs. If no offer with a matching SKU is
found, `the internal reference is used instead <amazon/matching>`.

<div class="tip">

<div class="title">

Tip

</div>

It is possible to force the pairing of a marketplace item with a
specific product by changing either the product or the SKU of an offer.
The offer can be manually created if it was not automatically done yet.
This is useful if you do not use the internal reference as the SKU or if
you sell the product under different conditions.

</div>

If no database product with a matching internal reference is found for a
given SKU or gift wrapping code, a default database product **Amazon
Sale** is used. The same is done with the default product **Amazon
Shipping** and the shipping code.

<div class="note">

<div class="title">

Note

</div>

To modify the default products, activate the `developer mode
<developer-mode>` and navigate to `Sales --> Configuration --> Settings
--> Connectors --> Amazon Sync -->
Default Products`.

</div>

## Configure taxes of products

To allow for tax reporting of Amazon sales with Odoo, the taxes applied
to the sales order items are those set on the product or determined by
the fiscal position. Make sure to have set the correct taxes on your
products in Odoo or to have it done by a fiscal position, to avoid
discrepancies in the subtotals between Seller Central and Odoo.

<div class="note">

<div class="title">

Note

</div>

As Amazon does not necessarily apply the same taxes as those configured
in Odoo, it may happen that order totals differ by a few cents from that
on Seller Central. Those differences can be resolved with a write-off
when reconciling the payments in Odoo.

</div>

## Add an unsupported marketplace

Some Amazon Marketplaces, such as Amazon Brazil, are not created by
default as they are not officially supported by Odoo but might be
compatible with your seller account. These marketplaces can be added
manually should you wish to use them. See `here
<amazon/supported-marketplaces>` for the exhaustive list of natively
supported marketplaces.

<div class="tip">

<div class="title">

Tip

</div>

To find out if a marketplace is eventually compatible, check the [Amazon
Documentation](https://developer-docs.amazon.com/amazon-shipping/docs/seller-central-urls).
The marketplace must belong to the same region as that of your seller
account.

</div>

To add a new marketplace, activate the `developer mode
<developer-mode>`.

Once that is done, go to `Sales --> Configuration --> Settings -->
Connectors -->
Amazon Sync --> Amazon Marketplaces`.

From there, create a new marketplace record. Enter the Marketplace ID
and select the Amazon Region for your marketplace as described in the
[Amazon Documentation for marketplace
IDs](https://developer-docs.amazon.com/amazon-shipping/docs/marketplace-ids),
and the Seller Central URL as described in the [Amazon Documentation for
seller central
URLs](https://developer-docs.amazon.com/amazon-shipping/docs/seller-central-urls).

Set the name of the record to `Amazon.<country code>` to easily retrieve
it (e.g.: `Amazon.se`). The `API Identifier`, the `Region` and the
`Seller Central URL` fields should respectively hold the
*MarketplaceId*, the selected Amazon region and the *Seller Central URL*
values from the Amazon Documentation.

Once the marketplace is saved, update the Amazon Account configuration
by going to `Sales --> Configuration --> Settings --> Connectors -->
Amazon Sync -->
Amazon Accounts`. Open the account on which you wish to use the new
marketplace, go to the `Marketplaces` tab and click on `Update available
marketplaces` (an animation should confirm the success of the
operation). Newly added marketplaces are automatically added to the list
of synchronized marketplaces. If the new marketplace is not added to the
list, it means that it is either incompatible or unavailable for your
seller account.

<div class="important">

<div class="title">

Important

</div>

As manually added marketplaces are not officially supported by Odoo,
there is no guarantee that adding one as described above will work, nor
can this be considered as a bug when contacting Odoo Support.

</div>

<div class="seealso">

\- `features` - `manage`

</div>
