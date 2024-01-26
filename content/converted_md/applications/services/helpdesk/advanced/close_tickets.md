# Allow customers to close their tickets

Allowing customers to close their own tickets gives them autonomy and
minimizes misunderstandings around when an issue is considered solved or
not. This results in operational capacity for support teams, and higher
satisfaction for the customer.

## Enable ticket closing

Start by navigating to `Helpdesk --> Configuration --> Helpdesk Teams`
and choose the appropriate team. Then click `Edit` and enable `Ticket
closing` by checking the field box.

![Ticket closing feature in Odoo
Helpdesk.](close_tickets/close-ticket-settings.png)

To designate which stage the ticket migrates to once it is closed,
navigate to the ticket pipeline by going to `Helpdesk --> Overview` and
clicking `Tickets` on the team's card.

There are two options: create a new Kanban stage or work with an
existing one. For both scenarios, click the `Settings (gear)` icon next
to the stage name, select `Edit Stage`, and enable `Closing Stage`.
After checking the field box, click `Save` to finish.

<div class="note">

<div class="title">

Note

</div>

If a closing stage is not specified, by default, the ticket is moved to
the last stage in the kanban. If more than one stage is set as a closing
stage, the ticket is placed in the first closing stage column.

</div>

With the ticket closing settings now complete, customers can now view
the option to `Close this ticket` when they log into their portal.

![Customer view of ticket closing in Odoo
Helpdesk.](close_tickets/customer-view-close-ticket.png)

## Get reports on tickets closed by customers

To analyze the tickets that have been closed by customers, go to
`Helpdesk -->
Reporting --> Tickets`. Then, click on the `Filters` menu and choose
`Add
Custom filter`. Next, set the custom filter parameters to `Closed by
partner` and `is true`. Finally, click `Apply`.

![Filter for tickets closed by customers on Odoo Helpdesk's reporting
page.](close_tickets/closed-by-search-filter.png)
