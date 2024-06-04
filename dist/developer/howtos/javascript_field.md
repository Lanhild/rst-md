# Customize a field

## Subclass an existing field component

Let's take an example where we want to extends the
<span class="title-ref">BooleanField</span> to create a boolean field
displaying "Late!" in red whenever the checkbox is checked.

1.  Create a new widget component extending the desired field component.

    ``` javascript
    /** @odoo-module */

    import { registry } from "@web/core/registry";
    import { BooleanField } from "@web/views/fields/boolean/boolean_field";
    import { Component, xml } from "@odoo/owl";

    class LateOrderBooleanField extends BooleanField {}
    LateOrderBooleanField.template = "my_module.LateOrderBooleanField";
    ```

2.  Create the field template.

    The component uses a new template with the name
    <span class="title-ref">my_module.LateOrderBooleanField</span>.
    Create it by inheriting the current template of the
    <span class="title-ref">BooleanField</span>.

    ``` xml
    <?xml version="1.0" encoding="UTF-8" ?>
    <templates xml:space="preserve">
        <t t-name="my_module.LateOrderBooleanField" t-inherit="web.BooleanField" owl="1">
            <xpath expr="//CheckBox" position="after">
                  <span t-if="props.value" class="text-danger"> Late! </span>
            </xpath>
        </t>
    </templates>
    ```

3.  Register the component to the fields registry.

    ``` 
    registry.category("fields").add("late_boolean", LateOrderBooleanField);
    ```

4.  Add the widget in the view arch as an attribute of the field.

    ``` xml
    <field name="somefield" widget="late_boolean"/>
    ```

## Create a new field component

Assume that we want to create a field that displays a simple text in
red.

1.  Create a new Owl component representing our new field

    ``` js
    /** @odoo-module */

    import { standardFieldProps } from "@web/views/fields/standard_field_props";
    import { Component, xml } from "@odoo/owl";
    import { registry } from "@web/core/registry";

    export class MyTextField extends Component {

        /**
        * @param {boolean} newValue
        */
        onChange(newValue) {
            this.props.update(newValue);
        }
    }

    MyTextField.template = xml`
        <input t-att-id="props.id" class="text-danger" t-att-value="props.value" onChange.bind="onChange" />
    `;
    MyTextField.props = {
        ...standardFieldProps,
    };
    MyTextField.supportedTypes = ["char"];
    ```

    The imported <span class="title-ref">standardFieldProps</span>
    contains the standard props passed by the
    <span class="title-ref">View</span> such as the
    <span class="title-ref">update</span> function to update the value,
    the <span class="title-ref">type</span> of the field in the model,
    the <span class="title-ref">readonly</span> boolean, and others.

2.  In the same file, register the component to the fields registry.

    ``` js
    registry.category("fields").add("my_text_field", MyTextField);
    ```

    This maps the widget name in the arch to its actual component.

3.  Add the widget in the view arch as an attribute of the field.

    ``` xml
    <field name="somefield" widget="my_text_field"/>
    ```
