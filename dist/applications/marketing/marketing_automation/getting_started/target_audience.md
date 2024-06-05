# Target an audience

Delivering marketing campaigns to the right audience is paramount when
trying to grow a business. The Konvergo ERP *Marketing Automation* application
helps marketers to do just that by providing detailed filtering tools,
which can be as simple (or as complex) as necessary, to reach the right
customers at the right time.

## Configure target filters

When configuring the target filters on a marketing campaign, there are
some options that have an `> (arrow)` icon beside them. The `> (arrow)`
icon signifies that the particular filter has more refined parameters
within it that can be customized.

<img src="target_audience/marketing-filters.png" class="align-center"
alt="The drop-down filter menu in the Marketing Automation application." />

Filters can be extended by adding *branches* and *nodes*. A *node* adds
another filtering parameter to a group of targeting conditions (e.g. a
new line), and a *branch* creates a narrowly refined cluster of
parameters, allowing filters to be grouped with `ANY` or `ALL`
statements.

Every time a new branch is created, there are two options:

- Either the records can match `ALL` criteria for the upcoming rules
  (creating an AND statement where *all* criteria must match).
- Or, the records can match `ANY` criteria for the upcoming rules
  (creating an OR statement where *only one* of the criteria must
  match).

To change between these two options, simply click the drop-down arrow
icon in the green box and select `ANY` or `ALL`.

To add a node, click on the `➕ (plus sign)` icon, and to add another
branch click on the `⋯ (ellipses)` icon. To exclude a node or a branch,
click on `✖ (delete)` icon to delete it.

<img src="target_audience/marketing-filter-nodes.png"
class="align-center"
alt="The drop-down filter menu in the Marketing Automation application." />

## Use cases

The following scenarios outline different combinations of filters a
marketing campaign might commonly use.

### Scenario \#1: Narrow target down to new opportunities in the pipeline

While in *Edit mode* on a campaign template form (by clicking the `Edit`
button), select the `Target` field, and click `Search More` from the
drop-down menu. Then, search for `Lead/Opportunity`, and select it.

Next, click `Add Filter` in the `Filter` field. Then, click on the
default `ID` filter option in the first portion of the filter equation.
Doing so reveals a drop-down menu full of filter options. From this
drop-down, scroll down (or search for) `Type`.

Keep the second portion of the filter equation on the default
`🟰 (equal sign)` icon.

Next, change the third (and final) portion of the filter equation from
`Lead` to `Opportunity`. The number of `Records` that fit this specific
filter equation changes as the equation is customized.

Add another node to this filter by clicking the `➕ (plus sign)` icon to
the right of the equation.

With "new" opportunities being the target of this filter, the second
node will focus on *only* locating opportunities that are in the `New`
stage of the pipeline. To do that, select the default `ID` from the
first portion of the second filter equation, and scroll down (or search
for) `Stage` from the field drop-down menu.

Once again, leave the second portion of the filter equation on
`🟰 (equal sign)` icon.

Lastly, highlight the default value in the third (and final) portion of
the second filter equation, and type in
<span class="title-ref">New</span>. With that in place, Konvergo ERP only
targets opportunities that are in the "New" stage of the pipeline.

<img src="target_audience/filters-opportunities.png"
class="align-center"
alt="A standard scenario using filters in the Konvergo ERP Marketing Automation app." />

### Scenario \#2: Narrow down target to event attendees who purchased a specific ticket

While in *Edit mode* on a campaign template form (by clicking the `Edit`
button), select the `Target` field, and click `Search More` from the
drop-down menu. Then, scroll down (or search for) `Event`, and select
it.

Next, click `Add Filter` in the `Filter` field. Click on the default
`ID` filter option in the first portion of the filter equation. Doing so
reveals a drop-down menu full of filter options. From this drop-down,
scroll down (or search for) `Event`.

Click the default `🟰 (equal sign)` icon in the second portion of the
filter equation. This reveals a drop-down menu. From this drop-down
menu, select `contains`.

In the third (and final) empty portion of the filter equation, type in
the name of the event(s) that Konvergo ERP should consider for this campaign
filter.

Then, add another node to this filter by clicking the `➕ (plus sign)`
icon to the right of the equation.

The second node will focus on targeting this campaign to attendees who
purchase a specific type of ticket to the aforementioned event(s)
mentioned in the first filter equation.

To do that, select the default `ID` from the first portion of the second
filter equation, and scroll down (or search for) `Event Ticket` from the
field drop-down menu. Then, in that same drop-down menu, select `Name`.

Once again, click the default `🟰 (equal sign)` icon in the second
portion of the filter equation, and select `contains`.

Lastly, in the third (and final) portion of the second filter equation,
which is blank, type in the name of the ticket type that should be used
for the filter. In this case, `Standard` is the name of the event ticket
type for this sample filter.

<img src="target_audience/filters-event-ticket.png" class="align-center"
alt="An event ticket filter in the Konvergo ERP Marketing Automation application." />
