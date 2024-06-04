# Version control

Use Odoo's *Product Lifecycle Management (PLM)* to manage previous
versions of bills of materials (BoMs). Store former assembly
instructions, component details, and past product design files while
keeping the past details out of the production
`BoM (Bill of Materials)`.

Easily revert to previous `BoM (Bill of Materials)` versions, when
needed. Additionally, use *PLM* to trace which `BoM (Bill of Materials)`
version was active on specific dates for recalls or customer complaints.

Every `BoM (Bill of Materials)` version is stored in an *engineering
change order* (ECO) for organized testing and improvements without
disrupting normal manufacturing operations.

<div class="seealso">

`Engineering change order <plm/eco>`

</div>

## Current BoM version

To see the current version of the `BoM (Bill of Materials)` used in
production, go to `PLM app --> Master
Data --> Bill of Materials`, and select the desired
`BoM (Bill of Materials)` from the list. Then, switch to the
`Miscellaneous` tab, where the currently live `Version` of the
`BoM (Bill of Materials)` is displayed.

> [!NOTE]
> `BoMs (Bills of Materials)` can also be accessed from
> `Manufacturing app --> Products --> Bill of
> Materials`.

<img src="version_control/current-version.png" class="align-center"
alt="Show the current version BOM in the Misc tab." />

## Version history

To manage all former, current, and future versions of a
`BoM (Bill of Materials)`, begin by navigating to
`Manufacturing app --> Products --> Bills of Materials` and click the
desired `BoM (Bill of Materials)`.

From the `BoM (Bill of Materials)` page, click the `ECO` smart button,
and switch to list view by selecting the `≣ (four horizontal lines)`
icon on the top right corner.

> [!NOTE]
> The `ECO` smart button is visible on the `BoM (Bill of Materials)`
> **only** if the *PLM* app is installed.

<img src="version_control/eco-smart-button.png" class="align-center"
alt="Show ECO smart button on a BoM." />

In the list of `ECOs (Engineering Change Orders)` for the product,
navigate to the search bar at the top, and click the `▼ (down arrow)`
icon on the right to access a drop-down menu of `Filters`.

Next, filter by `Done` `ECOs (Engineering Change Orders)` to view: the
revision history of the `BoM (Bill of Materials)`, the `Responsible`
user who applied the change, and the `Effective Date` of the
`BoM (Bill of Materials)`.

Click each `ECO (Engineering Change Order)` to view the past components,
operations, and design files associated with the
`BoM (Bill of Materials)`.

<img src="version_control/eco-list.png" class="align-center"
alt="Display ECO revision history for a BoM for a product." />

> [!NOTE]
> If the `Effective Date` field is empty, the `Effective` date of the
> `ECO (Engineering Change Order)` is automatically set to
> `As soon as possible` and no dates are recorded in the revision
> history of the `BoM (Bill of Materials)`.
>
> <img src="version_control/no-effective-date.png" class="align-center"
> alt="List of BOM effective dates." />

> [!TIP]
> A workaround for checking when the `BoM (Bill of Materials)` went live
> is by navigating to the chatter, and hovering over the time the
> `ECO (Engineering Change Order)` was moved to the
> `closing stage <plm/eco/stage-config>`.

## Design files

Attach computer-aided design (CAD) files, PDFs, images, or other design
material to the `BoM (Bill of Materials)` itself.

To do so, navigate to `PLM app --> Master Data --> Bill of Materials`,
and select the desired `BoM (Bill of Materials)`. On the
`BoM (Bill of Materials)`, navigate to the *chatter*, and click the
`📎 (paperclip)` icon.

The files associated with the `BoM (Bill of Materials)` are displayed in
the `Files` section. To add more design files, select the `Attach files`
button.

<img src="version_control/attach-files.png" class="align-center"
alt="Show paperclip icon in the chatter to attach files to a BoM." />

### Manage design files in an ECO

