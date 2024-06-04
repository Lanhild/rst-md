# Hooks

[Owl
hooks](https://github.com/odoo/owl/blob/master/doc/reference/hooks.md)
are a way to factorize code, even if it depends on some component
lifecycle. Most hooks provided by Owl are related to the lifecycle of a
component, but some of them (such as
[useComponent](https://github.com/odoo/owl/blob/master/doc/reference/hooks.md#usecomponent))
provide a way to build specific hooks.

Using these hooks, it is possible to build many customized hooks that
help solve a specific problem, or make some common tasks easier. The
rest of this page documents the list of hooks provided by the Odoo web
framework.

| Name                                         | Short Description                                      |
|----------------------------------------------|--------------------------------------------------------|
| `useAssets <frontend/hooks/useassets>`       | load assets                                            |
| `useAutofocus <frontend/hooks/useAutofocus>` | focus automatically an element referenced by autofocus |
| `useBus <frontend/hooks/usebus>`             | subscribe and unsubscribe to a bus                     |
| `usePager <frontend/hooks/usepager>`         | Display the pager of the control panel of a view.      |
| `usePosition <frontend/hooks/useposition>`   | position an element relative to a target               |

## useAssets

### Location

<span class="title-ref">@web/core/assets</span>

### Description

See the section on `lazy loading assets <frontend/assets/lazy_loading>`
for more details.

## useAutofocus

### Location

<span class="title-ref">@web/core/utils/hooks</span>

### Description

Focus an element referenced by a t-ref="autofocus" in the current
component as soon as it appears in the DOM and if it was not displayed
before.

``` javascript
import { useAutofocus } from "@web/core/utils/hooks";

class Comp {
  setup() {
    this.inputRef = useAutofocus();
  }
  static template = "Comp";
}
```

``` xml
<t t-name="Comp" owl="1">
  <input t-ref="autofocus" type="text"/>
</t>
```

### API

> returns  
> the element reference.

## useBus

### Location

<span class="title-ref">@web/core/utils/hooks</span>

### Description

Add and clear an event listener to a bus. This hook ensures that the
listener is properly cleared when the component is unmounted.

``` javascript
import { useBus } from "@web/core/utils/hooks";

class MyComponent {
  setup() {
    useBus(this.env.bus, "some-event", event => {
      console.log(event);
    });
  }
}
```

### API

> param EventBus bus  
> the target event bus
>
> param string eventName  
> the name of the event that we want to listen to
>
> param function callback  
> listener callback

## usePager

### Location

<span class="title-ref">@web/search/pager_hook</span>

### Description

Display the `Pager <frontend/pager>` of the control panel of a view.
This hooks correctly sets <span class="title-ref">env.config</span> to
provide the props to the pager.

``` javascript
import { usePager } from "@web/search/pager_hook";

class CustomView {
  setup() {
    const state = owl.hooks.useState({
      offset: 0,
      limit: 80,
      total: 50,
    });
    usePager(() => {
      return {
        offset: this.state.offset,
        limit: this.state.limit,
        total: this.state.total,
        onUpdate: (newState) => {
          Object.assign(this.state, newState);
        },
      };
    });
  }
}
```

### API

> param function getPagerProps  
> function that returns the pager props.

## usePosition

### Location

<span class="title-ref">@web/core/position_hook</span>

### Description

Helps positioning an HTMLElement (the
<span class="title-ref">popper</span>) relatively to another HTMLElement
(the <span class="title-ref">reference</span>). This hook ensures the
positioning is updated when the window is resized/scrolled.

``` javascript
import { usePosition } from "@web/core/position_hook";

class MyPopover extends owl.Component {
  setup() {
    // Here, the reference is the target props, which is an HTMLElement
    usePosition(this.props.target);
  }
}
MyPopover.template = owl.tags.xml`
  <div t-ref="popper">
    I am positioned through a wonderful hook!
  </div>
`;
```

> [!IMPORTANT]
> You should indicate your <span class="title-ref">popper</span> element
> using a [t-ref
> directive](https://github.com/odoo/owl/blob/master/doc/reference/hooks.md#useref).

### API

> param reference  
> the target HTMLElement to be positioned from
>
> type reference  
> HTMLElement or ()=\>HTMLElement
>
> param Options options  
> the positioning options (see table below)

| Option                                      | Type                                                      | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|---------------------------------------------|-----------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="title-ref">popper</span>       | string                                                    | this is a [useRef reference](https://github.com/odoo/owl/blob/master/doc/reference/hooks.md#useref) for the element that will get positioned. Default is <span class="title-ref">"popper"</span>.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| <span class="title-ref">container</span>    | HTMLElement                                               | the container from which the popper is expected not to overflow. If overflowing occurs, other popper positions are tried until a not overflowing one is found. (default: the <span class="title-ref">\<html/\></span> node)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| <span class="title-ref">margin</span>       | number                                                    | added margin between popper and reference elements (default: <span class="title-ref">0</span>)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| <span class="title-ref">position</span>     | Direction\[-Variant\]                                     | the desired position. It is a string composed of one <span class="title-ref">Direction</span> and one <span class="title-ref">Variant</span> separated by a dash character. <span class="title-ref">Direction</span> could be: <span class="title-ref">top</span>, <span class="title-ref">bottom</span>, <span class="title-ref">right</span>, <span class="title-ref">left</span>. <span class="title-ref">Variant</span> could be: <span class="title-ref">start</span>, <span class="title-ref">middle</span>, <span class="title-ref">end</span>. The variant can be omitted (default variant is <span class="title-ref">middle</span>). Examples of valid positions: <span class="title-ref">right-end</span>, <span class="title-ref">top-start</span>, <span class="title-ref">left-middle</span>, <span class="title-ref">left</span>. (default position: <span class="title-ref">bottom</span>) |
| <span class="title-ref">onPositioned</span> | (el: HTMLElement, position: PositioningSolution) =\> void | a callback that will be called everytime a positioning occurs (e.g. on component mounted/patched, document scroll, window resize...). Can be used i.e. for dynamic styling regarding the current position. The <span class="title-ref">PositioningSolution</span> is an object having the following type: <span class="title-ref">{ direction: Direction, variant: Variant, top: number, left: number }</span>.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |

<div class="example">

``` javascript
import { usePosition } from "@web/core/position_hook";

class DropMenu extends owl.Component {
  setup() {
    const toggler = owl.useRef("toggler");
    usePosition(
      () => toggler.el,
      {
        popper: "menu",
        position: "right-start",
        onPositioned: (el, { direction, variant }) => {
          el.classList.add(`dm-${direction}`); // -> "dm-top" "dm-right" "dm-bottom" "dm-left"
          el.style.backgroundColor = variant === "middle" ? "red" : "blue";
        },
      },
    );
  }
}
DropMenu.template = owl.tags.xml`
  <button t-ref="toggler">Toggle Menu</button>
  <div t-ref="menu">
    <t t-slot="default">
      This is the menu default content.
    </t>
  </div>
`;
```

</div>
