# Chapter 3: Custom kanban view

<div class="todo">

It'd be cool to follow the naming convention of the previous chapters:
"Chapter N: The concept studied in the chapter"

</div>

> [!WARNING]
> It is highly recommended that you complete `01_fields_and_views`
> before starting this chapter. The concepts introduced in Chapter 3,
> including views and examples, will be essential for understanding the
> material covered in this chapter.

We have gained an understanding of the numerous capabilities offered by
the Odoo web framework. As a next step, we will customize a kanban view.
This is a more complicated project that will showcase some non trivial
aspects of the framework. The goal is to practice composing views,
coordinating various aspects of the UI, and doing it in a maintainable
way.

Bafien had the greatest idea ever: a mix of a kanban view and a list
view would be perfect for your needs! In a nutshell, he wants a list of
customers on the left of the task's kanban view. When you click on a
customer on the left sidebar, the kanban view on the right is filtered
to only display orders linked to that customer.

<div class="admonition">

Goal

<img src="03_custom_kanban_view/overview.png" class="align-center"
alt="image" />

</div>

<div class="spoiler">

Solutions

The solutions for each exercise of the chapter are hosted on the
[official Odoo tutorials
repository](https://github.com/odoo/tutorials/commits/%7BCURRENT_MAJOR_BRANCH%7D-solutions/awesome_tshirt).

</div>

## 1. Create a new kanban view

Since we are customizing the kanban view, let us start by extending it
and using our extension in the kanban view for the tshirt orders.

<div class="exercise">

1.  Extend the kanban view by extending the kanban controller and by
    creating a new view object.
2.  Register it in the views registry under
    <span class="title-ref">awesome_tshirt.customer_kanban</span>.
3.  Update the kanban arch to use the extended view. This can be done
    with the <span class="title-ref">js_class</span> attribute.

</div>

## 2. Create a CustomerList component

We will need to display a list of customers, so we might as well create
the component.

<div class="exercise">

1.  Create a <span class="title-ref">CustomerList</span> component which
    only displays a <span class="title-ref">div</span> with some text
    for now.
2.  It should have a <span class="title-ref">selectCustomer</span> prop.
3.  Create a new template extending (XPath) the kanban controller
    template to add the <span class="title-ref">CustomerList</span> next
    to the kanban renderer. Give it an empty function as
    <span class="title-ref">selectCustomer</span> for now.
4.  Subclass the kanban controller to add
    <span class="title-ref">CustomerList</span> in its sub-components.
5.  Make sure you see your component in the kanban view.

<img src="03_custom_kanban_view/customer_list.png" class="align-center"
alt="image" />

</div>

## 3. Load and display data

<div class="exercise">

1.  Modify the <span class="title-ref">CustomerList</span> component to
    fetch a list of all customers in
    <span class="title-ref">onWillStart</span>.
2.  Display the list in the template with a
    <span class="title-ref">t-foreach</span>.
3.  Whenever a customer is selected, call the
    <span class="title-ref">selectCustomer</span> function prop.

<img src="03_custom_kanban_view/customer_data.png" class="align-center"
alt="image" />

</div>

## 4. Update the main kanban view

<div class="exercise">

1.  Implement <span class="title-ref">selectCustomer</span> in the
    kanban controller to add the proper domain.
2.  Modify the template to give the real function to the
    <span class="title-ref">CustomerList</span>
    <span class="title-ref">selectCustomer</span> prop.

Since it is not trivial to interact with the search view, here is a
quick snippet to help:

``` js
selectCustomer(customer_id, customer_name) {
   this.env.searchModel.setDomainParts({
      customer: {
            domain: [["customer_id", "=", customer_id]],
            facetLabel: customer_name,
      },
   });
}
```

<img src="03_custom_kanban_view/customer_filter.png"
class="align-center" alt="image" />

</div>

## 5. Only display customers which have an active order

There is a <span class="title-ref">has_active_order</span> field on
<span class="title-ref">res.partner</span>. Let us allow the user to
filter results on customers with an active order.

<div class="exercise">

1.  Add an input of type checkbox in the
    <span class="title-ref">CustomerList</span> component, with a label
    "Active customers" next to it.
2.  Changing the value of the checkbox should filter the list on
    customers with an active order.

<img src="03_custom_kanban_view/active_customer.png"
class="align-center" alt="image" />

</div>

## 6. Add a search bar to the customer list

<div class="exercise">

Add an input above the customer list that allows the user to enter a
string and to filter the displayed customers, according to their name.

> [!TIP]
> You can use the <span class="title-ref">fuzzyLookup</span> function to
> perform the filter.

<img src="03_custom_kanban_view/customer_search.png"
class="align-center" alt="image" />

</div>

<div class="seealso">

- [Code: The fuzzylookup
  function](%7BGITHUB_PATH%7D/addons/web/static/src/core/utils/search.js)
- [Example: Using fuzzyLookup
  \<https://github.com/odoo/odoo/blob/1f4e583ba20a01f4c44b0a4ada42c4d3bb074273/
  addons/web/static/tests/core/utils/search_test.js#L17\>]()

</div>

## 7. Refactor the code to use <span class="title-ref">t-model</span>

To solve the previous two exercises, it is likely that you used an event
listener on the inputs. Let us see how we could do it in a more
declarative way, with the
[t-model](%7BOWL_PATH%7D/doc/reference/input_bindings.md) directive.

<div class="exercise">

1.  Make sure you have a reactive object that represents the fact that
    the filter is active (something like
    `this.state = useState({ displayActiveCustomers: false, searchString: ''})`).
2.  Modify the code to add a getter
    <span class="title-ref">displayedCustomers</span> which returns the
    currently active list of customers.
3.  Modify the template to use <span class="title-ref">t-model</span>.

</div>

## 8. Paginate customers!

<div class="exercise">

1.  Add a `pager <frontend/pager>` in the
    <span class="title-ref">CustomerList</span>, and only load/render
    the first 20 customers.
2.  Whenever the pager is changed, the customer list should update
    accordingly.

This is actually pretty hard, in particular in combination with the
filtering done in the previous exercise. There are many edge cases to
take into account.

<img src="03_custom_kanban_view/customer_pager.png" class="align-center"
alt="image" />

</div>
