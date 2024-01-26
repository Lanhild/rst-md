# ORM API

<div class="automodule">

odoo.models

</div>

## Models<span id="reference/orm/models"></span>

Model fields are defined as attributes on the model itself:

    from odoo import models, fields
    class AModel(models.Model):
        _name = 'a.model.name'
    
        field1 = fields.Char()

<div class="warning">

<div class="title">

Warning

</div>

this means you cannot define a field and a method with the same name,
the last one will silently overwrite the former ones.

</div>

By default, the field's label (user-visible name) is a capitalized
version of the field name, this can be overridden with the `string`
parameter. :

    field2 = fields.Integer(string="Field Label")

For the list of field types and parameters, see `the fields reference
<reference/fields>`.

Default values are defined as parameters on fields, either as a value:

    name = fields.Char(default="a value")

or as a function called to compute the default value, which should
return that value:

    def _default_name(self):
        return self.get_value()
    
    name = fields.Char(default=lambda self: self._default_name())

**API**

<div class="autoclass">

odoo.models.BaseModel()

<div class="autoattribute">

\_auto

</div>

<div class="attribute">

\_log\_access

Whether the ORM should automatically generate and update the
`reference/fields/automatic/log_access`.

Defaults to whatever value was set for `~._auto`.

</div>

<div class="autoattribute">

\_table

</div>

<div class="autoattribute">

\_sequence

</div>

<div class="autoattribute">

\_sql\_constraints

</div>

<div class="autoattribute">

\_register

</div>

<div class="autoattribute">

\_abstract

</div>

<div class="autoattribute">

\_transient

</div>

<div class="autoattribute">

\_name

</div>

<div class="autoattribute">

\_description

</div>

<div class="autoattribute">

\_inherit

</div>

<div class="autoattribute">

\_inherits

</div>

<div class="autoattribute">

\_rec\_name

</div>

<div class="autoattribute">

\_order

</div>

<div class="autoattribute">

\_check\_company\_auto

</div>

<div class="autoattribute">

\_parent\_name

</div>

<div class="autoattribute">

\_parent\_store

</div>

<div class="autoattribute">

\_date\_name

</div>

<div class="autoattribute">

\_fold\_name

</div>

</div>

### AbstractModel

<div class="autoclass">

odoo.models.AbstractModel()

</div>

### Model

<div class="autoclass">

odoo.models.Model()

<div class="autoattribute">

\_auto

</div>

<div class="autoattribute">

\_abstract

</div>

<div class="autoattribute">

\_transient

</div>

</div>

### TransientModel

<div class="autoclass">

odoo.models.TransientModel()

<div class="autoattribute">

\_auto

</div>

<div class="autoattribute">

\_abstract

</div>

<div class="autoattribute">

\_transient

</div>

</div>

## Fields<span id="reference/fields"></span>

<div class="currentmodule">

odoo.fields

</div>

<div class="autoclass">

Field()

</div>

### Basic Fields

<div class="autoclass">

Boolean()

</div>

<div class="autoclass">

Char()

</div>

<div class="autoclass">

Float()

</div>

<div class="autoclass">

Integer()

</div>

### Advanced Fields

<div class="autoclass">

Binary()

</div>

<div class="autoclass">

Html()

</div>

<div class="autoclass">

Image()

</div>

<div class="autoclass">

Monetary()

</div>

<div class="autoclass">

Selection()

</div>

<div class="autoclass">

Text()

</div>

#### Date(time) Fields

`Dates <odoo.fields.Date>` and `Datetimes <odoo.fields.Datetime>` are
very important fields in any kind of business application. Their misuse
can create invisible yet painful bugs, this section aims to provide Odoo
developers with the knowledge required to avoid misusing these fields.

When assigning a value to a Date/Datetime field, the following options
are valid:

  - A <span class="title-ref">date</span> or
    <span class="title-ref">datetime</span> object.
  - A string in the proper server format:
      - `YYYY-MM-DD` for `~odoo.fields.Date` fields,
      - `YYYY-MM-DD HH:MM:SS` for `~odoo.fields.Datetime` fields.
  - <span class="title-ref">False</span> or
    <span class="title-ref">None</span>.

