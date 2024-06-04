# Authorize.Net

[Authorize.Net](https://www.authorize.net) is a United States-based
online payment solution provider, allowing businesses to accept **credit
cards**.

## Configuration

<div class="seealso">

\- `payment_providers/add_new`

</div>

### Credentials tab

Odoo needs your **API Credentials & Keys** to connect with your
Authorize.Net account, which comprise:

- **API Login ID**: The ID solely used to identify the account with
  Authorize.Net.
- **API Transaction Key**
- **API Signature Key**
- **API Client Key**

To retrieve them, log into your Authorize.Net account, go to
`Account --> Settings
--> Security Settings --> API Credentials & Keys`, generate your
**Transaction Key** and **Signature Key**, and paste them on the related
fields in Odoo. Then, click on **Generate Client Key**.

> [!IMPORTANT]
> To test Authorize.Net with a *sandbox* account, change the `State` to
> `Test
> Mode`. We recommend doing this on a test Odoo database, rather than on
> your main database.
>
> If you use the `Test Mode` with a regular account, it results in the
> following error: *The merchant login ID or password is invalid or the
> account is inactive*.

### Configuration tab

#### Place a hold on a card

With Authorize.Net, you can enable the `manual capture
<payment_providers/manual_capture>`. If enabled, the funds are reserved
for 30 days on the customer's card, but not charged yet.

> [!WARNING]
> After **30 days**, the transaction is **voided automatically** by
> Authorize.Net.

<div class="seealso">

\- `../payment_providers`

</div>

## ACH payments (USA only)

`ACH (automated clearing house)` is an electronic funds transfer system
used between bank accounts in the United States.

### Configuration

To give customers the possibility to pay using ACH, [sign up for
Authorize.Net eCheck's
service](https://www.authorize.net/payments/echeck.html). Once eCheck is
activated, duplicate the previously configured Authorize.Net payment
provider on Odoo by going to `Accounting
--> Configuration --> Payment Providers --> Authorize.net --> ⛭ Action --> Duplicate`.
Then, change the provider's name to differentiate both versions (e.g.,
<span class="title-ref">Authorize.net - Banks</span>).

Open the `Configuration` tab, set the `Allow Payments From` field to
`Bank Account (USA only)`.

When ready, change the provider's `State` to `Enabled` for a regular
account or `Test Mode` for a sandbox account.

## Import an Authorize.Net statement

### Export from Authorize.Net

<div id="authorize-import-template">

<div class="admonition">

Template

[Download the Excel import
template](https://docs.google.com/spreadsheets/d/1CMVtBWLLVIrUpYA92paw-cL7-WdKLbaa/edit?usp=share_link&ouid=105295722917050444558&rtpof=true&sd=true)

</div>

</div>

To export a statement:

- Log in to Authorize.Net.
- Go to `Account --> Statements --> eCheck.Net Settlement Statement`.
- Define an export range using an *opening* and *closing* batch
  settlement. All transactions within the two batch settlements will be
  exported to Odoo.
- Select all transactions within the desired range, copy them, and paste
  them into the `Report 1 Download` sheet of the `Excel import template
  <authorize-import-template>`.

![Selecting Authorize.Net transactions to import](authorize/authorize-report1.png)

<div class="example">

<img src="authorize/authorize-settlement-batch.png" class="align-center"
alt="Settlement batch of an Authorize.Net statement" />

In this case, the first batch (01/01/2021) of the year belongs to the
settlement of 12/31/2020, so the **opening** settlement is from
12/31/2020.

</div>

Once the data is in the `Report 1 Download` sheet:

- Go to the `Transaction Search` tab on Authorize.Net.
- Under the `Settlement Date` section, select the previously used range
  of batch settlement dates in the `From:` and `To:` fields and click
  `Search`.
- When the list has been generated, click `Download to File`.
- In the pop-up window, select
  `Expanded Fields with CAVV Response/Comma Separated`, enable
  `Include Column Headings`, and click `Submit`.
- Open the text file, select `All`, copy the data, and paste it into the
  `Report
  2 Download` sheet of the
  `Excel import template <authorize-import-template>`.
- Transit lines are automatically filled in and updated in the
  `transit for report 1` and `transit for report 2` sheets of the
  `Excel import template
  <authorize-import-template>`. Make sure all entries are present, and
  **if not**, copy the formula from previously filled-in lines of the
  `transit for report 1` or `2` sheets and paste it into the empty
  lines.

> [!IMPORTANT]
> To get the correct closing balance, **do not remove** any line from
> the Excel sheets.

### Import into Odoo

To import the data into Odoo:

- Open the `Excel import template <authorize-import-template>`.
- Copy the data from the `transit for report 2` sheet and use *paste
  special* to only paste the values in the `Odoo Import to CSV` sheet.
- Look for *blue* cells in the `Odoo Import to CSV` sheet. These are
  chargeback entries without any reference number. As they cannot be
  imported as such, go to
  `Authorize.Net --> Account --> Statements --> eCheck.Net Settlement Statement`.
- Look for `Charge Transaction/Chargeback`, and click it.
- Copy the invoice description, paste it into the `Label` cell of the
  `Odoo
  Import to CSV` sheet, and add <span class="title-ref">Chargeback
  /</span> before the description.
- If there are multiple invoices, add a line into the
  `Excel import template
  <authorize-import-template>` for each invoice and copy/paste the
  description into each respective `Label` line.

> [!NOTE]
> For **combined chargeback/returns** in the payouts, create a new line
> in the `Excel import
> template <authorize-import-template>` for each invoice.

<div class="example">

![Chargeback description](authorize/authorize-chargeback-desc.png)

</div>

- Next, delete *zero transaction* and *void transaction* line items, and
  change the format of the `Amount` column in the `Odoo Import to CSV`
  sheet to *Number*.
- Go back to
  `eCheck.Net Settlement Statement --> Search for a Transaction` and
  search again for the previously used batch settlements dates.
- Verify that the batch settlement dates on eCheck.Net match the related
  payments' dates found in the `Date` column of the
  `Odoo Import to CSV`.
- If it does not match, replace the date with the one from eCheck.Net.
  Sort the column by *date*, and make sure the format is
  <span class="title-ref">MM/DD/YYYY</span>.
- Copy the data - column headings included - from the
  `Odoo Import to CSV` sheet, paste it into a new Excel file, and save
  it using the CSV format.
- Open the Accounting app, go to `Configuration --> Journals`, tick the
  `Authorize.Net` box, and click `Favorites --> Import records --> Load
  file`. Select the CSV file and upload it into Odoo.

> [!TIP]
> List of [eCheck.Net return
> codes](https://support.authorize.net/knowledgebase/Knowledgearticle/?code=000001293)
