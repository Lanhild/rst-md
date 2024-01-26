# Job positions

In the default `Recruitment` dashboard view, all job positions are
shown, regardless of status. Current published positions with active
applicants are shown, as well as job positions that have been created
but have not yet been published.

Each job position is shown in an individual kanban card. If the job
position is active and candidates can apply, then a `Published` banner
will appear in the top-right corner of the card.

View submitted applications by clicking the `# Applications` button,
with <span class="title-ref">\#</span> being the number of applications
received. If a position is not published, a `Start Recruitment` button
will appear instead.

![Main dashboard view of Recruitment showing all job
positions.](new_job/jobs.png)

## Create a new job position

There are two ways a job position can be created: from the main
`Recruitment` dashboard, or from the `Configuration` menu.

To create a job position from the `Configuration` menu, go to
`Recruitment
app --> Configuration --> Job Positions`. The job positions in this view
are displayed in a list.

Create a new job position from the `Job Positions` dashboard by clicking
the `Create` button in the top-left corner.

Then, a `Create a Job Position` pop-up window will appear. From here,
enter the name of the position (such as <span class="title-ref">Sales
Manager</span>, <span class="title-ref">Mechanical Engineer</span>,
etc.). When complete, click the `Create` button to save the entry, or
the `Discard` button to delete it.

![Create a new job position.](new_job/job-title.png)

Once the job position has been created, it will appear as a card in the
kanban view on the main `Recruitment`<span class="title-ref"> dashboard,
as well as in the list view on the :guilabel:\`Configuration</span>
dashboard.

### Edit a new job position

Once the job position is created, it's time to enter the details for the
position. Click on the `⋮ (three dots)` icon in the upper-right corner
of the relevant card to reveal several options, and then click `Edit` to
edit the details.

![Edit the job position card.](new_job/edit-job.png)

Enter the job description in the `Job Description` tab. This information
is what is visible to potential employees when searching for available
jobs.

#### Recruitment

All the basic information about the job position is listed under the
`Recruitment` tab. None of the fields are required, but it is a good
idea to provide at least a few details, such as where the job is
located.

The fields can be filled out as follows:

  - `Company`: Select the company the job is for.

  - `Website`: Select the website where the job will be published.

  - `Department`: Select the relevant department for the job position.

  - `Expected New Employees`: Enter the number of employees to be hired
    for this position.

  - `Contract Template`: Select a contract template that will be used
    when offering the job to a candidate.

  - `Interview Form`: Select a form that applicants will fill out prior
    to their interview, or create a new form. Once selected, a `Display
    (Name) Form` button will appear next to the selected form. Click on
    this to see how the form will be displayed to the candidate on the
    front end.
    
    ![The interview form will display a link to see the form as the
    candidate will.](new_job/interview-form.png)

  - `Recruiter`: Select the person who will be doing the recruiting for
    this role.

![Enter job information details in the recruitment
tab.](new_job/recruitment-tab.png)

#### Appraisals

This tab displays the `Employee Feedback Template` and the `Manager
Feedback
Template`, both of which will be used after the employee has been hired,
the predetermined time has passed, and feedback is requested.

### Create interview form

Once a job position has been made, the `Interview Form` needs to be
created. In the kanban view of the `Recruitment` dashboard, click on the
`⋮ (three dots)` icon in the upper-right corner of the card to reveal
several options, and then click `Create Interview Form`.

![Create an interview form for the new
position.](new_job/new-interview-form.png)

Click on `Add a section` to add a section to the form. A line will
appear, and a section heading can be entered. When complete, click off
the line, or press enter to lock in the new section on the form.

![Enter job information details in the recruitment
tab.](new_job/add-section.png)

Next, click `Add a question` to add a question to the section. A pop-up
window appears to enter the question details. Type out the question in
the top line.

There are several *Question Types* to choose from:

  - `Multiple Lines Text Box`: allows the applicant to enter several
    lines of text
  - `Single Line Text Box`: limits the applicant to only a single line
    of text
  - `Numerical Value`: only allows a number to be entered
  - `Date`: a calendar module is presented to select a date
  - `Datetime`: a calendar module and a clock icon is presented to
    select a date and time
  - `Multiple choice: only one answer`: a multiple choice question that
    only allows the candidate to select one answer
  - `Multiple choice: multiple answers allowed`: a multiple choice
    question that allows the candidate to select multiple answers
  - `Matrix`: a customizable table that allows the candidate to choose
    an answer for each row

![Add a new question to the interview form.](new_job/questions.png)

Questions and sections can be reorganized. Move them by clicking and
dragging individual section headings or question lines to their desired
position(s).

Sections are indicated by a gray background, while questions have a
white background.

![A sample of categories and questions for a
candidate.](new_job/questions-matrix.png)

Next, configure the options for the interview form. Click the `Options`
tab to view all the options to configure, by category.

#### Questions

  - `Layout`: Choose how the questions should be displayed.
    
      - `One page with all the questions`: Display all sections and
        questions at the same time.
      - `One page per section`: Display each section with the
        corresponding questions on an individual page.
      - `One page per question`: Display a single question on each page.

  - `Progression Mode`: Display the progress the candidate is making,
    either as a `Percentage`, or as a `Number`.

  - `Survey Time Limit`: Check this box to limit the time allowed to
    complete the form. When selected, a field to enter the minutes
    appears next to the checked box. Enter the time (using an XX:XX
    minute/second format) in the field.

  - `Selection`: Display the entire form (e.g. `All questions`), or only
    a random selection of questions from each section (`Randomized per
    section`).
    
    <div class="note">
    
    <div class="title">
    
    Note
    
    </div>
    
    Although it is a selectable option, the `Randomized per section`
    option is not typically selected for an interview form.
    
    </div>

#### Scoring

  - `No scoring`: Select this option to not score the form.

  -   - `Scoring with answers at the end`: Select this option to score
        the form and display the  
        correct answers for the candidate when they are finished with
        the form.

  - `Scoring without answers at the end`: Select this option to score
    the form but not display the answers to the candidate.

If one of the scoring options was selected, a `Success %` field will
appear. Enter the percentage the candidate needs to pass the exam
(example, 80.00%). The entry should be written in an “XX.XX” format.

#### Candidates

  - `Access Mode`: Specify who can access the exam. Either `Anyone with
    the link` or `Invited people only`.
  - `Appraisal Managers Only`: Check this box so only the managers who
    are reviewing the exam can see the answers. If left unchecked,
    anyone can view the results.
  - `Login Required`: Check this box to require candidates to log in
    before taking the exam, whether they have a valid token or not.
  - `Attempts Limit`: If there is a limit to how many times the exam can
    be taken, check this box, then enter the maximum attempt number in
    the field next to it.

#### Live Session

  - `Reward quick answers`: If the exam is to be taken live, check this
    box to award more points to participants who answer quickly.
  - `Session Code`: Enter an access code that will allow the viewers
    into the live exam session.

After all fields have been entered, click the `Save` button to save the
changes, or click `Discard` to delete the changes.

![Various options to configure for the interview
form.](new_job/options.png)