The Date and Datetime fields class have helper methods to attempt
conversion into a compatible type:

  - `~odoo.fields.Date.to_date` will convert to a `datetime.date`
  - `~odoo.fields.Datetime.to_datetime` will convert to a
    `datetime.datetime`.

<div class="example">

To parse date/datetimes coming from external sources:

    fields.Date.to_date(self._context.get('date_from'))

</div>

Date / Datetime comparison best practices:

  - Date fields can **only** be compared to date objects.
  - Datetime fields can **only** be compared to datetime objects.

<div class="warning">

<div class="title">

Warning

</div>

Strings representing dates and datetimes can be compared between each
other, however the result may not be the expected result, as a datetime
string will always be greater than a date string, therefore this
practice is **heavily** discouraged.

</div>

Common operations with dates and datetimes such as addition, subtraction
or fetching the start/end of a period are exposed through both
`~odoo.fields.Date` and `~odoo.fields.Datetime`. These helpers are also
available by importing
<span class="title-ref">odoo.tools.date\_utils</span>.

<div class="note">

<div class="title">

Note

</div>

Timezones

Datetime fields are stored as <span class="title-ref">timestamp without
timezone</span> columns in the database and are stored in the UTC
timezone. This is by design, as it makes the Odoo database independent
from the timezone of the hosting server system. Timezone conversion is
managed entirely by the client side.

</div>

<div class="autoclass" data-members="today, context_today, to_date, to_string, start_of, end_of, add, subtract">

Date()

</div>

<div class="autoclass" data-members="now, today, context_timestamp, to_datetime, to_string, start_of, end_of, add, subtract">

Datetime()

</div>

#### Relational Fields

<div class="autoclass">

Many2one()

</div>

<div class="autoclass">

One2many()

</div>

<div class="autoclass">

Many2many()

</div>

#### Pseudo-relational fields

<div class="autoclass">

Reference()

</div>

<div class="autoclass">

Many2oneReference()

</div>

#### Computed Fields

Fields can be computed (instead of read straight from the database)
using the `compute` parameter. **It must assign the computed value to
the field**. If it uses the values of other *fields*, it should specify
those fields using `~odoo.api.depends`. :

    from odoo import api
    total = fields.Float(compute='_compute_total')
    
    @api.depends('value', 'tax')
    def _compute_total(self):
        for record in self:
            record.total = record.value + record.value * record.tax

  - dependencies can be dotted paths when using sub-fields:
    
        @api.depends('line_ids.value')
        def _compute_total(self):
            for record in self:
                record.total = sum(line.value for line in record.line_ids)

  - computed fields are not stored by default, they are computed and
    returned when requested. Setting `store=True` will store them in the
    database and automatically enable searching.

  - searching on a computed field can also be enabled by setting the
    `search` parameter. The value is a method name returning a
    `reference/orm/domains`. :
    
        upper_name = field.Char(compute='_compute_upper', search='_search_upper')
        
        def _search_upper(self, operator, value):
            if operator == 'like':
                operator = 'ilike'
            return [('name', operator, value)]
    
    The search method is invoked when processing domains before doing an
    actual search on the model. It must return a domain equivalent to
    the condition: `field operator value`.

<!-- end list -->

  - Computed fields are readonly by default. To allow *setting* values
    on a computed field, use the `inverse` parameter. It is the name of
    a function reversing the computation and setting the relevant
    fields:
    
        document = fields.Char(compute='_get_document', inverse='_set_document')
        
        def _get_document(self):
            for record in self:
                with open(record.get_document_path) as f:
                    record.document = f.read()
        def _set_document(self):
            for record in self:
                if not record.document: continue
                with open(record.get_document_path()) as f:
                    f.write(record.document)

  - multiple fields can be computed at the same time by the same method,
    just use the same method on all fields and set all of them:
    
        discount_value = fields.Float(compute='_apply_discount')
        total = fields.Float(compute='_apply_discount')
        
        @api.depends('value', 'discount')
        def _apply_discount(self):
            for record in self:
                # compute actual discount from discount percentage
                discount = record.value * record.discount
                record.discount_value = discount
                record.total = record.value - discount

