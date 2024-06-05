# Services

Services are long lived pieces of code that provide a feature. They may
be imported by components (with `useService`) or by other services.
Also, they can declare a set of dependencies. In that sense, services
are basically a DI `dependency injection` system. For example, the
`notification` service provides a way to display a notification, or the
`rpc` service is the proper way to perform a request to the Konvergo ERP server.

The following example registers a simple service that displays a
notification every 5 seconds:

``` javascript
import { registry } from "@web/core/registry";

const myService = {
    dependencies: ["notification"],
    start(env, { notification }) {
        let counter = 1;
        setInterval(() => {
            notification.add(`Tick Tock ${counter++}`);
        }, 5000);
    }
};

registry.category("services").add("myService", myService);
```

At startup, the web client starts all services present in the
<span class="title-ref">services</span> registry. Note that the name
used in the registry is the name of the service.

> [!NOTE]
> Most code that is not a component should be *packaged* in a service,
> in particular if it performs some side effect. This is very useful for
> testing purposes: tests can choose which services are active, so there
> are less chance for unwanted side effects interfering with the code
> being tested.

## Defining a service

A service needs to implement the following interface:

> Optional list of strings. It is the list of all dependencies (other
> services) that this service needs

> param Environment env  
> the application environment
>
> param Object deps  
> all requested dependencies
>
> returns  
> value of service or Promise\<value of service\>
>
> This is the main definition for the service. It can return either a
> value or a promise. In that case, the service loader simply waits for
> the promise to resolve to a value, which is then the value of the
> service.
>
> Some services do not export any value. They may just do their work
> without a need to be directly called by other code. In that case,
> their value will be set to `null` in `env.services`.

> Optional value. If given, it should be
> <span class="title-ref">true</span> or a list of strings.
>
> Some services need to provide an asynchronous API. For example, the
> <span class="title-ref">rpc</span> service is an asynchronous
> function, or the <span class="title-ref">orm</span> service provides a
> set of functions to call the Konvergo ERP server.
>
> In that case, it is possible for components that use a service to be
> destroyed before the end of an asynchronous function call. Most of the
> time, the asynchronous function call needs to be ignored. Doing
> otherwise is potentially very risky, because the underlying component
> is no longer active. The <span class="title-ref">async</span> flag is
> a way to do just that: it signals to the service creator that all
> asynchronous calls coming from components should be left pending if
> the component is destroyed.

## Using a service

A service that depends on other services and has properly declared its
`dependencies` simply receives a reference to the corresponding services
in the second argument of the `start` method.

The `useService` hook is the proper way to use a service in a component.
It simply returns a reference to the service value, that can then be
used by the component later. For example:

``` javascript
import { useService } from "@web/core/utils/hooks";

class MyComponent extends Component {
  setup() {
    const rpc = useService("rpc");

    onWillStart(async () => {
      this.someValue = await rpc(...);
    });
  }
}
```

## Reference List

| Technical Name                                  | Short Description                                     |
|-------------------------------------------------|-------------------------------------------------------|
| `cookie <frontend/services/cookie>`             | read or modify cookies                                |
| `effect <frontend/services/effect>`             | display graphical effects                             |
| `http <frontend/services/http>`                 | perform low level http calls                          |
| `notification <frontend/services/notification>` | display notifications                                 |
| `router <frontend/services/router>`             | manage the browser url                                |
| `rpc <frontend/services/rpc>`                   | send requests to the server                           |
| `scroller <frontend/services/scroller>`         | handle clicks on anchors elements                     |
| `title <frontend/services/title>`               | read or modify the window title                       |
| `user <frontend/services/user>`                 | provides some information related to the current user |

### Cookie service

#### Overview

- Technical name: <span class="title-ref">cookie</span>
- Dependencies: none

Provides a way to manipulate cookies. For example:

``` javascript
cookieService.setCookie("hello", "odoo");
```

#### API

> Object representing each cookie and its value if any (or empty string)

> param string name  
> the name of the cookie that should be set
>
> param any value  
> optional. If given, the cookie will be set to that value
>
> param number ttl  
> optional. the time in seconds before the cookie will be deleted
> (default=1 year)
>
> Sets the cookie <span class="title-ref">name</span> to the value
> <span class="title-ref">value</span> with a max age of
> <span class="title-ref">ttl</span>

> param string name  
> name of the cookie
>
> Deletes the cookie <span class="title-ref">name</span>.

### Effect service

#### Overview

- Technical name: <span class="title-ref">effect</span>
- Dependencies: None

Effects are graphical elements that can be temporarily displayed on top
of the page, usually to provide feedback to the user that something
interesting happened.

