# Security in Konvergo ERP

Aside from manually managing access using custom code, Konvergo ERP provides two
main data-driven mechanisms to manage or restrict access to data.

Both mechanisms are linked to specific users through *groups*: a user
belongs to any number of groups, and security mechanisms are associated
to groups, thus applying security mechanisms to users.

<div class="res.groups">

<div class="attribute">

name

serves as user-readable identification for the group (spells out the
role / purpose of the group)

</div>

<div class="attribute">

category_id

The *module category*, serves to associate groups with an Konvergo ERP App (~a
set of related business models) and convert them into an exclusive
selection in the user form.

<div class="todo">

clarify & document special cases & relationship between groups &
categories better

</div>

</div>

<div class="attribute">

implied_ids

Other groups to set on the user alongside this one. This is a
convenience pseudo-inheritance relationship: it's possible to explicitly
remove implied groups from a user without removing the implier.

</div>

<div class="attribute">

comment

Additional notes on the group e.g.

</div>

</div>

## Access Rights

*Grants* access to an entire model for a given set of operations. If no
access rights matches an operation on a model for a user (through their
group), the user doesn't have access.

Access rights are additive, a user's accesses are the union of the
accesses they get through all their groups e.g. given a user who is part
of group A granting read and create access and a group B granting update
access, the user will have all three of create, read, and update.

<div class="ir.model.access">

<div class="attribute">

name

The purpose or role of the group.

</div>

<div class="attribute">

model_id

The model whose access the ACL controls.

</div>

<div class="attribute">

group_id

The `res.groups` to which the accesses are granted, an empty `group_id`
means the ACL is granted to *every user* (non-employees e.g. portal or
public users).

</div>

The `perm_{method}` attributes grant the corresponding CRUD access when
set, they are all unset by default.

<div class="attribute">

perm_create

</div>

<div class="attribute">

perm_read

</div>

<div class="attribute">

perm_write

</div>

<div class="attribute">

perm_unlink

</div>

</div>

## Record Rules

Record rules are *conditions* which must be satisfied in order for an
operation to be allowed. Record rules are evaluated record-by-record,
following access rights.

Record rules are default-allow: if access rights grant access and no
rule applies to the operation and model for the user, the access is
granted.

<div class="ir.rule">

<div class="attribute">

name

The description of the rule.

</div>

<div class="attribute">

model_id

The model to which the rule applies.

</div>

<div class="attribute">

groups

The `res.groups` to which access is granted (or not). Multiple groups
can be specified. If no group is specified, the rule is *global* which
is treated differently than "group" rules (see below).

</div>

<div class="attribute">

global

Computed on the basis of `groups`, provides easy access to the global
status (or not) of the rule.

</div>

<div class="attribute">

domain_force

A predicate specified as a `domain <reference/orm/domains>`, the rule
allows the selected operations if the domain matches the record, and
forbids it otherwise.

The domain is a *python expression* which can use the following
variables:

`time`  
Python's `python:time` module.

`user`  
The current user, as a singleton recordset.

`company_id`  
The current user's currently selected company as a single company id
(not a recordset).

`company_ids`  
All the companies to which the current user has access as a list of
company ids (not a recordset), see `howto/company/security` for more
details.

</div>

The `perm_{method}` have completely different semantics than for
`ir.model.access`: for rules, they specify which operation the rules
applies *for*. If an operation is not selected, then the rule is not
checked for it, as if the rule did not exist.

All operations are selected by default.

<div class="attribute">

perm_create

</div>

<div class="attribute">

perm_read

</div>

<div class="attribute">

perm_write

</div>

<div class="attribute">

perm_unlink

</div>

</div>

### Global rules versus group rules

There is a large difference between global and group rules in how they
compose and combine:

- Global rules *intersect*, if two global rules apply then *both* must
  be satisfied for the access to be granted, this means adding global
  rules always restricts access further.
- Group rules *unify*, if two group rules apply then *either* can be
  satisfied for the access to be granted. This means adding group rules
  can expand access, but not beyond the bounds defined by global rules.
- The global and group rulesets *intersect*, which means the first group
  rule being added to a given global ruleset will restrict access.

<div class="danger">

<div class="title">

Danger

</div>

Creating multiple global rules is risky as it's possible to create
non-overlapping rulesets, which will remove all access.

</div>

## Field Access

An ORM `~odoo.fields.Field` can have a `groups` attribute providing a
list of groups (as a comma-separated string of `external identifiers`).

If the current user is not in one of the listed groups, he will not have
access to the field:

- restricted fields are automatically removed from requested views
- restricted fields are removed from `~odoo.models.Model.fields_get`
  responses
- attempts to (explicitly) read from or write to restricted fields
  results in an access error

<div class="todo">

