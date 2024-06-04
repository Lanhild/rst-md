# Digest emails

*Digest Emails* are periodic snapshots sent via email to users in an
organization that include high-level information about how the business
is performing.

To start sending digest emails, begin by navigating to
`Settings app --> Statistics
section`, activate the `Digest Emails` feature, and click `Save`.

<img src="digest_emails/digest-email-settings.png" class="align-center"
alt="Digest Emails section inside General Settings." />

A variety of settings can be configured for digest emails, such as:

- Deciding which `KPIs (key performance indicators)` are shared in the
  digest emails
- Determining how often digest emails are sent
- Choosing who in the organization receives digest emails
- Creating custom digest email templates
- Adding additional `KPIs (key performance indicators)` (*Studio* app
  required)

> [!NOTE]
> By default, the `Digest Email` feature is enabled. `Your Odoo Periodic
> Digest` serves as the primary template, which includes all
> `KPI (key performance
> indicator)` measurements across the Odoo database, and is sent daily
> to administrators.

> [!WARNING]
> When creating duplicates of databases that have sending capabilities
> (not testing-mode), the digest emails continue to send from the
> duplicate database, unless deactivated.
>
> To deactivate the digest email, navigate to
> `Settings --> Statistics section`. Then, deactivate the
> `Digest Emails` feature, by un-ticking the checkbox, and clicking
> `Save`. See the section on `digest-emails/deactivate`.

## Customize default digest email

To customize the default digest email (*Your Odoo Periodic Digest*), go
to `Settings
app --> Statistics section --> Digest Email field`. Then, select
`Your Odoo Periodic
Digest`, and click on the `↗️ (External link)` icon, next to the
drop-down menu selection.

A pop-up window appears, and presents a variety of editable settings,
which include:

- `Digest Name`: the name of the digest email.
- `Periodicity`: control how often digest emails are sent (`Daily`,
  `Weekly`, `Monthly`, or `Quarterly`).
- `Next Send Date`: the date on which the digest email will be sent
  again.
- `KPIs` tab: check/uncheck each calculated
  `KPI (key performance indicator)` that appears in digest emails. A
  ticked box indicates an active `KPI (key performance indicator)` in
  the digest email. See the section on `digest-emails/kpis`.
- `Recipients` tab: add/remove users who receive the digest emails. See
  the section on `digest-emails/recipients`.

> [!NOTE]
> The `KPIs (key performance indicators)` can be customized using Odoo
> *Studio*. Additional costs to the database subscription are incurred
> should *Studio* need to be installed. See this section on
> `digest-emails/custom-kpi`.

<img src="digest_emails/periodic-digest.png" class="align-center"
alt="Customize default Digest Email settings and custom KPIs." />

## Deactivate digest email

To manually deactivate an individual digest email, first navigate to
`Settings app
--> Statistics section`, and click `Configure Digest Emails`. Then,
select the desired digest email from the list that should be
deactivated.

Next, click `DEACTIVATE FOR EVERYONE` to deactivate the digest email for
everyone, or `UNSUBSCRIBE ME` to remove the logged in user from the
mailing list. These buttons are located in the top menu, just above the
`Digest Name`.

## Manually send digest email

To manually send a digest email, first navigate to
`Settings app --> Statistics
section`, and click `Configure Digest Emails`. Then, select the desired
digest email, and click `SEND NOW`. This button is located in the top
menu, just above the `Digest
Name`.

## KPIs

Pre-configured `KPIs (key performance indicators)` can be added to the
digest email from the `KPIs` tab of the digest email template form.

First, navigate to `Settings app --> Statistics section`, and click
`Configure Digest Emails`.

Then, select the desired digest email, and open the `KPIs` tab.

To add a `KPI (key performance indicator)` to the digest email, tick the
checkbox next to the desired `KPI (key performance indicator)`. After
all `KPIs (key performance indicators)` are added (or deselected), click
`Save`.

The following `KPIs (key performance indicators)` are available in the
`KPIs` tab on a digest email template form out-of-box in Odoo:

<img src="digest_emails/oob-kpis.png" class="align-right"
alt="KPIs listed in the out-of-box digest email." />

`General`  
- `Connected Users`
- `Messages`

`Project`  
- `Open Tasks`

`Recruitment`  
- `Employees`

`CRM`  
- `New Leads/Opportunities`
- `Opportunities Won`

`Sales`  
- `All Sales`
- `eCommerce Sales`

`Point of Sale`  
- `POS Sales`

`Live Chat`  
- `% of Happiness`
- `Conversations handled`
- `Time to answer (sec)`

`Helpdesk`  
- `Tickets Closed`