A good example would be the rainbow man:

<img src="services/rainbow_man.png" class="align-center" width="600"
alt="The rainbow man effect" />

Here's how this can be displayed:

``` javascript
const effectService = useService("effect");
effectService.add({
  type: "rainbow_man", // can be omitted, default type is already "rainbow_man"
  message: "Boom! Team record for the past 30 days.",
});
```

#### API

> param object options  
> the options for the effect. They will get passed along to the
> underlying effect component.
>
> Display an effect.

The options are defined by:

``` ts
interface EffectOptions {
  // The name of the desired effect
  type?: string;
  [paramName: string]: any;
}
```

#### Available effects

Currently, the only effect is the rainbow man.

##### RainbowMan

``` javascript
effectService.add({ type: "rainbow_man" });
```

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 40%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr class="header">
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span class="title-ref">params.Component</span></td>
<td><span class="title-ref">owl.Component?</span></td>
<td>Component class to instantiate inside the RainbowMan (will replace
the message).</td>
</tr>
<tr class="even">
<td><span class="title-ref">params.props</span></td>
<td><span class="title-ref">object?={}</span></td>
<td>If params.Component is given, its props can be passed with this
argument.</td>
</tr>
<tr class="odd">
<td><p><span class="title-ref">params.message</span></p></td>
<td><p><span class="title-ref">string?="Well Done!"</span></p></td>
<td><p>Message is the notice the rainbowman holds.</p>
<p>If effects are disabled for the user, the rainbowman won't appear and
a simple notification will get displayed as a fallback.</p>
<p>If effects are enabled and params.Component is given, params.message
is not used.</p>
<p>The message is a simple string or a string representing html (prefer
using params.Component if you want interactions in the DOM).</p></td>
</tr>
<tr class="even">
<td><span class="title-ref">params.messageIsHtml</span></td>
<td><span class="title-ref">boolean?=false</span></td>
<td>Set to true if the message represents html, s.t. it will be
correctly inserted into the DOM.</td>
</tr>
<tr class="odd">
<td><span class="title-ref">params.img_url</span></td>
<td><span
class="title-ref">string?=/web/static/img/smile.svg</span></td>
<td>The url of the image to display inside the rainbow.</td>
</tr>
<tr class="even">
<td><p><span class="title-ref">params.fadeout</span></p></td>
<td><p><span
class="title-ref">("slow"|"medium"|"fast"|"no")?="medium"</span></p></td>
<td><p>Delay for rainbowman to disappear.</p>
<p><span class="title-ref">"fast"</span> will make rainbowman dissapear
quickly.</p>
<p><span class="title-ref">"medium"</span> and <span
class="title-ref">"slow"</span> will wait little longer before
disappearing (can be used when <span
class="title-ref">params.message</span> is longer).</p>
<p><span class="title-ref">"no"</span> will keep rainbowman on screen
until user clicks anywhere outside rainbowman.</p></td>
</tr>
</tbody>
</table>

#### How to add an effect

<div id="frontend/services/effect_registry">

The effects are stored in a registry called
<span class="title-ref">effects</span>. You can add new effects by
providing a name and a function.

</div>

``` javascript
const effectRegistry = registry.category("effects");
effectRegistry.add("rainbow_man", rainbowManEffectFunction);
```

The function must follow this API:

> param Env env  
> the environment received by the service
>
> param object params  
> the params received from the add function on the service.
>
> returns  
> <span class="title-ref">({Component, props} \| void)</span> A
> component and its props or nothing.

This function must create a component and return it. This component is
mounted inside the effect component container.

#### Example

Let's say we want to add an effect that add a sepia look at the page.

``` javascript
/** @odoo-module **/

import { registry } from "@web/core/registry";
const { Component, tags } = owl;

class SepiaEffect extends Component {}
SepiaEffect.template = tags.xml`
    <div style="
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        background: rgba(124,87,0, 0.4);
    "></div>
`;

export function sepiaEffectProvider(env, params = {}) {
    return {
        Component: SepiaEffect,
    };
}

const effectRegistry = registry.category("effects");
effectRegistry.add("sepia", sepiaEffectProvider);
```

And then, call it somewhere you want and you will see the result. Here,
it is called in webclient.js to make it visible everywhere for the
example.

``` javascript
const effectService = useService("effect");
effectService.add({ type: "sepia" });
```

<img src="services/odoo_sepia.png" class="align-center" width="600"
alt="Konvergo ERP in sepia" />

### Http Service

#### Overview

- Technical name: <span class="title-ref">http</span>
- Dependencies: None

