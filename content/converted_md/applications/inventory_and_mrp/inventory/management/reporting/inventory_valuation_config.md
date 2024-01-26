# Inventory valuation configuration

<div id="inventory/inventory_valuation_config">

All of a company's stock on-hand contributes to the valuation of its
inventory. That value should be reflected in the company's accounting
records to accurately show the value of the company and all of its
assets.

</div>

By default, Odoo uses a periodic inventory valuation (also known as
manual inventory valuation). This method implies that the accounting
team posts journal entries based on the physical inventory of the
company, and that warehouse employees take the time to count the stock.
In Odoo, this method is reflected inside each product category, where
the `Costing Method` field will be set to
<span class="title-ref">Standard Price</span> by default, and the
`Inventory Valuation` field will be set to
<span class="title-ref">Manual</span>.

![The Inventory Valuation fields are located on the Product Categories
form.](inventory_valuation_config/inventory-valuation-fields.png)

Alternatively, automated inventory valuation is an integrated valuation
method that updates the inventory value in real-time by creating journal
entries whenever there are stock moves initiated between locations in a
company's inventory.

<div class="note">

<div class="title">

Note

</div>

Automated inventory valuation is a method recommended for expert
accountants, given the extra steps involved in journal entry
configuration. Even after the initial setup, the method will need to be
periodically checked to ensure accuracy, and adjustments may be needed
on an ongoing basis depending on the needs and priorities of the
business.

</div>

## Types of accounting

Accounting entries will depend on the accounting mode: *Continental* or
*Anglo-Saxon*.

<div class="tip">

<div class="title">

Tip

</div>

Verify the accounting mode by activating the `developer-mode` and
navigating to `Accounting --> Configuration --> Settings`.

</div>

In *Anglo-Saxon* accounting, the costs of goods sold (COGS) are reported
when products are sold or delivered. This means that the cost of a good
is only recorded as an expense when a customer is invoiced for a
product. *Interim Stock Accounts* are used for the input and output
accounts, and are both *Asset Accounts* in the balance sheet.

In *Continental* accounting, the cost of a good is reported as soon as a
product is received into stock. Additionally, a single *Expense* account
is used for both input and output accounts in the balance sheet.

## Costing methods

Below are the three costing methods that can be used in Odoo for
inventory valuation.

  - **Standard Price**: is the default costing method in Odoo. The cost
    of the product is manually defined on the product form, and this
    cost is used to compute the valuation. Even if the purchase price on
    a purchase order differs, the valuation will still use the cost
    defined on the product form.
  - **Average Cost (AVCO)**: calculates the valuation of a product based
    on the average cost of that product, divided by the total number of
    available stock on-hand. With this costing method, inventory
    valuation is *dynamic*, and constantly adjusts based on the purchase
    price of products.
  - **First In First Out (FIFO)**: tracks the costs of incoming and
    outgoing items in real-time and uses the real price of the products
    to change the valuation. The oldest purchase price is used as the
    cost for the next good sold until an entire lot of that product is
    sold. When the next inventory lot moves up in the queue, an updated
    product cost is used based on the valuation of that specific lot.
    This method is arguably the most accurate inventory valuation method
    for a variety of reasons, however, it's highly sensitive to input
    data and human error.

<div class="warning">

<div class="title">

Warning

</div>

Changing the costing method greatly impacts inventory valuation. It's
highly recommended to consult an accountant first before making any
adjustments here.

</div>

## Configure automated inventory valuation in Odoo

Make changes to inventory valuation options by navigating to `Inventory
-->
Configuration --> Product Categories`, and choose the
category/categories where the automated valuation method should apply.

<div class="note">

<div class="title">

Note

</div>

It is possible to use different valuation settings for different product
categories.

</div>

Under the `Inventory Valuation` heading are two labels: `Costing Method`
and `Inventory Valuation`. Pick the desired `Costing Method` using the
drop-down menu (e.g. `Standard`, `Average Cost (AVCO)`, or `First In
First Out
(FIFO)`) and switch the `Inventory Valuation` to `Automated`.

<div class="seealso">

`Using the inventory valuation<inventory/reporting/using_inventory_val>`

</div>

<div class="note">

<div class="title">

Note

</div>

When choosing `Average Cost (AVCO)` as the `Costing Method`, changing
the numerical value in the `Cost` field for products in the respective
product category creates a new record in the *Inventory Valuation*
report to adjust the value of the product. The `Cost` amount will then
automatically update based on the average purchase price both of
inventory on hand and the costs accumulated from validated purchase
orders.

</div>

When the `Costing Method` is changed, products already in stock that
were using the `Standard` costing method **do not** change value;
rather, the existing units keep their value, and any product moves from
then on affect the average cost, and the cost of the product will
change. If the value in the `Cost` field on a product form is changed
manually, Odoo will generate a corresponding record in the *Inventory
Valuation* report.

On the same screen, the `Account Stock Properties` fields will appear,
as they are now required fields given the change to automated inventory
valuation. These accounts are defined as follows:

  - `Stock Valuation Account`: when automated inventory valuation is
    enabled on a product, this account will hold the current value of
    the products.
  - `Stock Input Account`: counterpart journal items for all incoming
    stock moves will be posted in this account, unless there is a
    specific valuation account set on the source location. This is the
    default value for all products in a given category, and can also be
    set directly on each product.
  - `Stock Output Account`: counterpart journal items for all outgoing
    stock moves will be posted in this account, unless there is a
    specific valuation account set on the destination location. This is
    the default value for all products in a given category, and can also
    be set directly on each product.

## Access reporting data generated by inventory valuation

To start, go to `Accounting --> Reporting --> Balance Sheet`. At the top
of the dashboard, change the `As of` field value to `Today`, and adjust
the filtering `Options` to `Unfold All` in order to see all of the
latest data displayed, all at once.

Under the parent `Current Assets` line item, look for the nested `Stock
Valuation Account` line item, where the total valuation of all of the
inventory on hand is displayed.

Access more specific information with the `Stock Valuation Account`
drop-down menu, by selecting either the `General Ledger` to see an
itemized view of all of the journal entries, or by selecting `Journal
Items` to review all of the individualized journal entries that were
submitted to the account. As well, annotations to the `Balance Sheet`
can be added by choosing `Annotate`, filling in the text box, and
clicking `Save`.

![See the full inventory valuation breakdown in Odoo Accounting
app.](inventory_valuation_config/stock-valuation-breakdown-in-accounting.png)
