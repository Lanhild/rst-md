# Manage users

Odoo defines a **user** as someone who has access to a database to
perform daily tasks. You can add as many users as you need and, in order
to restrict the type of information each user can access, rules can be
applied. Users and access rights can be added and changed at any point.

<div class="seealso">

\- `language` - `access_rights`

</div>

## Add individual users

Go to `Settings --> Manage Users` and click on *Create*.

![View of the settings page emphasizing the manage users field in
Odoo](manage_users/manage-users.png)

Fill in the form with the needed information. Under the tab `Access
Rights <access_rights>` choose the group within each application the
user can have access to.  
The list of applications shown is based on the applications installed on
the database.

![View of a user’s form emphasizing the access rights tab in
Odoo](manage_users/new_user.png)

When you are done editing the page and have *Saved* it, an invitation
email is automatically sent to the user. The user must click on it to
accept the invitation and create a login.

![View of a user’s form with a notification that the invitation email
has been sent in Odoo](manage_users/invitation-email.png)

<div class="note">

<div class="title">

Note

</div>

Remember that subscription prices follow the number of users. Refer to
our [pricing page](https://www.odoo.com/pricing) for more information.

</div>

With the `developer mode <developer-mode>` activated, *User Types* can
be selected.

![View of a user’s form in developer mode emphasizing the user type
field in Odoo](manage_users/user-type.png)

The *Portal* and *Public* options do not allow you to choose access
rights. Members have specific ones (such as record rules and restricted
menus) and usually do not belong to the usual Odoo groups.

## Deactivate users

Go to `Settings --> Users & Companies --> Users`, open the user you want
to deactivate, click on *Action*, and then on *Archive*.

<div class="danger">

<div class="title">

Danger

</div>

**Never** deactivate the main user (*admin*).

</div>

## Passwords management

### Reset passwords

#### Enable password resets from login page

It is possible to enable password resets directly from the login page.

To do so, go to `Settings --> Permissions`, activate **Password Reset**
and *Save*.

![Enabling Password Reset in Odoo
Settings](manage_users/password-reset-login.png)

#### Send reset instructions to users

Go to `Settings --> Users & Companies --> Users`, select the user out of
the list and click on *Send Password Reset Instructions* on its user
form. An email is automatically sent to them.

<div class="note">

<div class="title">

Note

</div>

The *Send Password Reset Instructions* button only appears if the Odoo
invitation email has already been confirmed by the user.

</div>

This email contains all the instructions needed to reset the password,
along with a link redirecting the user to an Odoo login page.

![Example of an email with a password reset link for an Odoo
account](manage_users/password-email.png)

### Change users’ passwords

Go to `Settings --> Users & Companies --> Users` and select a user to
access its form. Click on the *Action* button and select *Change
Password*.

![Change another user's password on
Odoo](manage_users/change-password.png)

Enter a new password and confirm by clicking on *Change Password*.

<div class="note">

<div class="title">

Note

</div>

This operation only modifies the password of the users locally and does
not affect their odoo.com account. If you want to change the odoo.com
password, you can `send the password reset
instructions <users/reset-password-email>`.

</div>

Click on *Change Password* one more time. You are then redirected to an
Odoo login page where you can reaccess your database using your new
password.

## Multi Companies

The *Multi Companies* field allows you to set to which of the multiple
companies database you hold the user can have access.

<div class="note">

<div class="title">

Note

</div>

Note that if not handled correctly, it may be the source of a lot of
inconsistent multi-company behaviors. Therefore, a good knowledge of
Odoo is required. For technical explanations refer to `this
</developer/howtos/company>` documentation.

</div>

![View of a user’s form emphasizing the multi companies field in
Odoo](manage_users/multi-companies.png)

<div class="seealso">

\- `companies`

</div>
