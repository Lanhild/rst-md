# Chapter 4: Creating a view from scratch

> [!WARNING]
> It is highly recommended that you complete `01_fields_and_views`
> before starting this chapter. The concepts introduced in Chapter 3,
> including views and examples, will be essential for understanding the
> material covered in this chapter.

Let us see how one can create a new view, completely from scratch. In a
way, it is not very difficult to do, but there are no really good
resources on how to do it. Note that most situations should be solved by
either customizing an existing view, or with a client action.

For this exercise, let's assume that we want to create a
<span class="title-ref">gallery</span> view, which is a view that lets
us represent a set of records with an image field. In our Awesome Tshirt
scenario, we would like to be able to see a set of t-shirts images.

The problem could certainly be solved with a kanban view, but this means
that it is not possible to have our normal kanban view and the gallery
view in the same action.

Let us make a gallery view. Each gallery view will be defined by an
<span class="title-ref">image_field</span> attribute in its arch:

``` xml
<gallery image_field="some_field"/>
```

To complete the tasks in this chapter, you will need to install the
awesome_gallery addon. This addon includes the necessary server files to
add a new view.

<div class="admonition">

Goal

<img src="04_creating_view_from_scratch/overview.png"
class="align-center" alt="image" />

</div>

<div class="spoiler">

Solutions

