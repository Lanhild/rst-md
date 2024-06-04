# Models, modules, and apps

Models determine the logical structure of a database and how data is
stored, organized, and manipulated. In other words, a model is a table
of information that can be linked with other tables. A model usually
represents a business concept, such as a *sales order*, *contact*, or
*product*.

Modules and apps contain various elements, such as models, views, data
files, web controllers, and static web data.

> [!NOTE]
> All apps are modules. Larger, standalone modules are typically
> referred to as apps, whereas other modules usually serve as add-ons to
> said apps.

## Suggested features

When you create a new model or app with Studio, you can choose to add up
to 14 features to speed up the creation process. These features bundle
fields, default settings, and views that are usually used together to
provide some standard functionality. Most of these features can be added
later on, but adding them from the start makes the model creation
process much easier. Furthermore, these features interact together in
some cases to increase their usefulness.

<div class="example">

Creating a model with the
`studio/models-modules-apps/suggested-features/picture` and
`studio/models-modules-apps/suggested-features/pipeline-stages` features
enabled adds the image in the card layout of the
`Kanban view <studio/views/multiple-records/kanban>`.

<img src="models_modules_apps/picture-pipeline-kanban.png"
class="align-center"
alt="Combination of the Picture and Pipeline stages features on the Kanban view" />

</div>

### Contact details

Selecting `Contact details` adds to the
`Form view <studio/views/general/form>` a
`Many2One field <studio/fields/relational-fields/many2one>` linked to
the *Contact* model and two of its
`Related Fields <studio/fields/relational-fields/related-field>`:
`Phone` and `Email`. The `Contact` field is also added to the `List view
<studio/views/multiple-records/list>`, and the
`Map view <studio/views/multiple-records/map>` is activated.

<div class="example">

<img src="models_modules_apps/contact.png" class="align-center"
alt="Contact details feature on the Form view" />

</div>

### User assignment

Selecting `User assignment` adds to the
`Form view <studio/views/general/form>` a
`Many2One field <studio/fields/relational-fields/many2one>` linked to
the *Contact* model, with the following `Domain`:
<span class="title-ref">Share User is not set</span> to only allow the
selection of *Internal Users*. In addition, the `many2one_avatar_user`
widget is used to display the user's avatar. The `Responsible` field is
also added to the `List view
<studio/views/multiple-records/list>`.

<div class="example">

<img src="models_modules_apps/user-assignment.png" class="align-center"
alt="User assignment feature on the Form view" />

</div>

### Date & Calendar

Selecting `Date & Calendar` adds to the
`Form view <studio/views/general/form>` a
`Date field <studio/fields/simple-fields/date>` and activates the
`Calendar view
<studio/views/timeline/calendar>`.

### Date range & Gantt

Selecting `Date range & Gantt` adds to the
`Form view <studio/views/general/form>` two
`Date fields <studio/fields/simple-fields/date>` next to each other: one
to set a start date, the other to set an end date, using the `daterange`
widget, and activates the `Gantt view <studio/views/timeline/gantt>`.

### Pipeline stages

Selecting `Pipeline stages` activates the `Kanban view
<studio/views/multiple-records/kanban>`, adds several fields such as
`Priority
<studio/fields/simple-fields/priority>` and `Kanban State`, and three
stages: `New`, `In Progress`, and `Done`. The `Pipeline status bar` and
the `Kanban State` field are added to the `Form view
<studio/views/general/form>`. The `Color` field is added to the
`List view
<studio/views/multiple-records/list>`.

> [!NOTE]
> The `Pipeline stages` feature can be added at a later stage.

### Tags

Selecting `Tags` adds to the `studio/views/general/form` and
`studio/views/multiple-records/list` views a `Tags field
<studio/fields/relational-fields/tags>`, creating a *Tag* model with
preconfigured access rights in the process.

### Picture

Selecting `Picture` adds to the top-right of the `Form view
<studio/views/general/form>` an
`Image field <studio/fields/simple-fields/image>`.

> [!NOTE]
> The `Picture` feature can be added at a later stage.

### Lines

Selecting `Lines`: adds to the `Form view <studio/views/general/form>` a
`Lines
field <studio/fields/relational-fields/lines>` inside a `Tab` component.

### Notes

Selecting `Notes` adds to the `Form view <studio/views/general/form>` an
`Html
field <studio/fields/simple-fields/html>` using the full width of the
form.

### Monetary value

Selecting `Monetary value` adds to the `studio/views/general/form` and
`studio/views/multiple-records/list` views a `Monetary field
<studio/fields/simple-fields/monetary>`. The
`studio/views/reporting/graph` and `studio/views/reporting/pivot` views
are also activated.

> [!NOTE]
> A *Currency* field is added and hidden from the view.

### Company

Selecting `Company` adds to the `studio/views/general/form` and
`studio/views/multiple-records/list` views a `Many2One field
<studio/fields/relational-fields/many2one>` linked to the *Company*
model.

> [!NOTE]
> This is only useful if you work in a multi-company environment.

### Custom Sorting

Selecting `Custom Sorting` adds to the `List view
<studio/views/multiple-records/list>` a drag handle icon to manually
reorder records.

<div class="example">

<img src="views/list-drag-handle.png" class="align-center"
alt="Custom Sorting feature on the List view" />

</div>

### Chatter

Selecting `Chatter` adds to the `Form view <studio/views/general/form>`
Chatter functionalities (sending messages, logging notes, and scheduling
activities).

> [!NOTE]
> The `Chatter` feature can be added at a later stage.

<div class="example">

<img src="models_modules_apps/chatter.png" class="align-center"
alt="Chatter feature on the Form view" />

</div>

### Archiving

Selecting `Archiving` adds to the `studio/views/general/form` and
`studio/views/multiple-records/list` views the `Archive` action and
hides archived records from searches and views by default.

## Export and import customizations

When you do any customization with Studio, a new module named
`Studio customizations` is added to your database.

To export these customizations, go to
`Main dashboard --> Studio --> Customizations
--> Export` to download a ZIP file containing all customizations.

To import and install these customizations in another database, connect
to the destination database and go to
`Main dashboard --> Studio --> Customizations --> Import`, then upload
the exported ZIP file before clicking on the `Import` button.

> [!WARNING]
> Before importing, make sure the destination database contains the same
> apps and modules as the source database. Studio does not add the
> underlying modules as dependencies of the exported module.
