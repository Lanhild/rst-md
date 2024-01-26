# Developer Mode (debug mode)

The developer mode (or debug mode) unlocks access to extra and advanced
tools in Odoo. There are several ways to activate the developer mode:
through the `settings <general/developer_mode/settings>`, the `browser
extension <general/developer_mode/browser-extension>`, through the
`command palette <general/developer_mode/command-palette>` or the `URL
<general/developer_mode/url>`.

## Activate through the Settings

The debug mode can be activated in the Odoo database settings. Go to
`Settings -->
General Settings --> Developer Tools` and click on `Activate the
developer mode`. At least one application needs to be installed for the
`Developer Tools` section to appear in the `Settings` module.

![Overview of the debug options under settings in
Odoo.](developer_mode/settings.png)

<div class="note">

<div class="title">

Note

</div>

`Activate the developer mode (with assets)` is used by developers;
`Activate
the developer mode (with tests assets)` is used by developers and
testers.

</div>

Once activated, the `Deactivate the developer mode` option becomes
available.

## Activate through the browser extension

Within a web browser, navigate to the browser settings and extensions
and search for the <span class="title-ref">Odoo Debug</span> extension.
Once the extension is installed, a new icon will be shown on the
browser's toolbar.

For the *Odoo Debug* extension, a single click enables a normal version
of the mode, while a double click enables it with assets. To deactivate
it, use a single click.

![View of Odoo's debug icon in a Google Chrome
toolbar.](developer_mode/developer-mode-monkey.png)

## Activate through the command palette

In Odoo, the command palette tool has a command to activate the debug
mode. First, open the command palette tool with the keyboard shortcut
<span class="title-ref">ctrl+k</span> and then type
<span class="title-ref">debug</span>. A command will show up to activate
the debug mode.

![Command palette with debug
command.](developer_mode/command-palette.png)

## Activate through the URL

The debug mode can also be activated by adding an extra query string to
the database's URL. In the URL, add
<span class="title-ref">?debug=1</span> or
<span class="title-ref">?debug=true</span> after
<span class="title-ref">/web</span>. To deactivate the debug mode,
change the value to <span class="title-ref">?debug=0</span> instead.

![Overview of a URL with the debug mode command
added.](developer_mode/url.png)

<div class="tip">

<div class="title">

Tip

</div>

Additional modes are available for developers:
<span class="title-ref">?debug=assets</span> enables the assets mode,
and <span class="title-ref">?debug=tests</span> enables the tests mode.

</div>

## Locate the developer mode tools

Once developer mode is activated, the developer mode tools can be
accessed from the `Open
Developer Tools` button, the bug icon located in the header of the Odoo
database.

![Overview of a console page and the debug icon being shown in
Odoo.](developer_mode/button-location.png)

This menu contains additional tools that are useful to understand or
edit technical data, such as the views or actions of a page. On a page
that has filters, actions, and view options, the developer mode tools
contain some useful menu items such as:

  - `Edit Action`
  - `Manage Filters`
  - Edit the current view (e.g. Kanban, List, Graph, etc.)
  - See the `Fields View Get`
