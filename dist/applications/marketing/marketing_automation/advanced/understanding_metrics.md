# Campaign metrics

*Campaign metrics* are detailed statistics and analytics within a
marketing campaign, measuring its success and effectiveness. Triggered
marketing activities populate relevant activity blocks with real-time
metrics, in the campaign detail form.

## Activity analytics

In the `Workflow` section of a campaign detail form in the *Marketing
Automation* app, where the various campaign activities are located, a
collection of useful data can be found on every individual activity
block, like number of communications `Sent`, percentage of messages that
have been `Clicked`, and more.

<img src="understanding_metrics/activity-analytics-block-sample.png"
class="align-center"
alt="An activity block in the workflow section with useful analytical data in Konvergo ERP." />

To the left of the activity block, the configured `trigger time
<../getting_started/workflow_activities>` is displayed as a duration
(either `Hours`, `Days`, `Weeks`, or `Months`) if it corresponds to
period after the workflow begins.

> [!NOTE]
> If the trigger time is dependent on another activity or triggering
> action (e.g. `Mail:
> Replied`, etc.) the time is displayed, along with the necessary action
> for that activity to be activated (e.g.
> <span class="title-ref">Replied after 2 Hours</span>).
>
> <img src="understanding_metrics/replied-after-activity-time-trigger.png"
> class="align-center"
> alt="Time trigger display when dependent on another activity in Konvergo ERP Marketing Automation." />

In the activity block, an icon represents each activity type. An
`✉️ (envelope)` icon means the activity is an email. Three tiny,
interlocking `⚙️ (gear)` icons means the activity is an internal action.
And, a small, basic `📱 (mobile)` icon means the activity is an SMS.

> [!TIP]
> The activity type name is also displayed in smaller font below the
> activity title.

Beside the activity icon, at the top of the activity block, is the title
of the activity. To the right of the activity title, there are `Edit`
and `Delete` buttons.

Click `Edit` to open the `Open: Activities` pop-up form for that
specific activity, in which that activity can be modified. Click the
`Delete` button to completely delete that specific activity from the
workflow.

<div class="seealso">

`/applications/marketing/marketing_automation/getting_started/workflow_activities`

</div>

### Activity graph tab

In every activity block, the `Graph (pie chart icon)` tab is open by
default, displaying related metrics as a simple line graph. The success
metrics are represented in <span class="title-ref">green</span> and the
rejected metrics are represented in <span class="title-ref">red</span>.

Numerical representations of both `Success` and `Rejected` activities
are shown to the right of the line graph.

> [!TIP]
> Hovering over any point in the line graph of the activity block
> reveals a notated breakdown of data for that specific date.
>
> <img src="understanding_metrics/graph-breakdown-data.png"
> class="align-center"
> alt="Hovering over any point in line graph reveals notated breakdown of data in Konvergo ERP." />

Beneath the graph in the activity block, for *Email* or *SMS* activity
types, a line of accessible data figures provide a bird's eye view of
the campaign activity, including: `Sent` (numerical), `Clicked`
(percentage), `Replied` (percentage), and `Bounced` (percentage).

> [!TIP]
> Clicking any of those stats on the `DETAILS` line, beneath the line
> graph, reveals a separate page containing every specific record for
> that particular data point.

### Activity filter tab

Next to the `Graph` tab on the activity block, there's the option to
open a `Filter` tab (represented by a `filter/funnel` icon).

<img src="understanding_metrics/activity-filter-tab.png"
class="align-center"
alt="What a campaign activity filter tab looks like in Konvergo ERP Marketing Automation." />

Clicking the `Filter` tab on an activity block, reveals what the
specific filters are for that particular campaign activity, and how many
records in the database match that specific criteria.

> [!TIP]
> Clicking the `records` link beneath the displayed filter reveals a
> separate pop-up window containing a list of all the records that match
> that specific campaign activity rule(s).

## Link tracker

Konvergo ERP tracks all URLs used in marketing campaigns. To access and analyze
those URLs, navigate to
`Marketing Automation app --> Reporting --> Link Tracker`. Doing so
reveals a `Link Statistics` page, wherein all campaign-related URLs can
be analyzed.

<img src="understanding_metrics/campaign-link-tracker.png"
class="align-center"
alt="What a campaign activity filter tab looks like in Konvergo ERP Marketing Automation." />

The default view on the `Link Statistics` page is the `Bar Chart` view,
but there are different view options available in the upper-left corner.
There is the option to view the statistics as a `Line Chart` or
`Pie Chart`.

Beside that, there is also the option to view the statistics as
`Stacked`, and the data can be put into `Descending` or `Ascending`
order.

To the far-left of the view options, there is the `Measures` drop-down
menu. When clicked, the options to view the `Number of Clicks` or total
`Count` are available. And, to the right of the `Measures` drop-down
menu, there's the ability to add any data to a spreadsheet by clicking
the `Insert in Spreadsheet` button.

Also, in the upper-right corner of the `Link Statistics` page, to the
far-right of the search bar, there are additional view options to choose
from: the default `Graph` view, the `Pivot` table view, and the `List`
view.

## Traces

Konvergo ERP tracks all activities used in every marketing campaign. The data
related to these activities can be accessed and analyzed in the `Traces`
page, which can be found by navigating to
`Marketing Automation app --> Reporting --> Traces`.

<img src="understanding_metrics/traces-page-marketing-automation.png"
class="align-center"
alt="The Traces page in the Konvergo ERP Marketing Automation application." />

The default view on the `Traces` page is the `Bar Chart` view, but there
are different view options available in the upper-left corner. There is
the option to view the statistics as a `Line Chart` or `Pie Chart`.

At the top of the graph, there's a color key, informing the user which
activities have been `Processed`, `Scheduled`, and `Rejected`. There's
also an outline indicator to inform users of the `Sum` of certain
activities, as well.

Beside the various view option in the upper-left corner of the `Traces`
page, there is also the option to view the statistics as `Stacked`, and
the data can be put into `Descending` or `Ascending` order.

To the far-left of the view options, there is the `Measures` drop-down
menu. When clicked, the options to view the `Document ID` or total
`Count` are available. And, to the right of the `Measures` drop-down
menu, there's the ability to add any data to a spreadsheet by clicking
the `Insert in Spreadsheet` button.

Also, in the upper-right corner of the `Link Statistics` page, to the
far-right of the search bar, there are additional view options to choose
from: the default `Graph` view, the `Pivot` table view, and the `List`
view.

## Participants

Konvergo ERP tracks all participants related to every marketing campaign. The
data related to these participants can be accessed and analyzed in the
`Participants` page, which can be found by navigating to
`Marketing Automation app --> Reporting --> Participants`.

<img
src="understanding_metrics/participants-page-marketing-automation.png"
class="align-center"
alt="The Participants page in the Konvergo ERP Marketing Automation application." />

The default view on the `Participants` page is the `Pie Chart` view, but
there are different view options available in the upper-left corner.
There is the option to view the statistics as a `Line Chart` or
`Bar Chart`.

At the top of the graph, there's a color key that describes the type of
participants found in the graph.

To the far-left of the view options, there is the `Measures` drop-down
menu. When clicked, the options to view the `Record ID` or total `Count`
are available. And, to the right of the `Measures` drop-down menu,
there's the ability to add any data to a spreadsheet by clicking the
`Insert in Spreadsheet` button.

Also, in the upper-right corner of the `Link Statistics` page, to the
far-right of the search bar, there are additional view options to choose
from: the default `Graph` view, the `Pivot` table view, and the `List`
view.
