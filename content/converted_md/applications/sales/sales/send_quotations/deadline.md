# Quotation deadlines

In the Odoo *Sales* application, it is possible to set deadlines on
sales quotations. Doing so encourages customers to act quickly during
sales negotiations, for they might fear for missing out on a good deal.
As well, deadlines also can also act as protection for a company in case
an order has to be fulfilled at a price that is no longer profitable for
the business.

## Expiration date deadlines

On an Odoo *Sales* quotation, add an expiration date in the `Expiration`
field located at the top of the quotation or sales order form.

To add an expiration date to a quotation, navigate to `Sales app`, and
select a desired quotation, or create a new one by clicking `Create`.

On the quotation form, click `Edit` (if modifying a pre-existing
quotation), and click the `Expiration` field. Doing so reveals a
drop-down calendar, in which the month and date can be designated as the
expiration date of the quotation.

![How to configure deadlines on Odoo
Sales.](deadline/quotation-deadlines-expiration-field.png)

Once the expiration date is selected, click `Save` to save all changes.

## Deadlines in quotation templates

The Odoo *Sales* application also makes it possible to add a deadline to
every quotation template. Whenever a specific quotation template is used
in a quote, its associated deadline is automatically applied.

To add a deadline to a quotation template, navigate to `Sales app -->
Configuration
--> Quotation Templates`, and either select the desired quotation
template to which a deadline should be added, or click `Create` to build
a new quotation template from scratch.

On the quotation template detail page, click the `Edit` button to edit
the quotation.

Then, add a specific number of days to the `Quotation expires after`
field, located beneath the quotation template name. The number of days
represents how long the quotation will be valid for, before it expires.
When done, click `Save`.

![How to use deadline in a quotation template on Odoo
Sales.](deadline/quotation-deadlines-expires-after.png)

<div class="tip">

<div class="title">

Tip

</div>

By clicking the `Customer Preview` button on a quotation, Odoo clearly
displays when that specific offer expires. As a reminder, the number of
days is the same as those mentioned in the quotation template (if a
quotation template was used for the initial quotation).

![How customers will see deadlines on Odoo
Sales.](deadline/quotation-deadlines-preview.png)

</div>

<div class="seealso">

`/applications/sales/sales/send_quotations/quote_template`

</div>
