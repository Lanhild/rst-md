# Registries

Registries are (ordered) key/value maps. They are the main web client
extension points: many features provided by the Odoo javascript
framework simply look up into a registry whenever it needs a definition
for some object (such as fields, views, client actions or services).
Customizing the web client is then simply done by adding specific values
in the correct registry.

``` javascript
import { Registry } from "@web/core/registry";

const myRegistry = new Registry();

myRegistry.add("hello", "odoo");

console.log(myRegistry.get("hello"));
```

A useful feature of registries is that they maintain a set of sub
registries, obtained by the <span class="title-ref">category</span>
method. If the sub registry does not exist yet, it is created on the
fly. All registries used by the web client are obtained in such a way
from one root registry, exported in
<span class="title-ref">@web/core/registry</span>.

``` javascript
import { registry } from "@web/core/registry";

const fieldRegistry = registry.category("fields");
const serviceRegistry = registry.category("services");
const viewRegistry = registry.category("views");
```

## Registry API

> Creates a new registry. Note that a registry is an event bus, so one
> can listen to the <span class="title-ref">UPDATE</span> event if
> necessary. Registries are ordered: the `getAll <Registry.getAll>`
> method returns a list of values ordered according to their sequence
> number.
>
> > param string key  
> > key for the new entry
> >
> > param any value  
> > value for the new entry
> >
> > param Object options  
> > options
> >
> > param boolean \[options.force\]  
> > do not throw if key already exists
> >
> > param number \[options.sequence\]  
> > sequence number (useful to order entries)
> >
> > returns  
> > Registry
> >
> > Inserts a value at a specific key. If the key is already used, this
> > method throws an error (unless the option
> > <span class="title-ref">force</span> is set to true). The option
> > <span class="title-ref">sequence</span> is useful to insert the
> > value at a specific position. This method also triggers an
> > <span class="title-ref">UPDATE</span> event.
> >
> > Returns the same registry, so <span class="title-ref">add</span>
> > method calls can be chained.
>
> > param string key  
> > key for the entry
> >
> > param defaultValue any  
> > return value if no entry for key exists
> >
> > Returns the value corresponding to the
> > <span class="title-ref">key</span> argument. If the registry does
> > not contain that key, this method returns
> > <span class="title-ref">defaultValue</span> if given, or throws an
> > error otherwise.
>
> > param string key  
> > key for the entry
> >
> > returns  
> > boolean
> >
> > Returns <span class="title-ref">true</span> if
> > <span class="title-ref">key</span> is present in the registry
>
> > returns  
> > any\[\]
> >
> > Returns the list of all elements in the registry. It is ordered
> > according to the sequence numbers.
>
> > param string key  
> > the key for the entry that should be removed
> >
> > Removes a key/value pair from the registry. This operation triggers
> > an <span class="title-ref">UPDATE</span> event.
>
> > param string subcategory  
> > the name for the sub category
> >
> > returns  
> > Registry
> >
> > Returns the sub registry associated with the
> > <span class="title-ref">subcategory</span>. If it does not exist
> > yet, the sub registry is created on the fly.

## Reference List

| Category                                                | Content                                                           |
|---------------------------------------------------------|-------------------------------------------------------------------|
| `effects <frontend/registries/effects>`                 | implementation for all available effects                          |
| `formatters <frontend/registries/formatters>`           | utility functions to format values (mostly used for field values) |
| `main_components <frontend/registries/main_components>` | top level components                                              |
| `parsers <frontend/registries/parsers>`                 | utility functions to parse values (mostly used for field values)  |
| `services <frontend/registries/services>`               | all services that should be activated                             |
| `systray <frontend/registries/systray>`                 | components displayed in the systray zone in the navbar            |
| `user_menuitems <frontend/registries/usermenu>`         | menu items displayed in the user menu (top right of navbar)       |

### Effect registry

The <span class="title-ref">effects</span> registry contains the
implementations of all available effects. See the section on the
`effect service <frontend/services/effect_registry>` for more details.

