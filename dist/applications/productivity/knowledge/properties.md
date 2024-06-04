# Properties

Properties are fields containing data and that can be added to articles
by any user with **write** access. These fields are shared between all
the child articles and article items under the same parent.

> [!NOTE]
> To be able to add properties, an article must be either a **child
> article** or an **article item**.

## Add property fields

Hover above the first-level header to make the buttons appear. Click
`⚙ Add
Properties --> Field Type`, select the type and add a default value if
needed. To make the fields appear in **kanban views**, check
`View in Kanban` as well. To validate and close the property creation
window, click anywhere.

<img src="properties/fields.png" class="align-center"
alt="Dropdown of property fields types" />

The different types assess what the field content can be:

| Types         | Uses                                           |
|---------------|------------------------------------------------|
| `Text`        | Allows adding any content with no restriction. |
| `Checkbox`    | Add a checkbox.                                |
| `Integer`     | Allows adding integer numbers.                 |
| `Decimal`     | Allows adding any number.                      |
| `Date`        | Allows selecting a date.                       |
| `Date & Time` | Allows selecting a date and time.              |

Some **field types** need to be configured:

<img src="properties/manyone.png" class="align-center"
alt="property configuration form" />

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 80%" />
</colgroup>
<thead>
<tr class="header">
<th>Types</th>
<th>Uses</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><code class="interpreted-text"
role="guilabel">Selection</code></p></td>
<td><p>Add a drop-down selection menu with restricted values that have
been set at the property creation.</p>
<p>To set it up, click <code class="interpreted-text"
role="guilabel">Add a Value</code> next to the <code
class="interpreted-text" role="guilabel">Values</code> field. Enter
predetermined values and press <strong>enter</strong> to validate; you
can enter as many values as needed. Click anywhere to close the property
creation window.</p></td>
</tr>
<tr class="even">
<td><p><code class="interpreted-text"
role="guilabel">Tags</code></p></td>
<td><p>Allows creating and applying as many tags as needed.</p>
<p>To set it up, enter your <span class="title-ref">new_tag</span> in
the <code class="interpreted-text" role="guilabel">Tags</code> field,
and press <strong>enter</strong> or click <code class="interpreted-text"
role="guilabel">Create "new_tag"</code>. Click anywhere to close the
window. Then, add the tags into the property field. To do so, click the
property field and choose from the created tags; enter the tags' name
and press <strong>enter</strong>; enter a new tag's name and create a
new one on the spot.</p></td>
</tr>
<tr class="odd">
<td><p><code class="interpreted-text"
role="guilabel">Many2one</code></p></td>
<td><p>Choose from a list of records that result from a model's domain.
You can only select one result.</p>
<p>To set it up, click <code class="interpreted-text"
role="guilabel">Search a Model</code> in the <code
class="interpreted-text" role="guilabel">Model</code> field, select the
model. Match all records by clicking <code class="interpreted-text"
role="guilabel">## Record(s)</code>, or filter the results by clicking
<code class="interpreted-text" role="guilabel">+ Add Filter</code> and
show the records by clicking <code class="interpreted-text"
role="guilabel">## Record(s)</code>.</p></td>
</tr>
<tr class="even">
<td><p><code class="interpreted-text"
role="guilabel">Many2many</code></p></td>
<td><p>Choose from a list of records that result from a model's domain.
You can select as many results as needed.</p>
<p>To set it up, click <code class="interpreted-text"
role="guilabel">Search a Model</code> in the <code
class="interpreted-text" role="guilabel">Model</code> field, select the
model. Match all records by clicking <code class="interpreted-text"
role="guilabel">## Record(s)</code>, or filter the results by clicking
<code class="interpreted-text" role="guilabel">+ Add Filter</code> and
show the records by clicking <code class="interpreted-text"
role="guilabel">## Record(s)</code>.</p></td>
</tr>
</tbody>
</table>

## Delete property fields

To remove a property, click the **pencil** icon next to the targeted
property, then click `Delete --> Delete`.

> [!WARNING]
> Once a property field is deleted, you cannot retrieve it.

## Hide the property panel

To hide the property sidebar panel, click the gear `(⚙)` button.
