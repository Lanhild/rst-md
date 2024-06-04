# ECO type

An *ECO type* is assigned to *engineering change orders* (ECOs) to
organize and track changes to products and bills of materials (BoMs).
Each `ECO (Engineering Change Order)` type separates
`ECOs (Engineering Change Orders)` into a project in Gantt view,
ensuring collaborators and stakeholders **only** view and assist with
relevant `BoM (Bill of Materials)` improvements.

For example, an electronic chip manufacturer might use 'New Product
Introduction', 'Product Improvement', 'Component Change', and 'Firmware
Update' `ECO (Engineering Change Order)` types. Then, designers and
engineers can focus on `ECOs (Engineering Change Orders)` in the 'New
Product Introduction' and 'Product Improvement' projects, avoiding
unrelated supplier change or firmware update
`ECOs (Engineering Change Orders)`.

## Create ECO type

To access and manage ECO types, navigate to
`PLM app --> Configuration --> ECO
Types`.

Create a new ECO type by clicking `New`. On the new `ECO Types` form,
fill in the following information:

- `Name`: the name of the `ECO (Engineering Change Order)` type, which
  will organize all of the `ECOs (Engineering Change Orders)` of this
  *type* in a project.
- `Email Alias`: if this optional field is filled, emails submitted to
  this email address automatically generate
  `ECOs (Engineering Change Orders)` in the left-most stage of this
  `ECO (Engineering Change Order)` type.

<div class="example">

The <span class="title-ref">Formulation change</span>
`ECO (Engineering Change Order)` type is used to organize and track
related `ECOs (Engineering Change Orders)` in a single project.
Configuring the `Email Alias` field generates
`ECOs (Engineering Change Orders)` in the
<span class="title-ref">Formulation change</span> project sent to the
email address,
<span class="title-ref">pawlish-change@pawlished-glam.odoo.com</span>.

<img src="eco_type/create-eco-type.png" class="align-center"
alt="Example of an ECO type." />

</div>

## Edit ECO type

Modify existing `ECO (Engineering Change Order)` type names and email
aliases by navigating to the `PLM app -->
Configuration --> ECO Types` page. There, click on the desired
`ECO (Engineering Change Order)` type from the list.

On the form for each `ECO (Engineering Change Order)` type, proceed to
edit the `Name` and `Email Alias` fields.

## Stages

Within an `ECO (Engineering Change Order)` type project, *stages* are
like milestones and are used to identify the progress of the
`ECO (Engineering Change Order)` before the changes are ready to be
applied. (e.g. 'Feedback', 'In Progress', 'Approved', 'Complete')

Additionally, required approvers can be added to each stage, ensuring
that changes to the production `BoM (Bill of Materials)` cannot proceed
until the approver reviews and approves the
`ECO (Engineering Change Order)`. Doing so prevents errors on the
production `BoM (Bill of Materials)` by enforcing at least one review of
suggested changes before they're applied on a production
`BoM (Bill of Materials)`.

For best practice, there should be at least one *verification* stage,
which is a stage with a required approver, and one *closing* stage,
which stores `ECOs (Engineering Change Orders)` that have been either
canceled or approved for use as the next production
`BoM (Bill of Materials)`.

### Create stage

To add a stage, go to the `PLM` app and select the intended project for
an `ECO (Engineering Change Order)` type from the `PLM Overview`
dashboard.

Then, on the `Engineering Change Orders` project pipeline for the
`ECO (Engineering Change Order)` type, click the `+ Stage` button. Doing
so reveals a text box to fill in the name of the stage. After filling it
in, click the `Add` button to finish adding the stage.

<div class="example">

A new <span class="title-ref">Assigned</span> stage separates assigned
`ECOs (Engineering Change Orders)` from the unassigned ones in the
<span class="title-ref">New</span> stage. Adding another stage helps the
product manager track unassigned tasks.

<img src="eco_type/create-stage.png" class="align-center"
alt="Create a new stage in a project for an ECO type." />

</div>

### Verification stage

Click an ECO type from `PLM app --> Overview` to open a kanban view of
`ECOs (Engineering Change Orders)` of this type.

To configure a verification stage, hover over the intended stage, and
select the `⚙️
(gear)` icon. Then, click `Edit` to open a pop-up window.

Configure the verification stage in the edit stage pop-up window, by
checking the box for `Allow to apply changes`.

Then, add an approver in the `Approvers` section, by clicking
`Add a line`, and specifying the `Role` of the reviewer, their `User`,
and `Approval
Type`.

Make sure at least one approver is configured with the `Approval Type`:
`Is
required to approve`.

The approver listed is automatically notified when
`ECOs (Engineering Change Orders)` are dropped in the stage specified in
the pop-up window. Once finished, click `Save & Close`.

<div class="example">

In the `ECO (Engineering Change Order)` type <span class="title-ref">New
Product Introduction</span>, the verification stage
<span class="title-ref">Validated</span> is configured by clicking the
`⚙️ (gear)` icon, and selecting `Edit`. Doing so opens the
`Edit: Validated` pop-up window.

By adding the <span class="title-ref">Engineering manager</span> as an
approver, only `ECOs (Engineering Change Orders)` approved by this user
can proceed to the next stage, and have the changes applied on the
production `BoM (Bill of Materials)`.

Additionally, check the `Allow to apply changes` option to ensure proper
behavior.

<img src="eco_type/verification-stage.png" class="align-center"
alt="Show &quot;Allow to apply changes&quot; option is checked." />

</div>

### Closing stage

Configure a closing stage by opening the `Edit: [stage]` pop-up window.
To do so, hover over the intended stage and click the `⚙️ (gear)` icon
that appears in the top-right corner. Then, click `Edit` from the
drop-down menu.

On the `Edit: [stage]` pop-up window, select the check boxes for
`Folded in
kanban view`, `Allow to apply changes` and `Final Stage`.

<div class="example">

The closing stage, <span class="title-ref">Effective</span> is
configured by checking the `Folded in kanban view`,
`Allow to apply changes`, and `Final Stage` options

</div>

<img src="eco_type/closing-stage.png" class="align-center"
alt="Show configurations of the closing stage." />
