# Contracts

Every employee in Odoo is required to have a contract in order to be
paid. A contract outlines the terms of an employee's position, their
compensation, their working hours, and any other details about their
position.

<div class="important">

<div class="title">

Important

</div>

Contract documents (PDFs) are uploaded and organized using the
*Documents* application, and are signed using the *Sign* application.
Ensure these applications are installed in order to send and sign
contracts. Please refer to the `/applications/finance/documents` and
`/applications/finance/sign` documentation.

</div>

To view the employee contracts, go to the `Payroll app --> Employees -->
Contracts` from the top menu. All employee contracts, and their current
contract status, are displayed in a default kanban view. The default
view displays both running contracts and contracts that need action.
Expired and canceled contracts are hidden in the default view.

![Contracts dashboard view showing running contracts and contracts with
issues.](contracts/contracts-overview.png)

<div class="note">

<div class="title">

Note

</div>

The list of contracts in the *Payroll* application matches the list of
contracts in the *Employees* application. The default contracts view in
the *Payroll* application displays running contracts and contracts
needing attention, while the default contracts view in the *Employees*
application displays all contracts in a kanban view, organized by their
stage, regardless of status. All contracts can be viewed by changing the
filters.

</div>

## Create a new contract

In order for an employee to be paid, an active contract is required. If
a new contract is needed, click the `Create` button on the contracts
dashboard. A contract form appears where the information can be entered.
Required fields are underlined in bold.

### Required fields

![New contract form to be filled in when creating a new
contract.](contracts/required-fields.png)

  - `Contact Reference`: Type in the name or title for the contract,
    such as <span class="title-ref">John Smith Contract</span>.
  - `Company`: Select the company the contract applies to by clicking on
    the drop-down menu. A new company can be created by typing the name
    in the field, then clicking either `Create` to create the new
    company, or `Create and Edit` to create the new company and edit the
    company details.
  - `Salary Structure Type`: Select one of the salary structure types
    from the drop-down menu. The default salary structure types are
    `Employee` or `Worker`. A new salary structure type can be created
    by typing the name in the field.
  - `Start Date`: The date the contract starts. Choose a date by
    clicking on the drop-down menu, navigating to the correct month and
    year by using the `< > (arrow)` icons, then clicking on the `date`.
  - `Working Schedule`: Select one of the working schedules from the
    drop-down menu.

<div class="tip">

<div class="title">

Tip

</div>

The `Working Schedule` drop-down menu displays all the working times for
the selected `Company`. To modify or add to this list, go to `Payroll
-->
Configuration --> Working Times` and either `Create` a new working time
or click on an existing working time and edit it by clicking `Edit`.

</div>

### Optional fields

  - `Employee`: Name of the employee that the contract applies to.
  - `Department`: The department the contract applies to.
  - `Job Position`: The specific job position the contract applies to.
  - `Contract Type`: Choose from `CDI`, `CDD`, or `PFI` from the
    drop-down menu.
      - `CDI` is an open-ended contract with only a start date but no
        end date.
      - `CDD` is a contract with both a start date and an end date.
      - `PFI` is a Belgian-specific contract used when hiring employees
        that need training, and covers the training period specifically.
  - `End Date`: If the contract has a specific end date, click the
    drop-down menu, navigate to the correct month and year using the
    arrow icons, then click on the date.
  - `HR Responsible`: If there is a specific person in HR that is
    responsible for the contract, select the person from the drop-down
    menu.
  - `Analytic Account`: This field allows a link between the contract
    and a specific analytic account for accounting purposes.

### Contract details

The contract details section allows for the addition and editing of a
contract, and the ability to send the contract to the employee for
approval and signatures.

![Contract details in optional tabs for a new
contract.](contracts/contract-details.png)

  - `Contract Template`: Select a pre-existing contract template from
    the drop-down menu. Contract templates are typically created through
    the *Recruitment* application.
  - `New Contract Document Template`: Select a contract from the
    drop-down menu to be modified for this new employee contract.
  - `Contract Update Document Template`: Select a contract from the
    drop-down menu if the employee has an existing contract that
    requires updating.
  - `Notes`: The notes field is a text field where any notes for the
    employee contract can be entered for future reference.

#### Modifying a contract

Click the `External Link` button at the end of each line to open the
corresponding contract template and make any changes.