<div class="warning">

<div class="title">

Warning

</div>

While it is possible to use the same compute method for multiple fields,
it is not recommended to do the same for the inverse method.

During the computation of the inverse, **all** fields that use said
inverse are protected, meaning that they can't be computed, even if
their value is not in the cache.

If any of those fields is accessed and its value is not in cache, the
ORM will simply return a default value of
<span class="title-ref">False</span> for these fields. This means that
the value of the inverse fields (other than the one triggering the
inverse method) may not give their correct value and this will probably
break the expected behavior of the inverse method.

</div>

#### Related fields

A special case of computed fields are *related* (proxy) fields, which
provide the value of a sub-field on the current record. They are defined
by setting the `related` parameter and like regular computed fields they
can be stored:

    nickname = fields.Char(related='user_id.partner_id.name', store=True)

The value of a related field is given by following a sequence of
relational fields and reading a field on the reached model. The complete
sequence of fields to traverse is specified by the `related` attribute.

Some field attributes are automatically copied from the source field if
they are not redefined: `string`, `help`, `required` (only if all fields
in the sequence are required), `groups`, `digits`, `size`, `translate`,
`sanitize`, `selection`, `comodel_name`, `domain`, `context`. All
semantic-free attributes are copied from the source field.

By default, related fields are:

  - not stored
  - not copied
  - readonly
  - computed in superuser mode

Add the attribute `store=True` to make it stored, just like computed
fields. Related fields are automatically recomputed when their
dependencies are modified.

<div class="tip">

<div class="title">

Tip

</div>

You can specify precise field dependencies if you don't want the related
field to be recomputed on any dependency change:

    nickname = fields.Char(
        related='partner_id.name', store=True,
        depends=['partner_id'])
    # The nickname will only be recomputed when the partner_id
    # is modified, not when the name is modified on the partner.

</div>

<div class="warning">

<div class="title">

Warning

</div>

You cannot chain `~odoo.fields.Many2many` or `~odoo.fields.One2many`
fields in `related` fields dependencies.

`related` can be used to refer to a `~odoo.fields.One2many` or
`~odoo.fields.Many2many` field on another model on the condition that
it's done through a `Many2one` relation on the current model. `One2many`
and `Many2many` are not supported and the results will not be aggregated
correctly:

    m2o_id = fields.Many2one()
    m2m_ids = fields.Many2many()
    o2m_ids = fields.One2many()
    
    # Supported
    d_ids = fields.Many2many(related="m2o_id.m2m_ids")
    e_ids = fields.One2many(related="m2o_id.o2m_ids")
    
    # Won't work: use a custom Many2many computed field instead
    f_ids = fields.Many2many(related="m2m_ids.m2m_ids")
    g_ids = fields.One2many(related="o2m_ids.o2m_ids")

</div>

### Automatic fields

<div class="attribute">

id

Identifier `field <odoo.fields.Field>`

If length of current recordset is 1, return id of unique record in it.

Raise an Error otherwise.

</div>

#### Access Log fields

These fields are automatically set and updated if
`~odoo.models.BaseModel._log_access` is enabled. It can be disabled to
avoid creating or updating those fields on tables for which they are not
useful.

By default, `~odoo.models.BaseModel._log_access` is set to the same
value as `~odoo.models.BaseModel._auto`

<div class="attribute">

create\_date

Stores when the record was created, `~odoo.fields.Datetime`

</div>

<div class="attribute">

create\_uid

Stores *who* created the record, `~odoo.fields.Many2one` to a
`res.users`.

</div>

<div class="attribute">

write\_date

Stores when the record was last updated, `~odoo.fields.Datetime`

