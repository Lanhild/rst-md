# Mailing lists

Mailing lists are important for a number of reasons. Mailing lists can
provide valuable leads for sales teams, communicate with focus groups
participants, contact consumers directly for useful feedback, and more.

## Create mailing lists

To create a mailing list in the *Email Marketing* application, navigate
to `Mailing
lists --> Mailing lists --> Create`. Clicking `Create` reveals a pop-up
window.

![View of the mailing list pop-up in the Odoo Email Marketing
application.](mailing_lists/new-mailing-list-popup.png)

In the pop-up, name the mailing list and designate if the mailing list
should be public with the `Is Public` checkbox.

The `Is Public` option allows the mailing list to be accessible by
recipients in the unsubscription page, making it possible for them to
update their subscription preferences.

After those options have been configured, click `Create` to create the
mailing list, which Odoo automatically adds to the `Mailing Lists` page.

## Add contacts to a mailing list

After a mailing list has been created (and added to the `Mailing Lists`
dashboard), click on the desired mailing list to add contacts to the
list.

Clicking the desired mailing list reveals a separate `Mailing List
Contacts` page, in which contacts can be added to this specific list by
clicking `Create`, and adding contact information directly on a separate
contact detail form.

Or, while in the `Email Marketing` application, navigate to `Mailing
Lists --> Mailing List Contacts`. Doing so reveals a separate page with
all the mailing list contacts in the database.

From here, click `Create`, and add a contact with the same previous
steps. Or, click the `Import` icon (to the right of the `Create` button)
to import contacts into the database.

Once contacts are in the database, click into the desired contact's
detail form, and add the preferred mailing list in the `Mailing List`
tab (at the bottom of the contact detail form), by clicking `Add a
line`, and selecting the desired mailing list. Multiple mailing lists
can be added to a single contact's detail form.

![View of a contact detail form with mailing list tab in Odoo Email
Marketing.](mailing_lists/contact-form-mailing-list-tab.png)

### Create new mailing list from contact detail form

To create a mailing list from a contact detail form, click `Add a line`,
and type in the name of a new mailing list in the empty field that
appears. Then, select either `Create` or `Create and Edit...`.

![View of the new mailing list drop-down on contact form in Odoo Email
Marketing.](mailing_lists/new-list-dropdown-create-options.png)

The `Create` option quickly creates the mailing list to the contact
detail form, and the list can be configured at a later date. The `Create
and Edit...` option creates the mailing list, and reveals a pop-up
window, in which the new mailing list can be configured right away.

![View of the create and edit mailing list pop-up in Odoo Email
Marketing.](mailing_lists/create-and-edit-mailing-list-popup.png)

## Link a mailing list to website (Newsletter blocks)

When a mailing list is created in the database, Odoo provides the option
to directly link the mailing list on the Odoo-built website (created via
Odoo's `Website` application).

To link a mailing list to a website, navigate to the front-end of the
website, and enter `Edit` mode by clicking `Edit` in the upper-right
corner. When clicked, Odoo reveals a right-sidebar, filled with
drag-and-drop *Building Blocks* that are packed with various features,
options, and design elements.

Then, to add a *subscription field* for a specific mailing list onto a
website, drag-and-drop any of the `Newsletter` options (`Newsletter
Block`, `Newsletter Popup`, or `Newsletter`).

<div class="tip">

<div class="title">

Tip

</div>

To quickly locate the `Newsletter` building block options (while in
`Edit` mode on the front-end of the website), type
<span class="title-ref">Newsletter</span> into the search bar, located
in the right sidebar, under the `Blocks` tab, and Odoo reveals the three
different `Newsletter` block options.

![View of how to quickly search for Newsletter blocks in the Odoo
Website application.](mailing_lists/newsletter-block-search.png)

</div>

When a `Newsletter` block is dragged onto the body of the website, Odoo
reveals a pop-up window, in which the desired mailing list is selected
from a drop-down menu (and linked) to this block on the website.

![View of the add mailing list subscription pop-up on an Odoo
Website.](mailing_lists/add-mailing-list-popup-website.png)

  - `Newsletter Block` - Adds a block onto the webpage, providing
    visitors with the option to add their email address to this mailing
    list, and subscribe to future communications.
    
    Here's an example of a `Newsletter Block`.
    
    ![View of a sample newsletter block in the Odoo Website
    application.](mailing_lists/newsletter-block-sample.png)

  - `Newsletter Popup` - Tells Odoo to reveal a subscription pop-up
    window to occur at a certain part of the webpage. When the visitor
    scrolls to this predetermined point, a pop-up subscription window
    appears, asking for their email address to subscribe to the mailing
    list. The pop-up window can be edited further to fit any business
    needs.
    
    Here's an example of a `Newsletter Popup`.
    
    ![View of a sample newsletter pop-up sample on an Odoo
    Website.](mailing_lists/newsletter-popup-sample.png)

  - `Newsletter` - Provides visitors with a simple field to add their
    email address to the mailing list, and subscribe to future mailings
    in the footer (or anywhere else on the page).
    
    Here's an example of a `Newsletter` dynamic block.
    
    ![View of a Newsletter dynamic block on an Odoo
    Website.](mailing_lists/newsletter-footer-block-sample.png)

<div class="seealso">

\- `/applications/marketing/email_marketing` -
`/applications/marketing/email_marketing/unsubscriptions`

</div>
