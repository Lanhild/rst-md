# Add quality controls

Use **Odoo Quality** to control the quality of products before they are
registered into stock, during picking operations, and when leaving the
warehouse for a delivery order. By creating *quality control points*,
manufacturers can set up quality checks that automatically trigger at
specific points during production.

## Configure quality control points

To create a new quality control point, go to `Quality Control -->
Control Points -->
Create`. Then, fill in the following form fields, accordingly:

  - `Title`: give the quality control point a simple, but informative
    title so production floor and quality check teams can understand it
    easily
  - `Products`: indicate which product(s) should pass through the
    specific quality control point
  - `Operations`: determine which operations team(s) should perform the
    quality control check (e.g.,
    <span class="title-ref">Manufacturing</span>,
    <span class="title-ref">Receipts</span>,
    <span class="title-ref">Delivery Orders</span>, etc.)
  - `Work Order Operation`: for manufacturing operations, use the
    drop-down menu to indicate which type of work order the quality
    control point applies to: `Manual
    Assembly`, `Packing`, `Assembly`, `Testing` or `Long time
    assembly`
  - `Company`: add the company that will implement the quality control
    point. Usually this will be the company that owns the Odoo database.
    However, a multi-company or vendor profile can be selected, as well,
    for cases where there are multiple manufacturing or engineering
    locations
  - `Control Type`: using the drop-down menu, choose from `All
    Operations`, `Randomly` or `Periodically` to determine how often the
    control point should executed
  - `Type`: using the drop-down menu, choose the control point type:
    `Instructions`, `Take a Picture`, `Pass - Fail`, or `Measure`
  - `Team`: decide which quality team should receive the results of the
    quality control point check
  - `Responsible`: add a point person to manage the status and evolution
    of the quality control point over time

The tabs at the bottom of the form can be used to provide additional
information to quality teams:

  - `Instructions`: describe the quality check to be performed
  - `Message If Failure`: detail what should be done if the check fails
  - `Notes`: use to include any additional information

![An example of a completed quality control point form for a Pass-Fail
test.](quality_control_points/quality-control-point-form.png)

Once a control point has been configured, a quality check will be
automatically created and assigned when the specified operation or work
order has been reached. Quality checks can be managed by selecting
`Quality Control --> Quality Checks`.

<div class="tip">

<div class="title">

Tip

</div>

To see all of the quality checks created by a control point, go to
`Quality
Control --> Control Points`, select a control point, and click `Quality
Checks` in the top right corner.

</div>

## Use case: configure a measure quality check

To ensure that a product meets specific measurement requirements, select
`Measure` from the `Type` drop-down menu. Selecting the `Measure`
quality check type reveals three new fields: `Device`, `Norm`, and
`Tolerance`. These fields can be configured so that only products within
a certain tolerance will pass the check:

  - `Device`: select the measuring device that should be used to take
    the measurement (e.g., measuring tape).
  - `Norm`: specify the desired measurement that the product should
    conform to and the unit of measurement that should be used
  - `Tolerance`: select the range that a measurement can be within while
    still passing the check (e.g., `from` 59.5 mm `to` 60.5 mm)

![An example of a quality control point form configured for a measure
quality check.](quality_control_points/measure_quality_check.png)

When the quality control points form is complete, click `Save`. Now,
this measurement-based test will trigger for products that were
specified on the form.

When production of the specified product reaches the operation that
requires a measure quality check, the manufacturing employee responsible
will be prompted to record and validate the measured value in the tablet
view. For products that measure within the values indicated in the
`Tolerance` fields, the test will pass. However, for products that
measure outside of those values, the test will fail. In that case, the
worker who performed the check would create a quality alert from the
tablet view. That quality alert can then be addressed by the quality
management team.