</div>

<div class="attribute">

write\_uid

Stores who last updated the record, `~odoo.fields.Many2one` to a
`res.users`.

</div>

<div class="warning">

<div class="title">

Warning

</div>

`~odoo.models.BaseModel._log_access` *must* be enabled on
`~odoo.models.TransientModel`.

</div>

### Reserved Field names

A few field names are reserved for pre-defined behaviors beyond that of
automated fields. They should be defined on a model when the related
behavior is desired:

<div class="attribute">

name

default value for `~odoo.models.BaseModel._rec_name`, used to display
records in context where a representative "naming" is necessary.

`~odoo.fields.Char`

</div>

<div class="attribute">

active

toggles the global visibility of the record, if `active` is set to
`False` the record is invisible in most searches and listing.

`~odoo.fields.Boolean`

</div>

<div class="attribute">

state

lifecycle stages of the object, used by the `states` attribute on
`fields <odoo.fields.Field>`.

`~odoo.fields.Selection`

</div>

<div class="attribute">

parent\_id

default\_value of `~._parent_name`, used to organize records in a tree
structure and enables the `child_of` and `parent_of` operators in
domains.

`~odoo.fields.Many2one`

</div>

<div class="attribute">

parent\_path

When `~._parent_store` is set to True, used to store a value reflecting
the tree structure of `~._parent_name`, and to optimize the operators
`child_of` and `parent_of` in search domains. It must be declared with
`index=True` for proper operation.

`~odoo.fields.Char`

</div>

<div class="attribute">

company\_id

Main field name used for Odoo multi-company behavior.

Used by
<span class="title-ref">:meth:\~odoo.models.\_check\_company</span> to
check multi company consistency. Defines whether a record is shared
between companies (no value) or only accessible by the users of a given
company.

`~odoo.fields.Many2one` :type: `~odoo.addons.base.models.res_company`

</div>

## Recordsets

Interactions with models and records are performed through recordsets,
an ordered collection of records of the same model.

<div class="warning">

<div class="title">

Warning

</div>

Contrary to what the name implies, it is currently possible for
recordsets to contain duplicates. This may change in the future.

</div>

Methods defined on a model are executed on a recordset, and their `self`
is a recordset:

    class AModel(models.Model):
        _name = 'a.model'
        def a_method(self):
            # self can be anything between 0 records and all records in the
            # database
            self.do_operation()

Iterating on a recordset will yield new sets of *a single record*
("singletons"), much like iterating on a Python string yields strings of
a single characters:

    def do_operation(self):
        print(self) # => a.model(1, 2, 3, 4, 5)
        for record in self:
            print(record) # => a.model(1), then a.model(2), then a.model(3), ...

### Field access

Recordsets provide an "Active Record" interface: model fields can be
read and written directly from the record as attributes.

<div class="note">

<div class="title">

Note

</div>

When accessing non-relational fields on a recordset of potentially
multiple records, use `~odoo.models.BaseModel.mapped`:

    total_qty = sum(self.mapped('qty'))

</div>

Field values can also be accessed like dict items, which is more elegant
and safer than `getattr()` for dynamic field names. Setting a field's
value triggers an update to the database:

    >>> record.name
    Example Name
    >>> record.company_id.name
    Company Name
    >>> record.name = "Bob"
    >>> field = "name"
    >>> record[field]
    Bob

<div class="warning">

<div class="title">

Warning

</div>

Trying to read a field on multiple records will raise an error for non
relational fields.

</div>

Accessing a relational field (`~odoo.fields.Many2one`,
`~odoo.fields.One2many`, `~odoo.fields.Many2many`) *always* returns a
recordset, empty if the field is not set.

### Record cache and prefetching

Odoo maintains a cache for the fields of the records, so that not every
field access issues a database request, which would be terrible for
performance. The following example queries the database only for the
first statement:

    record.name             # first access reads value from database
    record.name             # second access gets value from cache

