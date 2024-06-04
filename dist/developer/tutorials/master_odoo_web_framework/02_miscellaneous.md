# Chapter 2: Miscellaneous

In the previous task, we learned how to create fields and views. There
is still much more to discover in the feature-rich Odoo web framework,
so let's dive in and explore more in this chapter!

<figure>
<img src="02_miscellaneous/previously_learned.svg" class="align-center"
style="width:70.0%" alt="02_miscellaneous/previously_learned.svg" />
<figcaption>This is the progress that we have made in discovering the
JavaScript web framework at the end of <code class="interpreted-text"
role="doc">01_fields_and_views</code>.</figcaption>
</figure>

<div class="admonition">

Goal

<img src="02_miscellaneous/kitten_mode.png" class="align-center"
alt="image" />

</div>

<div class="spoiler">

Solutions

The solutions for each exercise of the chapter are hosted on the
[official Odoo tutorials
repository](https://github.com/odoo/tutorials/commits/%7BCURRENT_MAJOR_BRANCH%7D-solutions/awesome_tshirt).

</div>

## 1. Interacting with the notification system

> [!NOTE]
> This task depends on `the previous exercises <01_fields_and_views>`.

After using the `Print Label` button for some t-shirt tasks, it is
apparent that there should be some feedback that the
<span class="title-ref">print_label</span> action is completed (or
failed, for example, the printer is not connected or ran out of paper).

<div class="exercise">

#\. Display a `notification <frontend/services/notification>` message
when the action is completed successfully, and a warning if it failed.
\#. If it failed, the notification should be permanent.

<img src="02_miscellaneous/notification.png" class="align-center"
alt="image" />

</div>

<div class="seealso">

[Example: Using the notification
service](%7BGITHUB_PATH%7D/addons/web/static/src/views/fields/image_url/image_url_field.js)

</div>

## 2. Add a systray item

Our beloved leader wants to keep a close eye on new orders. He wants to
see the number of new, unprocessed orders at all time. Let's do that
with a systray item.

A `systray <frontend/registries/systray>` item is an element that
appears in the system tray, which is a small area located on the
right-hand side of the navbar. The systray is used to display
notifications and provide access to certain features.

<div class="exercise">

1.  Create a systray component that connects to the statistics service
    we made previously.
2.  Use it to display the number of new orders.
3.  Clicking on it should open a list view with all of those orders.
4.  Bonus point: avoid making the initial RPC by adding the information
    to the session info. The session info is given to the web client by
    the server in the initial response.

<img src="02_miscellaneous/systray.png" class="align-center"
alt="image" />

</div>

<div class="seealso">

\- [Example: Systray
item](%7BGITHUB_PATH%7D/addons/web/static/src/webclient/user_menu/user_menu.js) -
[Example: Adding some information to the "session
info"](%7BGITHUB_PATH%7D/addons/barcodes/models/ir_http.py) - [Example:
Reading the session information
\<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
addons/barcodes/static/src/barcode_service.js#L5\>]()

</div>

## 3. Real life update

So far, the systray item from above does not update unless the user
refreshes the browser. Let us do that by calling periodically (for
example, every minute) the server to reload the information.

<div class="exercise">

1.  The <span class="title-ref">tshirt</span> service should
    periodically reload its data.

</div>

Now, the question arises: how is the systray item notified that it
should re-render itself? It can be done in various ways but, for this
training, we choose to use the most *declarative* approach:

<div class="exercise">

2.  Modify the <span class="title-ref">tshirt</span> service to return a
    [reactive](%7BOWL_PATH%7D/doc/reference/reactivity.md#reactive)
    object. Reloading data should update the reactive object in place.
3.  The systray item can then perform a
    [useState](%7BOWL_PATH%7D/doc/reference/reactivity.md#usestate) on
    the service return value.
4.  This is not really necessary, but you can also *package* the calls
    to <span class="title-ref">useService</span> and
    <span class="title-ref">useState</span> in a custom hook
    <span class="title-ref">useStatistics</span>.

</div>

<div class="seealso">

\- [Documentation on
reactivity](%7BOWL_PATH%7D/doc/reference/reactivity.md) - [Example: Use
of reactive in a service
\<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
addons/web/static/src/core/debug/profiling/profiling_service.js#L30\>]()

</div>

## 4. Add a command to the command palette

Now, let us see how we can interact with the command palette. The
command palette is a feature that allows users to quickly access various
commands and functions within the application. It is accessed by
pressing <span class="title-ref">CTRL+K</span> in the Odoo interface.

<div class="exercise">

Modify the
`image preview field <tutorials/master_odoo_web_framework/image_preview_field>`
to add a command to the command palette to open the image in a new
browser tab (or window).

Ensure the command is only active whenever a field preview is visible on
the screen.

<img src="02_miscellaneous/new_command.png" class="align-center"
alt="image" />

</div>

<div class="seealso">

[Example: Using the useCommand hook
\<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
addons/web/static/src/core/debug/debug_menu.js#L15\>]()

</div>

## 5. Monkey patching a component

Often, we can achieve what we want by using existing extension points
that allow for customization, such as registering something in a
registry. Sometimes, however, it happens that we want to modify
something that has no such mechanism. In that case, we must fall back on
a less safe form of customization: monkey patching. Almost everything in
Odoo can be monkey patched.

Bafien, our beloved leader, heard about employees performing better if
they are constantly being watched. Since he cannot be there in person
for each of his employees, he tasked you with updating the user
interface to add a blinking red eye in the control panel. Clicking on
that eye should open a dialog with the following message: "Bafien is
watching you. This interaction is recorded and may be used in legal
proceedings if necessary. Do you agree to these terms?"

<div class="exercise">

1.  `Inherit <reference/qweb/template_inheritance>` the
    <span class="title-ref">web.Breadcrumbs</span> template of the
    [ControlPanel
    component](%7BGITHUB_PATH%7D/addons/web/static/src/search/control_panel)
    to add an icon next to the breadcrumbs. You might want to use the
    <span class="title-ref">fa-eye</span> or
    <span class="title-ref">fa-eyes</span> icons.

2.  `Patch </developer/reference/frontend/patching_code>` the component
    to display the message on click by using [the dialog
    service](%7BGITHUB_PATH%7D/addons/web/static/src/core/dialog/dialog_service.js).
    You can use
    [ConfirmationDialog](%7BGITHUB_PATH%7D/addons/web/static/src/core/confirmation_dialog/confirmation_dialog.js).

3.  Add the CSS class <span class="title-ref">blink</span> to the
    element representing the eye and paste the following code in a new
    CSS file located in your patch's directory.

    ``` css
    .blink {
      animation: blink-animation 1s steps(5, start) infinite;
      -webkit-animation: blink-animation 1s steps(5, start) infinite;
    }
    @keyframes blink-animation {
      to {
        visibility: hidden;
      }
    }
    @-webkit-keyframes blink-animation {
      to {
          visibility: hidden;
      }
    }
    ```

<img src="02_miscellaneous/bafien_eye.png" class="align-center"
alt="image" />

<img src="02_miscellaneous/confirmation_dialog.png" class="align-center"
alt="image" />

</div>

<div class="seealso">

\- [Code: The patch function
\<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
addons/web/static/src/core/utils/patch.js#L16\>]() - [The Font Awesome
website](https://fontawesome.com/) - [Example: Using the dialog service
\<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
addons/board/static/src/board_controller.js#L88\>]()

</div>

## 6. Fetching orders from a customer

Let's see how to use some standard components to build a powerful
feature combining autocomplete, fetching data, and fuzzy lookup. We will
add an input in our dashboard to easily search all orders from a given
customer.

<div class="exercise">

1.  Update `tshirt_service.js` to add a
    <span class="title-ref">loadCustomers</span> method, which returns a
    promise that returns the list of all customers (and only performs
    the call once).
2.  Add the [AutoComplete
    component](%7BGITHUB_PATH%7D/addons/web/static/src/core/autocomplete)
    to the dashboard, next to the buttons in the control panel.
3.  Fetch the list of customers with the tshirt service, and display it
    in the AutoComplete component, filtered by the
    [fuzzyLookup](%7BGITHUB_PATH%7D/addons/web/static/src/core/utils/search.js)
    method.

<img src="02_miscellaneous/autocomplete.png" class="align-center"
alt="image" />

</div>

## 7. Reintroduce Kitten Mode

Let us add a special mode to Odoo: whenever the URL contains
<span class="title-ref">kitten=1</span>, we will display a kitten in the
background of Odoo, because we like kittens.

<div class="exercise">

1.  Create a <span class="title-ref">kitten</span> service, which should
    check the content of the active URL hash with the help of the
    `router service <frontend/services/router>`. If
    <span class="title-ref">kitten</span> is set in the URL, add the
    class <span class="title-ref">o-kitten-mode</span> to the document
    body.

2.  Add the following SCSS in `kitten_mode.scss`:

    ``` css
    .o-kitten-mode {
      background-image: url(https://upload.wikimedia.org/wikipedia/commons/5/58/Mellow_kitten_%28Unsplash%29.jpg);
      background-size: cover;
      background-attachment: fixed;
    }

    .o-kitten-mode > * {
      opacity: 0.9;
    }
    ```

3.  Add a command to the command palette to toggle the kitten mode.
    Toggling the kitten mode should toggle the class
    <span class="title-ref">o-kitten-mode</span> and update the current
    URL accordingly.

<img src="02_miscellaneous/kitten_mode.png" class="align-center"
alt="image" />

</div>

## 8. Lazy loading our dashboard

This is not really necessary, but the exercise is interesting. Imagine
that our awesome dashboard is a large application with potentially
multiple external libraries and lots of code/styles/templates. Also,
suppose that the dashboard is used only by some users in some business
flows. It would be interesting to lazy load it in order to speed up the
loading of the web client in most cases.

So, let us do that!

<div class="exercise">

1.  Modify the manifest to create a new
    `bundle <reference/assets_bundle>`
    <span class="title-ref">awesome_tshirt.dashboard</span>.
2.  Add the awesome dashboard code to this bundle. Create folders and
    move files if needed.
3.  Remove the code from the
    <span class="title-ref">web.assets_backend</span> bundle so that it
    is not loaded twice.

</div>

So far, we only removed the dashboard from the main bundle; we now want
to lazy load it. Currently, no client action is registered in the action
registry.

<div class="exercise">

4.  Create a new file `dashboard_loader.js`.
5.  Copy the code registering
    <span class="title-ref">AwesomeDashboard</span> to the dashboard
    loader.
6.  Register <span class="title-ref">AwesomeDashboard</span> as a
    [LazyComponent
    \<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
    addons/web/static/src/core/assets.js#L265-L282\>]().
7.  Modify the code in the dashboard loader to use the lazy component
    <span class="title-ref">AwesomeDashboard</span>.

</div>

If you open the `Network` tab of your browser's dev tools, you should
see that `awesome_tshirt.dashboard.min.js` is now loaded only when the
Dashboard is first accessed.

<div class="seealso">

`Documentation on assets <reference/assets>`

</div>
