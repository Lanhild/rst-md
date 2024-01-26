# Reconciliation models

Once the bank statements are correctly imported, it is essential to
reconcile the records properly and ensure all **journal entries** are
balanced and in agreement. To ease and speed up the reconciliation
process, you can configure **reconciliation models**, which are
particularly useful with **recurrent entries** such as bank fees.

<div class="note">

<div class="title">

Note

</div>

Reconciliation models are also useful when handling *Cash Discounts*.
Please refer to `the cash discounts
<../../receivables/customer_invoices/cash_discounts>` for more
information.

</div>

## Types of reconciliation models

There are three types of reconciliation models:

1.  `Write-off button <reconciliation_models_button>`
2.  `Suggestion of counterpart values
    <reconciliation_models_suggestion>`
3.  `Match existing invoices/bills <reconciliation_models_match>`

### Manually create a write-off on clicked button

When reconciling an entry with an *open balance*, you can use the
buttons available under the `Manual Operations` tab to pre-fill all the
values automatically before validating the reconciliation. Each button
corresponds to a reconciliation model.

![Example of a reconciliation model with a write-off button in Odoo
Accounting.](reconciliation_models/reconciliation_models_button.png)

### Suggest counterpart values

This type of reconciliation model immediately suggests counterpart
values when selecting an entry, which then only needs to be validated.
This automation is based on a set of rules defined in the reconciliation
model.

![Example of a reconciliation model that suggests counterpart values in
Odoo
Accounting.](reconciliation_models/reconciliation_models_suggestion.png)

### Match existing invoices/bills

This type of reconciliation model automatically selects the right
customer invoice or vendor bill that matches the payment. All that is
left to do is to validate the entry. This automation is based on a set
of rules defined in the reconciliation model.

![Example of a reconciliation model that matches existing invoices and
bills automatically&#10;in Odoo
Accounting.](reconciliation_models/reconciliation_models_match.png)

## Configuration

To manage or create new **reconciliation models**, go to `Accounting app
-->
Configuration --> Banks: Reconciliation Models`. Alternatively, you can
also open this menu from `Accounting app --> Bank --> Drop-down menu (⋮)
--> Reconciliation Models`.

![Open the reconciliation model menu from the overview dashboard in Odoo
Accounting.](reconciliation_models/reconciliation_models_overview.png)

<div class="important">

<div class="title">

Important

</div>

The first entry, `Invoices Matching Rule`, is responsible for the
current matching of invoices and bills. Therefore, it is advised to
leave it at the top of the list and not delete it.

</div>

Open the model you want to modify or click on `Create` to create a new
one, and fill out the form.

### Type

See `types of reconciliation models <reconciliation_models_types>` for
an explanation about the different types of reconciliation models.

<div class="note">

<div class="title">

Note

</div>

If the *Documents* application is installed on your database, an
additional `Activity type` field appears when `To Check` is ticked.
Selecting the value `Reconciliation request` implies that whenever you
use this model, a `Request Document` window pops up to request a
document from the user.

</div>

### Conditions on bank statement line

Define here all the conditions that should be fulfilled for the
reconciliation model to be applied. Depending on the `Type` of model you
choose, different options are available.

<div class="important">

<div class="title">

Important

</div>

If a record matches with several reconciliation models, the first one in
the list is applied. Models can be rearranged by dragging and dropping
the handle next to their name.

</div>

![Conditions for the reconciliation model to be applied in Odoo
Accounting.](reconciliation_models/reconciliation_models_conditions.png)

### Counterpart values

This section comprises the values that are applied by the reconciliation
model. If the value to reconcile needs to be written-off in two separate
accounts, click on `Add a second line` a second time.

![Counterparts values of a reconciliation model in Odoo
Accounting.](reconciliation_models/reconciliation_models_counterparts.png)

<div class="seealso">

  - `use_cases`
  - `../bank_synchronization`
  - `../../receivables/customer_invoices/cash_discounts`

</div>