To avoid reading one field on one record at a time, Odoo *prefetches*
records and fields following some heuristics to get good performance.
Once a field must be read on a given record, the ORM actually reads that
field on a larger recordset, and stores the returned values in cache for
later use. The prefetched recordset is usually the recordset from which
the record comes by iteration. Moreover, all simple stored fields
(boolean, integer, float, char, text, date, datetime, selection,
many2one) are fetched altogether; they correspond to the columns of the
model's table, and are fetched efficiently in the same query.

Consider the following example, where `partners` is a recordset of 1000
records. Without prefetching, the loop would make 2000 queries to the
database. With prefetching, only one query is made:

    for partner in partners:
        print partner.name          # first pass prefetches 'name' and 'lang'
                                    # (and other fields) on all 'partners'
        print partner.lang

The prefetching also works on *secondary records*: when relational
fields are read, their values (which are records) are subscribed for
future prefetching. Accessing one of those secondary records prefetches
all secondary records from the same model. This makes the following
example generate only two queries, one for partners and one for
countries:

    countries = set()
    for partner in partners:
        country = partner.country_id        # first pass prefetches all partners
        countries.add(country.name)         # first pass prefetches all countries

## Method decorators

<div class="automodule" data-members="depends, depends_context, constrains, onchange, returns, autovacuum, model, model_create_multi">

odoo.api

</div>

<div class="todo">

With sphinx 2.0 : autodecorator

</div>

<div class="todo">

Add in Views reference \* It is possible to suppress the trigger from a
specific field by adding `on_change="0"` in a view:

    <field name="name" on_change="0"/>

will not trigger any interface update when the field is edited by the
user, even if there are function fields or explicit onchange depending
on that field.

</div>

## Environment

The `~odoo.api.Environment` stores various contextual data used by the
ORM: the database cursor (for database queries), the current user (for
access rights checking) and the current context (storing arbitrary
metadata). The environment also stores caches.

All recordsets have an environment, which is immutable, can be accessed
using `~odoo.models.Model.env` and gives access to:

  - the current user (`~odoo.api.Environment.user`)
  - the cursor (`~odoo.api.Environment.cr`)
  - the superuser flag (`~odoo.api.Environment.su`)
  - or the context (`~odoo.api.Environment.context`)

<!-- end list -->

``` bash
>>> records.env
<Environment object ...>
>>> records.env.user
res.user(3)
>>> records.env.cr
<Cursor object ...)
```

When creating a recordset from an other recordset, the environment is
inherited. The environment can be used to get an empty recordset in an
other model, and query that model:

    >>> self.env['res.partner']
    res.partner()
    >>> self.env['res.partner'].search([['is_company', '=', True], ['customer', '=', True]])
    res.partner(7, 18, 12, 14, 17, 19, 8, 31, 26, 16, 13, 20, 30, 22, 29, 15, 23, 28, 74)

<div class="currentmodule">

odoo.api

</div>

<div class="automethod">

Environment.ref

</div>

<div class="autoattribute">

Environment.lang

</div>

<div class="autoattribute">

Environment.user

</div>

<div class="autoattribute">

Environment.company

</div>

<div class="autoattribute">

Environment.companies

</div>

### Altering the environment

<div class="currentmodule">

odoo.models

</div>

<div class="automethod">

Model.with\_context

</div>

<div class="automethod">

Model.with\_user

</div>

<div class="automethod">

Model.with\_company

</div>

<div class="automethod">

Model.with\_env

</div>

<div class="automethod">

Model.sudo

</div>

### SQL Execution

The `~odoo.api.Environment.cr` attribute on environments is the cursor
for the current database transaction and allows executing SQL directly,
either for queries which are difficult to express using the ORM (e.g.
complex joins) or for performance reasons:

    self.env.cr.execute("some_sql", params)

Because models use the same cursor and the `~odoo.api.Environment` holds
various caches, these caches must be invalidated when *altering* the
database in raw SQL, or further uses of models may become incoherent. It
is necessary to clear caches when using `CREATE`, `UPDATE` or `DELETE`
in SQL, but not `SELECT` (which simply reads the database).

