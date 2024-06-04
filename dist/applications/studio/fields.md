# Fields and widgets

Fields structure the models of a database. If you picture a model as a
table or spreadsheet, fields are the columns where data is stored in the
records (i.e., the rows). Fields also define the type of data that is
stored within them. How the data is presented and formatted on the
`UI (User
Interface)` is defined by their widget.

From a technical point of view, there are 15 field types in Odoo.
However, you can choose from 20 fields in Studio, as some field types
are available more than once with a different default widget.

> [!TIP]
> `New Fields` can only be added to the `studio/views/general/form` and
> `studio/views/multiple-records/list` views. On other views, you can
> only add `Existing Fields` `(fields already on the model)`.

## Simple fields

Simple fields contain basic values, such as text, numbers, files, etc.

> [!NOTE]
> Non-default widgets, when available, are presented as bullet points
> below.

### Text (<span class="title-ref">char</span>)

The `Text` field is used for short text containing any character. One
text line is displayed when filling out the field.

- `Badge`: displays the value inside a rounded shape, similar to a tag.
  The value cannot be edited on the UI, but a default value can be set.

- `Copy to Clipboard`: users can copy the value by clicking a button.

- `E-mail`: the value becomes a clickable *mailto* link.

- `Image`: displays an image using a URL. The value cannot be edited
  manually, but a default value can be set.

  > [!NOTE]
  > This works differently than selecting the `Image field
  > <studio/fields/simple-fields/image>` directly, as the image is not
  > stored in Odoo when using a `Text` field with the `Image` widget.
  > For example, it can be useful if you want to save disk space.

- `Phone`: the value becomes a clickable *tel* link.

  > [!TIP]
  > Tick `Enable SMS` to add an option to send an SMS directly from Odoo
  > next to the field.

- `URL`: the value becomes a clickable URL.

<div class="example">

<img src="fields/text-examples.png" class="align-center"
alt="Examples of Text fields with different widgets" />

</div>

### Multiline Text (<span class="title-ref">text</span>)

The `Multiline Text` field is used for longer text containing any type
of character. Two text lines are displayed on the UI when filling out
the field.

- `Copy to Clipboard`: users can copy the value by clicking a button.

<div class="example">

<img src="fields/multiline-text-examples.png" class="align-center"
alt="Examples of Multiline Text fields with different widgets" />

</div>

### Integer (<span class="title-ref">integer</span>)

The `Integer` field is used for all integer numbers
(`positive, negative, or zero,
without a decimal`).

- `Percentage Pie`: displays the value inside a percentage circle,
  usually for a computed value. The value cannot be edited on the UI,
  but a default value can be set.
- `Progress Bar`: displays the value next to a percentage bar, usually
  for a computed value. The field cannot be edited manually, but a
  default value can be set.
- `Handle`: displays a drag handle icon to order records manually in
  `List view
  <studio/views/multiple-records/list>`.

<div class="example">

<img src="fields/integer-examples.png" class="align-center"
alt="Examples of Integer fields with different widgets" />

</div>

### Decimal (<span class="title-ref">float</span>)

The `Decimal` field is used for all decimal numbers
(`positive, negative, or zero,
with a decimal`).

> [!NOTE]
> Decimal numbers are displayed with two decimals after the decimal
> point on the UI, but they are stored in the database with more
> precision.

- `Monetary`: it is similar to using the `Monetary field
  <studio/fields/simple-fields/monetary>`. It is recommended to use the
  later as it offers more functionalities.
- `Percentage`: displays a percent character
  <span class="title-ref">%</span> after the value.
- `Percentage Pie`: displays the value inside a percentage circle,
  usually for a computed value. The field cannot be edited manually, but
  a default value can be set.
- `Progress Bar`: displays the value next to a percentage bar, usually
  for a computed value. The field cannot be edited manually, but a
  default value can be set.
