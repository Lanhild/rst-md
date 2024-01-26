# Bills

Typical practices in restaurants or bars are to request the bill before
proceeding to payment or splitting it based on the items ordered. Odoo
POS provides two features to perform these tasks seamlessly: **Bill
Printing** and **Bill Splitting**.

## Configuration

To activate the bill printing and splitting features, go to `Point of
Sale -->
Configuration --> Point of sale` and select your POS. Then, scroll down
to the `Bills &
Receipts` section and enable `Bill Printing` and `Bill Splitting`.

![activate the bill printing and bill splitting features in the POS
settings](bill_printing/settings.png)

## Bill printing

From an open session, click `Bill --> Print` at any moment to generate
and print a bill.

<div class="note">

<div class="title">

Note

</div>

The printed bill is **not** final and will be updated to reflect any
changes to the order.

</div>

## Bill splitting

From an open session, click `Split` to select the items to regroup. Once
everything is selected, click `Payment` and proceed to checkout for
these items. Repeat for each guest.

<div class="note">

<div class="title">

Note

</div>

\- Once you return to the table, the selected items are no longer on
order, as they have been paid for. - The feature is available as soon as
at least two items are ordered.

</div>

<div class="seealso">

\- `floors_tables`

</div>