<div class="note">

<div class="title">

Note

</div>

Clearing caches can be performed using the
`~odoo.models.Model.invalidate_cache` method.

</div>

<div class="automethod">

Model.invalidate\_cache

</div>

<div class="warning">

<div class="title">

Warning

</div>

Executing raw SQL bypasses the ORM, and by consequent, Odoo security
rules. Please make sure your queries are sanitized when using user input
and prefer using ORM utilities if you don't really need to use SQL
queries.

</div>

## Common ORM methods

<div class="currentmodule">

odoo.models

</div>

### Create/update

<div class="todo">

api.model\_create\_multi information

</div>

<div class="automethod">

Model.create

</div>

<div class="automethod">

Model.copy

</div>

<div class="automethod">

Model.default\_get

</div>

<div class="automethod">

Model.name\_create

</div>

<div class="automethod">

Model.write

</div>

<div class="automethod">

Model.flush

</div>

### Search/Read

<div class="automethod">

Model.browse

</div>

<div class="automethod">

Model.search

</div>

<div class="automethod">

Model.search\_count

</div>

<div class="automethod">

Model.name\_search

</div>

<div class="automethod">

Model.read

</div>

<div class="automethod">

Model.read\_group

</div>

#### Fields/Views

<div class="automethod">

Model.fields\_get

</div>

<div class="automethod">

Model.fields\_view\_get

</div>

#### Search domains

A domain is a list of criteria, each criterion being a triple (either a
`list` or a `tuple`) of `(field_name, operator, value)` where:

  -   - `field_name` (`str`)  
        a field name of the current model, or a relationship traversal
        through a `~odoo.fields.Many2one` using dot-notation e.g.
        `'street'` or `'partner_id.country'`

  -   - `operator` (`str`)  
        an operator used to compare the `field_name` with the `value`.
        Valid operators are:
        
          - `=`  
            equals to
        
          - `!=`  
            not equals to
        
          - `>`  
            greater than
        
          - `>=`  
            greater than or equal to
        
          - `<`  
            less than
        
          - `<=`  
            less than or equal to
        
          - `=?`  
            unset or equals to (returns true if `value` is either `None`
            or `False`, otherwise behaves like `=`)
        
          - `=like`  
            matches `field_name` against the `value` pattern. An
            underscore `_` in the pattern stands for (matches) any
            single character; a percent sign `%` matches any string of
            zero or more characters.
        
          - `like`  
            matches `field_name` against the `%value%` pattern. Similar
            to `=like` but wraps `value` with '%' before matching
        
          - `not like`  
            doesn't match against the `%value%` pattern
        
          - `ilike`  
            case insensitive `like`
        
          - `not ilike`  
            case insensitive `not like`
        
          - `=ilike`  
            case insensitive `=like`
        
          - `in`  
            is equal to any of the items from `value`, `value` should be
            a list of items
        
          - `not in`  
            is unequal to all of the items from `value`
        
          - `child_of`  
            is a child (descendant) of a `value` record (value can be
            either one item or a list of items).
            
            Takes the semantics of the model into account (i.e following
            the relationship field named by
            `~odoo.models.Model._parent_name`).
        
          - `parent_of`  
            is a parent (ascendant) of a `value` record (value can be
            either one item or a list of items).
            
            Takes the semantics of the model into account (i.e following
            the relationship field named by
            `~odoo.models.Model._parent_name`).

  -   - `value`  
        variable type, must be comparable (through `operator`) to the
        named field.

Domain criteria can be combined using logical operators in *prefix*
form:

  - `'&'`  
    logical *AND*, default operation to combine criteria following one
    another. Arity 2 (uses the next 2 criteria or combinations).

  - `'|'`  
    logical *OR*, arity 2.

  - `'!'`  
    logical *NOT*, arity 1.
    
    <div class="note">
    
    <div class="title">
    
    Note
    
    </div>
    
    Mostly to negate combinations of criteria Individual criterion
    generally have a negative form (e.g. `=` -\> `!=`, `<` -\> `>=`)
    which is simpler than negating the positive.
    
    </div>

