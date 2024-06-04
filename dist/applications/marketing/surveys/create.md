# Survey essentials

Companies often use surveys to collect valuable information from their
customers and employees, which in turn, allows them to make more
informed business decisions.

In Odoo, surveys are used to collect customer feedback, evaluate the
success of a recent event, measure the satisfaction of customers (or
employees), and gain more insight into shifting market sentiments.

## Getting started

To begin, open the `Surveys` application and click `Create`. Odoo then
redirects the page to a blank survey template form.

On the survey form, add a `Survey Title` and then add a cover image to
the survey by hovering over the photo icon and clicking on the
`Edit (pencil)` icon. When the file explorer window opens, choose an
image from the local files.

Below the `Survey Title` are various tabs in which the survey questions
and format can be created and customized. These tabs are labeled as
follows:

- `Questions`: the list of questions to be asked in the survey
- `Description`: contextual information to aid in understanding the
  survey
- `Options`: choices for survey respondents to answer the questions

<img src="create/questions-description-options.png" class="align-center"
alt="Various tabs that can be found on the survey template page." />

## Questions tab

Add questions and sections to the survey in the `Questions` tab. A
section divides the survey into parts in order to visually group similar
questions together. To make a section, click `Add a section` and type in
a section name. Then, add questions or drag and drop questions into the
divided sections.

Clicking `Add a question` opens the `Create Sections and Questions`
pop-up to create and customize the survey question.

<img src="create/survey-question-pop-up.png" class="align-center"
alt="The survey question pop-up window." />

### Create questions

In the `Create Sections and Questions` pop-up, type the question in the
`Question` field. Then, choose the `Question Type`. A preview of how the
question type looks is shown in the preview window.

Choose from the following `Question Types`:

- `Multiple Lines Text Box`
- `Single Line Text Box`
- `Numerical Value`
- `Date`
- `Datetime`
- `Multiple choice: only one answer`
- `Multiple choice: multiple answers allowed`
- `Matrix`

> [!NOTE]
> Different features appear in the `Answers` and `Options` tabs,
> depending on the `Question Type` chosen. However, the `Description`
> tab always remains the same, regardless of what question is chosen.

#### Create sections and questions

Once a `Question Type` has been selected, there are three possible tabs
where information can be customized for the question. These include the
`Answers` (if applicable), `Description`, and `Options` tabs.

Each tab offers a variety of different features depending on what
`Question Type` was chosen.

For example, in the `Options` tab, the following options may appear:

- `Mandatory Answer`: the question must be answered.
- `Matrix Type`: for matrix-type questions, select if one choice or
  multiple choices can be selected per row.
- `Number of columns`: select how many columns are displayed.
- `Images on answers`: allow images on the answer options.
- `Conditional Display`: determine if the question is displayed based on
  the participant's answer to a previous question.
- `Show Comments Field`: allow the participant to type a comment in a
  text box.
- `Question Time Limit`: for live session surveys, set a time limit for
  the question.

##### Conditional Display

`Conditional Display` means the question is only displayed if the
specified conditional answer has been selected in a previous question.

When the box next to `Conditional Display` is selected, the `Triggering
Question` field appears. Select a question from the survey.

Then, a `Triggering Answer` field appears. Here, select which answer
will trigger this `Conditional Display` question.

## Options tab

Back on the main survey template form, under the `Options` tab, there
are different sections of settings that can be modified.

The sections include:

- `Questions`: focuses on the overall presentation of the survey
- `Scoring`: decides how the survey is scored
- `Candidates`: manages access to the survey
- `Live Session`: enables the survey into a real-time group activity.

### Questions

First, select the `Layout` of the survey. The following options can be
chosen:

- `One page with all the questions`
- `One page per section`
- `One page per question`

If either the `One page per section` or `One page per question` options
are chosen, then the `Back Button` option appears. If selected, the
`Back Button` option allows the participant to go back to a question
during the survey.

Under the `Layout` options is the `Progression Mode` setting, which
indicates how the participant's progress during the survey is displayed.
It is shown as either a `Percentage` or a `Number`.

Next, there is an option available to add a `Survey Time Limit`. To
implement this option, simply check the box, and enter the amount of
time (in minutes) participants have to complete the survey.

After the `Survey Time Limit` option is a section labeled `Selection`.
Here, questions can be `Randomized per section`, in other words, the
number of random questions can be configured by section. This mode is
ignored in a live session.

<div class="seealso">

`time_random`

</div>

### Scoring

The following options are available when deciding how a `Scoring`
method:

- `No scoring`
- `Scoring with answers at the end`
- `Scoring without answers at the end`

If either the `Scoring with answers at the end` or
`Scoring without answers at
the end` options are selected, a `Success %` field appears. Set the
percentage of correct answers needed to pass the survey.

Next, there is the option to make the survey a certification. To do so,
check the box next to the option labeled `Is a Certification`, and two
additional fields appear. Select a color theme in the
`Certification Template` field and then choose an `Email
Template`. When a participant passes the certification with the required
score, an email from Odoo will automatically be sent to that person
using the selected email template.

If the `Give Badge` feature is enabled and the `Certification Badge` is
set, the survey participant also receives a badge upon passing the
certification.

<div class="seealso">

`scoring`

</div>

### Candidates

To determine access to the survey, the `Access Mode` has two options to
choose between: `Anyone with the link` and `Invited people only`.

Below the `Appraisal Managers Only` checkbox is the `Login Required`
option to require a login to participate in the survey. If this option
is activated, an `Attempts
Limit` field also populates, in which the number of survey attempts is
defined for the participant.

### Live Session

The `Live Session` section is dedicated to users who are conducting
surveys in real-time, wherein they directly engage with and collect
answers from a live audience.

Customize the `Session Code` here; this code is needed for participants
to access the live session survey. Reward participants for quick answers
by selecting the checkbox labeled `Reward quick answers`. By checking
it, attendees will get more points if they answer quickly.

## Description tab

Back on the main survey template page is the `Description` tab, where a
custom description of the survey can be added. This is displayed beneath
the title on the survey's homepage, which is on the front end of the
website made through the Odoo `Website` app.

## Test and share the survey

Once the survey is created and saved, run a test to check for possible
errors before finally sending it out to the participants by clicking
`Test` in the upper left corner of the survey template page.

When activated, Odoo redirects the page to a test version of the survey
on the front end of the website. This page displays how the survey will
look to participants. Proceed to run through the survey, like a normal
participant, to check for errors.

To return to the survey template form in the backend, simply click the
`This is a test
survey. Edit Survey` link in the blue banner along the top of the page.
Once Odoo redirects the page to the survey template in the backend, make
any further changes, as needed, before officially sending the survey out
to participants.

When the survey is ready to be shared with the audience, click the
`Start Survey` button in the upper-left corner of the survey template
form. Then, click `Share`.

In the pop-up window, add the survey recipients in the `Recipients`
field (for existing contacts in the Odoo database) or the
`Additional emails` field (for contacts that do not want to be listed in
the Odoo database). Finally, click `Send`.

As answers are received, check them by clicking the `Answers` smart
button on the survey template form, or the `See Results` button in the
upper left corner. To end the survey, click the `Close` button on the
survey template form.
