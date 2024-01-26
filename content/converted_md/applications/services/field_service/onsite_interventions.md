# Onsite interventions planning

## From a sales order

Allowing your sales team to open onsite interventions creates a seamless
experience for your customers. They can receive a quotation they first
have to approve before the work even starts.

Go to `Field Service --> Configuration --> Products` and create or edit
a product.

1.  Under the `General Information` tab, select `Service` as `Product
    Type`.
2.  Under the `Sales` tab, select `Timesheets on tasks` as `Service
    Invoicing Policy`.
3.  Select `Create a task in an existing project` as `Service Tracking`.
4.  Select your `Project`.
5.  If you use them, select your `Worksheet Template`, and save.

![Product configuration to create tasks from sales orders in Odoo Field
Service](onsite_interventions/product-configuration.png)

From the `Sales <../../sales/sales>` app, create a quotation with the
product and confirm it. A task is automatically set up under your Field
Service project. It is directly accessible from the sales order.

![Field Service task on a sales order in Odoo
Sales](onsite_interventions/task-on-so.png)

## From helpdesk tickets

The integration with the `Helpdesk <../helpdesk>` app lets your helpdesk
team manage intervention requests directly. Planning field service tasks
from tickets speeds up your processes.

### Configure the helpdesk team

Go to `Helpdesk --> Configuration --> Helpdesk Teams`. Select a team and
enable `Onsite Interventions`.

![Onsite interventions settings in Odoo
Helpdesk](onsite_interventions/helpdesk-settings.png)

The helpdesk tickets of the team now display the `Plan Intervention`
button. Click on it to create a new task under your field service
project.

![Plan intervention from helpdesk tickets in Odoo
Helpdesk](onsite_interventions/plan-intervention-from-ticket.png)
