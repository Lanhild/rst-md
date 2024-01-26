  - show-content

# Expenses

Odoo **Expenses** streamlines the management of expenses. After an
employee submits their expenses in Odoo, the expenses are reviewed by
management and accounting teams. Once approved, payments can then be
processed and disbursed back to the employee for reimbursement(s).

<div class="seealso">

[Odoo Expenses: product page](https://www.odoo.com/app/expenses)

</div>

## Set expense types

The first step to track expenses is to configure the different *expense
types* for the company (managed as *products* in Odoo). Each "product"
can be as specific or generalized as needed. Go to `Expenses app -->
Configuration --> Expense Products` to view the current expensable
products in a default kanban view.

![Set expense costs on products.](expenses/products.png)

To create a new expense product, click `Create`. A product form will
appear. Only two fields are required, the `Product Name` and the `Unit
of Measure`. Enter the `Product Name` in the field, and select the `Unit
of Measure` from the drop-down menu (most products will be set to
`Units`).

<div class="tip">

<div class="title">

Tip

</div>

The *Sales* app is where specification on the units of measure are
created and edited (e.g. units, miles, nights, etc.). Go to `Sales app
--> Configuration --> Settings` and ensure <span class="title-ref">Units
of Measure</span> is checked off in the <span class="title-ref">Product
Catalog</span> section. Click on the `Units of Measure` internal link to
view, create, and edit the units of measure. Refer to `this document
</applications/inventory_and_mrp/inventory/management/products/uom>` to
learn more about units of measure and how to configure them.

</div>

![Set expense costs on products.](expenses/new-expense-product.png)

The `Cost` field on the product form is populated with a value of
<span class="title-ref">0.00</span> by default. When a specific expense
should always be reimbursed for a particular price, enter that amount in
the `Cost` field. Otherwise, leave the `Cost` set to
<span class="title-ref">0.00</span>, and employees will report the
actual cost when submitting an expense report.

<div class="example">

Here are some examples for when to set a specific `Cost` on a product
vs. leaving the `Cost` at \`0.00\`:

  - **Meals**: Set the `Cost` to <span class="title-ref">0.00</span>.
    When an employee logs an expense for a meal, they enter the actual
    amount of the bill and will be reimbursed for that amount. An
    expense for a meal costing $95.23 would equal a reimbursement for
    $95.23.
  - **Mileage**: Set the `Cost` to <span class="title-ref">0.30</span>.
    When an employee logs an expense for "mileage", they enter the
    number of miles driven, and are reimbursed 0.30 per mile they
    entered. An expense for 100 miles would equal a reimbursement for
    $30.00.
  - **Monthly Parking**: Set the `Cost` to
    <span class="title-ref">75.00</span>. When an employee logs an
    expense for "monthly parking", the reimbursement would be for
    $75.00.
  - **Expenses**: Set the `Cost` to <span class="title-ref">0.00</span>.
    When an employee logs an expense that is not a meal, mileage, or
    monthly parking, they use the generic `Expenses` product. An expense
    for a laptop costing $350.00 would be logged as an `Expenses`
    product, and the reimbursement would be for $350.00.

</div>

Select an `Expense Account` if using the Odoo *Accounting* app. It is
recommended to check with the accounting department to determine the
correct account to reference in this field as it will affect reports.

Set a tax on each product in the `Vendor Taxes` and `Customer Taxes`
fields if applicable. It is considered good practice to use a tax that
is configured with `Tax Included
in Price <taxes/included-in-price>`. Taxes will be automatically
configured if this is set.

## Record expenses

### Manually create a new expense

To record a new expense, begin in the main `Expenses` app dashboard,
which presents the default `My Expenses to Report` view. This view can
also be accessed from `Expenses app --> My Expenses --> My Expenses to
Report`.

First, click `Create`, and then fill out the various fields on the form.

  - `Description`: Enter a short description for the expense in the
    `Description` field. This should be short and informative, such as
    <span class="title-ref">lunch with client</span> or
    <span class="title-ref">hotel for conference</span>.

  - `Product`: Select the product from the drop-down menu that most
    closely corresponds to the expense. For example, an airplane ticket
    would be appropriate for an expense `Product` named `Air Travel`.

  - `Unit Price`: Enter the total amount paid for the expense in one of
    two ways:
    
    1.  If the expense is for one single item/expense, enter the cost in
        the `Unit Price` field, and leave the `Quantity`
        <span class="title-ref">1.00</span>.
    
    2.  If the expense is for multiples of the same item/expense, enter
        the price *per unit* in the `Unit Price` field, and enter the
        *quantity of units* in the `Quantity` field.
        
        <div class="example">
        
        In the case of a hotel stay, for example, the `Unit Price` would
        be set as the cost *per night*, and set the `Quantity` to the
        *number of nights* stayed.
        
        </div>

  - `Taxes`: If taxes were paid on the expense, select the tax
    percentage using the drop-down menu. Tax options are pre-configured
    based on the localization setting selected when the database was
    created. Adding any new taxes should only be done when necessary.
    
    <div class="note">
    
    <div class="title">
    
    Note
    
    </div>
    
    When a tax is selected, the `Total` value will update in real time
    to show the added taxes.
    
    </div>

  - `Paid By`: Click the radio button to indicate who paid for the
    expense and should be reimbursed. If the employee paid for the
    expense (and should be reimbursed) select `Employee (to reimburse)`.
    If the company paid directly instead (e.g. if the company credit
    card was used to pay for the expense) select `Company`.

  - `Expense Date`: Using the calendar module, enter the date the
    expense was incurred. Use the `< (left)` and `> (right)` arrows to
    navigate to the correct month, then click on the specific day to
    enter the selection.

  - `Bill Reference`: If there is any reference text that should be
    included for the expense, enter it in this field.

  - `Account`: Select the expense account that this expense should be
    logged on from the drop-down menu.

  - `Employee`: Using the drop-down menu, select the employee this
    expense is for.

  - `Customer to Reinvoice`: If the expense is something that should be
    paid for by a customer, select the customer that will be invoiced
    for this expense from the drop-down menu. For example, if a customer
    wishes to have an on-site meeting, and agrees to pay for the
    expenses associated with it (such as travel, hotel, meals, etc.),
    then all expenses tied to that meeting would indicate that customer
    as the `Customer to Reinvoice`.

  - `Analytic Account`: Select the account the expense should be written
    against from the drop-down menu.

  - `Company`: If multiple companies are set-up, select the company this
    expense should be filed for from the drop-down menu. If there is
    only one company, this field will be automatically populated.

  - `Notes...`: If any notes are needed in order to clarify the expense,
    enter them in the notes field.

Once all the fields have been filled out, click `Save`.

![A filled in expense form for a client
lunch.](expenses/expense-filled-in.png)

#### Attach a receipt

After the expense is saved, the next step is to attach a receipt. A new
`Attach Receipt` button appears after the entry is saved, beneath the
former `Save` button (which turns into an `Edit` button).

![Attach a receipt after saving the record.](expenses/save-receipt.png)

Click the new `Attach Receipt` button, and a file explorer appears.
Navigate to the receipt to be attached, and click `Open`. A new
`Receipts` smart button appears at the top, and the new receipt is
recorded in the chatter. More than one receipt can be attached to an
individual expense, as needed. The number of receipts attached to the
expense will be noted on the smart button.

![Attach a receipt after saving the
record.](expenses/receipt-smartbutton.png)

### Automatically create new expenses from an email

Instead of individually creating each expense in the *Expenses* app,
expenses can be automatically created by sending an email to an email
alias.

To do so, first, an email alias needs to be configured. Go to `Expenses
app -->
Configuration --> Settings`. Ensure `Incoming Emails` is checked off.

![Create the domain alias by clicking the
link.](expenses/email-alias.png)

<div class="note">

<div class="title">

Note

</div>

If the domain alias needs to be set up, `Setup your domain alias` will
appear beneath the incoming emails check box instead of the email
address field. Refer to this documentation for setup instructions and
more information: `/administration/maintain/domain_names`. Once the
domain alias is configured, the email address field will be visible
beneath the incoming emails section.

</div>

Next, enter the email address to be used in the email field, then click
`Save`. Now that the email address has been entered, emails can be sent
to that alias to create new expenses without having to be in the Odoo
database.

To submit an expense via email, create a new email and enter the
product's *internal reference* code (if available) and the amount of the
expense in the email subject. Next, attach the receipt to the email.
Odoo creates the expense by taking the information in the email subject
and combining it with the receipt.

To check an expense product's internal reference, go to `Expenses app
-->
Configuration --> Expense Products`. If an internal reference is listed
on the product, it is visible in this view as `(Ref###)`.

![Internal reference numbers are listed in the main Expense Products
view.](expenses/internal-ref-numbers.png)

To add an internal reference on an expense product, click on the
product, then click `Edit`. In edit mode, enter the `Internal Reference`
in the field. Beneath the `Internal Reference` field, this sentence
appears: `Use this reference as a
subject prefix when submitting by email.`.

![Internal reference numbers are listed in the main Expense Products
view.](expenses/meals-internal-reference.png)

<div class="note">

<div class="title">

Note

</div>

For security purposes, only authenticated employee emails are accepted
by Odoo when creating an expense from an email. To confirm an
authenticated employee email address, go to the employee card in the
`Employees` app, and refer to the `Work Email` in the main field.

![Create the domain alias by clicking the
link.](expenses/authenticated-email-address.png)

</div>

<div class="example">

If submitting an expense via email for a $25.00 meal during a work trip,
the email subject would be <span class="title-ref">Ref005 Meal
$25.00</span>.

Explanation:

  - The `Internal Reference` for the expense product
    <span class="title-ref">Meals</span> is
    <span class="title-ref">Ref005</span>
  - The `Cost` for the expense is <span class="title-ref">$25.00</span>

</div>

## Create an expense report

When expenses are ready to submit (such as at the end of a business
trip, or once a month), an *expense report* needs to be created. Go to
the main `Expenses` app dashboard, which displays a default `My
Expenses` view, or go to `Expenses app --> My
Expenses --> My Expenses to Report`.

First, each individual expense for the report must be selected by
clicking the check box next to each entry, or quickly select all the
expenses in the list by clicking the check box next to `Expense Date`.

![Select the expenses to submit, then create the
report.](expenses/create-report.png)

Once the expenses have been selected, click the `Create Report` button.
The new report appears with all the expenses listed, and the number of
documents is visible in the `Documents` smart button.

It is recommended to add a short summary for each report to help keep
expenses organized. Click the `Edit` button, and the `Expense Report
Summary` field appears. Enter a short description for the expense report
(such as <span class="title-ref">Client Trip NYC</span>, or
<span class="title-ref">Repairs for Company Car</span>). Next, select a
`Manager` from the drop-down menu to assign a manager to review the
report.

![Enter a short description and select a manager for the
report.](expenses/expense-report-summary.png)

If some expenses are not on the report that should be, they can still be
added. Click `Add
a line` at the bottom of the `Expense` tab. Click the check box next to
each expense to add, then click `Select`. The items now appear on the
report that was just created.

![Add more expenses to the report before
submitting.](expenses/add-an-expense-line.png)

<div class="note">

<div class="title">

Note

</div>

`Add a line` only appears when the document is in edit mode. It does not
appear otherwise.

</div>

When all edits have been completed, click `Save`.

### Submit an expense report

When an expense report is completed, the next step is to submit the
report to a manager for approval. Reports must be individually
submitted, and cannot be submitted in batches. Open the specific report
from the list of expense reports (if the report is not already open). To
view all expense reports, go to `Expenses app --> My Expenses --> My
Reports`.

If the list is large, grouping the results by status may be helpful
since only reports that are in a `Draft` mode need to be submitted,
reports with an `Approved` or `Submitted` status do not.

![Submit the report to the manager.](expenses/expense-status.png)

<div class="note">

<div class="title">

Note

</div>

The status of each report is shown in the `Status` column on the far
right. If the `Status` column is not visible, click the `⋮ (additional
options)` icon at the end of the row, and check the box next to
`Status`.

</div>

Click on a report to open it, then click `Submit To Manager`. After
submitting a report, the next step is to wait for the manager to approve
it.

<div class="important">

<div class="title">

Important

</div>

The `expenses/approve`, `expenses/post`, and `expenses/reimburse`
sections are **only** for users with the *necessary rights*.

</div>

## Approve expenses

In Odoo, not just anyone can approve expense reports— only users with
the necessary rights (or permissions) can. This means that a user must
have at least *Team Approver* rights for the *Expenses* app. Employees
with the necessary rights can review expense reports, and approve or
reject them, as well as provide feedback thanks to the integrated
communication tool.

To see who has rights to approve, go to the main `Settings` app and
click on `Manage Users`.

<div class="note">

<div class="title">

Note

</div>

If the *Settings* app is not available, then certain rights are not set
on the account. In the `Access Rights` tab of a user's card in the
`Settings` app, the `Administration` section is set to one of three
options:

  - `None (blank)`: The user cannot access the *Settings* app at all.
  - `Access Rights`: The user can only view the `User's & Companies`
    section of the *Settings* app.
  - `Settings`: The user has access to the entire *Settings* app with no
    restrictions.

Please refer to `this document
</applications/general/users/manage_users>` to learn more about managing
users and their access rights.

</div>

Click on an individual to view their card, which displays the `Access
Rights` tab in the default view. Scroll down to the `Human Resources`
section. Under `Expenses`, there are four options:

  - `None (blank)`: A blank field means the user has no rights to view
    or approve expense reports, and can only view their own.
  - `Team Approver`: The user can only view and approve expense reports
    for their own specific team.
  - `All Approver`: The user can view and approve any expense report.
  - `Administrator`: The user can view and approve any expense report as
    well as access the reporting and configuration menus in the
    *Expenses* app.

Users who are able to approve expense reports (typically managers) can
easily view all expense reports to validate. Go to `Expenses app -->
Expense Reports --> Reports to
Approve`. This view lists all the expense reports that have been
submitted but not approved, as noted by the `Submitted` tag in the
status column.

![Reports to validate are found on the Reports to Approve
page.](expenses/reports-to-approve.png)

Reports can be approved in two ways (individually or several at once)
and refused only one way. To approve multiple expense reports at once,
remain in the list view. First, select the reports to approve by
clicking the check box next to each report, or click the box next to
`Employee` to select all reports in the list. Next, click on the `⚙️
Action (gear)` icon, then click `Approve Report`.

![Approve multiple reports by clicking the checkboxes next to each
report.](expenses/approve-report.png)

To approve an individual report, click on a report to go to a detailed
view of that report. In this view, several options are presented:
`Approve`, `Refuse`, or `Reset to
draft`. Click `Approve` to approve the report.

If `Refuse` is clicked, a pop-up window appears. Enter a brief
explanation for the refusal in the `Reason to refuse Expense` field,
then click `Refuse`.

![Send messages in the chatter.](expenses/refuse-expense.png)

Team managers can easily view all the expense reports for their team
members. While in the `Reports to Approve` view, click on `Filters`,
then click `My Team`. This presents all the reports for the manager's
team.

![Select the My Team filter.](expenses/my-team-filter.png)

<div class="note">

<div class="title">

Note

</div>

If more information is needed, such as a receipt is missing,
communication is easy from the chatter. In an individual report, simply
type in a message, tagging the proper person (if needed), and post it to
the chatter by clicking `Send`. The message is posted in the chatter,
and the person tagged will be notified via email of the message, as well
as anyone following.

![Send messages in the chatter.](expenses/chatter.png)

</div>

## Post expenses in accounting

Once an expense report is approved, the next step is to post the report
to the accounting journal. To view all expense reports to post, go to
`Expenses --> Expense Reports --> Reports
To Post`.

![View reports to post by clicking on expense reports, then reports to
post.](expenses/post-reports.png)

Just like approvals, expense reports can be posted in two ways
(individually or several at once). To post multiple expense reports at
once, remain in the list view. First, select the reports to post by
clicking the check box next to each report, or click the box next to
`Employee` to select all reports in the list. Next, click on the `⚙️
Action (gear)` icon, then click `Post Entries`.

![Post multiple reports from the Post Entries
view.](expenses/post-entries.png)

To post an individual report, click on a report to go to the detailed
view of that report. In this view, several options are presented: `Post
Journal Entries`, `Report In Next
Payslip`, or `Refuse`. Click `Post Journal Entries` to post the report.

If `Refuse` is clicked, a pop-up window appears. Enter a brief
explanation for the refusal in the `Reason to refuse Expense` field,
then click `Refuse`. Refused reports can be viewed by going to `Expenses
app --> Expense Reports --> All Reports`. This list shows all reports,
including the refused ones.

<div class="note">

<div class="title">

Note

</div>

To post expense reports to an accounting journal, the user must have
following access rights:

  - Accounting: Accountant or Adviser
  - Expenses: Manager

</div>

## Reimburse employees

After an expense report is posted to an accounting journal, the next
step is to reimburse the employee. To view all expense reports to pay,
go to `Expenses --> Expense Reports -->
Reports To Pay`.

![View reports to pay by clicking on expense reports, then reports to
pay.](expenses/reports-to-pay.png)

Just like approvals and posting, expense reports can be paid in two ways
(individually or several at once). To pay multiple expense reports at
once, remain in the list view. First, select the reports to pay by
clicking the check box next to each report, or click the box next to
`Employee` to select all reports in the list. Next, click on the `⚙️
Action (gear)` icon, then click `Register Payment`.

![Post multiple reports by clicking the checkboxes, clicking the gear,
then post the entries.](expenses/register-payment.png)

To pay an individual report, click on a report to go to a detailed view
of that report. Click `Register Payment` to pay the employee.

## Re-invoice expenses to customers

If expenses are tracked on customer projects, expenses can be
automatically charged back to the customer. This is done by creating an
expense report, then creating a sales order with the expensed items on
it. Then, managers approve the expense report, and the accounting
department posts the journal entries. Finally, the customer is invoiced.

### Setup

First, specify the invoicing policy for each expense product. Go to
`Expenses app -->
Configuration --> Expense Products`. Click on the expense product to
edit, then click `Edit`. Under the `Invoicing` section, select the
`Invoicing Policy` and `Re-Invoicing Policy` by clicking the radio
button next to the desired selection.

`Invoicing Policy`:

  - `Ordered quantities`: Expense product will only invoice expenses
    based on the ordered quantity.
  - `Delivered quantities`: Expense product will only invoice expenses
    based on the delivered quantity.

`Re-Invoicing Policy`:

  - `No`: Expense product will not be re-invoiced.
  - `At cost`: Expense product will invoice expenses at their real cost.
  - `At sales price`: Expense product will invoice the price set on the
    sale order.

### Create an expense

First, when `creating a new expense <expenses/new>`, the correct
information needs to be entered in order to re-invoice a customer.
Select the `Customer to Reinvoice` from the drop-down menu. Next, select
the `Analytic Account` the expense will be posted to.

![Ensure the customer to be invoiced is called out on the
expense.](expenses/reinvoice-expense.png)

### Create a quote and sales order

In the `Sales` app, create a quote for the customer being invoiced,
listing the expense products. First, click `Create` to create a new
quotation. Next, select the `Customer` being invoiced for the expenses
from the drop-down menu.

In the `Order Lines` tab, click `Add a product`. In the `Product` field,
select the first item being invoiced from the drop-down menu, or type in
the product name. Then, update the `Quantity`, the `Delivered` quantity,
and the `Unit
Price` if needed. Repeat this for all products being invoiced. When all
the products have been added to the quote, click `Confirm` and the
quotation becomes a sales order.

![Create and confirm the sales order with the expenses listed as
products.](expenses/expenses-salesorder.png)

Once the quote turns into a sales order, a `Delivered` column appears.
The delivered quantity must be updated for each item. Click on the
<span class="title-ref">0.000</span> field for each product, and enter
the delivered quantity. When all delivered quantities have been entered,
click `Save`.

### Validate and post expenses

Only employees with permissions (typically managers or supervisors) can
`approve expenses
<expenses/approve>`. Before approving an expense report, ensure the
`Analytic Account` is set on every expense line of a report. If an
`Analytic Account` is missing, click `Edit` and select the correct
account from the drop-down menu, then click `Approve` or `Refuse`.

The accounting department is typically responsible for `posting journal
entries
<expenses/post>`. Once an expense report is approved, it can then be
posted.

### Invoice expenses

Once the quote has turned into a sales order, and the expense report has
been approved, it is time to invoice the customer. Go to `Sales app -->
To Invoice --> Orders to Invoice` to view the sales orders ready to be
invoiced.

Next, find the sales order related to the expense report, click into it,
and then click `Create Invoice` and a `Create invoices` pop-up window
appears. Select if the invoice is a `Regular invoice`, `Down payment
(percentage)`, or `Down
payment (fixed amount)` by clicking the radio button next to the
selection. For either down payment options, enter the amount (fixed or
percentage) in the `Down Payment Amount` field. Finally, click either
`create and view invoice` or `create invoice`.
