# Create customized reports

SQL views are a technique for creating customized reports to show data
that cannot be shown with existing models' fields and views. In other
words, this technique helps avoid unnecessary creation and calculation
of additional fields solely for data analysis purposes.

## Create a model

A SQL view is created in a similar manner as a standard model:

``` python
from odoo import fields, models


class ModuleReport(models.Model):
    _name = 'module.report'
    _description = "Module Report"
    _rec_name = 'module_field'
    _auto = False
```

Where the attributes:

- <span class="title-ref">\_auto = False</span> indicates that we do not
  want to store the model in the database
- <span class="title-ref">\_rec_name</span> indicates which of the
  model's fields represents a record's name (i.e. the name that will be
  used in the navigation breadcrumb when opening a record's form view)

and its fields are defined in the same way as a standard model, except
every field is marked as <span class="title-ref">readonly=True</span>.

> [!NOTE]
> Don't forget to add your new model to your security file.

## Populate the model

There are 2 ways to populate a SQL view's table:

- override the <span class="title-ref">BaseModel.init()</span> method,
- set the <span class="title-ref">\_table_query</span> property.

Regardless of which way is used, a SQL query will be executed to
populate the model. Therefore, any SQL commands can be used to collect
and/or calculate the data needed and you are expected to keep in mind
that you are bypassing the ORM (i.e. it is a good idea to read through
`reference/security` if you haven't already). The columns returned from
the <span class="title-ref">SELECT</span> will populate the model's
fields, so ensure that your column names match your field names, or use
alias names that match.

<div class="tabs">

<div class="tab">

Overriding <span class="title-ref">BaseModel.init()</span>

In most cases, overriding the
<span class="title-ref">BaseModel.init()</span> method is the standard
and better option to use. It requires the import of
<span class="title-ref">tools</span> and is typically written as
follows:

``` python
def init(self):
    tools.drop_view_if_exists(self.env.cr, self._table)
    self.env.cr.execute("""CREATE or REPLACE VIEW %s as (
                           SELECT
                              %s
                           FROM
                              %s
        )""" % (self._table, self._select(), self._from()))
```

<span class="title-ref">tools.drop_view_if_exists</span> ensures that a
conflicting view is not created when the SQL query is executed. It is
standard to separate the different parts of the query to allow for
easier model extension. Exactly how the query is split up across methods
is not standardized, but at minimum, the
<span class="title-ref">\_select</span> and
<span class="title-ref">\_from</span> methods are common, and of course,
all these methods will return strings.

<div class="seealso">

[Example: a SQL view using an override of
BaseModel.init()](%7BGITHUB_PATH%7D/addons/project/report/project_report.py)

</div>

</div>

<div class="tab">

Using <span class="title-ref">\_table_query</span>

The `_table_query` property is used when the view depends on the
context. It is typically written as follows:

``` python
@property
def _table_query(self):
    return 'SELECT %s FROM %s' % (self._select(), self._from())
```

and follows the same <span class="title-ref">\_select</span> and
<span class="title-ref">\_from</span> methods standards as
<span class="title-ref">BaseModel.init()</span>.

An example of when the property should be used instead of overriding
<span class="title-ref">BaseModel.init()</span> is in a multi-company
and multi-currency environment where currency related amounts need to be
converted using currency exchange rates when the user switches between
companies.

<div class="seealso">

[Example: a SQL view using
\_table_query](%7BGITHUB_PATH%7D/addons/account/report/account_invoice_report.py)

</div>

</div>

</div>

## Use the model

Views and menu items for your SQL views are created and used in the same
way as any other Konvergo ERP model. You are all set to start using your SQL
view. Have fun!

## Extra tips

> [!TIP]
> A common mistake in SQL views is not considering the duplication of
> certain data due to table JOINs. This can lead to miscounting when
> using a field's <span class="title-ref">group_operator</span> and/or
> the pivot view. It is best to test your SQL view with sufficient data
> to ensure the resulting field values are as you expect.

> [!TIP]
> If you have a field that you do not want as a measure (i.e., in your
> pivot or graph views), add <span class="title-ref">store=False</span>
> to it, and it will not show.
