# Amazon Connector Features

The **Amazon Connector** synchronizes the orders between Amazon and your
Odoo database, which reduces considerably the amount of time spent on
your Amazon Seller Central dashboard, making your daily routine a lot
easier.

## Supported Features

The connector is able to:

  - Synchronize (Amazon to Odoo) all confirmed orders (both FBA and FBM)
    and their order items which include:
      - the product’s name, description and quantity
      - the shipping costs for the product
      - the gift wrapping charges
  - Create on Odoo any missing partner related to an order (contact
    types supported: contact and delivery).
  - Notify Amazon of a shipping confirmed on Odoo (FBM) in order to get
    paid.
  - Support multiple seller accounts.
  - Support multiple marketplaces per seller account.

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 32%" />
<col style="width: 42%" />
</colgroup>
<thead>
<tr class="header">
<th></th>
<th>Fulfilled By Amazon (FBA)</th>
<th>Fulfilled By Merchant (FBM)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Orders</strong></td>
<td>Synchronize shipped and canceled orders</td>
<td>Synchronize unshipped and canceled orders</td>
</tr>
<tr class="even">
<td><strong>Shipping</strong></td>
<td><ul>
<li>Charges</li>
</ul></td>
<td><ul>
<li>Charges</li>
<li>Delivery created</li>
</ul></td>
</tr>
<tr class="odd">
<td><strong>Gift Wrapping</strong></td>
<td>Handled by Amazon</td>
<td><ul>
<li>Gift wrapping charges</li>
<li>Gift message</li>
</ul></td>
</tr>
<tr class="even">
<td><strong>Stock Management</strong></td>
<td>One stock move created per sales order item</td>
<td>Handled by the delivery</td>
</tr>
<tr class="odd">
<td><strong>Confirmation</strong></td>
<td>Handled by Amazon</td>
<td>Notify Amazon when confirming delivery</td>
</tr>
</tbody>
</table>

<div class="note">

<div class="title">

Note

</div>

The connector is designed to synchronize orders' data as detailed above.
Other actions, such as downloading monthly fees reports, handling
disputes, or issuing refunds must be managed from Amazon Seller Central,
as usual.

</div>

## Supported Marketplaces

The Amazon Connector currently supports 9 marketplaces. If a marketplace
is not listed below, it may be possible for you to `add it as an
unsupported
marketplace <amazon/add-unsupported-marketplace>`.

\+-------------------------------+ | **North America region** |
+===============+===============+ | Canada | Amazon.ca |
+---------------+---------------+ | Mexico | Amazon.com.mx |
+---------------+---------------+ | US | Amazon.com |
+---------------+---------------+

\+-------------------------------+ | **Europe region** |
+===============+===============+ | Germany | Amazon.de |
+---------------+---------------+ | Spain | Amazon.es |
+---------------+---------------+ | France | Amazon.fr |
+---------------+---------------+ | UK | Amazon.co.uk |
+---------------+---------------+ | Italy | Amazon.it |
+---------------+---------------+ | Netherlands | Amazon.nl |
+---------------+---------------+

<div class="seealso">

\- `setup` - `manage`

</div>
