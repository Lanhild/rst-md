# Assign leads based on scoring

*Lead Scoring* lets you rank and prioritize leads based on selected
criteria. A higher score indicates that a lead is more likely to bring
value to your company.

For example, if customers from Canada tend to be more likely to purchase
your products, you can assign them a higher score than customers from
other countries.

## Configuration

To use scoring, go to `Apps`, remove the `Apps` filter, search for `Lead
Scoring` and then install the module.

![Lead Scoring module
installation](lead_scoring/lead-scoring-module.png)

## Create scoring rules

To manage scoring rules, go to `CRM --> Leads --> Scoring Rules`.

Customize your rules to fit the needs of your business, and add as many
criteria as you want.

![Score Rule example](lead_scoring/scoring-example.png)

Every hour, Odoo automatically assigns scores to new leads according to
your configured rules.

![Scoring section on a lead](lead_scoring/scoring-section-on-lead.png)

## Assign leads

Odoo can also assign leads to specific teams based on configured rules.
To configure assignment rules, go to the individual Sales Team's
configuration page via `CRM --> Leads -->
Team Assignment` or `CRM --> Configuration --> Sales Teams`, and apply a
specific Domain to each team. The Domain can include lead scores.

![Team Assignments using domains](lead_scoring/team-assignation.png)

Assign leads to specific salespeople using further refined Domains at
`CRM --> Leads
--> Leads Assignment`.

![Lead Assignments](lead_scoring/lead-assignment-filters.png)

Odoo automatically assigns new leads to teams/salespeople once per day.

## Evaluate and use the unassigned leads

Not all leads will fall into your set Domains and get assigned
automatically by Odoo.

To view your unassigned leads, go to `CRM --> Leads --> Leads` and
select the Unassigned filter.

![Filtering for unassigned leads](lead_scoring/unassigned-filter.png)

<div class="note">

<div class="title">

Note

</div>

You can also find unassigned leads and create re-engagement campaigns
using the `Email
Marketing` or `Marketing Automation` apps.

</div>
