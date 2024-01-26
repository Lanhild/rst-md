# Create a quotation using subscription products

Selling a digital product or service gives instant gratification.
However, you have to work hard for a new customer to make a purchase. It
costs time and money. By convincing customers to sign up for a
subscription, you maximize your income and streamline your cash flow.
You can sell any type of product or service through a subscription
business model.

<div align="center" style="color:#AD5E99; font-size: 2rem ;margin: 20px 0"> <b>The only limit is
your imagination.</b> </div>

Here is a scenario using **Odoo Subscriptions** to create a quotation
including subscription products.

## Create your first quotation

Before creating your first quotation, be sure to check out our
documentation on how to create and manage your own `Subscription
templates <../../subscriptions/configuration/subscription_templates>`
and on how to add `Subscription products
<../../subscriptions/configuration/subscription_products>` to your
templates.

<div class="important">

<div class="title">

Important

</div>

These steps are **mandatory** to make a basic sales flow using **Odoo
Subscriptions**.

</div>

Go to **Odoo Sales** and create a new quotation. Then, choose a customer
and add a product. Be careful to select a product that you previously
configured as a *Subscription product*.

![View of a quotation form in Odoo
Sales](create_a_quotation/create-a-quotation-using-subscription-products.png)

When your quotation is ready, you have the possibility to send it to
your customers or to confirm it. It is better to first *Send by email*
the quotation to your customers to have their confirmation and, then,
*Confirm* it in **Odoo Sales**. By clicking on *Customer preview*, you
have an idea of what your customers will see when receiving your
quotation.

![Customer preview of a quotation form in Odoo
Sales](create_a_quotation/customer-preview-of-a-quotation-using-subscription-products.png)

From there, your customers have three choices: *Sign & Pay* the
quotation, give you a *Feedback* or *Reject* the quotation. It appears
that they are very happy and accept the option *Sign & Pay*. Then, they
have to validate the order with a signature and by choosing a payment
method. When it is done, you can check out the quotation in **Odoo
Sales** and *Confirm* it.

## Manage your subscriptions from your SO

Once confirmed, the quotation becomes a sales order and a new button
appears, *Subscriptions*. Indeed, a subscription is automatically
created.

![Quotation form in Odoo Sales with a button
"Subscriptions"](create_a_quotation/manage-your-subscriptions-from-your-sales-order.png)

By clicking on the *Subscriptions* button, you can see that the status
of the subscription is *In progress*. From there, you will have three
options: `Renew <../../subscriptions/sales_flow/renewals>`, `Close
<../../subscriptions/sales_flow/closing>` or `Upsell
<../../subscriptions/sales_flow/upselling>` your subscription.

![Use of the intelligent button "Subscriptions" in Odoo
Sales](create_a_quotation/use-of-the-subscriptions-button-in-odoo-sales.png)

In the top-right corner, you can see the status of the subscription.
When a subscription is new and created from **Odoo Subscriptions**, the
status is *Draft*. When a sales order has been validated, the status is
*In progress*. Finally, when a customer decides to close his
subscription, the status becomes *Closed*.

<div class="seealso">

\- `../../subscriptions/configuration/subscription_templates` -
`../../subscriptions/configuration/subscription_products` -
`../../subscriptions/sales_flow/renewals` -
`../../subscriptions/sales_flow/closing` -
`../../subscriptions/sales_flow/upselling`

</div>
