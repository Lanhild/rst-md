# Chapter 5: Testing

Automatically testing code is important when working on a codebase. It
helps ensure we don't introduce (too many) bugs or regressions. Let us
see how to test our code.

<div class="spoiler">

Solutions

The solutions for each exercise of the chapter are hosted on the
[official Odoo tutorials
repository](https://github.com/odoo/tutorials/commits/%7BCURRENT_MAJOR_BRANCH%7D-solutions).

</div>

## 1. Integration testing

To make sure our application works as expected, we can perform
`integration testing
<reference/testing/integration-testing>` by creating a tour: this is a
sequence of steps that we can execute. Each step wait until some desired
DOM state is reached, then performs an action. If, at some point, it is
unable to go to the next step for a long time, the tour fails.

Let's write a tour to ensure that it is possible to perform an tshirt
order from our public route

<div class="exercise">

1.  In the <span class="title-ref">awesome_tshirt</span> addon, add a
    `/static/tests/tours` folder.
2.  Add a `/static/tests/tours/order_flow.js` file.
3.  Add a tour that performs the following steps:
    1.  Open the <span class="title-ref">/awesome_tshirt/order</span>
        route.
    2.  Fill the order form.
    3.  Validate it.
    4.  Navigate to our webclient.
    5.  Open the list view for the the t-shirt order.
    6.  Check that our order can be found in the list.
4.  Run the tour manually.
5.  Add a Python test to run it programmatically.
6.  Run the tour from the terminal.

</div>

## 2. Unit testing a Component

It is also useful to test independently a component or a piece of code.
`QUnit
<reference/testing/qunit>` tests are useful to quickly locate an issue.

<div class="exercise">

1.  In the <span class="title-ref">awesome_tshirt</span> addon, add a
    `static/tests/counter_tests.js` file.
2.  Add a QUnit test that instantiates a counter, clicks on it, and
    makes sure it is incremented.

<img src="05_testing/component_test.png" class="align-center"
alt="image" />

</div>

<div class="seealso">

[Example: Testing an Owl
component](%7BGITHUB_PATH%7D/addons/web/static/tests/core/checkbox_tests.js)

</div>

## 3. Unit testing our gallery view

Many components need more setup to be tested. In particular, we often
need to mock some demo data. Let us see how to do that.

> [!NOTE]
> This depends on our Gallery View from `04_creating_view_from_scratch`.

<div class="exercise">

1.  In the <span class="title-ref">awesome_gallery</span> addon, add a
    `/static/tests/gallery_view_tests.js` file.
2.  Add a test that instantiates the gallery view with some demo data.
3.  Add another test that checks that when the user clicks on an image,
    it is switched to the form view of the corresponding order.

<img src="05_testing/view_test.png" class="align-center" alt="image" />

</div>

<div class="seealso">

[Example: Testing a list
view](%7BGITHUB_PATH%7D/addons/web/static/tests/views/list_view_tests.js)

</div>
