# Patching code

Sometimes, we need to customize the way the UI works. Many common needs
are covered by some supported API. For example, all registries are good
extension points: the field registry allows adding/removing specialized
field components, or the main component registry allows adding
components that should be displayed all the time.

However, there are situations for which it is not sufficient. In those
cases, we may need to modify an object or a class in place. To achieve
that, Konvergo ERP provides the utility function
<span class="title-ref">patch</span>. It is mostly useful to
override/update the behavior of some other component/piece of code that
one does not control.

## Description

The patch function is located in \`@web/core/utils/patch\`:

> param Object obj  
> object that should be patched
>
> param string patchName  
> unique string describing the patch
>
> param Object patchValue  
> an object mapping each key to a patchValue
>
> param Object options  
> option object (see below)
>
> The <span class="title-ref">patch</span> function modifies in place
> the <span class="title-ref">obj</span> object (or class) and applies
> all key/value described in the
> <span class="title-ref">patchValue</span> object. This operation is
> registered under the <span class="title-ref">patchName</span> name, so
> it can be unpatched later if necessary.
>
> Most patch operations provide access to the parent value by using the
> <span class="title-ref">\_super</span> property (see below in the
> examples). To do that, the <span class="title-ref">patch</span> method
> wraps each pair key/value in a getter that dynamically binds
> <span class="title-ref">\_super</span>.
>
> The only option is <span class="title-ref">pure (boolean)</span>. If
> set to <span class="title-ref">true</span>, the patch operation does
> not bind the <span class="title-ref">\_super</span> property.

## Patching a simple object

Here is a simple example of how an object can be patched:

``` javascript
import { patch } from "@web/core/utils/patch";

const object = {
  field: "a field",
  fn() {
    // do something
  },
};

patch(object, "patch name", {
  fn() {
    // do things
  },
});
```

When patching functions, we usually want to be able to access the
`parent` function. Since we are working with patch objects, not ES6
classes, we cannot use the native `super` keyword. So, Konvergo ERP provides a
special method to simulate this behaviour: `this._super`:

``` javascript
patch(object, "_super patch", {
  fn() {
    this._super(...arguments);
    // do other things
  },
});
```

> [!WARNING]
> `this._super` is reassigned after each patched function is called.
> This means that if you use an asynchronous function in the patch then
> you cannot call `this._super` after an `await`, because it may or may
> not be the function that you expect. The correct way to do that is to
> keep a reference to the initial `_super` method:
>
> ``` javascript
> patch(object, "async _super patch", {
>   async myAsyncFn() {
>     const _super = this._super.bind(this);
>     await Promise.resolve();
>     await _super(...arguments);
>     // await this._super(...arguments); // this._super is undefined.
>   },
> });
> ```

Getters and setters are supported too:

``` javascript
patch(object, "getter/setter patch", {
  get number() {
    return this._super() / 2;
  },
  set number(value) {
    this._super(value * 2);
  },
});
```

## Patching a javascript class

The `patch` function is designed to work with anything: object or ES6
class.

However, since javascript classes work with the prototypal inheritance,
when one wishes to patch a standard method from a class, then we
actually need to patch the \`prototype\`:

``` javascript
class MyClass {
  static myStaticFn() {...}
  myPrototypeFn() {...}
}

// this will patch static properties!!!
patch(MyClass, "static patch", {
  myStaticFn() {...},
});

// this is probably the usual case: patching a class method
patch(MyClass.prototype, "prototype patch", {
  myPrototypeFn() {...},
});
```

Also, Javascript handles the constructor in a special native way which
makes it impossible to be patched. The only workaround is to call a
method in the original constructor and patch that method instead:

``` javascript
class MyClass {
  constructor() {
    this.setup();
  }
  setup() {
    this.number = 1;
  }
}

patch(MyClass.prototype, "constructor", {
  setup() {
    this._super(...arguments);
    this.doubleNumber = this.number * 2;
  },
});
```

> [!WARNING]
> It is impossible to patch directly the
> <span class="title-ref">constructor</span> of a class!

## Patching a component

Components are defined by javascript classes, so all the information
above still holds. For these reasons, Owl components should use the
<span class="title-ref">setup</span> method, so they can easily be
patched as well (see the section on
`best practices<frontend/owl/best_practices>`.

``` javascript
patch(MyComponent.prototype, "my patch", {
  setup() {
    useMyHook();
  },
});
```

## Removing a patch

The <span class="title-ref">patch</span> function has a counterpart,
<span class="title-ref">unpatch</span>, also located in
<span class="title-ref">@web/core/utils/patch</span>.

> param Object obj  
> object that should be unpatched
>
> param string patchName  
> string describing the patch that should be removed
>
> Removes an existing patch from an object
> <span class="title-ref">obj</span>. This is mostly useful for testing
> purposes, when we patch something at the beginning of a test, and
> unpatch it at the end.
>
> ``` javascript
> patch(object, "patch name", { ... });
> // test stuff here
> unpatch(object, "patch name");
> ```
