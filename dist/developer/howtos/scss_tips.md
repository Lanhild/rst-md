# Write lean easy-to-maintain CSS

There are many ways to lean and simplify SCSS. The first step is to
establish if custom code is needed at all.

Odoo's webclient has been designed to be modular, meaning that
(potentially all) classes can be shared across views. Check the code
before creating a new class. Chances are that there is already a class
or an HTML tag doing exactly what you're looking for.

On top of that, Odoo relies on
[Bootstrap](https://getbootstrap.com/docs/5.1/getting-started/introduction/)
(BS), one of the most complete CSS frameworks available. The framework
has been customized in order to match Odoo's design (both community and
enterprise versions), meaning that you can use any BS class directly in
Odoo and achieve a visual result that is consistent with our UI.

> [!WARNING]
> - The fact that a class achieves the desired visual result doesn't
> necessarily mean that it's the right one for the job. Be aware of
> classes triggering JS behaviors, for example. - Be careful about class
> semantics. Applying a **button class** to a **title** is not only
> semantically wrong, it may also lead to migration issues and visual
> inconsistencies.

The following sections describe tips to strip-down SCSS lines **when
custom-code is the only way to go**.

## Browser defaults

By default, each browser renders content using a *user agent
stylesheet*. To overcome inconsistencies between browsers, some of these
rules are overridden by [Bootstrap
Reboot](https://getbootstrap.com/docs/5.1/content/reboot/).

At this stage all "browser-specific-decoration" rules have been stripped
away, but a big chunk of rules defining basic layout information is
maintained (or reinforced by *Reboot* for consistency reasons).

You can rely on these rules.

<div class="example">

Applying <span class="title-ref">display: block;</span> to a
<span class="title-ref">\<div/\></span> is normally not necessary.

``` css
div.element {
   display: block;
   /* not needed 99% of the time */
}
```

</div>

<div class="example">

In this instance, you may opt to switching the HTML tag rather than
adding a new CSS rule.

``` css
span.element {
   display: block;
   /* replace <span> with <div> instead
      to get 'display: block' by default */
}
```

</div>

Here's a non-comprehensive list of default rules:

<table>
<thead>
<tr class="header">
<th>Tag / Attribute</th>
<th>Defaults</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span class="title-ref">&lt;div/&gt;</span>, <span
class="title-ref">&lt;section/&gt;</span>, <span
class="title-ref">&lt;header/&gt;</span>, <span
class="title-ref">&lt;footer/&gt;</span>...</td>
<td><span class="title-ref">display: block</span></td>
</tr>
<tr class="even">
<td><span class="title-ref">&lt;span/&gt;</span>, <span
class="title-ref">&lt;a/&gt;</span>, <span
class="title-ref">&lt;em/&gt;</span>, <span
class="title-ref">&lt;b/&gt;</span>...</td>
<td><span class="title-ref">display: inline</span></td>
</tr>
<tr class="odd">
<td><span class="title-ref">&lt;button/&gt;</span>, <span
class="title-ref">&lt;label/&gt;</span>, <span
class="title-ref">&lt;output/&gt;</span>...</td>
<td><span class="title-ref">display: inline-block</span></td>
</tr>
<tr class="even">
<td><span class="title-ref">&lt;img/&gt;</span>, <span
class="title-ref">&lt;svg/&gt;</span></td>
<td><span class="title-ref">vertical-align: middle</span></td>
</tr>
<tr class="odd">
<td><span class="title-ref">&lt;summary/&gt;</span>, <span
class="title-ref">[role="button"]</span></td>
<td><span class="title-ref">cursor: pointer;</span></td>
</tr>
<tr class="even">
<td><span class="title-ref">&lt;q/&gt;</span></td>
<td><div class="line-block"><span class="title-ref">:before {content:
open-quote}</span><br />
<span class="title-ref">:after {content: close-quote}</span></div></td>
</tr>
<tr class="odd">
<td>...</td>
<td>...</td>
</tr>
</tbody>
</table>

<div class="seealso">

[Bootstrap Reboot on
GitHub](https://github.com/twbs/bootstrap/blob/1a6fdfae6b/scss/_reboot.scss)

</div>

## HTML tags

It may seem obvious, but the simplest and most **consistent** way of
making text look like a title is to use a header tag
(<span class="title-ref">\<h1\></span>,
<span class="title-ref">\<h2\></span>, ...). Besides reboot rules,
mostly all tags carry decorative styles defined by Odoo.

<div class="rst-class">

bg-light

</div>

<div class="example">

<div class="container alert alert-danger">

Don't

<div class="tabs">

<div class="code-tab">

html XML

\<span class="o_module_custom_title"\>  
Hello There!

\</span\>

\<span class="o_module_custom_subtitle"\>  
I'm a subtitle.

\</span\>

</div>

<div class="code-tab">

css SCSS

.o_module_custom_title {  
display: block; font-size: 120%; font-weight: bold; animation: 1s linear
1s mycustomAnimation;

}

.o_module_custom_subtitle {  
display: block; font-size: 12px; font-weight: bold; animation: 2s linear
1s mycustomAnimation;

}

</div>

</div>

</div>

<div class="container alert alert-success">

Do

<div class="tabs">

<div class="code-tab">

html XML

\<h5 class="o_module_custom_title"\>  
Hello There!

\</h5\>

\<div class="o_module_custom_subtitle"\>  
\<b\>\<small\>I'm a subtitle.\</small\>\</b\>

\</div\>

</div>

<div class="code-tab">

css SCSS

.o_module_custom_title {  
animation: 1s linear 1s mycustomAnimation;

}

.o_module_custom_subtitle {  
animation: 2s linear 1s mycustomAnimation;

}

</div>

</div>

</div>

</div>

> [!NOTE]
> Besides reducing the amount of code, a modular-design approach (use
> classes, tags, mixins...) keeps the visual result consistent and
> easily **maintainable**.
>
> Following the last example, if Odoo titles' design changes, these
> changes will be applied in the
> <span class="title-ref">o_module_custom_title</span> element too since
> it's using an <span class="title-ref">\<h5\></span> tag.

## Utility classes

Our framework defines a multitude of utility classes designed to cover
almost all layout/design/interaction needs. The simple fact that a class
already exists justifies its use over custom CSS whenever possible.

Take the example of <span class="title-ref">position-relative</span>.

``` css
position-relative {
   position: relative !important;
}
```

Since a utility-class is defined, any CSS line with the declaration
<span class="title-ref">position: relative</span> is **potentially**
redundant.

Odoo relies on the default [Bootstrap
utility-classes](https://getbootstrap.com/docs/5.1/utilities/background/)
stack and defines its own using [Bootstrap
API](https://getbootstrap.com/docs/5.1/utilities/api/).

<div class="seealso">

\- [Bootstrap utility
classes](https://getbootstrap.com/docs/5.1/utilities/api/) - [Odoo
custom utilities on
github](%7BGITHUB_PATH%7D/addons/web/static/src/scss/utilities_custom.scss)

</div>

### Handling utility-classes verbosity

The downside of utility-classes is the potential lack of readability.

<div class="example">

``` html
<myComponent t-attf-class="d-flex border px-lg-2 card
{{props.readonly ? 'o_myComponent_disabled' : ''}}
card d-lg-block position-absolute {{props.active ?
'o_myComponent_active' : ''}}  myComponent px-3"/>
```

</div>

To overcome the issue you may combine different approaches:

- in Qweb attributes, only use classes to be toggled *on-the-fly*;
- use new lines for each attribute;
- order classes using the convention <span class="title-ref">\[odoo
  component\] \[bootstrap component\] \[css declaration order\]</span>.

<div class="example">

``` html
<myComponent
   t-att-class="{
      o_myComponent_disabled: props.readonly,
      o_myComponent_active: props.active
   }"
   class="myComponent card position-absolute d-flex d-lg-block border px-3 px-lg-2"
/>
```

</div>

<div class="seealso">

`Odoo CSS properties order <contributing/coding_guidelines/scss/properties_order>`

</div>
