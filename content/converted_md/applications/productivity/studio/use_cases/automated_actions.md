# Advanced Use Cases: Automated Actions

  - **Case scenario 1: when a Belgian lead is created, a 3-stars
    priority should be automatically applied.**

Under *Automations*, click on *Create* and set the following rules:

  - *Model*: Lead/Opportunity
  - *Active*: On
  - *Trigger*: On Creation & Update
  - *Apply on*: Country \> Country Name = Belgium
  - *Action To Do*: Update the Record
  - *Data to Write*: Lead/Opportunity \> Value \> 3

![View of an automated action that sets a high priority to Belgian leads
in Odoo Studio](automated_actions/hight_priority_leads.png)

<div class="tip">

<div class="title">

Tip

</div>

Check `this doc <filters_status_bar>` in order to have another automated
action example.

</div>

<div class="seealso">

\- `../concepts/understanding_automated_actions` -
`../concepts/understanding_general`

</div>
