# Add a new employee

When a new employee is hired, the first step is to create a new employee
form. Starting in the `Employees` app default view, click the `Create`
button to access a new employee form. Fill out the required information
(underlined in bold) and any additional details, then click `Save`.

![Create a new employee card.](new_employee/employee-new.png)

<div class="note">

<div class="title">

Note

</div>

The current company phone number and name is populated in the `Work
Phone` and `Company` fields.

</div>

## General information

### Required fields

  - `Name`: Enter the employee's name.
  - `Company`: Select the company from the drop-down menu that the new
    employee is hired by, or create a new company by typing the name in
    the field.
  - `Working Hours`: In the `Work Information` tab, select the desired
    `Working Hours` from the drop-down menu.

![Working Hours are located in the Work Information
tab.](new_employee/working-hours.png)

<div class="note">

<div class="title">

Note

</div>

`Working Hours` are related to a company's working times, and an
employee cannot have working hours that are outside of a company's
working times.

Each individual working time is company-specific, so for multi-company
databases, each company needs to have its own working hours set.

If an employee's working hours are not configured as a working time for
the company, new working times can be added, or existing working times
can be modified. To add or modify a working time, go to the `Payroll app
--> Configuration --> Working Times`, and add a new working time or edit
an existing one.

After the new working time is created, set the working hours for the
employee.

</div>

### Optional fields

  - `Photo`: In the top right image box of the employee card, click on
    the `✏️
    (pencil)` edit icon to select a photo to upload.
  - `Job Position`: Enter the employee's job position title.
  - Tags: Click on a tag in the drop-down menu to add any tags
    applicable to the employee. Any tag can be created in this field by
    typing it in. Once created, the new tag is available for all
    employee cards. There is no limit to the amount of tags that can be
    added.
  - Work Contact Information: Enter the employees `Work Mobile`, `Work
    Phone`, `Work Email`, and/or `Company` name.
  - `Department`: Select the employee's department from the drop-down
    menu.
  - `Manager`: Select the employee's manager from the drop-down menu.
  - `Coach`: Select the employee's coach from the drop-down menu.

<div class="note">

<div class="title">

Note

</div>

After a `Manager` is selected, if the `Coach` field is blank, the
selected manager automatically populates the `Coach` field.

</div>

<div class="tip">

<div class="title">

Tip

</div>

To make edits to the selected `Department`, `Manager`, `Coach`, or
`Company`, click the `External Link` button next to the respective
selection. The `External Link` button opens the selected form, allowing
for modifications. Click `Save` after any edits are made.

</div>

## Additional information tabs

### Resumé tab

#### Resumé

Next, the employee's work history is entered in the `Resumé` tab. Each
previous experience must be entered individually. Click `Create a New
Entry`, and the `Create Resumé
lines` form appears. Enter the following information, then click the
`Save & Close` button if there is only one entry to add, or click the
`Save & New` button to save the current entry and create another line.

![Add information for the previous work experience in this
form.](new_employee/resume-lines.png)

  - `Name`: Type in the name of the previous work experience.
  - `Type`: From the drop-down menu, select either `Experience`,
    `Education`, `Internal Certification`, `Internal Training`, or type
    in a new entry.
  - `Display Type`: Select either `Classic`, `Certification`, or
    `Course` from the drop-down menu.
  - `Date Start` and `Date End`: Enter the start and end dates for the
    work experience. To select a date, use the `< (left)` and `>
    (right)` arrow icons to scroll to the desired month, then click on
    the day to select it.
  - `Description`: Enter any relevant details in the field.

#### Skills

An employee's skills can be entered in the `Resumé` tab in the same
manner a resumé line is created. Click the `Create a New Entry` button
under `Skills` and a `Create Skills` form appears. Fill in the
information, then click the `Save &
Close` button if there is only one entry to add, or click the `Save &
New` button to save the current entry and immediately create a new
entry.

![Create a new skill for the employee.](new_employee/create-skill.png)

  - `Skill Type`: Select from the drop-down menu either `Languages`,
    `Dev`, `Music`, `Marketing`, or type in a new skill type. After
    entering the new skill type, an option to `Create` the skill or
    `Create and
    Edit` the skill appears. Click `Create and Edit`, and a pop-up for
    the specific skill type appears. This can also be accessed with the
    `External Link` button next to the new skill. This form allows for
    the creation of specific skills and levels. Click `Add a
    line` and enter the information for the new skill, then repeat for
    all other added skills. Repeat this process for the `Levels`
    section. Click `Add a line` to add each level and progress.
    
    ![Add a new skill and levels.](new_employee/new-skills.png)
    
    <div class="example">
    
    To add a math skill set, enter <span class="title-ref">Math</span>
    in the `Name` field. In the `Skills` field, enter
    <span class="title-ref">Algebra</span>,
    <span class="title-ref">Calculus</span>, and
    <span class="title-ref">Trigonometry</span>. And, in the `Levels`
    field enter <span class="title-ref">beginner</span>,
    <span class="title-ref">intermediate</span>, and
    <span class="title-ref">expert</span>. Then, either click `Save &
    Close` or `Save & New`.
    
    </div>

  - `Skill`: The corresponding skills associated with the selected
    `Skill Type` appear in a drop-down menu. For example, selecting
    `Language` as the `Skill
    Type` presents a variety of languages to select from under the
    `Skills` field. Select the appropriate pre-configured skill, or type
    in a new one.

  - `Skill Level`: Pre-defined skill levels associated with the selected
    `Skill
    Type` appear in a drop-down menu. Select a level or create a new
    skill level by typing it in.

  - `Progress`: Progress is automatically selected based on the selected
    `Skill
    Level`. Skill levels and progress can be modified in the `Skill
    Type` pop-up form, which is accessed via the `External Link` button
    next to `Skill Type` field.

