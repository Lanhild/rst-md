# Quotation templates

In Odoo *Sales*, salespeople have the ability to create reusable
quotation templates for common product or service offerings that the
business offers. By using these templates, quotations can be tailored
and sent to customers at a much faster pace, without having to create
new quotations from scratch every time a sales negotiation occurs.

## Configuration

Begin by activating the setting in `Sales app --> Configuration -->
Settings`, and scroll to the `Quotations & Orders` heading.

In that section, check the box beside the `Quotation Templates` option.
Doing so reveals a new `Default Template` field, in which a default
quotation template can be chosen from a drop-down menu.

![How to enable quotation templates on Odoo
Sales.](quote_template/quotations-templates-setting.png)

Also, upon activating the `Quotation Template` feature, an internal `➡️
Quotation Templates` link appears beneath the `Default Template` field.
Clicking that link reveals the `Quotation Templates` page, from which
templates can be created, viewed, and edited.

<div class="tip">

<div class="title">

Tip

</div>

Consider activating the `Quotation Builder` option in the `Settings`, as
well, which is located in the right column beside the `Quotation
Templates` option. This feature aides in the design and customization of
quotation templates.

**Note:** enabling this feature also automatically installs the Odoo
*Website* application.

</div>

![How to enable quotation builder on Odoo
Sales.](quote_template/quotations-builder-setting.png)

Before leaving the `Settings` page, don't forget to click the `Save`
button to activate the feature(s) and save all changes made during the
session.

## Create quotation templates

Click the `Quotation Templates` link on the `Settings` page, or navigate
to `Sales app --> Configuration --> Quotation Templates`. Both options
reveal the `Quotation Templates` page, where quotation templates can be
created, viewed, and edited.

To create a new quotation template, click the `Create` button, located
in the upper-left corner. Doing so reveals a blank quotation template
form that can be customized in a number of ways.

![Create a new quotation template on Odoo
Sales.](quote_template/blank-quotation-template.png)

Start by entering a name for the template in the `Quotation Template`
field. Then, in the `Quotation expires after` field, designate how many
days the quotation template will remain valid for, or leave the field on
the default <span class="title-ref">0</span> to keep the template valid
indefinitely.

In the `Company` field, designate to which company this quotation
template applies, if working in a multi-company environment.

Beneath those fields are three tabs: `Lines`, `Optional Products`,
`Confirmation`.

In the `Lines` tab, products can be added to the quotation template by
clicking `Add a product`, organized by clicking
<span class="title-ref">Add a section</span> (and dragging/dropping
section headers accordingly), and further explained with discretionary
information (such as warranty details, terms, etc.) by clicking `Add a
note`.

In the `Optional Products` tab, `Add a line` for each compatible
cross-selling product related to the original items in the `Lines` tab,
if applicable. The products added here ideally compliment the original
offering as added value for the prospective buyer.

Lastly, in the `Confirmation` tab, enable options, as needed, to require
an `Online Signature` and/or an `Online Payment`, which each allow
buyers to confirm orders automatically using the web portal view after
the required action is taken.

There's also an option to add a `Confirmation Mail` to the quotation
template, as well -meaning whenever this template is used, and an order
is confirmed, an email is sent to the customer informing them that their
order has been confirmed.

![Allow customers to sign electronically or to pay online on Odoo
Sales.](quote_template/quotations-templates-confirmation-tab.png)

## Design quotation templates

<div class="note">

<div class="title">

Note

</div>

The following section on designing quotation templates only applies to
databases that have the *Quotation Builder* feature enabled, which is
accessible by following the `configuration
steps above <sales/send_quotations/templates>`.

</div>

In the upper-left corner of the quotation template form, there's a
`Design Template` button. When clicked, Odoo reveals a preview of the
quotation template, as it will appear on the front-end of the website,
with a `Template Header` specifying that this content will appear on all
quotations using this specific template.

To edit the content, look, and overall design of the quotation template,
click the `Edit` button in the upper-right corner. Doing so reveals a
variety of design elements and feature-filled building blocks.

![Design quotation template on Odoo
Sales.](quote_template/design-quotation-edit.png)

Drag and drop any desired building blocks onto the blank quotation
template, and proceed to further customize the content to fit any
business need. When all blocks and customizations are complete, click
the `Save` button to put those configurations into place.

![Drag and drop building blocks to create your quotation template on
Odoo Sales.](quote_template/quotations-building-blocks.png)

## Use quotation templates

When creating a quotation (`Sales app --> Create`), choose a
preconfigured template in the `Quotation Template` field drop-down menu.

![Select a specific template on Odoo
Sales.](quote_template/quotations-templates-field.png)

To view what the customer will see, click the `Customer Preview` smart
button to see how the quotation template will look on the front-end of
the website.

<div class="seealso">

\- `/applications/sales/sales/send_quotations/get_signature_to_validate`
- `/applications/sales/sales/send_quotations/get_paid_to_validate`

</div>
