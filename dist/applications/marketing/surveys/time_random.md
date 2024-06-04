# Timed and randomized questions

When creating a survey in Odoo, there are options to set a time limit on
the survey and randomize the questions.

## Time limit

During a timed survey, participants must finish the survey within a
specified period of time. A common use case for implementing a time
limit is that it greatly reduces the chance of participants looking up
responses via external resources (e.g. web search), and reduces the
survey to a "closed book" testing environment.

Find the `Survey Time Limit` setting in the `Options` tab of the survey
form, under the `Questions` section.

<img src="time_random/time-limit.png" class="align-center"
alt="Time limit field in the options tab of a survey template form." />

When the `Survey Time Limit` option is checked, a timer will be
displayed on every page of the survey, letting participants keep track
of the time remaining while the survey is active.

> [!NOTE]
> Participants that do not submit their survey by the preconfigured time
> limit will *not* have their answers saved.

## Randomized selection

When a survey is randomized, Odoo shuffles the questions and reveals
them in a random order every time a participant begins the
questionnaire. Using randomization as a survey method discourages
participants from looking at each other's responses, and helps control
for individual testing.

To randomize a survey, click the `Options` tab on the survey form. In
the `Questions` section, select `Randomized per section` for the
`Selection` field. After enabling, navigate to the `Questions` tab and
look in the `Random questions count` column. From there, determine how
many questions (per section) Odoo should select and display during the
shuffling of questions.

<img src="time_random/random-questions.png" class="align-center"
alt="Randomized question count in the questions tab of a survey." />

<div class="seealso">

`scoring`

</div>
