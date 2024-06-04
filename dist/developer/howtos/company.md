# Multi-company Guidelines

> [!WARNING]
> This tutorial requires good knowledge of Odoo. Please refer to the
> `../tutorials/getting_started` tutorial first if needed.

As of version 13.0, a user can be logged in to multiple companies at
once. This allows the user to access information from multiple
companies, but also to create/edit records in a multi-company
environment.

If not managed correctly, it may be the source of a lot of inconsistent
multi-company behaviors. For instance, a user logged in to both
companies A and B could create a sales order in company A and add
products belonging to company B to it. It is only when the user logs out
from company B that access errors will occur for the sales order.

To correctly manage multi-company behaviors, Odoo's ORM provides
multiple features:

- `Company-dependent fields <howto/company/company_dependent>`
- `Multi-company consistency <howto/company/check_company>`
- `Default company <howto/company/default_company>`
- `Views <howto/company/views>`
- `Security rules <howto/company/security>`

## Company-dependent fields

When a record is available from multiple companies, we must expect that
different values will be assigned to a given field depending on the
company from which the value is set.

For the field of the same record to support several values, it must be
defined with the attribute
<span class="title-ref">company_dependent</span> set to
<span class="title-ref">True</span>.

``` python
from odoo import api, fields, models

class Record(models.Model):
    _name = 'record.public'

    info = fields.Text()
    company_info = fields.Text(company_dependent=True)
    display_info = fields.Text(string='Infos', compute='_compute_display_info')

    @api.depends_context('company')
    def _compute_display_info(self):
        for record in self:
            record.display_info = record.info + record.company_info
```

> [!NOTE]
> The <span class="title-ref">\_compute_display_info</span> method is
> decorated with
> <span class="title-ref">depends_context('company')</span> (see
> `~odoo.api.depends_context`) to ensure that the computed field is
> recomputed depending on the current company
> (<span class="title-ref">self.env.company</span>).

When a company-dependent field is read, the current company is used to
retrieve its value. In other words, if a user is logged in to companies
A and B with A as the main company and creates a record for company B,
the value of company-dependent fields will be that of company A.

To read the values of company-dependent fields set by another company
than the current one, we need to ensure the company we are using is the
correct one. This can be done with `~odoo.models.Model.with_company`,
which updates the current company.

``` python
# Accessed as the main company (self.env.company)
val = record.company_dependent_field

# Accessed as the desired company (company_B)
val = record.with_company(company_B).company_dependent_field
# record.with_company(company_B).env.company == company_B
```

> [!WARNING]
> Whenever you are computing/creating/... things that may behave
> differently in different companies, you should make sure whatever you
> are doing is done in the right company. It doesn't cost much to always
> use <span class="title-ref">with_company</span> to avoid problems
> later.
>
> ``` python
> @api.onchange('field_name')
> def _onchange_field_name(self):
>  self = self.with_company(self.company_id)
>  ...
>
> @api.depends('field_2')
> def _compute_field_3(self):
>  for record in self:
>    record = record.with_company(record.company_id)
>    ...
> ```

## Multi-company consistency

When a record is made shareable between several companies by the means
of a <span class="title-ref">company_id</span> field, we must take care
that it cannot be linked to the record of another company through a
relational field. For instance, we do not want to have a sales order and
its invoice belonging to different companies.

To ensure this multi-company consistency, you must:

- Set the class attribute
  <span class="title-ref">\_check_company_auto</span> to
  <span class="title-ref">True</span>.
- Define relational fields with the attribute
  <span class="title-ref">check_company</span> set to
  <span class="title-ref">True</span> if their model has a
  <span class="title-ref">company_id</span> field.

On each `~odoo.models.Model.create` and `~odoo.models.Model.write`,
automatic checks will be triggered to ensure the multi-company
consistency of the record.

``` python
from odoo import fields, models

class Record(models.Model):
    _name = 'record.shareable'
    _check_company_auto = True

    company_id = fields.Many2one('res.company')
    other_record_id = fields.Many2one('other.record', check_company=True)
```

> [!NOTE]
> The field <span class="title-ref">company_id</span> must not be
> defined with <span class="title-ref">check_company=True</span>.

<div class="currentmodule">

odoo.models

</div>

<div class="automethod">

Model.\_check_company

</div>

> [!WARNING]
> The <span class="title-ref">check_company</span> feature performs a
> strict check! It means that if a record has no
> <span class="title-ref">company_id</span> (i.e., the field is not
> required), it cannot be linked to a record whose
> <span class="title-ref">company_id</span> is set.

> [!NOTE]
> When no domain is defined on the field and
> <span class="title-ref">check_company</span> is set to
> <span class="title-ref">True</span>, a default domain is added:
> <span class="title-ref">\['\|', '('company_id', '=', False),
> ('company_id', '=', company_id)\]</span>

## Default company

When the field <span class="title-ref">company_id</span> is made
required on a model, a good practice is to set a default company. It
eases the setup flow for the user or even guarantees its validity when
the company is hidden from view. Indeed, the company is usually hidden
if the user does not have access to multiple companies (i.e., when the
user does not have the group
<span class="title-ref">base.group_multi_company</span>).

``` python
from odoo import api, fields, models

class Record(models.Model):
    _name = 'record.restricted'
    _check_company_auto = True

    company_id = fields.Many2one(
        'res.company', required=True, default=lambda self: self.env.company
    )
    other_record_id = fields.Many2one('other.record', check_company=True)
```

## Views

As stated in `above <howto/company/default_company>`, the company is
usually hidden from view if the user does not have access to multiple
companies. This is assessed with the group
<span class="title-ref">base.group_multi_company</span>.

``` xml
<record model="ir.ui.view" id="record_form_view">
    <field name="name">record.restricted.form</field>
    <field name="model">record.restricted</field>
    <field name="arch" type="xml">
        <form>
            <sheet>
                <group>
                    <group>
                        <field name="company_id" groups="base.group_multi_company"/>
                        <field name="other_record_id"/>
                    </group>
                </group>
            </sheet>
        </form>
    </field>
</record>
```

## Security rules

When working with records shared across companies or restricted to a
single company, we must take care that a user does not have access to
records belonging to other companies.

This is achieved with security rules based on
<span class="title-ref">company_ids</span>, which contain the current
companies of the user (the companies the user checked in the
multi-company widget).

``` xml
<!-- Shareable Records -->
<record model="ir.rule" id="record_shared_company_rule">
    <field name="name">Shared Record: multi-company</field>
    <field name="model_id" ref="model_record_shared"/>
    <field name="global" eval="True"/>
    <field name="domain_force">
        ['|', ('company_id', '=', False), ('company_id', 'in', company_ids)]
    </field>
</record>
```

``` xml
<!-- Company-restricted Records -->
<record model="ir.rule" id="record_restricted_company_rule">
    <field name="name">Restricted Record: multi-company</field>
    <field name="model_id" ref="model_record_restricted"/>
    <field name="global" eval="True"/>
    <field name="domain_force">
        [('company_id', 'in', company_ids)]
    </field>
</record>
```

<div class="todo">

check_company on company_dependent fields.

</div>