field access groups apply to the Superuser in fields_get but not in
read/write...

</div>

## Security Pitfalls

As a developer, it is important to understand the security mechanisms
and avoid common mistakes leading to insecure code.

### Unsafe Public Methods

Any public method can be executed via a `RPC call
<api/external_api/calling_methods>` with the chosen parameters. The
methods starting with a `_` are not callable from an action button or
external API.

On public methods, the record on which a method is executed and the
parameters can not be trusted, ACL being only verified during CRUD
operations.

``` python
# this method is public and its arguments can not be trusted
def action_done(self):
    if self.state == "draft" and self.user_has_groups('base.manager'):
        self._set_state("done")

# this method is private and can only be called from other python methods
def _set_state(self, new_state):
    self.sudo().write({"state": new_state})
```

Making a method private is obviously not enough and care must be taken
to use it properly.

### Bypassing the ORM

You should never use the database cursor directly when the ORM can do
the same thing! By doing so you are bypassing all the ORM features,
possibly the automated behaviours like translations, invalidation of
fields, `active`, access rights and so on.

And chances are that you are also making the code harder to read and
probably less secure.

``` python
# very very wrong
self.env.cr.execute('SELECT id FROM auction_lots WHERE auction_id in (' + ','.join(map(str, ids))+') AND state=%s AND obj_price > 0', ('draft',))
auction_lots_ids = [x[0] for x in self.env.cr.fetchall()]

# no injection, but still wrong
self.env.cr.execute('SELECT id FROM auction_lots WHERE auction_id in %s '\
           'AND state=%s AND obj_price > 0', (tuple(ids), 'draft',))
auction_lots_ids = [x[0] for x in self.env.cr.fetchall()]

# better
auction_lots_ids = self.search([('auction_id','in',ids), ('state','=','draft'), ('obj_price','>',0)])
```

#### SQL injections

Care must be taken not to introduce SQL injections vulnerabilities when
using manual SQL queries. The vulnerability is present when user input
is either incorrectly filtered or badly quoted, allowing an attacker to
introduce undesirable clauses to a SQL query (such as circumventing
filters or executing `UPDATE` or `DELETE` commands).

The best way to be safe is to never, NEVER use Python string
concatenation (+) or string parameters interpolation (%) to pass
variables to a SQL query string.

The second reason, which is almost as important, is that it is the job
of the database abstraction layer (psycopg2) to decide how to format
query parameters, not your job! For example psycopg2 knows that when you
pass a list of values it needs to format them as a comma-separated list,
enclosed in parentheses !

``` python
# the following is very bad:
#   - it's a SQL injection vulnerability
#   - it's unreadable
#   - it's not your job to format the list of ids
self.env.cr.execute('SELECT distinct child_id FROM account_account_consol_rel ' +
           'WHERE parent_id IN ('+','.join(map(str, ids))+')')

# better
self.env.cr.execute('SELECT DISTINCT child_id '\
           'FROM account_account_consol_rel '\
           'WHERE parent_id IN %s',
           (tuple(ids),))
```

This is very important, so please be careful also when refactoring, and
most importantly do not copy these patterns!

Here is a memorable example to help you remember what the issue is about
(but do not copy the code there). Before continuing, please be sure to
read the online documentation of pyscopg2 to learn of to use it
properly:

- [The problem with query
  parameters](http://initd.org/psycopg/docs/usage.html#the-problem-with-the-query-parameters)
- [How to pass parameters with
  psycopg2](http://initd.org/psycopg/docs/usage.html#passing-parameters-to-sql-queries)
- [Advanced parameter
  types](http://initd.org/psycopg/docs/usage.html#adaptation-of-python-values-to-sql-types)
- [Psycopg documentation](https://www.psycopg.org/docs/sql.html)

### Unescaped field content

When rendering content using JavaScript and XML, one may be tempted to
use a `t-raw` to display rich-text content. This should be avoided as a
frequent [XSS](https://en.wikipedia.org/wiki/Cross-site_scripting)
vector.

It is very hard to control the integrity of the data from the
computation until the final integration in the browser DOM. A `t-raw`
that is correctly escaped at the time of introduction may no longer be
safe at the next bugfix or refactoring.

``` javascript
QWeb.render('insecure_template', {
    info_message: "You have an <strong>important</strong> notification",
})
```

``` xml
<div t-name="insecure_template">
    <div id="information-bar"><t t-raw="info_message" /></div>
</div>
```

The above code may feel safe as the message content is controlled but is
a bad practice that may lead to unexpected security vulnerabilities once
this code evolves in the future.

``` javascript
// XSS possible with unescaped user provided content !
QWeb.render('insecure_template', {
    info_message: "You have an <strong>important</strong> notification on " \
        + "the product <strong>" + product.name + "</strong>",
})
```

While formatting the template differently would prevent such
vulnerabilities.

``` javascript
QWeb.render('secure_template', {
    message: "You have an important notification on the product:",
    subject: product.name
})
```

``` xml
<div t-name="secure_template">
    <div id="information-bar">
        <div class="info"><t t-esc="message" /></div>
        <div class="subject"><t t-esc="subject" /></div>
    </div>
</div>
```

``` css
.subject {
    font-weight: bold;
}
```

### Escaping vs Sanitizing

> [!IMPORTANT]
> Escaping is always 100% mandatory when you mix data and code, no
> matter how safe the data

**Escaping** converts *TEXT* to *CODE*. It is absolutely mandatory to do
it every time you mix *DATA/TEXT* with *CODE* (e.g. generating HTML or
python code to be evaluated inside a
<span class="title-ref">safe_eval</span>), because *CODE* always
requires *TEXT* to be encoded. It is critical for security, but it's
also a question of correctness. Even when there is no security risk
(because the text is 100% guarantee to be safe or trusted), it is still
required (e.g. to avoid breaking the layout in generated HTML).

Escaping will never break any feature, as long as the developer
identifies which variable contains *TEXT* and which contains *CODE*.

``` python
>>> from odoo.tools import html_escape, html_sanitize
>>> data = "<R&D>" # `data` is some TEXT coming from somewhere

# Escaping turns it into CODE, good!
>>> code = html_escape(data)
>>> code
'&lt;R&amp;D&gt;'

# Now you can mix it with other code...
>>> self.message_post(body="<strong>%s</strong>" % code)
```

**Sanitizing** converts *CODE* to *SAFER CODE* (but not necessary *safe*
code). It does not work on *TEXT*. Sanitizing is only necessary when
*CODE* is untrusted, because it comes in full or in part from some
user-provided data. If the user-provided data is in the form of *TEXT*
(e.g. the content from a form filled by a user), and if that data was
correctly escaped before putting it in *CODE*, then sanitizing is
useless (but can still be done). If however, the user-provided data was
**not escaped**, then sanitizing will **not** work as expected.

``` python
# Sanitizing without escaping is BROKEN: data is corrupted!
>>> html_sanitize(data)
''

# Sanitizing *after* escaping is OK!
>>> html_sanitize(code)
'<p>&lt;R&amp;D&gt;</p>'
```

Sanitizing can break features, depending on whether the *CODE* is
expected to contain patterns that are not safe. That's why
<span class="title-ref">fields.Html</span> and
<span class="title-ref">tools.html_sanitize()</span> have options to
fine-tune the level of sanitization for styles, etc. Those options have
to be carefully considered depending on where the data comes from, and
the desired features. The sanitization safety is balanced against
sanitization breakages: the safer the sanitisation the more likely it is
to break things.

``` python
>>code = "<p class='text-warning'>Important Information</p>"
# this will remove the style, which may break features
# but is necessary if the source is untrusted
>> html_sanitize(code, strip_classes=True)
'<p>Important Information</p>'
```

### Evaluating content

Some may want to `eval` to parse user provided content. Using `eval`
should be avoided at all cost. A safer, sandboxed, method
`~odoo.tools.safe_eval` can be used instead but still gives tremendous
capabilities to the user running it and must be reserved for trusted
privileged users only as it breaks the barrier between code and data.

``` python
# very bad
domain = eval(self.filter_domain)
return self.search(domain)

# better but still not recommended
from odoo.tools import safe_eval
domain = safe_eval(self.filter_domain)
return self.search(domain)

# good
from ast import literal_eval
domain = literal_eval(self.filter_domain)
return self.search(domain)
```

Parsing content does not need `eval`

| Language   | Data type          | Suitable parser                  |
|------------|--------------------|----------------------------------|
| Python     | int, float, etc.   | int(), float()                   |
| Javascript | int, float, etc.   | parseInt(), parseFloat()         |
| Python     | dict               | json.loads(), ast.literal_eval() |
| Javascript | object, list, etc. | JSON.parse()                     |

### Accessing object attributes

If the values of a record needs to be retrieved or modified dynamically,
one may want to use the `getattr` and `setattr` methods.

``` python
# unsafe retrieval of a field value
def _get_state_value(self, res_id, state_field):
    record = self.sudo().browse(res_id)
    return getattr(record, state_field, False)
```

This code is however not safe as it allows to access any property of the
record, including private attributes or methods.

The `__getitem__` of a recordset has been defined and accessing a
dynamic field value can be easily achieved safely:

``` python
# better retrieval of a field value
def _get_state_value(self, res_id, state_field):
    record = self.sudo().browse(res_id)
    return record[state_field]
```

The above method is obviously still too optimistic and additional
verifications on the record id and field value must be done.