![Contract details in optional tabs for a new
contract.](contracts/external-link.png)

A pop-up window appears with all the contract details. Modify the fields
for the contract as needed.

![Edit the details for the contract.](contracts/modify-contract.png)

  - `Tags`: Select any tags associated with the contract.
  - `Signed Document Workspace`: This is where the signatures are
    stored. Choose a pre-configured workspace or create a new one.
  - `Signed Document Tags`: Select or create any tags associated only
    with the signed contract as opposed to the original unsigned
    contract.
  - `Redirect Link`: Enter a redirect link for the employee to access
    the contract. A redirect link takes the user from one URL to
    another, in this case, to the newly updated contract specifically
    written for them.
  - `Who can Sign`: Select either `All Users` or `On Invitation`.
      - `All Users`: Any user in the organization can sign the contract.
      - `On Invitation`: Only users selected in this field can sign the
        contract.
  - `Invited Users`: Select the person(s) that can sign the document.
  - `Document`: The attached document can be replaced by clicking the
    `✏️
    (pencil)` icon. A pop-up window appears so another document can be
    selected for upload. The file must be a PDF. To remove the document,
    click the `🗑️ (trash can)` icon.

Once the edits are complete, click the `Save` button. All the
information for the selected contract template populates the fields in
the `Salary Information` tab. Any additional tabs, such as `Personal
Documents`, appears if applicable.

### Salary information

![Optional tabs for a new contract.](contracts/salary-info.png)

This section is where the specific salary details are defined. This
section is country-specific, so depending on where the company is
located, these fields may vary.

Enter the amount in the various fields, or check a box to apply a
benefit. Some options that can be entered here include `Meal Vouchers`,
`Fuel Card`, `Internet`, `Paid Time Off`, etc.

Some fields may be automatically filled in based off of the contracts
selected in the `Contract Details` tab.

### Attachment of salary

Any automatic deductions or allocations for an employee, such as child
support payments and wage garnishments, are referred to as a *salary
attachment*. This section is where all of these deductions or
allocations are set.

To add a new deduction, click `Add a line`. Type in a description for
the allocation under `Description`.

![Enter a new line for each type of
garnishment.](contracts/garnishment.png)

Select the `Garnished Type` from the drop-down menu. Choose from:

  - `Attachment of Salary`: Any payments taken out towards something
    that is *not* child support. Typically any garnishments such as
    lawsuit payments, payments toward taxes owed, etc.
  - `Assignment of Salary`: Any deduction that is not required but
    voluntary, such as a pre-tax allocation to a college savings
    account.
  - `Child Support`: Any payments taken out specifically for child
    support.

Enter the start and end dates the entry applies to. Click on the
drop-down menu under `From` and `To`, navigate to the correct month and
year by using the `< > (arrow)` icons, then click on the `date`.

Last, enter the `Amount` that each payslip pays towards the entry.

To delete a line, click the `🗑️ (trash can)` icon at the end of the
line.

### Save and send the contract

Once a contract has been created and/or modified, save the contract by
clicking the `Save` button. Next, the contract must be sent to the
employee to be signed.

Click on one of the following buttons to send the contract to the
employee:

![Send the contract to the employee via one of the
buttons.](contracts/send-contract.png)

  - `Generate Simulation Link`: This option is for Belgian companies
    only. Clicking this opens a pop-up window that contains the basic
    information from the contract as well as a link for the contract
    when using the salary configurator. Click `Send Offer` to send an
    email to the employee so they can sign the contract.
    
    ![Sends a link to the employee for the
    contract.](contracts/simulation.png)
    
    <div class="note">
    
    <div class="title">
    
    Note
    
    </div>
    
    In order to send a contract using the `Generate Simulation Link`,
    there must be a signature field in the contract PDF being sent to
    the employee so they can sign it.
    
    </div>

  - `Signature Request`: Click this and a pop-up window appears where an
    email can be typed to the employee. Select the document, such as a
    contract, NDA, or Homeworking Policy, from the drop-down menu, and
    fill out the email section. Click `Send` when the email is ready to
    be sent.
    
    ![Request a signature for the contract via
    email.](contracts/sign-contract.png)

  - `Credit Time`: This option is for Belgian companies only. When
    clicked, a pop-up window appears that allows for the changing of
    working times, and can compute time off.
