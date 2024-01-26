# Service Level Agreements (SLA)

Service Level Agreements (SLA) are commitments you make with your
customers to outline how a service is delivered. It bolsters trust
between you and your customers as it makes clear what needs to be done,
to what standard, and when.

## Create your policies

First, enable the feature on the settings of the team you would like
policies to be applied, going to `Helpdesk --> Configuration -->
Helpdesk Teams`.  
Create your policies through the team’s settings page or go to `Helpdesk
--> Configuration --> SLA Policies`.

![View of an SLA form in Odoo Helpdesk](sla/new_sla.png)

Choose to which **Team** the policy is relevant and the **Minimum
Priority** a ticket needs to have for the policy to be applied.  
**Target** is the stage a ticket needs to reach within the period
defined to satisfy the SLA. The period is based on the ticket’s creation
date, and a deadline is set on the ticket’s form once it matches an SLA
policy rule. If a ticket has more than one policy applied to it, the
closest deadline of all SLAs is the one considered.  
When a ticket has satisfied an SLA policy, the SLA tag appears in green
and the deadline field is not shown anymore.

![View of a ticket’s form emphasizing a satisfied SLA in Odoo
Helpdesk](sla/ticket_green_tag.png)

## SLA Analysis

Go to `Helpdesk --> Reporting --> SLA Status Analysis`. Apply *Filters*
and *Group by* to identify tickets that should be prioritized and keep
track of upcoming deadlines.

![View of the SLA status analysis page emphasizing the group by option
in Odoo Helpdesk](sla/sla_analysis.png)

<div class="seealso">

\- `../advanced/close_tickets`

</div>
