# Authorize.Net

[Authorize.Net](https://www.authorize.net) is a United States-based
online payment solution provider allowing businesses to accept **credit
cards**. Among others, it offers the ability to process customer
payments after delivery.

## Authorize.Net account

First, choose a plan and [create an Authorize.Net
account](https://www.authorize.net/sign-up/pricing.html).

Odoo needs the Authorize.Net account's **API credentials and keys** to
connect to it, which comprises the:

  - API login ID,
  - Transaction key, and
  - Signature key.

To retrieve them, log in to Authorize.Net and go to `Account -->
Security Settings:
API Credentials & Keys`. While the `API Login ID` is displayed, both
keys need to be generated.

To do so, select `New Transaction Key` and click `Submit`. Copy the key
and store it somewhere secure as it will not be displayed afterward.
Repeat the same process for the `Signature Key`.

![Generating the transaction and signature keys on
Authorize.Net](authorize/authorize-api-keys.png)

<div class="seealso">

[Authorize.Net Getting Started
Guide](https://support.authorize.net/knowledgebase/Knowledgearticle/?code=000002939)

</div>

## Configuration

<div class="seealso">

Refer to the `payment acquirers documentation <../payment_acquirers>`
for more information about general configuration options.

</div>

To activate Authorize.Net as a payment acquirer in Odoo, go to
`Accounting -->
Configuration --> Payment Acquirers`. Find `Authorize.Net`, click the
`Activate` button, and change the `State` to `Enabled`.

### Credentials

Fill in the `API Login Id`, `API Transaction Key`, and `API Signature
Key` fields with the values displayed or generated on Authorize.Net's
`API Credentials &
Keys` page, and `Save`.

<div class="note">

<div class="title">

Note

</div>

An `API Client Key` is only necessary if the `Payment from Odoo` option
is selected as `Payment Flow <payment_acquirers/payment_flow>`.

</div>

<div class="important">

<div class="title">

Important

</div>

To test Authorize.Net with a **sandbox account**, first change the
`State` field to `Test Mode`. It is recommended to do so on a test Odoo
database, rather than on a production database.

<div class="note">

<div class="title">

Note

</div>

If the `Test Mode` is used with the credentials of a non-sandbox
account, it will result in the following error: *The merchant login ID
or password is invalid or the account is inactive*.

</div>

</div>

### Payment flow

It is possible either to redirect users to Authorize.Net's portal to
authenticate the payment or to keep users on the current page and
authenticate the payment from Odoo.

To configure the payment flow, go to `Accounting --> Configuration -->
Payment
Acquirers --> Authorize.Net --> Configuration tab`. Under `Payment
Flow`, select `Redirection to the acquirer website` or `Payment from
Odoo` and `Save`.

#### Payment from Odoo

If `Payment from Odoo` is selected, an `API Client Key` is needed. To
generate one, go to `Accounting --> Configuration --> Payment Acquirers
--> Authorize.Net -->
Credentials tab`. Click `Generate Client Key` to automatically fill in
the `API
Client Key` field and `Save`.

#### Redirection to the acquirer website

If `Redirection to the acquirer website` is selected, a `Default Receipt
URL` and `Default Relay Response URL` should be added to the
Authorize.Net account.

To do so, log in to Authorize.Net, and go to `Account --> Transaction
Format
Settings: Response/Receipt URLs`. Click `Add URL`, enter the URL
following the format below, and click `Submit`:

  - `Default Receipt URL`: add
    <span class="title-ref">/payment/authorize/return</span> after the
    main website URL.
    
    <div class="example">
    
    <span class="title-ref">https://example.odoo.com/payment/authorize/return</span>
    
    </div>

  - `Default Relay Response URL`: add
    <span class="title-ref">/shop/confirmation</span> after the main
    website URL.
    
    <div class="example">
    
    <span class="title-ref">https://example.odoo.com/shop/confirmation</span>
    
    </div>

![Adding the response and receipt URLs on
Authorize.Net](authorize/authorize-redirect-urls.png)

<div class="note">

<div class="title">

Note

</div>

Failing to complete this step results in the following error: *The
referrer, relay response or receipt link URL is invalid*.

</div>

### Capture payments after delivery

To reserve funds for 30 days on the customer's card without charging
them yet, go to `Accounting --> Configuration --> Payment Acquirers -->
Authorize.Net -->
Configuration tab`, enable `Capture Amount Manually`, and `Save`.

To capture the payment, go to the related sales order and click `Capture
Transaction`. If the order is canceled, click `Void Transaction` to
unlock the funds from the customer's card.

![Capturing the payment manually](authorize/authorize-capture.png)

<div class="warning">

<div class="title">

Warning

</div>

After **30 days**, transactions are **voided automatically** by
Authorize.Net.

</div>

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
    settlement. All transactions within the two batch settlements will
    be exported to Odoo.
  - Select all transactions within the desired range, copy them, and
    paste them into the `Report 1 Download` sheet of the `Excel import
    template
    <authorize-import-template>`.

![Selecting Authorize.Net transactions to
import](authorize/authorize-report1.png)

<div class="example">

![Settlement batch of an Authorize.Net
statement](authorize/authorize-settlement-batch.png)

In this case, the first batch (01/01/2021) of the year belongs to the
settlement of 12/31/2020, so the **opening** settlement is from
12/31/2020.

</div>

Once the data is in the `Report 1 Download` sheet:

  - Go to the `Transaction Search` tab on Authorize.Net.
  - Under the `Settlement Date` section, select the previously used
    range of batch settlement dates in the `From:` and `To:` fields and
    click `Search`.
  - When the list has been generated, click `Download to File`.
  - In the pop-up window, select `Expanded Fields with CAVV
    Response/Comma Separated`, enable `Include Column Headings`, and
    click `Submit`.
  - Open the text file, select `All`, copy the data, and paste it into
    the `Report
    2 Download` sheet of the `Excel import template
    <authorize-import-template>`.
  - Transit lines are automatically filled in and updated in the
    `transit for report 1` and `transit for report 2` sheets of the
    `Excel import template
    <authorize-import-template>`. Make sure all entries are present, and
    **if not**, copy the formula from previously filled-in lines of the
    `transit for report 1` or `2` sheets and paste it into the empty
    lines.

<div class="important">

<div class="title">

Important

</div>

To get the correct closing balance, **do not remove** any line from the
Excel sheets.

</div>

### Import into Odoo

To import the data into Odoo:

  - Open the `Excel import template <authorize-import-template>`.
  - Copy the data from the `transit for report 2` sheet and use *paste
    special* to only paste the values in the `Odoo Import to CSV` sheet.
  - Look for *blue* cells in the `Odoo Import to CSV` sheet. These are
    chargeback entries without any reference number. As they cannot be
    imported as such, go to `Authorize.Net --> Account --> Statements
    --> eCheck.Net Settlement Statement`.
  - Look for `Charge Transaction/Chargeback`, and click it.
  - Copy the invoice description, paste it into the `Label` cell of the
    `Odoo
    Import to CSV` sheet, and add <span class="title-ref">Chargeback
    /</span> before the description.
  - If there are multiple invoices, add a line into the `Excel import
    template
    <authorize-import-template>` for each invoice and copy/paste the
    description into each respective `Label` line.

<div class="note">

<div class="title">

Note

</div>

For **combined chargeback/returns** in the payouts, create a new line in
the `Excel import
template <authorize-import-template>` for each invoice.

</div>

<div class="example">

![Chargeback description](authorize/authorize-chargeback-desc.png)

</div>

  - Next, delete *zero transaction* and *void transaction* line items,
    and change the format of the `Amount` column in the `Odoo Import to
    CSV` sheet to *Number*.
  - Go back to `eCheck.Net Settlement Statement --> Search for a
    Transaction` and search again for the previously used batch
    settlements dates.
  - Verify that the batch settlement dates on eCheck.Net match the
    related payments' dates found in the `Date` column of the `Odoo
    Import to CSV`.
  - If it does not match, replace the date with the one from eCheck.Net.
    Sort the column by *date*, and make sure the format is
    <span class="title-ref">MM/DD/YYYY</span>.
  - Copy the data - column headings included - from the `Odoo Import to
    CSV` sheet, paste it into a new Excel file, and save it using the
    CSV format.
  - Open the Accounting app, go to `Configuration --> Journals`, tick
    the `Authorize.Net` box, and click `Favorites --> Import records -->
    Load
    file`. Select the CSV file and upload it into Odoo.

<div class="tip">

<div class="title">

Tip

</div>

List of [eCheck.Net return
codes](https://support.authorize.net/knowledgebase/Knowledgearticle/?code=000001293)

</div>

<div class="seealso">

\- [Authorize.Net: Getting Started
Guide](https://support.authorize.net/s/article/Authorize-Net-Getting-Started-Guide)
- `../payment_acquirers` -
`../../websites/ecommerce/shopper_experience/payment_acquirer`

</div>