While most interactions between the client and the server in odoo are
<span class="title-ref">RPCs</span>
(<span class="title-ref">XMLHTTPRequest</span>), lower level control on
requests may sometimes be required.

This service provides a way to send <span class="title-ref">get</span>
and <span class="title-ref">post</span> [http
requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods).

#### API

> param string route  
> the url to send the request to
>
> param string readMethod  
> the response content type. Can be "text", "json", "formData", "blob",
> "arrayBuffer".
>
> returns  
> the result of the request with the format defined by the readMethod
> argument.
>
> Sends a get request.

> param string route  
> the url to send the request to
>
> param object params  
> key value data to be set in the form data part of the request
>
> param string readMethod  
> the response content type. Can be "text", "json", "formData", "blob",
> "arrayBuffer".
>
> returns  
> the result of the request with the format defined by the readMethod
> argument.
>
> Sends a post request.

#### Example

``` javascript
const httpService = useService("http");
const data = await httpService.get("https://something.com/posts/1");
// ...
await httpService.post("https://something.com/posts/1", { title: "new title", content: "new content" });
```

### Notification service

#### Overview

- Technical name: <span class="title-ref">notification</span>
- Dependencies: None

The <span class="title-ref">notification</span> service allows to
display notifications on the screen.

``` javascript
const notificationService = useService("notification");
notificationService.add("I'm a very simple notification");
```

#### API

> param string message  
> the notification message to display
>
> param object options  
> the options of the notification
>
> returns  
> a function to close the notification
>
> Shows a notification.
>
> The options are defined by:
>
> | Name                                     | Type                                                                                                                                                             | Description                                                 |
> |------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
> | <span class="title-ref">title</span>     | string                                                                                                                                                           | Add a title to the notification                             |
> | <span class="title-ref">type</span>      | <span class="title-ref">warning</span> \| <span class="title-ref">danger</span> \| <span class="title-ref">success</span> \| <span class="title-ref">info</span> | Changes the background color according to the type          |
> | <span class="title-ref">sticky</span>    | boolean                                                                                                                                                          | Whether or not the notification should stay until dismissed |
> | <span class="title-ref">className</span> | string                                                                                                                                                           | additional css class that will be added to the notification |
> | <span class="title-ref">onClose</span>   | function                                                                                                                                                         | callback to be executed when the notification closes        |
> | <span class="title-ref">buttons</span>   | button\[\] (see below)                                                                                                                                           | list of button to display in the notification               |
>
> The buttons are defined by:
>
> | Name                                   | Type     | Description                                             |
> |----------------------------------------|----------|---------------------------------------------------------|
> | <span class="title-ref">name</span>    | string   | The button text                                         |
> | <span class="title-ref">onClick</span> | function | callback to execute when the button is clicked          |
> | <span class="title-ref">primary</span> | boolean  | whether the button should be styled as a primary button |

#### Examples

A notification for when a sale deal is made with a button to go some
kind of commission page.

``` javascript
// in setup
this.notificationService = useService("notification");
this.actionService = useService("action");

// later
this.notificationService.add("You closed a deal!", {
  title: "Congrats",
  type: "success",
  buttons: [
      {
          name: "See your Commission",
          onClick: () => {
              this.actionService.doAction("commission_action");
          },
      },
  ],
});
```

<img src="services/notification_service.png" class="align-center"
width="600" alt="Example of notification" />

A notification that closes after a second:

``` javascript
const notificationService = useService("notification");
const close = notificationService.add("I will be quickly closed");
setTimeout(close, 1000);
```

### Router Service

#### Overview

- Technical name: <span class="title-ref">router</span>
- Dependencies: none

The <span class="title-ref">router</span> service provides three
features:

- information about the current route
- a way for the application to update the url, depending on its state
- listens to every hash change, and notifies the rest of the application

#### API

For example:

``` javascript
// url = /web?debug=assets#action=123&owl&menu_id=174
const { pathname, search, hash } = env.services.router.current;
console.log(pathname); //   /web
console.log(search); //   { debug="assets" }
console.log(hash); //   { action:123, owl: "", menu_id: 174 }
```

Updating the URL is done with the
<span class="title-ref">pushState</span> method:

> param Object hash  
> object containing a mapping from some keys to some values
>
> param boolean replace  
> if true, the url will be replaced, otherwise only key/value pairs from
> the <span class="title-ref">hash</span> will be updated.
>
> Updates the URL with each key/value pair from the
> <span class="title-ref">hash</span> object. If a value is set to an
> empty string, the key is added to the url without any corresponding
> value.
>
> If true, the <span class="title-ref">replace</span> argument tells the
> router that the url hash should be completely replaced (so values not
> present in the <span class="title-ref">hash</span> object will be
> removed).
>
> This method call does not reload the page. It also does not trigger a
> <span class="title-ref">hashchange</span> event, nor a
> <span class="title-ref">ROUTE_CHANGE</span> in the
> `main bus <frontend/framework/bus>`. This is because this method is
> intended to only updates the url. The code calling this method has the
> responsibility to make sure that the screen is updated as well.