To delete any line from the `Resumé` tab, click the `🗑️ (trash can)`
delete icon to delete the entry. Add a new line by clicking the `ADD`
button next to the corresponding section.

### Work information tab

  - `Location`: Select the `Work Address` from the drop-down menu. The
    `External Link` button opens up the selected company form in a
    window, and allows for editing. The `Work Location` is where any
    specific location details should be noted, such as a floor, or
    building.

  - `Approvers`: Using the drop-down menus, select the employees
    responsible for approving `Time Off`, `Expenses`, and `Timesheets`
    for the employee. The `External Link` button opens a form with the
    approver's `Name`, `Email Address`, `Company`, `Phone`, and `Mobile`
    fields. These can be modified, if needed. Click `Save` after making
    any edits.

  - `Schedule`: Select the `Working Hours` (required) and `Timezone` for
    the employee. The `External Link` button opens up a detailed view of
    the specific daily working hours. Working hours can be created,
    modified, or deleted here. Global time off (such as holidays) can be
    entered in the `Global Time Off` tab. Click `Add a line` to add a
    new global time off.

  - `Planning`: Click on a planning role from the drop-down menu for
    both the `Default Planning Role` and the `Planning Roles` fields to
    add a role. There is no limit to the amount of `Planning Roles` that
    can be selected for an employee, but there can only be one `Default
    Planning Role`. The default is the *typical* role that the employee
    performs, where the `Planning Roles` are *all* the specific roles
    the employee is able to perform.
    
    ![Add the work information to the Work Information
    tab.](new_employee/work-info.png)

### Private information tab

No information in the `Private Information` tab is required, however,
some information in this section may be critical for the company's
payroll department. In order to properly process payslips and ensure all
deductions are accounted for, the employee's personal information should
be entered.

Here, the employee's `Private Contact`, `Marital Status`, `Emergency
Contact`, `Education`, `Citizenship`, `Dependant`, and `Work
Permit` information is entered. Fields are entered either using a
drop-down menu, clicking a check box, or typing in the information.

  - `Private Contact`: Enter the `Address` for the employee. The
    selection can be made with the drop-down menu. If the information is
    not available, type in the name for the new address. To edit the new
    address, click the `External Link` button to open the address form.
    On the address form, enter the necessary details, then click `Save`.
    Some other information in the `Private Contact` section may
    auto-populate, if the address is already listed in the drop-down
    menu.
  - `Marital Status`: Select either `Single`, `Married`, `Legal
    Cohabitant`, `Widower`, or `Divorced` from the drop-down menu.
  - `Emergency Contact`: Type in the name and phone number of the
    employee's emergency contact.
  - `Education`: Select the highest level of education completed by the
    employee from the `Certificate Level` drop-down menu. Options
    include `Graduate`, `Bachelor`, `Master`, `Doctor`, or `Other`. Type
    in the `Field of Study`, and the name of the `School` in the
    respective fields.
  - `Citizenship`: This section houses all the information relevant to
    the citizenship of the employee. Some selections use a drop-down
    menu, as does the `Nationality (Country)`, `Gender`, and `Country of
    Birth` sections. The `Date of Birth` uses a calendar module to
    select the date. First, click on the name of the month, then the
    year, to access the year ranges. Use the `< (left)` and `> (right)`
    arrow icons, navigate to the correct year range, and click on the
    year. Next, click on the month. Last, click on the day to select the
    date. Type in the information for the `Identification No`, `Passport
    No`, and `Place of Birth` fields. If the employee is `Disabled` or a
    `Nonresident`, click the check box next to the respective fields.
  - `Dependant`: If the employee has any dependants, that information is
    entered here. Type in the number of children the employee has, and
    check the boxes next to `Disabled
    Children` and/or `Other Dependent People` if applicable.
  - `Work Permit`: If the employee has a work permit, enter the
    information in this section. Type in the `Visa No` and/or `Work
    Permit No` in the corresponding fields. Using the calendar module,
    select the `Visa Expire Date` to enter the expiration date.

![Add the private information to the Private Information
tab.](new_employee/private-info.png)

### HR settings tab

This tab provides various fields for different information, depending on
the country the company is located. Different fields are configured for
different locations, however some sections appear regardless.

  - `Status`: If applicable, select a `Related User`, `Job Position`,
    and `Language` with the drop-down menus. Type in the `Registration
    Number of
    the Employee`, and the `NIF Country Code` if available.
  - `Fleet`: If the employee has access to a company car, enter the
    `Mobility
    Card` information here.
  - `Timesheets`: Enter the employee's cost per hour in a $XX.XX format.
    This is factored in when the employee is working at a work center.
    This value affects the employee's pay, and may also affect
    manufacturing costs for a product, if the value of the manufactured
    product is not a fixed amount.
  - `Attendance`: This section may only appear for Belgian companies.
    Enter the `INSZ or BIS` number if applicable. `Badge ID` and a `PIN
    Code` can be entered here, if the employee needs/has one. Click
    `Generate` next to the `Badge ID` to create a badge ID.

![Enter any information prompted in the HR Settings tab for the
employee.](new_employee/hr-settings.png)

### Personal documents tab

The `Personal Documents` tab is only displayed for certain countries. If
this tab is not visible, it is not applicable to the company's location.

Add a file for the employee's `ID Card Copy`, `Driving License`, `Mobile
Subscription Invoice`, `SIM Card Copy`, and `Internet
Subscription Invoice` by clicking the `Upload Your File` button next to
the corresponding field. File types that can be accepted are `.jpg`,
`.png`, and `.pdf`.

![Upload personal documents for the employee in the Personal Documents
tab, either a jpg,&#10;png, or pdf.](new_employee/personal.png)
