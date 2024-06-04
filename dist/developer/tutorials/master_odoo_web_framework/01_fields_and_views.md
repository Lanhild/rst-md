# Chapter 1: Fields and Views

In the previous chapter, we learned a range of skills, including how to
create and use services, work with the Layout component, make the
dashboard translatable, and lazy load a JavaScript library like
Chart.js. Now, let's learn how to create new fields and views.

<div class="spoiler">

Solutions

The solutions for each exercise of the chapter are hosted on the
[official Odoo tutorials
repository](https://github.com/odoo/tutorials/commits/%7BCURRENT_MAJOR_BRANCH%7D-solutions/awesome_tshirt).
It is recommended not to look at them before trying the exercises.

</div>

Fields and views are among the most important concepts in the Odoo user
interface. They are key to many important user interactions, and should
therefore work perfectly. In the context of the JavaScript framework,
fields are components specialized for visualizing/editing a specific
field for a given record. For example, a (Python) model may define a
char field, which will be represented by a field component
<span class="title-ref">CharField</span>.

A field component is basically just a component registered in the
<span class="title-ref">fields</span> `registry
<frontend/registries>`. The field component may define some additional
static keys (metadata), such as
<span class="title-ref">displayName</span> or
<span class="title-ref">supportedTypes</span>, and the most important
one: <span class="title-ref">extractProps</span>, which prepare the base
props received by the <span class="title-ref">CharField</span>.

## Example: a simple field

Let us discuss a simplified implementation of a
<span class="title-ref">CharField</span>. First, here is the template:

``` xml
<t t-name="web.CharField" owl="1">
    <t t-if="props.readonly">
        <span t-esc="formattedValue" />
    </t>
    <t t-else="">
        <input
            class="o_input"
            t-att-type="props.isPassword ? 'password' : 'text'"
            t-att-placeholder="props.placeholder"
            t-on-change="updateValue"
        />
    </t>
</t>
```

It features a readonly mode and an edit mode, which is an input with a
few attributes. Now, here is the JavaScript code:

``` js
export class CharField extends Component {
    get formattedValue() {
        return formatChar(this.props.value, { isPassword: this.props.isPassword });
    }

    updateValue(ev) {
        let value = ev.target.value;
        if (this.props.shouldTrim) {
            value = value.trim();
        }
        this.props.update(value);
    }
}

CharField.template = "web.CharField";
CharField.displayName = _lt("Text");
CharField.supportedTypes = ["char"];

CharField.extractProps = ({ attrs, field }) => {
    return {
        shouldTrim: field.trim && !archParseBoolean(attrs.password),
        maxLength: field.size,
        isPassword: archParseBoolean(attrs.password),
        placeholder: attrs.placeholder,
    };
};

registry.category("fields").add("char", CharField);
```

There are a few important things to notice:

- The <span class="title-ref">CharField</span> receives its (raw) value
  in props. It needs to format it before displaying it.
- It receives an <span class="title-ref">update</span> function in its
  props, which is used by the field to notify the owner of the state
  that the value of this field has been changed. Note that the field
  does not (and should not) maintain a local state with its value.
  Whenever the change has been applied, it will come back (possibly
  after an onchange) by the way of the props.
- It defines an <span class="title-ref">extractProps</span> function.
  This is a step that translates generic standard props, specific to a
  view, to specialized props, useful to the component. This allows the
  component to have a better API, and may make it so that it is
  reusable.

Fields have to be registered in the
<span class="title-ref">fields</span> registry. Once it's done, they can
be used in some views (namely: <span class="title-ref">form</span>,
<span class="title-ref">list</span>,
<span class="title-ref">kanban</span>) by using the
<span class="title-ref">widget</span> attribute.

<div class="example">

``` xml
<field name="preview_moves" widget="account_resequence_widget"/>
```

</div>

## 1. An <span class="title-ref">image_preview</span> field

Each new order on the website will be created as an
<span class="title-ref">awesome_tshirt.order</span>. This model has a
<span class="title-ref">image_url</span> field (of type
<span class="title-ref">char</span>), which is currently only visible as
a string. We want to be able to see the image itself in the form view.

<div class="exercise">

1.  Create a new <span class="title-ref">ImagePreview</span> component
    and register it in the proper `registry
    <frontend/registries>`. Use the
    <span class="title-ref">CharField</span> component in your template.
    You can use
    [t-props](%7BOWL_PATH%7D/doc/reference/props.md#dynamic-props) to
    pass props received by <span class="title-ref">ImagePreview</span>
    to <span class="title-ref">CharField</span>. Update the arch of the
    form view to use your new field by setting the
    <span class="title-ref">widget</span> attribute.
2.  Change the code of the <span class="title-ref">ImagePreview</span>
    component so that the image is displayed below the URL.
3.  When the field is readonly, only the image should be displayed and
    the URL should be hidden.

</div>

> [!NOTE]
> It is possible to solve this exercise by inheriting
> <span class="title-ref">CharField</span>, but the goal of this
> exercise is to create a field from scratch.

<img src="01_fields_and_views/image_field.png" class="align-center"
alt="image" />

<div class="seealso">

[Code:
CharField](%7BGITHUB_PATH%7D/addons/web/static/src/views/fields/char/char_field.js)

</div>

## 2. Improving the <span class="title-ref">image_preview</span> field

We want to improve the field of the previous task to help the staff
recognize orders for which some action should be done.

<div class="exercise">

Display a warning "MISSING TSHIRT DESIGN" in red if there is no image
URL specified on the order.

</div>

<img src="01_fields_and_views/missing_image.png" class="align-center"
alt="image" />

## 3. Customizing a field component

Let's see how to use inheritance to extend an existing component.

There is a <span class="title-ref">is_late</span>, readonly, boolean
field on the order model. That would be useful information to see on the
list/kanban/view. Then, let us say that we want to add a red word
"Late!" next to it whenever it is set to
<span class="title-ref">true</span>.

<div class="exercise">

1.  Create a new <span class="title-ref">LateOrderBoolean</span> field
    inheriting from <span class="title-ref">BooleanField</span>. The
    template of <span class="title-ref">LateOrderBoolean</span> can also
    `inherit <reference/qweb/template_inheritance>` from the
    <span class="title-ref">BooleanField</span> template.
2.  Use it in the list/kanban/form view.
3.  Modify it to add a red <span class="title-ref">Late</span> next to
    it, as requested.

</div>

<img src="01_fields_and_views/late_field.png" class="align-center"
alt="image" />

<div class="seealso">

\- [Example: A field inheriting
another](%7BGITHUB_PATH%7D/addons/account/static/src/components/account_type_selection) -
`Documentation on xpath <reference/views/inheritance>`

</div>

## 4. Message for some customers

Odoo form views support a <span class="title-ref">widget</span> API,
which is like a field, but more generic. It is useful to insert
arbitrary components in the form view. Let us see how we can use it.

<div class="exercise">

For a super efficient workflow, we would like to display an alert block
with specific messages depending on some conditions:

- If the <span class="title-ref">image_url</span> field is not set, it
  should display "No image".
- If the <span class="title-ref">amount</span> of the order is higher
  than 100 euros, it should display "Add promotional material".
- Make sure that your widget is updated in real time.

> [!TIP]
> Try to evaluate <span class="title-ref">props.record</span> in the
> `Console` tab of your browser's dev tools.

</div>

<img src="01_fields_and_views/warning_widget.png" class="align-center"
alt="image" />

<div class="seealso">

- [Example: Using the tag \<widget\> in a form view
  \<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
  addons/calendar/views/calendar_views.xml#L197\>]()
- [Example: Implementation of a
  widget](%7BGITHUB_PATH%7D/addons/web/static/src/views/widgets/week_days)

</div>

## 5. Use <span class="title-ref">markup</span>

Let’s see how we can display raw HTML in a template. The
<span class="title-ref">t-out</span> directive can be used for that
propose. Indeed, [it generally acts like t-esc, unless the data has been
marked explicitly with a markup
function](%7BOWL_PATH%7D/doc/reference/templates.md#outputting-data). In
that case, its value is injected as HTML.

<div class="exercise">

1.  Modify the previous exercise to put the
    <span class="title-ref">image</span> and
    <span class="title-ref">material</span> words in bold.
2.  The warnings should be markuped, and the template should be modified
    to use <span class="title-ref">t-out</span>.
3.  Import the <span class="title-ref">markup</span> function from Owl
    and, for each message, replace it with a call of the function with
    the message passed as argument.

</div>

> [!NOTE]
> This is an example of a safe use of
> <span class="title-ref">t-out</span>, since the string is static.

<img src="01_fields_and_views/warning_widget2.png" class="align-center"
alt="image" />

## 6. Add buttons in the control panel

Views are among the most important components in Odoo: they allow users
to interact with their data. Let us discuss how Odoo views are designed.

The power of Odoo views is that they declare how a particular screen
should work with an XML document (usually named
<span class="title-ref">arch</span>, short for architecture). This
description can be extended/modified by xpaths serverside. Then, the
browser loads that document, parses it (fancy word to say that it
extracts the useful information), and then represents the data
accordingly.

<div class="example">

The <span class="title-ref">arch</span> document is view specific. Here
is how a <span class="title-ref">graph</span> view or a
<span class="title-ref">calendar</span> view could be defined:

``` xml
<graph string="Invoices Analysis" type="line" sample="1">
    <field name="product_categ_id"/>
    <field name="price_subtotal" type="measure"/>
</graph>

<calendar string="Leads Generation" create="0" mode="month" date_start="activity_date_deadline" color="user_id" hide_time="true" event_limit="5">
    <field name="expected_revenue"/>
    <field name="partner_id" avatar_field="avatar_128"/>
    <field name="user_id" filters="1" invisible="1"/>
</calendar>
```

</div>

A view is defined in the view registry by an object with a few specific
keys.

- \`type\`: The (base) type of a view (for example,
  <span class="title-ref">form</span>,
  <span class="title-ref">list</span>...).
- \`display_name\`: What should be displayed in the tooltip in the view
  switcher.
- \`icon\`: Which icon to use in the view switcher.
- \`multiRecord\`: Whether the view is supposed to manage a single
  record or a set of records.
- \`Controller\`: The component that will be used to render the view
  (the most important information).

<div class="example">

Here is a minimal <span class="title-ref">Hello</span> view, which does
not display anything:

``` js
/** @odoo-module */

import { registry } from "@web/core/registry";

export const helloView = {
   type: "hello",
   display_name: "Hello",
   icon: "fa fa-picture-o",
   multiRecord: true,
   Controller: Component,
};

registry.category("views").add("hello", helloView);
```

</div>

Most (or all?) Odoo views share a common architecture:

<img src="01_fields_and_views/view_architecture.svg"
class="o-no-modal o-no-modalalign-center" style="width:75.0%"
alt="image" />

The view description can define a <span class="title-ref">props</span>
function, which receives the standard props, and computes the base props
of the concrete view. The <span class="title-ref">props</span> function
is executed only once, and can be thought of as being some kind of
factory. It is useful to parse the <span class="title-ref">arch</span>
XML document, and to allow the view to be parameterized (for example, it
can return a Renderer component that will be used as Renderer). Then, it
is easy to customize the specific renderer used by a sub view.

The props will be extended before being given to the Controller. In
particular, the search props (domain/context/groupby) will be added.

Finally, the root component, commonly called the
<span class="title-ref">Controller</span>, coordinates everything. It
uses the generic <span class="title-ref">Layout</span> component (to add
a control panel), instantiates a <span class="title-ref">Model</span>,
and uses a <span class="title-ref">Renderer</span> component in the
<span class="title-ref">Layout</span> default slot. The
<span class="title-ref">Model</span> is tasked with loading and updating
data, and the <span class="title-ref">Renderer</span> is supposed to
handle all rendering work, along with all user interactions.

In practice, once the t-shirt order is printed, we need to print a label
to put on the package. To do that, let us add a button in the order's
form view's control panel, which will call a model method.

There is a service dedicated to calling models methods:
<span class="title-ref">orm_service</span>, located in
<span class="title-ref">core/orm_service.js</span>. It provides a way to
call common model methods, as well as a generic
<span class="title-ref">call(model, method, args, kwargs)</span> method.

<div class="example">

``` js
setup() {
    this.orm = useService("orm");
    onWillStart(async () => {
        // will read the fields 'id' and 'descr' from the record with id=3 of my.model
        const data = await this.orm.read("my.model", [3], ["id", "descr"]);
        // ...
    });
}
```

</div>

<div class="exercise">

1.  Create a customized form view extending the
    <span class="title-ref">web</span> form view and register it as
    <span class="title-ref">awesome_tshirt.order_form_view</span>.

2.  Add a
    <span class="title-ref">js_class="awesome_tshirt.order_form_view"</span>
    attribute to the arch of the form view so that Odoo will load it.

3.  Create a new template inheriting from the form controller template
    and add a "Print Label" button after the "New" button.

4.  Clicking on this button should call the method
    <span class="title-ref">print_label</span> from the model
    <span class="title-ref">awesome_tshirt.order</span> with the proper
    id.

    > [!NOTE]
    > <span class="title-ref">print_label</span> is a mock method; it
    > only displays a message in the logs.

5.  The button should not be disabled if the current order is in
    <span class="title-ref">create</span> mode (i.e., it does not exist
    yet).

    > [!TIP]
    > Log <span class="title-ref">this.props.resId</span> and
    > <span class="title-ref">this.model.root.resId</span> and compare
    > the two values before and after entering
    > <span class="title-ref">create</span> mode.

6.  The button should be displayed as a primary button if the customer
    is properly set and if the task stage is
    <span class="title-ref">printed</span>. Otherwise, it should be
    displayed as a secondary button.

7.  Bonus point: clicking twice on the button should not trigger 2 RPCs.

<img src="01_fields_and_views/form_button.png" class="align-center"
alt="image" />

</div>

<div class="seealso">

\- [Example: Extending a view
(JS)](%7BGITHUB_PATH%7D/addons/mass_mailing/static/src/views/mailing_contact_view_kanban.js) -
[Example: Extending a view
(XML)](%7BGITHUB_PATH%7D/addons/mass_mailing/static/src/views/mass_mailing_views.xml) -
[Example: Using a js_class attribute
\<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
addons/mass_mailing/views/mailing_contact_views.xml#L44\>]() - [Code:
orm
service](%7BGITHUB_PATH%7D/addons/web/static/src/core/orm_service.js) -
[Example: Using the orm
service](%7BGITHUB_PATH%7D/addons/account/static/src/components/open_move_widget/open_move_widget.js) -
[Code: useDebounced hook
\<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
addons/web/static/src/core/utils/timing.js#L117\>]()

</div>

## 7. Auto-reload the kanban view

Bafien is upset: he wants to see the kanban view of the tshirt orders on
his external monitor, but the view needs to be up-to-date. He is tired
of clicking on the `refresh` icon every 30s, so he tasked you to find a
way to do it automatically.

Just like the previous exercise, that kind of customization requires
creating a new JavaScript view.

<div class="exercise">

1.  Extend the kanban view/controller to reload its data every minute.
2.  Register it in the view registry, under
    <span class="title-ref">awesome_tshirt.autoreloadkanban</span>.
3.  Use it in the arch of the kanban view (with the
    <span class="title-ref">js_class</span> attribute).

</div>

> [!IMPORTANT]
> If you use <span class="title-ref">setInterval</span> or something
> similar, make sure that it is properly canceled when your component is
> unmounted. Otherwise, you will introduce a memory leak.