- `Time`: the value must follow the *hh:mm* format, with a maximum of 59
  minutes.

<div class="example">

<img src="fields/decimal-examples.png" class="align-center"
alt="Examples of Decimal fields with different widgets" />

</div>

### Monetary (<span class="title-ref">monetary</span>)

The `Monetary` field is used for all monetary values.

> [!NOTE]
> When you first add a `Monetary` field, you are prompted to add a
> `Currency` field if none exists already on the model. Odoo offers to
> add the `Currency` field for you. Once it is added, add the `Monetary`
> field again.

<div class="example">

<img src="fields/monetary-example.png" class="align-center"
alt="Example of a Monetary field along with its Currency field" />

</div>

### Html (<span class="title-ref">html</span>)

The `Html` field is used to add text that can be edited using the Odoo
HTML editor.

- `Multiline Text`: disables the Odoo HTML editor to allow editing raw
  HTML.

<div class="example">

<img src="fields/html-example.png" class="align-center"
alt="Examples of Html fields with different widgets" />

</div>

### Date (<span class="title-ref">date</span>)

The `Date` field is used to select a date on a calendar.

- `Remaining Days`: the remaining number of days before the selected
  date is displayed (e.g., *In 5 days*), based on the current date.

<div class="example">

<img src="fields/date-examples.png" class="align-center"
alt="Examples of Date fields with different widgets" />

</div>

### Date & Time (<span class="title-ref">datetime</span>)

The `Date & Time` field is used to select a date on a calendar and a
time on a clock. The user's current time is automatically used if no
time is set.

- `Date`: used to record the time without displaying it on the UI.
- `Remaining days`: displays the remaining number of days before the
  selected date (e.g., *In 5 days*), based on the current date and time.

<div class="example">

<img src="fields/date-time-examples.png" class="align-center"
alt="Examples of Date &amp; Time fields with different widgets" />

</div>

### Checkbox (<span class="title-ref">boolean</span>)

The `Checkbox` field is used when a value should only be true or false,
indicated by checking or unchecking a checkbox.

- `Button`: displays a radio button. The widget works without switching
  to the edit mode.
- `Toggle`: displays a toggle button. The widget works without switching
  to the edit mode.

<div class="example">

<img src="fields/checkbox-examples.png" class="align-center"
alt="Examples of Checkbox fields with different widgets" />

</div>

### Selection (<span class="title-ref">selection</span>)

The `Selection` field is used when users should select a single value
from a group of predefined values.

- `Badge`: displays the value inside a rounded shape, similar to a tag.
  The value cannot be edited on the UI, but a default value can be set.

- `Badges`: displays all selectable values simultaneously inside
  rectangular shapes, organized horizontally.

- `Priority`: displays star symbols instead of values, which can be used
  to indicate an importance or satisfaction level, for example. This has
  the same effect as selecting the
  `Priority field <studio/fields/simple-fields/priority>`, although, for
  the latter, four priority values are already predefined.

- `Radio`: displays all selectable values at the same time as radio
  buttons.

  > [!TIP]
  > By default, radio buttons are organized vertically. Tick
  > `display horizontally` to switch the way they are displayed.

<div class="example">

<img src="fields/selection-examples.png" class="align-center"
alt="Examples of Selection fields with different widgets" />

</div>

### Priority (<span class="title-ref">selection</span>)

The `Priority` field is used to display a three-star rating system,
which can be used to indicate importance or satisfaction level. This
field type is a `Selection field
<studio/fields/simple-fields/selection>` with the `Priority` widget
selected by default and four priority values predefined. Consequently,
the `Badge`, `Badges`, `Radio`, and `Selection` widgets have the same
effects as described under
`Selection <studio/fields/simple-fields/selection>`.

> [!TIP]
> To change the number of available stars by adding or removing values,
> click `Edit
> Values`. Note that the first value is equal to 0 stars (i.e., when no
> selection is made), so having four values results in a three-star
> rating system, for example.

