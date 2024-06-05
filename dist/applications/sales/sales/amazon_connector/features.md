# Amazon Connector features

The *Amazon Connector* synchronizes orders between Amazon and Konvergo ERP,
which considerably reduces the amount of time spent manually entering
Amazon orders (from the Amazon Seller account) into Konvergo ERP. It also allows
users to accurately keep track of Amazon sales in Konvergo ERP.

## Supported features

The Amazon Connector is able to:

- Synchronize (Amazon to Konvergo ERP) all confirmed orders (both FBA and FBM),
  and their order items, which include:
  - product name, description, and quantity
  - shipping costs for the product
  - gift wrapping charges
- Create any missing partner related to an order in Konvergo ERP (contact types
  supported: contact and delivery address).
- Notify Amazon of confirmed shipment in Konvergo ERP (FBM) to get paid.
- Support multiple seller accounts.
- Support multiple marketplaces per seller account.

The following table lists capabilities provided by Konvergo ERP when using the
Amazon Connector:

|                            | Fulfilled By Amazon (FBA)                                                         | Fulfilled By Merchant (FBM)                                                                                                                                            |
|----------------------------|-----------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Orders**                 | Synchronize shipped and canceled orders.                                          | Synchronize unshipped and canceled orders.                                                                                                                             |
| **Shipping**               | Shipping cost is computed by Amazon, and included in the synchronized order.      | Shipping cost is computed by Amazon and included in the synchronized orders.                                                                                           |
|                            | Shipping done by Amazon.                                                          | A delivery order is automatically created in Konvergo ERP for each new order. Once it has been processed in Konvergo ERP, the status is then synchronized in Amazon.                   |
| **Gift Wrapping**          | Handled by Amazon.                                                                | Cost is computed by Amazon, and included in the synchronized order. Gift message is added on a line of the order and on the delivery order. Then it is up to the user. |
| **Stock Management**       | Managed by Amazon, and synchronized with a virtual location to follow it in Konvergo ERP. | Managed in Konvergo ERP Inventory app, and synchronized with Amazon.                                                                                                           |
| **Delivery Notifications** | Handled by Amazon.                                                                | Send by Amazon, based on delivery status synchronized from Konvergo ERP.                                                                                                       |

> [!NOTE]
> The Amazon Connector is designed to synchronize the data of sales
> orders. Other actions, such as downloading monthly fees reports,
> handling disputes, or issuing refunds, **must** be managed from the
> *Amazon Seller Central*, as usual.

> [!WARNING]
> As of February 19, 2024, in North American marketplaces,
> `FBA (Fulfilled by Amazon)` orders created with the *Amazon
> Connector*, do not get the customer's name passed onto the
> sales/delivery order in Konvergo ERP. This is due to the fact that Amazon now
> calculates, and remits, sales tax on behalf of sellers. In other
> words, personally identifiable customer information is not transmitted
> to the seller any longer, after a `FBA (Fulfilled by Amazon)` order.

## Supported marketplaces

If a marketplace is not listed in your Amazon marketplaces, it's
possible to `add a new
marketplace <amazon/add-new-marketplace>`.

| **North America region** |               |
|--------------------------|---------------|
| Canada                   | Amazon.ca     |
| Mexico                   | Amazon.com.mx |
| US                       | Amazon.com    |

| **Europe region** |              |
|-------------------|--------------|
| Germany           | Amazon.de    |
| Spain             | Amazon.es    |
| France            | Amazon.fr    |
| UK                | Amazon.co.uk |
| Italy             | Amazon.it    |
| Netherlands       | Amazon.nl    |

<div class="seealso">

\- `setup` - `manage`

</div>