### Formatter registry

The <span class="title-ref">formatters</span> registry contains
functions to format values. Each formatter has the following API:

> param value  
> a value of a specific type, or <span class="title-ref">false</span> if
> no value is given
>
> type value  
> T \| false
>
> param Object options  
> various options
>
> returns  
> string
>
> Formats a value and returns a string

<div class="seealso">

\- `Parsers registry <frontend/registries/parsers>`

</div>

### Main components registry

The main component registry
(<span class="title-ref">main_components</span>) is useful for adding
top level components in the web client. The webclient has a
<span class="title-ref">MainComponentsContainer</span> as direct child.
This component is basically a live representation of the ordered list of
components registered in the main components registry.

API  
``` text
interface {
    Component: Owl Component class
    props?: any
}
```

For example, the <span class="title-ref">LoadingIndicator</span>
component can be added in the registry like this:

``` javascript
registry.category("main_components").add("LoadingIndicator", {
  Component: LoadingIndicator,
});
```

### Parser registry

The <span class="title-ref">parsers</span> registry contains functions
to parse values. Each parser has the following API:

<div class="seealso">

\- `Formatters registry <frontend/registries/formatters>`

</div>

### Service registry

The service registry (category: <span class="title-ref">services</span>)
contains all `services <frontend/services>` that should be activated by
the Odoo framework.

``` javascript
import { registry } from "@web/core/registry";

const myService = {
    dependencies: [...],
    start(env, deps) {
        // some code here
    }
};

registry.category("services").add("myService", myService);
```

### Systray registry

The systray is the zone on the right of the navbar that contains various
small components, that usually display some sort of information (like
the number of unread messages), notifications and/or let the user
interact with them.

The <span class="title-ref">systray</span> registry contains a
description of these systray items, as objects with the following three
keys:

- \`Component\`: the component class that represents the item. Its root
  element should be a <span class="title-ref">\<li\></span> tag,
  otherwise it might not be styled properly.
- \`props (optional)\`: props that should be given to the component
- \`isDisplayed (optional)<span class="title-ref">: a function that
  takes the :ref:\`env \<frontend/framework/environment\></span> and
  returns a boolean. If true, the systray item is displayed. Otherwise
  it is removed.

For example:

``` javascript
import { registry } from "@web/core/registry";

class MySystrayItem extends Component {
    // some component ...
}

registry.category("systray").add("myAddon.myItem", {
    Component: MySystrayItem,
});
```

The systray registry is an ordered registry (with the
<span class="title-ref">sequence</span> number):

``` javascript
const item = {
    Component: MySystrayItem
};
registry.category("systray").add("myaddon.some_description", item, { sequence: 43 });
```

The sequence number defaults to 50. If given, this number will be used
to order the items. The lowest sequence is on the right and the highest
sequence is on the left in the systray menu.

### Usermenu registry

The user menu registry (category:
<span class="title-ref">user_menuitems</span>) contains all menu items
that are shown when opening the user menu (the navbar element with the
user name, on the top right).

User menu items are defined by a function taking the
`env <frontend/framework/environment>` and returning a plain object,
containing the following information:

- <span class="title-ref">description</span> : the menu item text,
- <span class="title-ref">href</span> : (optional) if given (and
  truthy), the item text is put in a <span class="title-ref">a</span>
  tag with given attribute href,
- <span class="title-ref">callback</span> : callback to call when the
  item is selected,
- \`hide\`: (optional) indicates if the item should be hidden (default:
  <span class="title-ref">false</span>),
- \`sequence\`: (optional) determines the rank of the item among the
  other dropwdown items (default: 100).

The user menu calls all the functions defining items every time it is
opened.

Example:

``` javascript
import { registry } from "@web/core/registry";

registry.category("user_menuitems").add("my item", (env) => {
    return {
        description: env._t("Technical Settings"),
        callback: () => { env.services.action_manager.doAction(3); },
        hide: (Math.random() < 0.5),
    };
});
```