<div class="example">

<img src="fields/priority-example.png" class="align-center"
alt="Example of a Priority field" />

</div>

### File (<span class="title-ref">binary</span>)

The `File` field is used to upload any type of file, or sign a form
(`Sign` widget).

- `Image`: users can upload an image file, which is then displayed in
  `Form view
  <studio/views/general/form>`. This has the same effect as using the
  `Image field
  <studio/fields/simple-fields/image>`.
- `PDF Viewer`: users can upload a PDF file, which can be then browsed
  from the `Form view <studio/views/general/form>`.
- `Sign`: users can electronically sign the form. This has the same
  effect as selecting the
  `Sign field <studio/fields/simple-fields/sign>`.

<div class="example">

<img src="fields/file-examples.png" class="align-center"
alt="Examples of File fields with different widgets" />

</div>

### Image (<span class="title-ref">binary</span>)

The `Image` field is used to upload an image and display it in
`Form view
<studio/views/general/form>`. This field type is a `File field
<studio/fields/simple-fields/file>` with the `Image` widget selected by
default. Consequently, the `File`, `PDF Viewer`, and `Sign` widgets have
the same effects as described under
`File <studio/fields/simple-fields/file>`.

> [!TIP]
> To change the display size of uploaded images, select `Small`,
> `Medium`, or `Large` under the `Size` option.

### Sign (<span class="title-ref">binary</span>)

The `Sign` field is used to sign the form electronically. This field
type is a `File
field <studio/fields/simple-fields/file>` with the `Sign` widget
selected by default. Consequently, the `File`, `Image`, and `PDF Viewer`
widgets have the same effects as described under
`File <studio/fields/simple-fields/file>`.

> [!TIP]
> To give users the `Auto` option when having to draw their signature,
> select one of the available `Auto-complete with` fields
> (`Text <studio/fields/simple-fields/text>`,
> `Many2One <studio/fields/relational-fields/many2one>`, and
> `Related Field
> <studio/fields/relational-fields/related-field>` on the model only).
> The signature is automatically generated using the data from the
> selected field.

## Relational fields

Relational fields are used to link and display the data from records on
another model.

> [!NOTE]
> Non-default widgets, when available, are presented as bullet points
> below.

### Many2One (<span class="title-ref">many2one</span>)

The `Many2One` field is used to link another record (from another model)
to the record being edited. The record's name from the other model is
then displayed on the record being edited.

<div class="example">

On the *Sales Order* model, the `Customer` field is a `Many2One` field
pointing at the *Contact* model. This allows **many** sales orders to be
linked to **one** contact (customer).

<img src="fields/many2one-diagram.png" class="align-center"
alt="Diagram showing a many2one relationship" />

</div>

> [!TIP]
> - To prevent users from creating a new record in the linked model,
> tick `Disable
> creation`. - To prevent users from opening records in a pop-up window,
> tick `Disable opening`. - To help users only select the right record,
> click on `Domain` to create a filter.

- `Badge`: displays the value inside a rounded shape, similar to a tag.
  The value cannot be edited on the UI.
- `Radio`: displays all selectable values at the same time as radio
  buttons.

### One2Many (<span class="title-ref">one2many</span>)

The `One2Many` field is used to display the existing relations between a
record on the current model and multiple records from another model.

<div class="example">

You could add a `One2Many` field on the *Contact* model to look at
**one** customer's **many** sales orders.

<img src="fields/one2many-diagram.png" class="align-center"
alt="Diagram showing a one2many relationship" />

</div>

> [!NOTE]
> To use a `One2Many` field, the two models must have been linked
> already using a
> `Many2One field <studio/fields/relational-fields/many2one>`. One2Many
> relations do not exist independently: a reverse-search of existing
> Many2One relations is performed.

### Lines (<span class="title-ref">one2many</span>)