<div class="example">

To search for partners named *ABC*, from belgium or germany, whose
language is not english:

    [('name','=','ABC'),
     ('language.code','!=','en_US'),
     '|',('country_id.code','=','be'),
         ('country_id.code','=','de')]

This domain is interpreted as:

``` text
(name is 'ABC')
AND (language is NOT english)
AND (country is Belgium OR Germany)
```

</div>

### Unlink

<div class="automethod">

Model.unlink

</div>

### Record(set) information

<div class="autoattribute">

Model.ids

</div>

<div class="attribute">

env

Returns the environment of the given recordset.

  - type  
    `~odoo.api.Environment`

</div>

<div class="todo">

Environment documentation

</div>

<div class="automethod">

Model.exists

</div>

<div class="automethod">

Model.ensure\_one

</div>

<div class="automethod">

Model.name\_get

</div>

<div class="automethod">

Model.get\_metadata

</div>

### Operations

Recordsets are immutable, but sets of the same model can be combined
using various set operations, returning new recordsets.

  - `record in set` returns whether `record` (which must be a 1-element
    recordset) is present in `set`. `record not in set` is the inverse
    operation
  - `set1 <= set2` and `set1 < set2` return whether `set1` is a subset
    of `set2` (resp. strict)
  - `set1 >= set2` and `set1 > set2` return whether `set1` is a superset
    of `set2` (resp. strict)
  - `set1 | set2` returns the union of the two recordsets, a new
    recordset containing all records present in either source
  - `set1 & set2` returns the intersection of two recordsets, a new
    recordset containing only records present in both sources
  - `set1 - set2` returns a new recordset containing only records of
    `set1` which are *not* in `set2`

Recordsets are iterable so the usual Python tools are available for
transformation (`python:map`, `python:sorted`,
`~python:itertools.ifilter`, ...) however these return either a
`python:list` or an `python:iterator`, removing the ability to call
methods on their result, or to use set operations.

Recordsets therefore provide the following operations returning
recordsets themselves (when possible):

#### Filter

<div class="automethod">

Model.filtered

</div>

<div class="automethod">

Model.filtered\_domain

</div>

#### Map

<div class="automethod">

Model.mapped

</div>

<div class="note">

<div class="title">

Note

</div>

Since V13, multi-relational field access is supported and works like a
mapped call:

``` python3
records.partner_id  # == records.mapped('partner_id')
records.partner_id.bank_ids  # == records.mapped('partner_id.bank_ids')
records.partner_id.mapped('name')  # == records.mapped('partner_id.name')
```

</div>

#### Sort

<div class="automethod">

Model.sorted

</div>

## Inheritance and extension

Odoo provides three different mechanisms to extend models in a modular
way:

  - creating a new model from an existing one, adding new information to
    the copy but leaving the original module as-is
  - extending models defined in other modules in-place, replacing the
    previous version
  - delegating some of the model's fields to records it contains

![image](orm/inheritance_methods.png)

### Classical inheritance

When using the `~odoo.models.Model._inherit` and
`~odoo.models.Model._name` attributes together, Odoo creates a new model
using the existing one (provided via `~odoo.models.Model._inherit`) as a
base. The new model gets all the fields, methods and meta-information
(defaults & al) from its base.

``` python
class Inheritance0(models.Model):
    _name = 'inheritance.0'
    _description = 'Inheritance Zero'

    name = fields.Char()

    def call(self):
        return self.check("model 0")

    def check(self, s):
        return "This is {} record {}".format(s, self.name)

class Inheritance1(models.Model):
    _name = 'inheritance.1'
    _inherit = 'inheritance.0'
    _description = 'Inheritance One'

    def call(self):
        return self.check("model 1")
```

and using them:

    a = env['inheritance.0'].create({'name': 'A'})
    b = env['inheritance.1'].create({'name': 'B'})
    
    a.call()
    b.call()

