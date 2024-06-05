show-content  

# Expenses

Konvergo ERP **Expenses** streamlines the management of expenses. After an
employee submits their expenses in Konvergo ERP, the expenses are reviewed by
management and accounting teams. Once approved, payments can then be
processed and disbursed back to the employee for reimbursement(s).

<div class="seealso">

[Konvergo ERP Expenses: product page](https://www.odoo.com/app/expenses)

</div>

## Set expense categories

The first step to track expenses is to configure the different types of
expenses for the company (managed as *expense categories* in Konvergo ERP). Each
category can be as specific or generalized as needed. Go to
`Expenses app --> Configuration --> Expense Categories` to view the
current expensable categories in a default list view.

<img src="expenses/categories.png" class="align-center"
alt="Set expense costs on products." />

To create a new expense category, click `New`. A product form will
appear, with the description field labeled `Product Name`.

> [!NOTE]
> Expense categories are managed like products in Konvergo ERP. The expense
> category form follows the standard product form in Konvergo ERP, and the
> information entered is similar. Expense products will be referred to
> as expense categories throughout this document since the main menu
> refers to these as `Expense Categories`.

Only two fields are required, the `Product Name` and the
`Unit of Measure`. Enter the `Product Name` in the field, and select the
`Unit of Measure` from the drop-down menu (most products will be set to
`Units`).

> [!TIP]
> The *Sales* app is where specification on the units of measure are
> created and edited (e.g. units, miles, nights, etc.). Go to
> `Sales app --> Configuration --> Settings` and ensure
> <span class="title-ref">Units of Measure</span> is enabled in the
> <span class="title-ref">Product Catalog</span> section. Click on the
> `Units of Measure` internal link to
> `view, create, and edit the units of measure
> <../inventory_and_mrp/inventory/product_management/product_replenishment/uom>`.

<img src="expenses/new-expense-product.png" class="align-center"
alt="Set expense costs on products." />

The `Cost` field on the product form is populated with a value of
<span class="title-ref">0.00</span> by default. When a specific expense
should always be reimbursed for a particular price, enter that amount in
the `Cost` field. Otherwise, leave the `Cost` set to
<span class="title-ref">0.00</span>, and employees will report the
actual cost when submitting an expense report.

> [!NOTE]
> The `Cost` field is always visible on the expense category form, but
> the `Sales Price` field is *only* visible if the `Sales Price` is
> selected under the `Re-Invoice Expenses` section. Otherwise, the
> `Sales Price` field is hidden.

<div class="example">

Here are some examples for when to set a specific `Cost` on a product
vs. leaving the `Cost` at \`0.00\`:

- **Meals**: Set the `Cost` to <span class="title-ref">0.00</span>. When
  an employee logs an expense for a meal, they enter the actual amount
  of the bill and will be reimbursed for that amount. An expense for a
  meal costing \$95.23 would equal a reimbursement for \$95.23.
- **Mileage**: Set the `Cost` to <span class="title-ref">0.30</span>.
  When an employee logs an expense for "mileage", they enter the number
  of miles driven in the `Quantity` field, and are reimbursed 0.30 per
  mile they entered. An expense for 100 miles would equal a
  reimbursement for \$30.00.
- **Monthly Parking**: Set the `Cost` to
  <span class="title-ref">75.00</span>. When an employee logs an expense
  for "monthly parking", the reimbursement would be for \$75.00.
- **Expenses**: Set the `Cost` to <span class="title-ref">0.00</span>.
  When an employee logs an expense that is not a meal, mileage, or
  monthly parking, they use the generic `Expenses` product. An expense
  for a laptop costing \$350.00 would be logged as an `Expenses`
  product, and the reimbursement would be for \$350.00.

</div>

Select an `Expense Account` if using the Konvergo ERP *Accounting* app. It is
recommended to check with the accounting department to determine the
correct account to reference in this field as it will affect reports.

Set a tax on each product in the `Vendor Taxes` and `Customer Taxes`
fields, if applicable. It is considered good practice to use a tax that
is configured with `Tax Included
in Price <taxes/included-in-price>`. Taxes will be automatically
configured if this is set.

## Record expenses

### Manually create a new expense

To record a new expense, begin in the main `Expenses` app dashboard,
which presents the default `My Expenses` view. This view can also be
accessed from `Expenses app --> My Expenses --> My Expenses`.

First, click `New`, and then fill out the various fields on the form.

- `Description`: Enter a short description for the expense in the
  `Description` field. This should be short and informative, such as
  <span class="title-ref">lunch with client</span> or
  <span class="title-ref">hotel for conference</span>.

- `Category`: Select the expense category from the drop-down menu that
  most closely corresponds to the expense. For example, an airplane
  ticket would be appropriate for an expense `Category` named
  `Air Travel`.

- `Total`: Enter the total amount paid for the expense in one of two
  ways:

  1.  If the expense is for one single item/expense, and the category
      selected was for a single item, enter the cost in the `Total`
      field (the `Quantity` field is hidden).

  2.  If the expense is for multiples of the same item/expense with a
      fixed price, the `Unit Price` is displayed. Enter the quantity in
      the `Quantity` field, and the total cost is automatically updated
      with the correct total (the `Unit Price` x the `Quantity` = the
      total). Be advised, the word "total" does not appear, the total
      cost simply appears below the `Quantity`.

      <div class="example">

      For example, in the case of mileage driven, the `Unit Price` is
      populated as the cost *per mile*. Set the `Quantity` to the
      *number of miles* driven, and the total is calculated.

      </div>

- `Included Taxes`: If taxes were configured on the expense category,
  the tax percentage and amount appear automatically after entering
  either the `Total` or the `Quantity`.

  > [!NOTE]
  > When a tax is configured on an expense category, the
  > `Included Taxes` value will update in real time as the `Total` or
  > `Quantity` is updated.

- `Employee`: Using the drop-down menu, select the employee this expense
  is for.

- `Paid By`: Click the radio button to indicate who paid for the expense
  and should be reimbursed. If the employee paid for the expense (and
  should be reimbursed) select `Employee (to reimburse)`. If the company
  paid directly instead (e.g. if the company credit card was used to pay
  for the expense) select `Company`. Depending on the expense category
  selected, this field may not appear.

- `Bill Reference`: If there is any reference text that should be
  included for the expense, enter it in this field.

- `Expense Date`: Using the calendar module, enter the date the expense
  was incurred. Use the `< (left)` and `> (right)` arrows to navigate to
  the correct month, then click on the specific day to enter the
  selection.

- `Account`: Select the expense account that this expense should be
  logged on from the drop-down menu.

- `Customer to Reinvoice`: If the expense is something that should be
  paid for by a customer, select the `SO (Sales Order)` and customer
  that will be invoiced for this expense from the drop-down menu. All
  sales orders in the drop-down menu list both the `SO (Sales
  Order)` as well as the company the sales order is written for, but
  after the expense is saved, the customer name disappears and only the
  `SO (Sales Order)` is visible on the expense.

  <div class="example">

  A customer wishes to have an on-site meeting for a custom garden
  (design and installation) and agrees to pay for the expenses
  associated with it (such as travel, hotel, meals, etc.). All expenses
  tied to that meeting would indicate the sales order for the custom
  garden (which also references the customer) as the
  `Customer to Reinvoice`.

  </div>

- `Analytic Distribution`: Select the account(s) the expense should be
  written against from the drop-down menu for either `Projects`,
  `Departments`, or both. Multiple accounts can be listed for each
  category if needed. Adjust the percentage for each analytic account by
  typing in the percentage value next to the account.

- `Company`: If multiple companies are set up, select the company this
  expense should be filed for from the drop-down menu. The current
  company will automatically populate this field.

- `Notes...`: If any notes are needed in order to clarify the expense,
  enter them in the notes field.

<img src="expenses/expense-filled-in.png" class="align-center"
alt="A filled in expense form for a client lunch." />

#### Attach a receipt

After the expense is created, the next step is to attach a receipt.
Click the `Attach
Receipt` button, and a file explorer appears. Navigate to the receipt to
be attached, and click `Open`. The new receipt is recorded in the
chatter, and the number of receipts will appear next to the
`📎 (paperclip)` icon beneath the expense form. More than one receipt
can be attached to an individual expense, as needed. The number of
receipts attached to the expense will be noted on the paperclip icon.

<img src="expenses/receipt-icon.png" class="align-center"
alt="Attach a receipt and it appears in the chatter." />

### Create new expenses from a scanned receipt

Rather than manually inputting all of the information for an expense,
expenses can be created by scanning a PDF receipt.

First, in the main `Expenses` app dashboard view (this view can also be
accessed from `Expenses app --> My Expenses --> My Expenses`), click
`Scan`, and a file explorer pops up. Navigate to the receipt to be
uploaded, click on it to select it, and then click `Open`.

<img src="expenses/scan.png" class="align-center"
alt="Create an expense by scanning a receipt. Click Scan at the top of the Expenses dashboard
view." />

The receipt is scanned, and a new entry is created with today's date as
the `Expense
Date`, and any other fields it can populate based on the scanned data,
such as the total. Click on the new entry to open the individual expense
form, and make any changes needed. The scanned receipt appears in the
chatter.

### Automatically create new expenses from an email

Instead of individually creating each expense in the *Expenses* app,
expenses can be automatically created by sending an email to an email
alias.

To do so, first, an email alias needs to be configured. Go to
`Expenses app -->
Configuration --> Settings`. Ensure `Incoming Emails` is enabled.

<img src="expenses/email-alias.png" class="align-center"
alt="Create the domain alias by clicking the link." />

> [!NOTE]
> If the domain alias needs to be set up, `Setup your domain alias` will
> appear beneath the incoming emails check box instead of the email
> address field. Refer to this documentation for setup instructions and
> more information:
> `/applications/websites/website/configuration/domain_names`. Once the
> domain alias is configured, the email address field will be visible
> beneath the incoming emails section.

Next, enter the email address to be used in the email field, and then
click `Save`. Now that the email address has been entered, emails can be
sent to that alias to create new expenses without having to be in the
Konvergo ERP database.

To submit an expense via email, create a new email and enter the
product's *internal reference* code (if available) and the amount of the
expense in the email subject. Next, attach the receipt to the email.
Konvergo ERP creates the expense by taking the information in the email subject
and combining it with the receipt.

To check an expense categories internal reference, go to
`Expenses app -->
Configuration --> Expense Categories`. If an internal reference is
listed on the expense category, it is listed in the `Internal Reference`
column.

<img src="expenses/ref.png" class="align-center"
alt="Internal reference numbers are listed in the main Expense Categories view." />

To add an internal reference on an expense category, click on the
category to open the form. Enter the internal reference in the field.
Beneath the `Internal Reference` field, this sentence appears:
`Use this reference as a subject prefix when submitting by email.`

<img src="expenses/mileage-internal-reference.png" class="align-center"
alt="Internal reference numbers are listed in the main Expense Products view." />

> [!NOTE]
> For security purposes, only authenticated employee emails are accepted
> by Konvergo ERP when creating an expense from an email. To confirm an
> authenticated employee email address, go to the employee card in the
> `Employees` app, and refer to the `Work Email`
>
> <img src="expenses/authenticated-email-address.png" class="align-center"
> alt="Create the domain alias by clicking the link." />

<div class="example">

If submitting an expense via email for a \$25.00 meal during a work
trip, the email subject would be <span class="title-ref">FOOD
\$25.00</span>.

Explanation:

- The `Internal Reference` for the expense category
  <span class="title-ref">Meals</span> is
  <span class="title-ref">FOOD</span>
- The `Cost` for the expense is <span class="title-ref">\$25.00</span>

</div>

## Create an expense report

When expenses are ready to submit (such as at the end of a business
trip, or once a month), an *expense report* needs to be created. Go to
the main `Expenses` app dashboard, which displays a default
`My Expenses` view, or go to `Expenses app --> My
Expenses --> My Expenses`.

Expenses are color coded by status. Any expense with a status of
`To Report` (expenses that still need to be added to an expense report)
the text appears in blue. All other statuses (`To Submit`, `Submitted`,
and `Approved`) the text appears in black.

First, select each individual expense for the report by clicking the
check box next to each entry, or quickly select all the expenses in the
list by clicking the check box next to `Expense
Date`.

Another way to quickly add all expenses that are not on an expense
report is to click `Create Report` without selecting any expenses, and
Konvergo ERP will select all expenses with a status of `To Submit` that are not
already on a report.

<img src="expenses/create-report.png" class="align-center"
alt="Select the expenses to submit, then create the report." />

> [!NOTE]
> Any expense can be selected from the `My Expenses` list, regardless of
> status. The `Create Report` button is visible as long as there is a
> minimum of 1 expense with a status of `To Report` selected. When the
> `Create Report` button is clicked, only expenses with a status of
> `To Submit` that are *not* currently on another expense report will
> appear in the newly created expense report.

Once the expenses have been selected, click the `Create Report` button.
The new report appears with all the expenses listed in the `Expense`
tab. If there is a receipt attached to an individual expense, a
`📎 (paperclip)` icon appears next to the `Customer
to Reinvoice` and `Analytic Distribution` columns.

When the report is created, the date range for the expenses appears in
the `Expense Report
Summary` field by default. It is recommended to edit this field with a
short summary for each report to help keep expenses organized. Enter a
short description for the expense report (such as
<span class="title-ref">Client Trip NYC</span>, or
<span class="title-ref">Repairs for Company Car</span>) in the
`Expense Report Summary` field. Next, select a `Manager` from the
drop-down menu to assign a manager to review the report. If needed, the
`Journal` can be changed. Use the drop-down menu to select a different
`Journal`.

<img src="expenses/expense-report-summary.png" class="align-center"
alt="Enter a short description and select a manager for the report." />

If some expenses are not on the report that should be, they can still be
added. Click `Add
a line` at the bottom of the `Expense` tab. A pop up appears with all
the available expenses that can be added to the report (with a status of
`To Submit`). Click the check box next to each expense to add, then
click `Select`. The items now appear on the report that was just
created. If a new expense needs to be added that does *not* appear on
the list, click `New` to create a new expense and add it to the report.

<img src="expenses/add-an-expense-line.png" class="align-center"
alt="Add more expenses to the report before submitting." />

> [!NOTE]
> Expense reports can be created in one of three places:
>
> 1.  Go to the main `Expenses` app dashboard (also accessed by going to
>     `Expenses app --> My Expenses --> My Expenses`)
> 2.  Go to `Expenses app --> My Expenses --> My Reports`
> 3.  Go to `Expenses app --> Expense Reports`
>
> In any of these views, click `New` to create a new expense report.

### Submit an expense report

When an expense report is completed, the next step is to submit the
report to a manager for approval. Reports must be individually
submitted, and cannot be submitted in batches. Open the specific report
from the list of expense reports (if the report is not already open). To
view all expense reports, go to
`Expenses app --> My Expenses --> My Reports`.

If the list is large, grouping the results by status may be helpful
since only reports that have a `To Submit` status need to be submitted,
reports with an `Approved` or `Submitted` status do not.

The `To Submit` expenses are easily identifiable not just from the
`To Submit` status, but the text appears in blue, while the other
expenses text appears in black.

<img src="expenses/expense-status.png" class="align-center"
alt="Submit the report to the manager." />

> [!NOTE]
> The status of each report is shown in the `Status` column on the
> right. If the `Status` column is not visible, click the
> `Additional Options (two dots)` icon at the end of the row, and enable
> `Status`.

Click on a report to open it, then click `Submit To Manager`. After
submitting a report, the next step is to wait for the manager to approve
it.

> [!IMPORTANT]
> The `expenses/approve`, `expenses/post`, and `expenses/reimburse`
> sections are **only** for users with the *necessary rights*.

## Approve expenses

In Konvergo ERP, not just anyone can approve expense reports— only users with
the necessary rights (or permissions) can. This means that a user must
have at least *Team Approver* rights for the *Expenses* app. Employees
with the necessary rights can review expense reports, approve or reject
them, and provide feedback thanks to the integrated communication tool.

To see who has rights to approve, go to the main `Settings` app and
click on `Manage Users`.

> [!NOTE]
> If the *Settings* app is not available, then certain rights are not
> set on the account. Check the `Access Rights` tab of a user's card in
> the `Settings` app. the `Administration` section (bottom right of the
> `Access Rights` tab) is set to one of three options:
>
> - `None (blank)`: The user cannot access the *Settings* app at all.
> - `Access Rights`: The user can only view the `User's & Companies`
>   section of the *Settings* app.
> - `Settings`: The user has access to the entire *Settings* app with no
>   restrictions.
>
> Please refer to `this document </applications/general/users>` to learn
> more about managing users and their access rights.

Click on an individual to view their card, which displays the
`Access Rights` tab in the default view. Scroll down to the
`Human Resources` section. Under `Expenses`, there are four options:

- `None (blank)`: A blank field means the user has no rights to view or
  approve expense reports, and can only view their own.
- `Team Approver`: The user can only view and approve expense reports
  for their own specific team.
- `All Approver`: The user can view and approve any expense report.
- `Administrator`: The user can view and approve any expense report, as
  well as access the reporting and configuration menus in the *Expenses*
  app.

Users who are able to approve expense reports (typically managers) can
easily view all expense reports they have access rights to. Go to
`Expenses app --> Expense Reports`, and a list appears with all expense
reports that have a status of either `To Submit`, `Submitted`,
`Approved`, `Posted`, or `Done`. Expense reports with a status of
`Refused` are hidden in the default view.

<img src="expenses/expense-reports-list.png" class="align-center"
alt="Reports to validate are found on the Reports to Approve page." />

When viewing expense reports, there is a panel of filters that can be
enabled or disabled on the left side. The three categories that filters
can be applied on are `Status`, `Employee`, and `Company`. To view only
expense reports with a particular status, enable the specific status
filter to display the expense reports with only that status. Disable the
specific status filter to hide the reports with that status. To view
expense reports for a particular employee and/or company, enable the
specific employee name filter and/or company filter in the `Employee`
and `Company` sections.

Reports can be approved in two ways (individually or several at once)
and refused only one way. To approve multiple expense reports at once,
remain in the list view. First, select the reports to approve by
clicking the check box next to each report, or click the box next to
`Employee` to select all the reports in the list.

> [!IMPORTANT]
> Only reports with a status of `Submitted` can be approved. It is
> recommended to only display the submitted reports by adjusting the
> status filter on the left side by only having the `Submitted` filter
> enabled.
>
> If a report is selected that is unable to be approved, the
> `Approve Report` button **will not appear**, indicating there is a
> problem with the selected report(s).

Next, click the `Approve Report` button.

<img src="expenses/approve-report.png" class="align-center"
alt="Approve multiple reports by clicking the checkboxes next to each report." />

To approve an individual report, click on a report to go to a detailed
view of that report. In this view, several options are presented:
`Approve`, `Report in Next Payslip`, `Refuse`, or `Reset to draft`.
Click `Approve` to approve the report.

If `Refuse` is clicked, a pop-up window appears. Enter a brief
explanation for the refusal in the `Reason to Refuse Expense` field, and
then click `Refuse`.

<img src="expenses/refuse-expense.png" class="align-center"
alt="Send messages in the chatter." />

Team managers can easily view all the expense reports for their team
members. While in the `Expense Reports` view, click the drop-down arrow
in the right-side of the search box, and click on `My Team` in the
`Filters` section. This presents all the reports for the manager's team.

<img src="expenses/my-team-filter.png" class="align-center"
alt="Select the My Team filter." />

> [!TIP]
> If more information is needed, such as a missing receipt,
> communication is easy from the chatter. In an individual report,
> simply click `Send message` to open the message text box. Type in a
> message, tagging the proper person (if needed), and post it to the
> chatter by clicking `Send`. The message is posted in the chatter, and
> the person tagged will be notified via email of the message, as well
> as any followers.
>
> The only people that can be tagged in a message are *followers*. To
> see who is a follower, click on the `👤 (person)` icon to display the
> followers of the expense.
>
> <img src="expenses/chatter.png" class="align-center"
> alt="Send messages in the chatter." />

## Post expenses in accounting

Once an expense report is approved, the next step is to post the report
to the accounting journal. To view all expense reports, go to
`Expenses app --> Expense Reports`. To view only the expense reports
that have been approved and need to be posted, adjust the filters on the
left side so that only the `Approved` status is enabled.

<img src="expenses/post-reports.png" class="align-center"
alt="View reports to post by clicking on expense reports, then reports to post." />

Just like approvals, expense reports can be posted in two ways
(individually or several at once). To post multiple expense reports at
once, remain in the list view. First, select the reports to post by
clicking the check box next to each report, or click the box next to
`Employee` to select all the reports in the list. Next, click
`Post Entries`.

<img src="expenses/post-entries.png" class="align-center"
alt="Post multiple reports at a time from the Expense Reports view, with the Approved filter." />

To post an individual report, click on a report to go to the detailed
view of that report. In this view, several options are presented:
`Post Journal Entries`, `Report In Next
Payslip`, `Refuse`, or `Reset to Draft`. Click `Post Journal Entries` to
post the report.

If `Refuse` is clicked, a pop-up window appears. Enter a brief
explanation for the refusal in the `Reason to Refuse Expense` field, and
then click `Refuse`. Refused reports can be viewed by going to
`Expenses app --> Expense Reports`, then adjusting the filters on the
left so that only `Refused` is selected. This will only show the refused
expense reports.

> [!IMPORTANT]
> To post expense reports to an accounting journal, the user must have
> following access rights:
>
> - Accounting: Accountant or Adviser
> - Expenses: Manager

## Reimburse employees

After an expense report is posted to an accounting journal, the next
step is to reimburse the employee. To view all the expense reports to
pay, go to `Expenses app --> Expense
Reports --> Reports To Pay`.

<img src="expenses/reports-to-pay.png" class="align-center"
alt="View reports to pay by clicking on expense reports, then reports to pay." />

Just like approvals and posting, expense reports can be paid in two ways
(individually or several at once). To pay multiple expense reports at
once, remain in the list view. First, select the reports to pay by
clicking the check box next to each report, or click the box next to
`Employee` to select all the reports in the list. Next, click
`Register Payment`.

<img src="expenses/register-payment.png" class="align-center"
alt="Post multiple reports by selecting them, clicking the gear, and then post the entries." />

To pay an individual report, click on a report to go to a detailed view
of that report. Click `Register Payment` to pay the employee.

A `Register Payment` pop-up appears, and the `Journal`, `Payment
Method`, and `Payment Date` can be modified, if needed. When the
selections are correct, click `Create Payment` to send the payment to
the employee.

To pay an individual report, click on a report in the list view to go to
a detailed view of that report. Click `Register Payment` to pay the
employee. A `Register Payment` pop-up appears, but when paying an
individual expense report instead of several at once, more options
appear in the pop-up. In addition to the `Journal`, `Payment Method`,
and `Payment Date` fields, a `Recipient Bank Account`, `Amount`, and
`Memo` field appear. Select the employee's bank account from the
drop-down menu to directly deposit the payment to their account. When
all other selections are correct, click `Create Payment` to send the
payment to the employee.

<img src="expenses/two-payment-posting-options.png" class="align-center"
alt="Different options appear when registering an individual expense report versus multiple
expense reports at once." />

## Re-invoice expenses to customers

If expenses are tracked on customer projects, expenses can be
automatically charged back to the customer. This is done by creating an
expense, referencing the `SO (Sales Order)` the expense should be added
to, and then creating the expense report. Next, managers approve the
expense report, and the accounting department posts the journal entries.
Finally, once the expense report is posted to a journal, the expense(s)
appears on the `SO (Sales Order)` that was referenced. The sales order
can then be invoiced, thus invoicing the customer for the expense.

### Setup

First, specify the invoicing policy for each expense category. Go to
`Expenses app
--> Configuration --> Expense Categories`. Click on the expense category
to open the expense category form. Under the `Invoicing` section, click
the radio button next to the desired selection for
`Re-Invoicing Expenses`. Options are `None`, `At cost`, and
`Sales price`.

`Re-Invoicing Expenses`:

- `None`: Expense category will not be re-invoiced.
- `At cost`: Expense category will invoice expenses at their real cost.
- `At sales price`: Expense category will invoice the price set on the
  sale order.

### Create an expense

First, when `creating a new expense <expenses/new>`, the correct
information needs to be entered in order to re-invoice a customer.
Select the *sales order* the expense will appear on in the
`Customer to Reinvoice` section, from the drop-down menu. Next, select
the `Analytic Account` the expense will be posted to. After the
expense(s) are created, the expense report needs to be
`created <expenses/report>` and `submitted <expenses/submit>` as usual.

<img src="expenses/reinvoice-expense.png" class="align-center"
alt="Ensure the customer to be invoiced is called out on the expense." />

> [!IMPORTANT]
> Selecting a `Customer to Reinvoice` when creating an expense is
> critical, since this is what causes the expenses to be automatically
> invoiced after an expense report is approved.
>
> The `Customer to Reinvoice` field can be modified *until an expense
> report is* **approved**, then the field is no longer able to be
> modified.

### Validate and post expenses

Only employees with permissions (typically managers or supervisors) can
`approve expenses
<expenses/approve>`. Before approving an expense report, ensure the
`Analytic
Distribution` is set on every expense line of a report. If an
`Analytic Distribution` is missing, assign the correct account(s) from
the drop-down menu, and then click `Approve` or `Refuse`.

The accounting department is typically responsible for
`posting journal entries
<expenses/post>`. Once an expense report is approved, it can then be
posted. The `SO (Sales
Order)` is **only** updated *after the journal entries are posted*. One
the journal entries are posted, the expenses now appear on the
referenced `SO (Sales Order)`.

### Invoice expenses

Once the `SO (Sales Order)` has been updated, it is time to invoice the
customer. After the expense report has been approved and the journal
entries have been posted, click the `Sales Orders` smart button to open
the `SO (Sales Order)`. The expenses to be re-invoiced are now on the
`SO (Sales Order)`.

<img src="expenses/sales-order.png" class="align-center"
alt="After the expense report is posted to the journal entry, the sales order can be called up
by clicking on the sales order number." />

> [!NOTE]
> More than one `SO (Sales Order)` can be referenced on an expense
> report. If more than one `SO (Sales Order)` is referenced, the
> `Sales Orders` smart button will list the number of
> `SO (Sales Order)`'s. If multiple `SO (Sales Order)`'s are listed, the
> `Sales Orders` smart button opens a list view of all the
> `SO (Sales Order)`'s on the expense report. Click on a
> `SO (Sales Order)` to open the individual `SO (Sales
> Order)`.

The expenses are listed in the `SO (Sales Order)` `Order Lines` tab.

<img src="expenses/so-details.png" class="align-center"
alt="See the expenses listed on the sales order after clicking into it." />

Next, click `Create Invoice`, and select if the invoice is for a
`Regular
invoice`, a `Down payment (percentage)`, or a
`Down payment (fixed amount)` by clicking the radio button next to it.
Then, click `Create Invoice`. The customer has now been invoiced for the
expenses.
