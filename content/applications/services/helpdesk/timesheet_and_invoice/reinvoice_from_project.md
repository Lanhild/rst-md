# Invoice Time Spent on Tickets (Postpaid Support Services)

The `Timesheet on Ticket` integration provides more control and
transparency over how clients are charged, and what they're specifically
billed for.

In Odoo, the Helpdesk agent can use the ticket to record timesheets.
Once a ticket is solved, the client can be billed for the time spent on
the ticket. Odoo will pull from the ticket's timesheet to accurately
bill the client.

## Configuration

To turn on the `Timesheet on Ticket` feature, go to `Helpdesk -->
Configuration --> Helpdesk Teams`, select a Helpdesk team, and then,
click `Edit`. Next, enable the options `Timesheet on Ticket` and `Time
Reinvoicing`. Then, click `Save` to apply these changes to the Helpdesk
team settings.

Once the `Timesheet on Ticket` feature is enabled, a `Project` drop-down
option will appear below `Timesheet on Ticket`. The `Project` drop-down
option will automatically be set to a Project that Odoo created for the
Helpdesk team. The tickets' timesheets will be stored in the selected
Project.

## Create a sales order

After a ticket comes into the pipeline, go to `Sales --> Create`. Then,
add the customer from the ticket to the `Customer` field in the new
quotation. In the `Order Lines` tab, create or select a product to
charge the customer for the time spent on their Helpdesk ticket.

If creating a new product from the sales order form, first give the
product a name by typing it in the `Product` column. Then, click `Create
and edit`.

First, in the `General Information` tab, set the `Product Type` to
`Service` and the `Sales Price` to the Helpdesk agent's service rate.
Then, in the `Sales` tab, set the `Service Invoicing Policy` to
`Timesheets on
tasks`. Finally, click `Save` to create the new product and add it to
the quotation.

Once the product is added, click `Confirm` to turn the quotation into a
sales order.

![Create a sales order and add a
product.](reinvoice_from_project/create-sales-order.png)

## Record a timesheet

To record a timesheet, jump back to the Helpdesk ticket by going to the
Helpdesk dashboard and clicking `Tickets` on the team's card (or by
going to the Projects dashboard and clicking `Tickets` on the project
card). Then, click `Edit` and use the `Timesheets` tab to record the
time spent on the ticket.

![Record time spent on a
ticket.](reinvoice_from_project/record-timesheet-ticket.png)

<div class="tip">

<div class="title">

Tip

</div>

The ticket's timesheets can be recorded before or after the sales order
is made, the order doesn't matter.

</div>

## Link the Helpdesk ticket to the SO

Once a timesheet is recorded, the `Sales Order Item` field will appear
on the ticket form. To link the `SO (Sales Order)` to the ticket, start
on the ticket form and click `Edit`. Next, select the `SO (Sales Order)`
that was created earlier from the drop-down menu. Odoo will
automatically filter the sales orders to only show sales orders that are
connected to the ticket's customer. Lastly, click `Save` to connect the
ticket and the `SO (Sales Order)`.

![Link the SO item to the
ticket.](reinvoice_from_project/link-soi-to-ticket.png)

## Modify billing rates

If a timesheet entry is recorded, but the agent does not want to bill
the client for that time, go to the `Timesheets` tab and toggle on the
visibility of the `Sales Order Item` column. When filling out the
information for the timesheet entry, make sure to leave the non-billable
timesheet entry's `Sales Order Item` field blank.

If the agent wants to charge a different rate for a timesheet entry,
first, add a new product to the connected `SO (Sales Order)` priced at
the new rate. Then, select the new product in the timesheet entry's
`Sales Order Item` field.

## Create the invoice

When the Helpdesk ticket is completed and the client is ready to be
billed for time, begin by clicking the `Sales Order` smart button on the
ticket form to navigate to the `SO
(Sales Order)`. The `Delivered` column should match the number of hours
recorded on the ticket's timesheet. After checking and filling out the
relevant information, click `Create Invoice` to bill the client for the
time spent on the ticket. Odoo will automatically generate an invoice to
send to the client and the Helpdesk ticket can officially be closed.

<div class="seealso">

\- `invoice_time` -
`/applications/inventory_and_mrp/inventory/management/products/uom`

</div>
