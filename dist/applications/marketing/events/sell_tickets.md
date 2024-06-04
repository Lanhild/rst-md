# Sell tickets

Create custom ticket tiers (with various price points) for potential
attendees to choose from, directly on the event template form, under the
`Tickets` tab. Odoo simplifies the ticket-purchasing process by
providing plenty of payment method options.

## Configuration

First, in order to enable the creation (and selling of) event tickets,
go to `Configuration --> Settings`, then enable the `Tickets` and
`Online Ticketing` features.

The `Tickets` feature allows tickets to be sold for an event.

The `Online Tickets` feature allows for the sale of tickets to occur
through the website.

> [!NOTE]
> If these options are *not* enabled, a default `Register` button will
> be available for free registrations.

<img src="sell_tickets/events-settings-tickets.png" class="align-center"
alt="View of the settings page for Odoo Events." />

## Sell tickets through sales orders

In the `Sales` application, choose a previously-created Event
Registration (as if it were a product), and add it as a product line.
Upon adding the registration, a pop-up appears, which allows for the
selection of a specific event (and ticket tier). That specific event
ticket is then attached to the sales order.

<img src="sell_tickets/events-through-sales-order.png"
class="align-center"
alt="View of a sales order and option to choose the specific event in Odoo Events." />

Events with tickets sold online or through sales orders have a
`Sales Smart Button` shortcut, located at the top of the event template
form (in the `Events` application).

Clicking the `Sales Smart Button` reveals a page with all the sales
orders related to that event.

<img src="sell_tickets/events-sales-smartbutton.png"
class="align-center"
alt="View of an event&#39;s form and the sales smart button in Odoo Events." />

<img src="sell_tickets/events-tickets-registration-product.png"
class="align-center"
alt="View of an event form highlighting the column product under the tickets tab in Odoo
Events." />

## Sell tickets through the website

With tickets purchased through the website, the process is similar to
creating a `Sales
Order` with a specific `Registration` product. Here, tickets are added
to a virtual cart, and the transaction can be completed as usual -
utilizing any of the pre-configured payment methods options that have
been set up on the website.

The completed purchase is automatically produced in a `Sales Order`,
which can be easily accessed in the back end of the database.

<img src="sell_tickets/events-online-ticket-purchase.png"
class="align-center"
alt="View of website transaction for Odoo Events." />