`Invoicing`  
- `Revenue`
- `Banks and Cash Moves`

## Recipients

Digest email recipients are added from the `Recipients` tab of the
digest email template form.

To add a recipient, navigate to `Settings app --> Statistics section`,
and click `Configure Digest Emails`. Then, select the desired digest
email, and open the `Recipients` tab.

To add a recipient, click `Add a line`, and an `Add Recipients` pop-up
window appears, with all available users to add as recipients.

From the pop-up window, tick the checkbox next to the `Name` of the
user(s), and click the `Select` button.

To remove a user as a recipient, click the `❌ (remove)` icon to the
far-right of the user listed in the `Recipients` tab.

Click `Save` to implement the changes.

## Create digest emails

To create a new digest email, navigate to
`Settings app --> Statistics section`, and click
`Configure Digest Emails`. Then, click `Create` to create a new digest
email.

A separate page, with a blank digest email template appears, and
presents a variety of editable settings, including:

- `Digest Name`: the name of the digest email.
- `Periodicity`: control how often digest emails are sent (`Daily`,
  `Weekly`, `Monthly`, or `Quarterly`).
- `Next Send Date`: the date on which the digest email will be sent
  again.
- `KPIs` tab: check/uncheck each calculated
  `KPI (key performance indicator)` that appears in digest emails. A
  ticked box indicates an active `KPI (key performance indicator)` in
  the digest email. See the section on `digest-emails/kpis`.
- `Recipients` tab: add/remove users who receive the digest emails. See
  the section on `digest-emails/recipients`.

From there, give the digest email a `Digest Name`, specify
`Periodicity`, choose the desired `KPIs (key performance indicators)`,
and add `Recipients`, as needed.

After clicking `Save`, the new custom digest email is available as a
selection in the `Digest Email` field, located in the
`Settings app --> Statistics section`.

## Custom KPIs with Odoo Studio

The `KPIs (key performance indicators)` on a digest email template form,
in the `KPIs` tab, can be customized using Odoo *Studio*.

> [!WARNING]
> Additional costs to the database subscription are incurred, should
> Odoo *Studio* need to be installed.

To begin, click the `🛠️ (tools)` icon in the top-right of the screen.
This is the link to the Odoo *Studio* application.

In order to create additional fields, create two fields on the digest
object:

1.  Create a boolean field called
    <span class="title-ref">kpi_myfield</span>, and display it in the
    `KPIs` tab.
2.  Create a computed field called
    <span class="title-ref">kpi_myfield_value</span> that computes the
    customized `KPI (key
    performance indicator)`.
3.  Select the `KPIs (key performance indicators)` in the `KPIs` tab.

> [!TIP]
> Here is the [source
> code](https://github.com/odoo/odoo/blob/15.0/addons/digest/models/digest.py)
> for the <span class="title-ref">digest.py</span> file, which guides
> the programmer in the coding of the computed field.

<div class="seealso">

Users can also click the `Recipients` tab, and then the vertical
three-dot `(kebab)` menu to edit this view. Either click
`EDIT LIST VIEW` or `EDIT FORM VIEW` to modify this tab.

</div>

### Computed values reference table

| LABEL                 | VALUE                                                                  |
|-----------------------|------------------------------------------------------------------------|
| Connected Users       | <span class="title-ref">kpi_res_users_connected_value</span>           |
| Messages Sent         | <span class="title-ref">kpi_mail_message_total_value</span>            |
| New Leads             | <span class="title-ref">kpi_crm_lead_created_value</span>              |
| Opportunities Won     | <span class="title-ref">kpi_crm_opportunities_won_value</span>         |
| Open Tasks            | <span class="title-ref">kpi_project_task_opened_value</span>           |
| Tickets Closed        | <span class="title-ref">kpi_helpdesk_tickets_closed_value</span>       |
| % of Happiness        | <span class="title-ref">kpi_livechat_rating_value</span>               |
| Conversations handled | <span class="title-ref">kpi_livechat_conversations_value</span>        |
| Time to answer (sec)  | <span class="title-ref">kpi_livechat_response_value</span>             |
| All Sales             | <span class="title-ref">kpi_all_sale_total_value</span>                |
| eCommerce Sales       | <span class="title-ref">kpi_website_sale_total_value</span>            |
| Revenue               | <span class="title-ref">kpi_account_total_revenue_value</span>         |
| Bank & Cash Moves     | <span class="title-ref">kpi_account_bank_cash_value</span>             |
| POS Sales             | <span class="title-ref">kpi_pos_total_value</span>                     |
| New Employees         | <span class="title-ref">kpi_hr_recruitment_new_colleagues_value</span> |