For example:

``` javascript
// url = /web#action_id=123
routerService.pushState({ menu_id: 321 });
// url is now /web#action_id=123&menu_id=321
routerService.pushState({ yipyip: "" }, replace: true);
// url is now /web#yipyip
```

Finally, the <span class="title-ref">redirect</span> method will
redirect the browser to a specified url:

> param string url  
> a valid url
>
> param boolean wait  
> if true, wait for the server to be ready, and redirect after
>
> Redirect the browser to <span class="title-ref">url</span>. This
> method reloads the page. The <span class="title-ref">wait</span>
> argument is rarely used: it is useful in some cases where we know that
> the server will be unavailable for a short duration, typically just
> after an addon update or install operation.

> [!NOTE]
> The router service emits a <span class="title-ref">ROUTE_CHANGE</span>
> event on the `main bus <frontend/framework/bus>` whenever the current
> route has changed.

### RPC service

#### Overview

- Technical name: <span class="title-ref">rpc</span>
- Dependencies: none

The <span class="title-ref">rpc</span> service provides a single
asynchronous function to send requests to the server. Calling a
controller is very simple: the route should be the first argument and
optionally, a `params` object can be given as a second argument.

``` javascript
// in setup
this.rpc = useService("rpc");

// somewhere else, in an async function:
const result = await this.rpc("/my/route", { some: "value" });
```

> [!NOTE]
> Note that the `rpc` service is considered a low-level service. It
> should only be used to interact with Konvergo ERP controllers. To work with
> models (which is by far the most important usecase), one should use
> the `orm` service instead.

#### API

> param string route  
> route targeted by the request
>
> param Object params  
> (optional) parameters sent to the server
>
> param Object settings  
> (optional) request settings (see below)
>
> The `settings` object can contain:
>
> - `xhr`, which should be a `XMLHTTPRequest` object. In that case, the
>   `rpc` method will simply use it instead of creating a new one. This
>   is useful when one accesses advanced features of the
>   <span class="title-ref">XMLHTTPRequest</span> API.
> - `silent (boolean)` If set to `true`, the web client will not provide
>   a feedback that there is a pending rpc.

The `rpc` service communicates with the server by using a
`XMLHTTPRequest` object, configured to work with the `application/json`
content type. So clearly the content of the request should be JSON
serializable. Each request done by this service uses the `POST` http
method.

Server errors actually return the response with an http code 200. But
the `rpc` service will treat them as error.

#### Error Handling

An rpc can fail for two main reasons:

- either the odoo server returns an error (so, we call this a `server`
  error). In that case the http request will return with an http code
  200 BUT with a response object containing an `error` key.
- or there is some other kind of network error

When a rpc fails, then:

- the promise representing the rpc is rejected, so the calling code will
  crash, unless it handles the situation

- an event `RPC_ERROR` is triggered on the main application bus. The
  event payload contains a description of the cause of the error:

  If it is a server error (the server code threw an exception). In that
  case the event payload will be an object with the following keys:

  - `type = 'server'`
  - `message(string)`
  - `code(number)`
  - `name(string)` (optional, used by the error service to look for an
    appropriate dialog to use when handling the error)
  - `subType(string)` (optional, often used to determine the dialog
    title)
  - `data(object)` (optional object that can contain various keys among
    which `debug` : the main debug information, with the call stack)

  If it is a network error, then the error description is simply an
  object `{type: 'network'}`. When a network error occurs, a
  `notification <frontend/services/notification>` is displayed and the
  server is regularly contacted until it responds. The notification is
  closed as soon as the server responds.

### Scroller service

#### Overview

- Technical name: <span class="title-ref">scroller</span>
- Dependencies: none

Whenever the user clicks on an anchor in the web client, this service
automatically scrolls to the target (if appropriate).

The service adds an event listener to get
<span class="title-ref">click</span>'s on the document. The service
checks if the selector contained in its href attribute is valid to
distinguish anchors and Konvergo ERP actions (e.g. <span class="title-ref">\<a
href="#target_element"\>\</a\></span>). It does nothing if it is not the
case.

