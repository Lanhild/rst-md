# Create a client action

A client action triggers an action that is entirely implemented in the
client side. One of the benefits of using a client action is the ability
to create highly customized interfaces with ease. A client action is
typically defined by an OWL component; we can also use the web framework
and use services, core components, hooks,...

1.  Create the `client action <reference/actions/client>`, don't forget
    to make it accessible.

    ``` xml
    <record model="ir.actions.client" id="my_client_action">
        <field name="name">My Client Action</field>
        <field name="tag">my_module.MyClientAction</field>
    </record>
    ```

2.  Create a component that represents the client action.

    ``` js
    /** @odoo-module **/

    import { registry } from "@web/core/registry";

    import { Component } from  "@odoo/owl";

    class MyClientAction extends Component {}
    MyClientAction.template = "my_module.clientaction";

    // remember the tag name we put in the first step
    registry.category("actions").add("my_module.MyClientAction", MyClientAction);
    ```

    ``` xml
    <?xml version="1.0" encoding="UTF-8" ?>
    <templates xml:space="preserve">
        <t t-name="awesome_tshirt.clientaction" owl="1">
            Hello world
        </t>
    </templates>
    ```