The `Lines` field is used to create a table with rows and columns (e.g.,
the lines of products on a sales order).

> [!TIP]
> To modify the columns, click on the `Lines` field and then
> `Edit List View`. To edit the form that pops up when a user clicks on
> `Add a line`, click on `Edit Form View` instead.

<div class="example">

<img src="fields/lines-example.png" class="align-center"
alt="Example of a Lines field" />

</div>

### Many2Many (<span class="title-ref">many2many</span>)

The `Many2Many` field is used to link multiple records from another
model to multiple records on the current model. Many2Many fields can use
`Disable creation`, `Disable opening`, `Domain`, just like
`Many2One fields
<studio/fields/relational-fields/many2one>`.

<div class="example">

On the *Task* model, the `Assignees` field is a `Many2Many` field
pointing at the *Contact* model. This allows a single user to be
assigned to **many** tasks and **many** users to be assigned to a single
task.

<img src="fields/many2many-diagram.png" class="align-center"
alt="Diagram showing many2many relationships" />

</div>

- `Checkboxes`: users can select several values using checkboxes.
- `Tags`: users can select several values appearing in rounded shapes,
  also known as *tags*. This has the same effect as selecting the
  `Tags field
  <studio/fields/relational-fields/tags>`.

### Tags (<span class="title-ref">many2many</span>)

The `Tags` field is used to display several values from another model
appearing in rounded shapes, also known as *tags*. This field type is a
`Many2Many field
<studio/fields/relational-fields/many2many>` with the `Tags` widget
selected by default. Consequently, the `Checkboxes` and `Many2Many`
widgets have the same effects as described under
`Many2Many <studio/fields/relational-fields/many2many>`.

> [!TIP]
> To display tags with different background colors, tick `Use colors`.

<div class="example">

<img src="fields/tags-example.png" class="align-center"
alt="Example of a Tags field" />

</div>

### Related Field (<span class="title-ref">related</span>)

A `Related Field` is not a relational field per se; no relationship is
created between models. It uses an existing relationship to fetch and
display information from another record.

<div class="example">

To display the email address of a customer on the *Sales Order* model,
use the `Related
Field` <span class="title-ref">partner_id.email</span> by selecting
`Customer` and then `Email`.

</div>

## Properties

- `Invisible`: When it is not necessary for users to view a field on the
  UI, tick `Invisible`. It helps clear the UI by only showing the
  essential fields depending on a specific situation.

  <div class="example">

  On the *Form* view of the *Contact* model, the `Title` field only
  appears when `Individual` is selected, as that field would not be
  helpful for a `Company` contact.

  </div>

  > [!NOTE]
  > The `Invisible` attribute also applies to Studio. To view hidden
  > fields inside Studio, click on a view's `View` tab and tick
  > `Show Invisible
  > Elements`.

- `Required`: If a field should always be completed by the user before
  being able to proceed, tick `Required`.

- `Read only`: If users should not be able to modify a field, tick
  `Read only`.

  > [!NOTE]
  > You can choose to apply these three properties only for specific
  > records by clicking on `Conditional` and creating a filter.

- `Label`: The `Label` is the field's name on the UI.

  > [!NOTE]
  > This is not the same name as used in the PostgreSQL database. To
  > view and change the latter, activate the
  > `Developer mode <developer-mode>`, and edit the `Technical Name`.

- `Help Tooltip`: To explain the purpose of a field, write a description
  under `Help Tooltip`. It is displayed inside a tooltip box when
  hovering with your mouse over the field's label.

- `Placeholder`: To provide an example of how a field should be
  completed, write it under `Placeholder`. It is displayed in light gray
  in lieu of the field's value.

- `Widget`: To change the default appearance or functionality of a
  field, select one of the available widgets.

- `Default value`: To add a default value to a field when a record is
  created, use `Default value`.

- `Limit visibility to groups`: To limit which users can see the field,
  select a user access group.
