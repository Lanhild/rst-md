  - show-content

  - show-toc

# Point of Sale

With **Odoo Point of Sale**, run your shops and restaurants easily. The
app works on any device with a web browser, even if you are temporarily
offline. Product moves are automatically registered in your stock, you
get real-time statistics, and your data is consolidated across all
shops.

<div class="seealso">

\- [Odoo Tutorials: Point of Sale
Tutorials](https://www.odoo.com/slides/point-of-sale-28) - `IoT Boxes
Documentations </applications/productivity/iot>`

</div>

## Start a session

From the **POS dashboard**, click `New Session` to start a POS session,
or `Resume` if the session was already open.

<div class="note">

<div class="title">

Note

</div>

`Multiple users <point_of_sale/employee_login>` can be logged into the
same session at the same time. However, the session can only be opened
once on the same browser.

</div>

## Sell products

Click on products to add them to the cart. To change the **quantity**,
click `Qty` and enter the number of products using the keypad. To add a
**discount** or modify the product **price**, click respectively `Disc`
or `Price` and enter the amounts.

Once an order is completed, proceed to checkout by clicking `Payment`.
Select the **payment method**, enter the received amount, and click
`Validate`. Click `New Order` to move on to the next customer.

![POS session interface.](point_of_sale/pos-interface.png)

<div class="tip">

<div class="title">

Tip

</div>

\- You can use both <span class="title-ref">,</span> and
<span class="title-ref">.</span> on your keyboard as decimal separators.
- **Cash** is selected by default if you enter the amount without
choosing a payment method.

</div>

## Set customers

You can create and set customers from an `open POS session
<pos/session-start>`. Registering your customer is necessary to `collect
their loyalty points and grant them rewards
<point_of_sale/pricing/loyalty>`, automatically apply the `attributed
pricelist
<point_of_sale/pricing/pricelists>`, or `generate and print an invoice
<receipts-invoices/invoices>`.

To access the list of customers, click `Customer` on the POS interface.
Then, select a customer or create a new one by clicking `Create`,
completing the form, and saving. Lastly, click `Set Customer` to set the
selected customer.

## Return and refund products

To return a product and make a refund,

1.  from the **POS dashboard**, **open a session** and select the
    returned product;
2.  click `Qty` and `+/-` to enter the quantity of returned products;
3.  once the order is completed, click `Payment` to proceed to the
    refund;
4.  click `Validate` and `New Order` to move on to the next customer.

## Close the POS session

To close your session,

1.  go back to the POS dashboard by clicking `Close` and `Confirm` in
    the upper right corner of your screen;
2.  then, click `Close` and proceed to the **closing control**;
3.  click the `Payments` smart button to know what amount of cash should
    be in your cash drawer;
4.  once the control is done, click `Close session & post entries`;
5.  the status goes automatically from `In Progress` to `Closed &
    Posted`.

![How to close a POS session.](point_of_sale/close-pos-session.png)

<div class="tip">

<div class="title">

Tip

</div>

\- It is strongly advised to close your POS session at the end of each
day. - To look at all your previous sessions, go to `Point of Sale -->
Orders -->
Sessions`.

</div>

<div class="toctree" data-titlesonly="">

point\_of\_sale/employee\_login point\_of\_sale/receipts\_invoices
point\_of\_sale/configuration point\_of\_sale/shop
point\_of\_sale/restaurant point\_of\_sale/pricing
point\_of\_sale/payment\_methods point\_of\_sale/reporting

</div>
