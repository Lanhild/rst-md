# GS1 barcode nomenclature

<div id="barcode/operations/gs1">

[GS1 nomenclature](https://www.gs1us.org/) consolidates various product
and supply chain data into a single barcode. Odoo takes in [unique
Global Trade Item Numbers](https://www.gs1.org/standards/get-barcodes)
(GTIN), purchased by businesses, to enable global shipping, sales, and
eCommerce product listing.

</div>

Configure GS1 nomenclature to scan barcodes of sealed boxes and identify
essential product information, such as
`GTIN (Global Trade Item Number)`, lot number, quantity information, and
more.

> [!IMPORTANT]
> `GTINs (Global Trade Item Numbers)` are unique product identification
> that **must** be [purchased from
> GS1](https://www.gs1.org/standards/get-barcodes) to use GS1 barcodes.

<div class="seealso">

\- [All GS1
barcodes](https://www.gs1.org/standards/barcodes/application-identifiers) -
`Odoo's default GS1 rules <barcode/operations/default-gs1-nomenclature-list>` -
`Why's my barcode not working? <barcode/operations/troubleshooting>`

</div>

## Set up barcode nomenclature

To use GS1 nomenclature, navigate to the
`Inventory app --> Configuration -->
Settings`. Then under the `Barcode` section, check the `Barcode Scanner`
box. Next, select `Barcode Nomenclature --> Default GS1 Nomenclature`
from the default barcode nomenclature options.

<img src="gs1_nomenclature/setup-gs1-nomenclature.png"
class="align-center"
alt="Choose GS1 from dropdown and click the external link to see the list of GS1 rules." />

The list of GS1 *rules* and *barcode patterns* Odoo supports by default
is accessible by clicking the `➡️ (arrow)` icon to the right of the
`Barcode Nomenclature` selection.

In the `Open: Nomenclature` pop-up table, view and edit the GS1
`Rule Names` available in Odoo. The table contains all the information
that can be condensed with a GS1 barcode, along with the corresponding
`Barcode Pattern`.

> [!TIP]
> After setting GS1 as the barcode nomenclature, the
> `Barcode Nomenclatures` settings can also be accessed by a hidden menu
> that's discoverable after enabling `developer
> mode <developer-mode>`. Once enabled, navigate to the
> `Inventory app -->
> Configuration --> Barcode Nomenclatures` menu and finally, select
> `Default GS1
> Nomenclature`.

## Use GS1 barcodes in Odoo

For product identification using GS1 barcodes in Odoo, businesses obtain
a [unique GTIN](https://www.gs1.org/standards/get-barcodes) as an
internationally distinct product identifier purchased from GS1. This
`GTIN (Global Trade Item Number)` is combined with specific product
details following GS1's designated *barcode pattern*. The barcode
pattern's arrangement of numbers and letters must adhere to GS1
conventions for accurate interpretation by global systems along the
supply chain.

Every barcode starts with a 2-4 digit [application
identifier](https://www.gs1.org/standards/barcodes/application-identifiers)
(A.I.). This required prefix universally indicates what kind of
information the barcode contains. Odoo follows GS1 rules for identifying
information, as detailed in the `default GS1 rules list
<barcode/operations/default-gs1-nomenclature-list>`. Including the
relevant `A.I. (Application Identifier)` from the list enables Odoo to
correctly interpret GS1 barcodes. While most barcode patterns have a
fixed length requirement, certain ones, such as lots and serial numbers,
have flexible length.

> [!TIP]
> For flexible-length barcode patterns not placed at the end of the GS1
> barcode, use the FNC1 separator (<span class="title-ref">x1D</span>)
> to end the barcode.
>
> Example: The barcode pattern for lot numbers is 20 characters long.
> Instead of creating a 20-character lot number barcode, like
> <span class="title-ref">LOT00000000000000001</span>, use the FNC1
> separator to make it shorter:
> <span class="title-ref">LOT001x1D</span>.

Refer to the
`GS1 nomenclature list <barcode/operations/default-gs1-nomenclature-list>`
to see a comprehensive list of all barcode patterns and rules to follow.
Otherwise, refer to `this
GS1 usage doc <barcode/operations/gs1_usage>` for specific examples of
combining `GTIN (Global Trade Item Number)` to product information and
configuring the workflow.

<div class="seealso">

\- `Lots workflow <barcode/operations/gs1-lots>` -
`Non-unit quantities workflow <barcode/operations/quantity-ex>`

</div>

### Create rules

GS1 rules are a specific format of information contained in the barcode,
beginning with an `A.I. (Application Identifier)` and containing a
defined length of characters. Scanning GS1 barcodes from the
`default GS1 list
<barcode/operations/default-gs1-nomenclature-list>` auto-fills
corresponding data in the Odoo database.

Adding GS1 barcode rules in Odoo ensures accurate interpretation of
unique, non-standard GS1 formats.

To do so, begin by turning on `developer mode <developer-mode>` and
navigating to the `Barcode Nomenclatures` list in
`Inventory app --> Configuration -->
Barcode Nomenclatures`. Then, select the `Default GS1 Nomenclature` list
item.

On the `Default GS1 Nomenclature` page, select `Add a line` at the
bottom of the table, which opens a window to create a new rule. The
`Rule Name` field is used internally to identify what the barcode
represents. The barcode `Types` are different classifications of
information that can be understood by the system (e.g. product,
quantity, best before date, package, coupon). The `Sequence` represents
the priority of the rule; this means the smaller the value, the higher
the rule appears on the table. Odoo follows the sequential order of this
table and will use the first rule it matches based on the sequence. The
`Barcode
Pattern` is how the sequence of letters or numbers is recognized by the
system to contain information about the product.

After filling in the information, click the `Save & New` button to make
another rule or click `Save & Close` to save and return to the table of
rules.

## Barcode troubleshooting

Since GS1 barcodes are challenging to work with, here are some checks to
try when the barcodes are not working as expected:

1.  Ensure that the `Barcode Nomenclature` setting is set as
    `Default GS1
    Nomenclature`. Jump to the `nomenclature setup section
    <barcode/operations/set-up-barcode-nomenclature>` for more details.

2.  Ensure that the fields scanned in the barcode are enabled in Odoo.
    For example, to scan a barcode containing lots and serial numbers,
    make sure the `Lots & Serial Numbers` feature is enabled in
    `Odoo's settings <barcode/operations/lot-setup>` and `on the product
    <barcode/operations/lot-setup-on-product>`.

3.  Omit punctuation such as parentheses
    <span class="title-ref">()</span> or brackets
    <span class="title-ref">\[\]</span> between the `A.I. (Application
    Identifier)` and the barcode sequence. These are typically used in
    examples for ease of reading and should **not** be included in the
    final barcode. For more details on building GS1 barcodes, go to
    `this section <barcode/operations/create-GS1-barcode>`.

4.  When a single barcode contains multiple encoded fields, Odoo
    requires all rules to be listed in the barcode nomenclature for Odoo
    to read the barcode. `This section
    <barcode/operations/create-new-rules>` details how to add new rules
    in the barcode nomenclature.

5.  Test barcodes containing multiple encoded fields, piece by piece, to
    figure out which field is causing the issue.

    <div class="example">

    When testing a barcode containing the
    `GTIN (Global Trade Item Number)`, lot number, and quantity, start
    by scanning the `GTIN (Global Trade Item Number)` alone. Then, test
    the `GTIN (Global Trade Item Number)` with the lot number, and
    finally, try scanning the whole barcode.

    </div>

6.  After diagnosing the encoded field is unknown, `add new rules
    <barcode/operations/create-new-rules>` to Odoo's default list to
    recognize GS1 barcodes with unique specifications.

    > [!IMPORTANT]
    > While the new field will be read, the information won't link to an
    > existing field in Odoo without developer customizations. However,
    > adding new rules is necessary to ensure the rest of the fields in
    > the barcode are interpreted correctly.

## GS1 nomenclature list

The table below contains Odoo's default list of GS1 rules. Barcode
patterns are written in regular expressions. Only the first three rules
require a [check
digit](https://www.gs1.org/services/check-digit-calculator) as the final
character.

<table style="width:98%;">
<colgroup>
<col style="width: 31%" />
<col style="width: 10%" />
<col style="width: 22%" />
<col style="width: 15%" />
<col style="width: 17%" />
</colgroup>
<thead>
<tr class="header">
<th><blockquote>
<p>Rule Name</p>
</blockquote></th>
<th><blockquote>
<p>Type</p>
</blockquote></th>
<th><blockquote>
<p>Barcode Pattern</p>
</blockquote></th>
<th><blockquote>
<p>GS1 Content Type</p>
</blockquote></th>
<th><blockquote>
<p>Odoo field</p>
</blockquote></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Serial Shipping Container Code</td>
<td>Package</td>
<td>(00)(\d{18})</td>
<td>Numeric identifier</td>
<td>Package name</td>
</tr>
<tr class="even">
<td>Global Trade Item Number (GTIN)</td>
<td>Unit Product</td>
<td>(01)(\d{14})</td>
<td>Numeric identifier</td>
<td><code class="interpreted-text" role="guilabel">Barcode</code> field
on product form</td>
</tr>
<tr class="odd">
<td>GTIN of contained trade items</td>
<td>Unit Product</td>
<td>(02)(\d{14})</td>
<td>Numeric identifier</td>
<td>Packaging</td>
</tr>
<tr class="even">
<td>Ship to / Deliver to global location</td>
<td>Destination location</td>
<td>(410)(\d{13})</td>
<td>Numeric identifier</td>
<td>Destination location</td>
</tr>
<tr class="odd">
<td>Ship / Deliver for forward</td>
<td>Destination location</td>
<td>(413)(\d{13})</td>
<td>Numeric identifier</td>
<td>Source location</td>
</tr>
<tr class="even">
<td>I.D. of a physical location</td>
<td>Location</td>
<td>(414)(\d{13})</td>
<td>Numeric identifier</td>
<td>Location</td>
</tr>
<tr class="odd">
<td>Batch or lot number</td>
<td>Lot</td>
<td>(10) ([!"%-/0-9:-?A-Z_a-z]{0,20})</td>
<td>Alpha-numeric name</td>
<td>Lot</td>
</tr>
<tr class="even">
<td>Serial number</td>
<td>Lot</td>
<td>(21) ([!"%-/0-9:-?A-Z_a-z]{0,20})</td>
<td>Alpha-numeric name</td>
<td>Serial number</td>
</tr>
<tr class="odd">
<td>Packaging date (YYMMDD)</td>
<td>Packaging Date</td>
<td>(13)(\d{6})</td>
<td>Date</td>
<td>Pack date</td>
</tr>
<tr class="even">
<td>Best before date (YYMMDD)</td>
<td>Best before Date</td>
<td>(15)(\d{6})</td>
<td>Date</td>
<td>Best before date</td>
</tr>
<tr class="odd">
<td>Expiration date (YYMMDD)</td>
<td>Expiration Date</td>
<td>(17)(\d{6})</td>
<td>Date</td>
<td>Expiry date</td>
</tr>
<tr class="even">
<td>Variable count of items</td>
<td>Quantity</td>
<td>(30)(\d{0,8})</td>
<td>Measure</td>
<td>UoM: Units</td>
</tr>
<tr class="odd">
<td>Count of trade items</td>
<td>Quantity</td>
<td>(37)(\d{0,8})</td>
<td>Measure</td>
<td>Qty in units for containers (AI 02)</td>
</tr>
<tr class="even">
<td>Net weight: kilograms (kg)</td>
<td>Quantity</td>
<td>(310[0-5])(\d{6})</td>
<td>Measure</td>
<td>Qty in kg</td>
</tr>
<tr class="odd">
<td>Length in meters (m)</td>
<td>Quantity</td>
<td>(311[0-5])(\d{6})</td>
<td>Measure</td>
<td>Qty in m</td>
</tr>
<tr class="even">
<td>Net volume: liters (L)</td>
<td>Quantity</td>
<td>(315[0-5])(\d{6})</td>
<td>Measure</td>
<td>Qty in L</td>
</tr>
<tr class="odd">
<td>Net volume: cubic meters (m<sup>3</sup>)</td>
<td>Quantity</td>
<td>(316[0-5])(\d{6})</td>
<td>Measure</td>
<td>Qty in m<sup>3</sup></td>
</tr>
<tr class="even">
<td>Length in inches (in)</td>
<td>Quantity</td>
<td>(321[0-5])(\d{6})</td>
<td>Measure</td>
<td>Qty in inches</td>
</tr>
<tr class="odd">
<td>Net weight/volume: ounces (oz)</td>
<td>Quantity</td>
<td>(357[0-5])(\d{6})</td>
<td>Measure</td>
<td>Qty in oz</td>
</tr>
<tr class="even">
<td>Net volume: cubic feet (ft<sup>3</sup>)</td>
<td>Quantity</td>
<td>(365[0-5])(\d{6})</td>
<td>Measure</td>
<td>Qty in ft<sup>3</sup></td>
</tr>
<tr class="odd">
<td>Packaging type</td>
<td>Packaging Type</td>
<td>(91) ([!"%-/0-9:-?A-Z_a-z]{0,90})</td>
<td>Alpha-numeric name</td>
<td>Package type</td>
</tr>
</tbody>
</table>
