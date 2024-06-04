# Customer accounts

Having customer accounts on an eCommerce allows customers to access all
their documents from a single place. To access their account, customers
must be **logged-in** on the eCommerce website, click on their
**username** in the top-right corner of the screen, and click
`My Account`. From there, customers can access their `quotations`,
`orders`, `invoices`, etc.

<img src="customer_accounts/account-log.png" class="align-center"
alt="Customer account log-in" />

> [!NOTE]
> Customers can only have an account if the
> `sign in/up at checkout <checkout-sign>` option allows for accounts
> creation.

> [!TIP]
> Similarly to the rest of the website, the customer account page can be
> customized with **content blocks** and other features through the
> **website builder**.

<div class="seealso">

`/applications/general/users/portal`

</div>

## Access restriction

It is possible to allow or restrict the documents to which customers
have access through the website builder. Log in your **own** account
with your Odoo database credentials, and go to `Edit --> Customize`.
From the website builder menu, enable or disable the documents customers
can have access to.

<img src="customer_accounts/account-documents.png" class="align-center"
alt="Documents to which customers have access to from their account" />

## Multi-website account

If you own multiple websites, you can make customer accounts available
across **all** websites. Then, the customer only needs one account. To
do so, go to `Website --> Configuration
--> Settings --> Privacy section`, and enable
`Shared Customer Accounts`.