The solutions for each exercise of the chapter are hosted on the
[official Odoo tutorials
repository](https://github.com/odoo/tutorials/commits/%7BCURRENT_MAJOR_BRANCH%7D-solutions/awesome_gallery).

</div>

## 1. Make a hello world view

First step is to create a JavaScript implementation with a simple
component.

<div class="exercise">

1.  Create the <span class="title-ref">gallery_view.js</span> ,
    <span class="title-ref">gallery_controller.js</span> and
    <span class="title-ref">gallery_controller.xml</span> files in
    <span class="title-ref">static/src</span>.
2.  Implement a simple hello world component in
    <span class="title-ref">gallery_controller.js</span>.
3.  In <span class="title-ref">gallery_view.js</span>, import the
    controller, create a view object, and register it in the view
    registry under the name <span class="title-ref">gallery</span>.
4.  Add <span class="title-ref">gallery</span> as one of the view type
    in the orders action.
5.  Make sure that you can see your hello world component when switching
    to the gallery view.

<img src="04_creating_view_from_scratch/view_button.png"
class="align-center" alt="image" />

<img src="04_creating_view_from_scratch/new_view.png"
class="align-center" alt="image" />

</div>

## 2. Use the Layout component

So far, our gallery view does not look like a standard view. Let's use
the <span class="title-ref">Layout</span> component to have the standard
features like other views.

<div class="exercise">

1.  Import the <span class="title-ref">Layout</span> component and add
    it to the <span class="title-ref">components</span> of
    <span class="title-ref">GalleryController</span>.
2.  Update the template to use <span class="title-ref">Layout</span>. It
    needs a <span class="title-ref">display</span> prop, which can be
    found in <span class="title-ref">props.display</span>.

<img src="04_creating_view_from_scratch/layout.png" class="align-center"
alt="image" />

</div>

## 3. Parse the arch

For now, our gallery view does not do much. Let's start by reading the
information contained in the arch of the view.

The process of parsing an arch is usually done with a
<span class="title-ref">ArchParser</span>, specific to each view. It
inherits from a generic <span class="title-ref">XMLParser</span> class.

<div class="example">

Here is an example of what an ArchParser might look like:

``` js
import { XMLParser } from "@web/core/utils/xml";

export class GraphArchParser extends XMLParser {
    parse(arch, fields) {
       const result = {};
       this.visitXML(arch, (node) => {
           ...
        });
       return result;
    }
}
```

</div>

<div class="exercise">

1.  Create the <span class="title-ref">ArchParser</span> class in its
    own file. It can inherit from
    <span class="title-ref">XMLParser</span> in
    <span class="title-ref">@web/core/utils/xml</span>.
2.  Use it to read the <span class="title-ref">image_field</span>
    information.
3.  Update the <span class="title-ref">gallery</span> view code to add
    it to the props received by the controller.

> [!NOTE]
> It is probably a little overkill to do it like that, since we
> basically only need to read one attribute from the arch, but it is a
> design that is used by every other odoo views, since it lets us
> extract some upfront processing out of the controller.

</div>

<div class="seealso">

[Example: The graph arch
parser](%7BGITHUB_PATH%7D/addons/web/static/src/views/graph/graph_arch_parser.js)

</div>

## 4. Load some data

Let us now get some real data.

<div class="exercise">

1.  Add a `loadImages(domain) {...}` method to the
    <span class="title-ref">GalleryController</span>. It should perform
    a <span class="title-ref">webSearchRead</span> call from the orm
    service to fetch records corresponding to the domain, and use
    <span class="title-ref">imageField</span> received in props.
2.  Modify the <span class="title-ref">setup</span> code to call that
    method in the <span class="title-ref">onWillStart</span> and
    <span class="title-ref">onWillUpdateProps</span> hooks.
3.  Modify the template to display the data inside the default slot of
    the <span class="title-ref">Layout</span> component.

> [!NOTE]
> The loading data code will be moved into a proper model in the next
> exercise.

<img src="04_creating_view_from_scratch/gallery_data.png"
class="align-center" alt="image" />

</div>

## 5. Reorganize code

Real views are a little bit more organized. This may be overkill in this
example, but it is intended to learn how to structure code in Odoo.
Also, this will scale better with changing requirements.

<div class="exercise">

1.  Move all the model code in its own
    <span class="title-ref">GalleryModel</span> class.
2.  Move all the rendering code in a
    <span class="title-ref">GalleryRenderer</span> component.
3.  Adapt the <span class="title-ref">GalleryController</span> and
    <span class="title-ref">gallery_view</span> to make it work.

</div>

## 6. Display images

<div class="exercise">

Update the renderer to display images in a nice way, if the field is
set. If <span class="title-ref">image_field</span> is empty, display an
empty box instead.

<img src="04_creating_view_from_scratch/tshirt_images.png"
class="align-center" alt="image" />

</div>

## 7. Switch to form view on click

<div class="exercise">

Update the renderer to react to a click on an image and switch to a form
view. You can use the <span class="title-ref">switchView</span> function
from the action service.

</div>

<div class="seealso">

[Code: The switchView function
\<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
addons/web/static/src/webclient/actions/action_service.js#L1329\>]()

</div>

## 8. Add an optional tooltip

It is useful to have some additional information on mouse hover.

<div class="exercise">

1.  Update the code to allow an optional additional attribute on the
    arch:

    ``` xml
    <gallery image_field="some_field" tooltip_field="some_other_field"/>
    ```

2.  On mouse hover, display the content of the tooltip field. It should
    work if the field is a char field, a number field or a many2one
    field.

3.  Update the orders gallery view to add the customer as tooltip field.

<img src="04_creating_view_from_scratch/image_tooltip.png"
class="align-center" alt="image" />

</div>

<div class="seealso">

[Code: The tooltip
hook](%7BGITHUB_PATH%7D/addons/web/static/src/core/tooltip/tooltip_hook.js)

</div>

## 9. Add pagination

<div class="exercise">

Let's add a pager on the control panel and manage all the pagination
like in a normal Odoo view. Note that it is surprisingly difficult.

<img src="04_creating_view_from_scratch/pagination.png"
class="align-center" alt="image" />

</div>

<div class="seealso">

[Code: The usePager
hook](%7BGITHUB_PATH%7D/addons/web/static/src/search/pager_hook.js)

</div>

## 10. Validating views

We have a nice and useful view so far. But in real life, we may have
issue with users incorrectly encoding the
<span class="title-ref">arch</span> of their Gallery view: it is
currently only an unstructured piece of XML.

Let us add some validation! In Odoo, XML documents can be described with
an RN file `(Relax NG file)`, and then validated.

<div class="exercise">

1.  Add an RNG file that describes the current grammar:
    - A mandatory attribute <span class="title-ref">image_field</span>.
    - An optional attribute:
      <span class="title-ref">tooltip_field</span>.
2.  Add some code to make sure all views are validated against this RNG
    file.
3.  While we are at it, let us make sure that
    <span class="title-ref">image_field</span> and
    <span class="title-ref">tooltip_field</span> are fields from the
    current model.

Since validating an RNG file is not trivial, here is a snippet to help:

``` python
# -*- coding: utf-8 -*-
import logging
import os

from lxml import etree

from odoo.loglevels import ustr
from odoo.tools import misc, view_validation

_logger = logging.getLogger(__name__)

_viewname_validator = None

@view_validation.validate('viewname')
def schema_viewname(arch, **kwargs):
    """ Check the gallery view against its schema

    :type arch: etree._Element
    """
    global _viewname_validator

    if _viewname_validator is None:
        with misc.file_open(os.path.join('modulename', 'rng', 'viewname.rng')) as f:
            _viewname_validator = etree.RelaxNG(etree.parse(f))

    if _viewname_validator.validate(arch):
        return True

    for error in _viewname_validator.error_log:
        _logger.error(ustr(error))
    return False
```

</div>

<div class="seealso">

[Example: The RNG file of the graph
view](%7BGITHUB_PATH%7D/addons/base/rng/graph_view.rng)

</div>