An event <span class="title-ref">SCROLLER:ANCHOR_LINK_CLICKED</span> is
triggered on the main application bus if the click seems to be targeted
at an element. The event contains a custom event containing the
<span class="title-ref">element</span> matching and its
<span class="title-ref">id</span> as a reference. It may allow other
parts to handle a behavior relative to anchors themselves. The original
event is also given as it might need to be prevented. If the event is
not prevented, then the user interface will scroll to the target
element.

#### API

The following values are contained in the
<span class="title-ref">anchor-link-clicked</span> custom event
explained above.

| Name                                      | Type                                               | Description                             |
|-------------------------------------------|----------------------------------------------------|-----------------------------------------|
| <span class="title-ref">element</span>    | <span class="title-ref">HTMLElement \| null</span> | The anchor element targeted by the href |
| <span class="title-ref">id</span>         | <span class="title-ref">string</span>              | The id contained in the href            |
| <span class="title-ref">originalEv</span> | <span class="title-ref">Event</span>               | The original click event                |

> [!NOTE]
> The scroller service emits a
> <span class="title-ref">SCROLLER:ANCHOR_LINK_CLICKED</span> event on
> the `main bus <frontend/framework/bus>`. To avoid the default scroll
> behavior of the scroller service, you must use
> <span class="title-ref">preventDefault()</span> on the event given to
> the listener so that you can implement your own behavior correctly
> from the listener.

### Title Service

#### Overview

- Technical name: <span class="title-ref">title</span>
- Dependencies: none

The <span class="title-ref">title</span> service offers a simple API
that allows to read/modify the document title. For example, if the
current document title is "Konvergo ERP", we can change it to "Konvergo ERP 15 - Apple"
by using the following command:

``` javascript
// in some component setup method
const titleService = useService("title");

titleService.setParts({ odoo: "Konvergo ERP 15", fruit: "Apple" });
```

#### API

The `title` service manipulates the following interface:

``` ts
interface Parts {
    [key: string]: string | null;
}
```

Each key represents the identity of a part of the title, and each value
is the string that is displayed, or <span class="title-ref">null</span>
if it has been removed.

Its API is:

> returns  
> Parts the current <span class="title-ref">Parts</span> object
> maintained by the title service

> param Parts parts  
> object representing the required change
>
> The `setParts` method allows to add/replace/delete several parts of
> the title. Delete a part (a value) is done by setting the associated
> key value to <span class="title-ref">null</span>.
>
> Note that one can only modify a single part without affecting the
> other parts. For example, if the title is composed of the following
> parts:
>
> ``` javascript
> { odoo: "Konvergo ERP", action: "Import" }
> ```
>
> with `current` value being `Konvergo ERP - Import` , then
>
> ``` javascript
> setParts({
>   action: null,
> });
> ```
>
> will change the title to `Konvergo ERP`.

### User service

#### Overview

- Technical name: <span class="title-ref">user</span>
- Dependencies: <span class="title-ref">rpc</span>

The <span class="title-ref">user</span> service provides a bunch of data
and a few helper functions concerning the connected user.

#### API

| Name             | Type               | Description                                                                                             |
|------------------|--------------------|---------------------------------------------------------------------------------------------------------|
| `context`        | `Object`           | The `user context<frontend/framework/user_context>`                                                     |
| `db`             | `Object`           | Info about the database                                                                                 |
| `home_action_id` | `(number | false)` | Id of the action used as home for the user                                                              |
| `isAdmin`        | `boolean`          | Whether the user is an admin (group <span class="title-ref">base.group_erp_manager</span> or superuser) |
| `isSystem`       | `boolean`          | Whether the user is part of the system group (<span class="title-ref">base.group_system</span>)         |
| `lang`           | `string`           | language used                                                                                           |
| `name`           | `string`           | Name of the user                                                                                        |
| `partnerId`      | `number`           | Id of the partner instance of the user                                                                  |
| `tz`             | `string`           | The timezone of the user                                                                                |
| `userId`         | `number`           | Id of the user                                                                                          |
| `userName`       | `string`           | Alternative nick name of the user                                                                       |

> param object update  
> the object to update the context with
>
> update the `user context<frontend/framework/user_context>` with the
> given object.
>
> ``` javascript
> userService.updateContext({ isFriend: true })
> ```

> param string key  
> the key of the targeted attribute
>
> remove the value with the given key from the
> `user context<frontend/framework/user_context>`
>
> ``` javascript
> userService.removeFromContext("isFriend")
> ```

> param string group  
> the xml_id of the group to look for
>
> returns  
> <span class="title-ref">Promise\<boolean\></span> is the user in the
> group
>
> check if the user is part of a group
>
> ``` javascript
> const isInSalesGroup = await userService.hasGroup("sale.group_sales")
> ```
