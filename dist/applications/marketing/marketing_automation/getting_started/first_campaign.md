# Marketing automation campaigns

The Odoo *Marketing Automation* app automates a variety of marketing
tasks by combining specific rules and filters to generate timed actions.
Instead of manually having to build each stage of a campaign (like a
series of timed massmails), the *Marketing Automation* app allows
marketers to build the entire campaign, and all of its stages, in one
place---on one dashboard.

## Campaign configuration

To create a new automated marketing campaign, navigate to
`Marketing Automation app
--> New` to reveal a blank campaign form.

<img src="first_campaign/blank-marketing-campaign-form.png"
class="align-center"
alt="A blank marketing automation campaign form in Odoo Marketing Automation application." />

After entering a name for the marketing campaign, configure the target
audience in the remaining fields.

A target audience can be configured by entering specific criteria for
Odoo to use when determining to whom this marketing automation campaign
should be sent.

In the `Target` field, use the drop-down menu to choose which model the
target audience filters should be based on (e.g. `Contact`,
`Lead/Opportunity`, `Sales Order`, etc.).

Select `Search More...` from the drop-down menu to reveal a
`Search: Target` pop-up window containing all of the available targeting
options.

Once a `Target` is selected, there's a `Unicity based on` field. This
field is used to avoid duplicates based on the model chosen in the
`Target` field.

<div class="example">

If `Customers` is chosen as the `Target`, select `Email` in the
`Unicity based on` field so Odoo only processes one record for each
customer email address.

</div>

Select `Search More...` from the `Unicity based on` drop-down menu to
reveal all available options in a pop-up window.

Last on the campaign form is the `Filter` field. This is where more
specific targeting options can be layered into the campaign to further
narrow the number and type of recipients that receive the marketing
automation material.

If left alone, the `Filter` field reads: `Match all records`. That means
Odoo uses the `Target` and `Unicity based on` fields to determine who
the recipients will be. The number of recipients is represented beneath
as `record(s)`.

### Campaign filter rules

To add a more specific filter to a marketing automation campaign, click
the `Add
condition` button in the `Filter` field. Doing so reveals a series of
other configurable filter rule fields.

In the rule fields, customizable equations can be configured for Odoo to
use when filtering who to include or exclude in this specific marketing
campaign.

<img src="first_campaign/filter-node-equation-fields.png"
class="align-center"
alt="How the filter rule equation fields look in Odoo Marketing Automation campaigns." />

> [!NOTE]
> `Records` refer to contacts in the system that fit the specified
> criteria for a campaign.

Also, once `Add condition` is clicked, the ability to
`Save as Favorite Filter` becomes available on the campaign form.

There is also the option to match records with `all` or `any` of the
rules configured in the `Filter` field.

To choose either of those options, click `all` from the middle of the
sentence "`Match records with all of the following rules`" to reveal a
drop-down menu with those options.

<img src="first_campaign/match-all-any-rules-drop-down.png"
class="align-center"
alt="Match records with all or any of the rules in Filter field for marketing campaigns." />

When the first field of the rule equation is clicked, a nested drop-down
menu of options appears on the screen where specific criteria is chosen
based on needs of the campaign.

The remaining fields on the rule equation further define the criteria,
which is used to determine which records in the database to include or
exclude in the execution of the campaign.

To add another rule, either click the `➕ (plus sign)` icon to the right
of the filtering rule, or click `New Rule` beneath the rule equation
fields. When either are clicked, a new series of rule fields appears.

To add a branch of multiple rules at the same time, click the `branch`
icon, located to the right of the `➕ (plus sign)` icon. When clicked,
two additional sub-rule equation fields appear beneath the initial rule.

<img src="first_campaign/rule-branch-filter-sample.png"
class="align-center"
alt="Sample of how the rule branches look in the filter section of a marketing campaign." />

There is also the option to have the filter apply to `any` or `all` of
the configured branch rules.

For further information on marketing automation campaign filter
configuration, refer to `this
documentation page <target_audience>`.

<div class="seealso">

\- `workflow_activities` - `testing_running`

</div>
