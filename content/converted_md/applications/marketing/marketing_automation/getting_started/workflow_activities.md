# Marketing activities

When creating a campaign in the *Marketing Automation* app, users can
plan marketing activities, such as email or SMS campaigns.

To get started, navigate to the bottom of a marketing automation
campaign detail form, and click `Add New Activity`. Doing so reveals a
`Create Activities` pop-up window. This pop-up window is a blank
activity template, where specific parameters can be set for that
particular activity.

The following fields are available in the `Create Activities` pop-up
window (when `Add New Activity` is clicked):

![An activity template in Odoo Marketing
Automation.](workflow_activities/activity-template.png)

  - `Activity Name`: the title of the activity.
  - `Activity Type`: choose between
    <span class="title-ref">Email</span>, <span class="title-ref">Server
    Action</span> (internal Odoo operation), or
    <span class="title-ref">SMS</span>.
  - `Mail Template`: choose from pre-configured templates (or create a
    new one on-the-fly).
  - `Trigger`: choose when this activity should be triggered.
  - `Expiry Duration`: configure to stop the actions after a specific
    amount of time (after the scheduled date). When selected, a `Cancel
    after` field appears, in which the user can choose how many `Hours,
    Days, Weeks, or Months` they want the actions to cease after the
    initial date.
  - `Activity Filter`: domain related to this activity (and all
    subsequent child activities).
  - `Applied Filter`: activity will *only* be performed if it satisfies
    the specified domain (filter).

After the activity's settings are fully configured, click `Save & Close`
to save the activity and return to the marketing automation campaign
form, `Save & New` to save the activity and immediately create another
one in a fresh `Create Activities` pop-up window, or `Discard` to delete
the activity and return to the marketing automation campaign form.

## Workflow activity

Once an activity is saved, the `Workflow Activity` section appears at
the bottom of the marketing automation campaign form. Each activity is
displayed as a line graph.

The configured `Trigger` time for that activity can be found to the left
of the `Workflow Activity` card in the `Workflow` section.

Once the activity has been triggered, a figure representing the number
of `Success` or `Rejected` activities will be displayed to the right of
the graph.

![Typical workflow activity in Odoo Marketing
Automation.](workflow_activities/workflow-activity.png)

<div class="tip">

<div class="title">

Tip

</div>

If the `Activity Type` of the activity is set to `Email`, there are more
in-depth analytics beneath the activity graph data, detailing how many
emails have been `Sent`, and what percentage of those have been
`Clicked`, `Replied` to, or `Bounced`.

</div>

## Child activities

There is also the option to add a *child activity* by clicking `Add
child activity`, located at the bottom of each activity block in the
`Workflow` section of a marketing automation form.

Child activities are sub-activities that are connected to (and triggered
by) the activity above it, which is also known as its *parent activity*.

Odoo provides a number of triggering options to launch a child activity
- all of which depend on the trigger configurations related to the
parent activity. Under the desired parent activity, hover over `Add
child activity`, and select any of the following triggers:

  - `Add Another Activity`: instantly add another activity.
  - `Opened`: the next activity will be triggered if the (email)
    recipient opens the mailing.
  - `Not Opened`: the next activity will be triggered if the recipient
    does not open the mailing.
  - `Replied`: the next activity will be triggered if the recipient
    replies to the mailing.
  - `Not Replied`: the next activity will be triggered if the recipient
    does not reply to the mailing.
  - `Clicked`: the next activity will be triggered if the recipient
    clicks on a link included in the mailing.
  - `Not Clicked`: the next activity will be triggered if the recipient
    does not click on a link included in the mailing.
  - `Bounced`: the next activity will be triggered if the mailing is
    bounced (not sent).

Once a trigger is selected, the user can configure the child activity
(it has the same configuration options as a regular activity), and click
`Save & Close` to finish creating the child activity, which will then be
displayed in the `Workflow` section, in a slightly indented position
beneath its parent activity.
