# Follow-up on invoices

A follow-up message can be sent to customers when a payment is overdue.
Odoo helps you identify late payments and allows you to schedule and
send the appropriate reminders, using **follow-up actions** that trigger
automatically one or more actions according to the number of overdue
days. You can send your follow-ups via different means such as email,
post, or SMS.

<div class="seealso">

\- [Odoo Tutorials: Payment
Follow-up](https://www.odoo.com/slides/slide/payment-follow-up-1682)

</div>

## Configuration

To configure a `Follow-Up Action`, go to `Accounting --> Configuration
-->
Follow-up Levels`. Several follow-up actions are available by default,
and you can customize them any way you want or create new ones to
trigger the following actions:

  - Send an email;
  - `Send an SMS message <pricing/pricing_and_faq>`;
  - Print a letter;
  - `Send a letter <customer_invoices/snailmail>`;
  - Manual action (creates a task).

It is also possible to automatically send a reminder by enabling the
`Auto Execute` option, within a specific `Follow-Up Action`.

<div class="tip">

<div class="title">

Tip

</div>

To send a reminder before the actual due date is reached, set a negative
number of due days.

</div>

## Follow-up reports

The overdue invoices you need to follow up on are available in
`Accounting -->
Customers --> Follow-up Reports`. From there, you can identify all the
customers that have late unpaid invoices.

When you open a customer, you see all their unpaid invoices (overdue or
not). The due dates of the late invoices appear in red. Select the
invoices that are not late yet in the `Excluded` column to exclude them
from the reminder you send.

It is up to you to decide how to remind your customer. You can select
`Print Letter`, `Send By Email`, `Send By Post`, `Send By SMS`. Then,
click on `Done` to view the next follow-up that needs your attention.

<div class="note">

<div class="title">

Note

</div>

\- The contact information available on the invoice or on the contact
form is used to send the reminder. - When the reminder is sent, it is
documented in the chatter of the invoice. - If it is not the right time
for a reminder, you can specify the `Next Reminder Date` and click on
`Remind me later`. You will get the next report according to the next
reminder date set on the statement.

</div>

<div class="tip">

<div class="title">

Tip

</div>

Reconcile your bank statements right before launching your follow-up
process to avoid sending a reminder to a customer that has already paid
you.

</div>

### Debtor's trust level

To know whether a customer usually pays late or not, you can set a trust
level by marking them as `Good Debtor`, `Normal Debtor`, or `Bad Debtor`
on their follow-up report. To do so, click on the bullet next to the
customer's name and select a trust level.

![Set debtor's trust level](followup/debtors-trust-level.png)

### Send reminders in batches

You can send reminder emails in batches from the `Follow-up Reports`
page. To do so, select all the reports you would like to process, click
on the `Action` gear icon, and select `Process follow-ups`.

<div class="seealso">

\- `../../../../general/in_app_purchase` -
`../../../../marketing/sms_marketing/pricing/pricing_and_faq` -
`../customer_invoices/snailmail`

</div>