Add, modify, and remove files in an `ECO (Engineering Change Order)`.
Once the `ECO (Engineering Change Order)` is approved and applied, the
new files are automatically linked to the production
`BoM (Bill of Materials)`. Archived files are removed from the
`BoM (Bill of Materials)`, but are still accessible in the
`ECO (Engineering Change Order)`.

To manage the design files in the `ECO (Engineering Change Order)`,
begin by navigating to `PLM app --> Changes` and choose the desired
`ECO (Engineering Change Order)`. Next, open the `Attachments` page by
clicking the `Documents` smart button.

Hover over each attachment to reveal the `︙ (three vertical dots)`
icon. From there, choose whether to `Edit`, `Remove`, or `Download` the
file. Any changes made to these files are contained within the
`ECO (Engineering Change Order)`, and will only apply to the production
`BoM (Bill of Materials)` once the
`changes are applied <plm/eco/apply-changes>`.

<div class="example">

In the <span class="title-ref">Create 60% keyboard</span>
`ECO (Engineering Change Order)`, the design files are from the original
<span class="title-ref">100% keyboard</span> `BoM (Bill of Materials)`.
To replace the keyboard PDF, begin by selecting the `Documents` smart
button.

<img src="version_control/documents-smart-button.png"
class="align-center"
alt="Show *Documents* smart button from an active ECO." />

On the `Attachments` page, hover over the <span class="title-ref">100%
keyboard manual.pdf</span> design file, and click the
`︙ (three vertical dots)` icon. Then, click the `Remove` option to
archive the file.

Next, on the same `Attachments` page, click the `Upload` button to
upload the new design file, named <span class="title-ref">60% keyboard
manual</span>.

<img src="version_control/attachments.png" class="align-center"
alt="View of *Attachments* page from the *Documents* smart button. Displays one archived and
one newly added attachment." />

</div>

> [!NOTE]
> Archived files are **not** permanently deleted — they can still be
> accessed in the previous `ECO (Engineering Change Order)`, or as an
> archived file in the latest `ECO (Engineering Change Order)`, where
> the archival occurred.

## Apply rebase

Odoo simplifies merge conflict resolution for concurrent
`ECOs (Engineering Change Orders)` on the same product.

Conflicts can occur when the production `BoM (Bill of Materials)` is
updated while other `ECOs (Engineering Change Orders)` are modifying the
previous version. Differences between the new and previous production
`BoMs (Bills of Materials)` are displayed in the
`Previous Eco Bom Changes` tab, visible only in this scenario.

To resolve conflicts and retain `ECO (Engineering Change Order)`
changes, click the `Apply Rebase` button.

<div class="example">

Two `ECOs (Engineering Change Orders)`,
<span class="title-ref">ECO0011</span> and
<span class="title-ref">ECO0012</span>, are created when the current
`BoM (Bill of Materials)` version is <span class="title-ref">5</span>.
In <span class="title-ref">ECO0011</span>, a new component,
<span class="title-ref">Space stabilizer</span>, is added, and the
changes are applied. This means the current `BoM (Bill of Materials)`
version has become <span class="title-ref">6</span>.

<img src="version_control/branch-change.png" class="align-center"
alt="Apply changes to an ECO to update the production BOM." />

This means <span class="title-ref">ECO0012</span> is modifying an
outdated `BoM (Bill of Materials)`. As shown in the `Previous Eco Bom
Changes` tab, the `BoM (Bill of Materials)` is missing the
<span class="title-ref">Space stabilizer</span>.

To ensure the changes applied by <span class="title-ref">ECO0011</span>
are kept when the changes occur in
<span class="title-ref">ECO0012</span>, click the `Apply Rebase` button
to apply the previous `ECO (Engineering Change Order)` changes, without
affecting the changes already made to
<span class="title-ref">ECO0012</span>.

<img src="version_control/merge-change.png" class="align-center"
alt="Click the *Apply Rebase* button to update the BOM to match the production BOM." />

</div>
