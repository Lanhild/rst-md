# Testing/running campaigns

Odoo gives users the ability to test marketing campaigns (and mailings)
before officially running them.

First, open the `Marketing Automation` application, and select the
desired campaign, which reveals that campaign's detail form.

On the campaign detail form, make sure the campaign already has
activities configured (or build a campaign by following the directions
here on `this documentation
</applications/marketing/marketing_automation/getting_started/workflow_activities>`).

To start a test, click the `Launch a Test` button at the top of the
campaign form.

![Launch a test button in Odoo Marketing
Automation.](testing_running/launch-test.png)

When clicked, a `Launch a test` pop-up window appears. In the drop-down
field, choose an existing record (or create a new one) to run the test
on. To create a brand new record, click the `Search More...` link at the
bottom of the drop-down menu, and then click the `Create` button.

Doing so reveals a blank contact form, in which the `Name` and `Email`
**must** be entered. When all the necessary information has been
entered, click `Save`, and Odoo returns to the `Launch a test` pop-up,
with that new record in the `Choose an
existing record or create a new one to test` field.

Once a record is selected, click `Continue`, and Odoo reveals the
campaign test page.

![Test screen in Odoo Marketing
Automation.](testing_running/test-screen.png)

On the campaign test page, the name of the `Record` being tested is
visible, along with the precise time this test workflow was started in
the `Workflow Started On` field. Beneath that, in the `Workflow` section
is the first activity (or activities) in the workflow that's being
tested.

To start a test, click the `Run` button, represented by a `▶️ (play
button)` icon beside the first activity in the workflow. When clicked,
the page reloads, and Odoo shows the various results (and analytics)
connected to that specific activity as they occur, in real-time.

![Workflow test progress in Odoo Marketing
Automation.](testing_running/workflow-test-progress.png)

Once all the workflow activities are completed, the test will end, and
move to the `Completed` stage. To stop a test before all the workflow
activities are completed, click the `Stop` button in the upper-left
corner of the campaign test page.
