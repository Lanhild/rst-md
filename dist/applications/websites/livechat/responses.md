# Commands and canned responses

In the Konvergo ERP *Live Chat* application, *commands* allow the user to
perform specific actions both inside the chat window, and through other
Konvergo ERP applications. The *Live Chat* app also includes *canned responses*.
These are customized, pre-configured substitutions that allow users to
replace shortcut entries in place of longer, well-thought out responses
to some of the most common questions and comments.

Both commands and canned responses save time, and allow users to
maintain a level of consistency throughout their conversations.

## Execute a command

Live chat *commands* are keywords that trigger pre-configured actions.
When a live chat *operator* is participating in a conversation with a
customer or website visitor, they can execute a command by typing
<span class="title-ref">/</span>, followed by the command.

Commands, and the resulting actions, are only visible in the
conversation window for the live chat operator. A customer will not see
any commands that an operator uses in a conversation from their view of
the chat.

<img src="responses/responses-ticket-link.png" class="align-center"
alt="View of the chat window with a helpdesk ticket created in Konvergo ERP Live Chat." />

More information about each available command can be found below.

### Help

If an operator types <span class="title-ref">/help</span> in the chat
window, an informative message that includes the potential entry types
an operator can make is displayed.

- Type <span class="title-ref">@username</span> to mention a user in the
  conversation. A notification will be sent to that user's inbox or
  email, depending on their notification settings.
- Type <span class="title-ref">\#channel</span> to mention a *Discuss*
  channel.
- Type <span class="title-ref">/command</span> to execute a command.
- Type <span class="title-ref">:shortcut</span> to insert a
  `canned response <live-chat/canned-responses>`.

<img src="responses/responses-help.png" class="align-center"
alt="View of the message generated from using the /help command in Konvergo ERP Live Chat." />

<div class="seealso">

\- `/applications/productivity/discuss` -
`/applications/productivity/discuss/team_communication`

</div>

### Helpdesk & Helpdesk search

The <span class="title-ref">/helpdesk</span> and
<span class="title-ref">/helpdesk_search</span> commands allow operators
to both create helpdesk tickets directly from a conversation, and search
through existing tickets by keyword or ticket number.

> [!IMPORTANT]
> The <span class="title-ref">/helpdesk</span> and
> <span class="title-ref">/helpdesk_search</span> commands can only be
> used if the *Helpdesk* app has been installed, and *Live Chat* has
> been activated on a *Helpdesk* team. To activate `Live
> Chat`, go to `Helpdesk application --> Configuration --> Teams`, and
> select a team. Scroll to the `Channels` section and check the box
> labeled `Live Chat`.

#### Create a ticket from a live chat

If an operator types <span class="title-ref">/helpdesk</span> in the
chat window, the conversation is used to create a *Helpdesk* ticket.

> [!IMPORTANT]
> In version 16.3, the command to create a new ticket is
> <span class="title-ref">/ticket</span>. This only applies to databases
> running version 16.3.

After entering the <span class="title-ref">/helpdesk</span> command,
type a title for the ticket into the chat window, then press
<span class="title-ref">Enter</span>.

<img src="responses/helpdesk.png" class="align-center"
alt="View of the results from a helpdesk search in a Live Chat conversation." />

The newly created ticket will be added to the *Helpdesk* team that has
live chat enabled. If more than one team has live chat enabled, the
ticket will automatically be assigned based on the team's priority.

The transcript from the conversation will be added to the new ticket,
under the `Description` tab.

To access the new ticket, click on the link in the chat window, or go to
the `Helpdesk app` and click the `Tickets` button on the kanban card for
the appropriate team.

#### Search for a ticket from a live chat

If an operator types <span class="title-ref">/helpdesk_search</span> in
the chat window, they can search through *Helpdesk* tickets by ticket
number or keyword.

> [!IMPORTANT]
> In version 16.3, the command to search through *Helpdesk* tickets is
> <span class="title-ref">/search_tickets</span>. This only applies to
> databases running version 16.3.

After entering the <span class="title-ref">/helpdesk_search</span>
command, type a keyword or ticket number, then press
<span class="title-ref">Enter</span>. If one or more related tickets are
found, a list of links will be generated in the conversation window.

<img src="responses/helpdesk-search.png" class="align-center"
alt="View of the results from a helpdesk search in a Live Chat conversation." />

> [!NOTE]
> Results from the search command will only be seen by the operator, not
> the customer.

### History

If an operator types <span class="title-ref">/history</span> in the chat
window, it will generate a list of the most recent pages the visitor has
viewed on the website (up to 15).

<img src="responses/responses-history.png" class="align-center"
alt="View of the results from a /history command in a Live Chat conversation." />

### Lead

By typing <span class="title-ref">/lead</span> in the chat window, an
operator can create a *lead* in the *CRM* application.

<img src="responses/responses-lead.png" class="align-center"
alt="View of the results from a /lead command in a Live Chat conversation." />

> [!IMPORTANT]
> The <span class="title-ref">/lead</span> command can only be used if
> the *CRM* app has been installed.

After typing <span class="title-ref">/lead</span>, create a title for
this new lead, then press <span class="title-ref">Enter</span>. A link
with the lead title appears. Click the link, or navigate to the `CRM`
app to view the `Pipeline`.

> [!NOTE]
> The link to the new lead can only be seen and accessed by the
> operator, not the customer.

The transcript of that specific live chat conversation (where the lead
was created) is added to the `Internal Notes` tab of the lead form.

On the `Extra Information` tab of the lead form, the `Source` will be
listed as `Livechat`.

### Leave

If an operator types <span class="title-ref">/leave</span> in the chat
window, they can automatically exit the conversation. This command does
not cause the customer to be removed from the conversation, nor does it
automatically end the conversation.

<div class="seealso">

\- `/applications/sales/crm/acquire_leads` -
`/applications/services/helpdesk/overview/getting_started`

</div>

## Canned responses

*Canned responses* are customizable inputs where a *shortcut* stands in
for a longer response. An operator will enter the shortcut, and it will
automatically be replaced by the expanded *substitution* response in the
conversation.

### Create canned responses

To create a new canned response, go to
`Live Chat app --> Configuration --> Canned
Responses --> New`.

From here, type the shortcut command into the `Shortcut` field.

Then, click into the `Substitution` field, and enter the custom message
that will be sent to visitors in place of the shortcut. Click `Save`.

> [!TIP]
> Try to connect the shortcut to the topic of the substitution. The
> easier it is for the operators to remember, the easier it will be to
> use the canned responses in conversations.

### Use canned responses in a live chat conversation

To use a canned response during a live chat conversation, type a colon
(<span class="title-ref">:</span>) into the chat window, followed by the
shortcut.

<div class="example">

An operator is chatting with a visitor. As soon as they type
<span class="title-ref">:</span> they would see a list of available
responses. They can manually select one from the list, or continue to
type. If they want to use the canned response <span class="title-ref">'I
am sorry to hear that.'</span>, they would type
<span class="title-ref">:sorry</span>.

</div>

<img src="responses/canned-responses.png" class="align-center"
alt="View of a chat window and the use of a canned response in Konvergo ERP Live Chat." />

> [!TIP]
> Typing <span class="title-ref">:</span> into a chat window on its own
> will generate a list of available canned responses. Responses can be
> manually selected from the list, in addition to the use of shortcuts.
>
> <img src="responses/response-list.png" class="align-center"
> alt="View of a chat window and the list of available canned responses." />
