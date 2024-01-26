# Understanding metrics

Metrics are detailed statistics that measure the progress and success of
marketing campaigns. When creating marketing activities in a workflow,
Odoo visually displays various metrics related to the campaign with
detailed graphs and in-depth data.

<div class="example">

A typical line graph in a marketing automation workflow showcasing the
success rate of an email.

![An example of a marketing automation campaign in
Odoo.](understanding_metrics/commercial-prospection-campaign-example.png)

</div>

In this case, the `Target` of this campaign is set to
`Lead/Opportunity`, and was narrowed down to *only* focus on the leads
(or opportunities) whose `Tag Name` contains a value of
<span class="title-ref">product</span> — and *also* have an email
address set up in the database.

Beneath the filter nodes, Odoo displays how many records in the database
fall into the previously-specified criteria filter.

<div class="example">

Below, there are 18 records in the database that match the criteria.

![Lead generation filters used to refine records on automation campaigns
in Odoo.](understanding_metrics/marketing-automation-lead-filters.png)

</div>

At the top of the marketing automation campaign form, there are a series
of smart buttons. The `Participations` smart button in this example
indicates that, out of those 18 records, 25 have become participants. In
other words, they have matched the criteria, and have already interacted
with the campaign in one way or another.

<div class="note">

<div class="title">

Note

</div>

`Records` represent a real-time number. Therefore, while the workflow is
running, changes in opportunity records (deletions, additions, or
adjustments) may occur.

This means there will be real-time updates to the number of `Records`,
but such updates do *not* change the number of `Participants`, as the
metric *will not* exclude opportunities that have already been set as
`Participants` before — Odoo just adds new ones.

That's why the number of `Records` can be different from the number of
`Participants` from time to time.

</div>

![Difference between real-time record count and total participants on a
markeing
campaign.](understanding_metrics/campaign-records-vs-participants.png)

Whenever the system runs, updating numbers and triggering actions, it
will look at the `Target` model, and check if new `Records` have been
added (or modified), which always keeps the flow up-to-date.

<div class="note">

<div class="title">

Note

</div>

The `Filter` here is applied to *all* activities. Leads that lose that
specific tag (<span class="title-ref">product</span>) in the meantime
will be excluded from later activities.

</div>

<div class="tip">

<div class="title">

Tip

</div>

Filters can also be applied to individual activities, in the `Domain`
section of the `Activity` pop-up form. Use this feature to specify an
individual filter that will *only* be performed if the records satisfy
*both* filter criteria — the activity filter and its specific domain
filter.

</div>

<div class="example">

When configuring an SMS activity, make sure a certain phone number is
set, in order to avoid triggering a SMS that would never be sent.

![A relevant targeting filter that applies to a type of individual
activity.](understanding_metrics/individual-filter-to-activity.png)

</div>

`Success` represents the number of times that the searching for
participants — who match the criteria filter(s) of that activity — was
performed successfully, in relation to the total number of participants.
If a participant does *not* match the conditions, it will be added to
the `Rejected` number.

![Overview showing participants who do or do not match filtering
criteria on an
activity.](understanding_metrics/participant-matching-success-vs-rejected.png)

Hovering over the graph on an automation activity block, Odoo displays
the number of successful and rejected participants, per day, over the
last 15 days.

<div class="note">

<div class="title">

Note

</div>

Whenever a new record is added to the `Target` model, it's automatically
added to the workflow, and it will start the workflow from the beginning
(`Parent Action`).

</div>