will yield:

> "This is model 0 record A" "This is model 1 record B"

the second model has inherited from the first model's `check` method and
its `name` field, but overridden the `call` method, as when using
standard `Python inheritance <python:tut-inheritance>`.

### Extension

When using `~odoo.models.Model._inherit` but leaving out
`~odoo.models.Model._name`, the new model replaces the existing one,
essentially extending it in-place. This is useful to add new fields or
methods to existing models (created in other modules), or to customize
or reconfigure them (e.g. to change their default sort order):

    class Extension0(models.Model):
    _name = 'extension.0'
    _description = 'Extension zero'
    
    name = fields.Char(default="A")
    
    class Extension1(models.Model):
    _inherit = 'extension.0'
    
    description = fields.Char(default="Extended")

``` python3
record = env['extension.0'].create({})
record.read()[0]
```

will yield:

    {'name': "A", 'description': "Extended"}

<div class="note">

<div class="title">

Note

</div>

It will also yield the various `automatic fields
<reference/fields/automatic>` unless they've been disabled

</div>

### Delegation

The third inheritance mechanism provides more flexibility (it can be
altered at runtime) but less power: using the
`~odoo.models.Model._inherits` a model *delegates* the lookup of any
field not found on the current model to "children" models. The
delegation is performed via `~odoo.fields.Reference` fields
automatically set up on the parent model.

The main difference is in the meaning. When using Delegation, the model
**has one** instead of **is one**, turning the relationship in a
composition instead of inheritance:

    class Screen(models.Model):
        _name = 'delegation.screen'
        _description = 'Screen'
    
        size = fields.Float(string='Screen Size in inches')
    
    class Keyboard(models.Model):
        _name = 'delegation.keyboard'
        _description = 'Keyboard'
    
        layout = fields.Char(string='Layout')
    
    class Laptop(models.Model):
        _name = 'delegation.laptop'
        _description = 'Laptop'
    
        _inherits = {
            'delegation.screen': 'screen_id',
            'delegation.keyboard': 'keyboard_id',
        }
    
        name = fields.Char(string='Name')
        maker = fields.Char(string='Maker')
    
        # a Laptop has a screen
        screen_id = fields.Many2one('delegation.screen', required=True, ondelete="cascade")
        # a Laptop has a keyboard
        keyboard_id = fields.Many2one('delegation.keyboard', required=True, ondelete="cascade")

``` python3
record = env['delegation.laptop'].create({
    'screen_id': env['delegation.screen'].create({'size': 13.0}).id,
    'keyboard_id': env['delegation.keyboard'].create({'layout': 'QWERTY'}).id,
})
record.size
record.layout
```

will result in:

    13.0
    'QWERTY'

and it's possible to write directly on the delegated field:

    record.write({'size': 14.0})

<div class="warning">

<div class="title">

Warning

</div>

when using delegation inheritance, methods are *not* inherited, only
fields

</div>

<div class="warning">

<div class="title">

Warning

</div>

  - <span class="title-ref">\_inherits</span> is more or less
    implemented, avoid it if you can;
  - chained <span class="title-ref">\_inherits</span> is essentially not
    implemented, we cannot guarantee anything on the final behavior.

</div>

### Fields Incremental Definition

A field is defined as class attribute on a model class. If the model is
extended, one can also extend the field definition by redefining a field
with the same name and same type on the subclass. In that case, the
attributes of the field are taken from the parent class and overridden
by the ones given in subclasses.

For instance, the second class below only adds a tooltip on the field
`state`:

    class First(models.Model):
        _name = 'foo'
        state = fields.Selection([...], required=True)
    
    class Second(models.Model):
        _inherit = 'foo'
        state = fields.Selection(help="Blah blah blah")

## Error management

<div class="automodule" data-members="AccessDenied, AccessError, CacheMiss, MissingError, RedirectWarning, UserError, ValidationError">

odoo.exceptions

</div>
