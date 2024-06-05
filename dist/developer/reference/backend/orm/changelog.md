# Changelog

## Konvergo ERP version 16.0

- Translations for translated fields are stored as JSONB values with
  [\#97692](https://github.com/odoo/odoo/pull/97692) and
  [\#101115](https://github.com/odoo/odoo/pull/101115). Code
  translations are no longer stored into the database. They become
  static and are extracted from the PO files when needed.
- `~odoo.models.Model.search_count` takes the `limit` argument into
  account with [\#95589](https://github.com/odoo/odoo/pull/95589). It
  limits the number of records to count, improving performance when a
  partial result is acceptable.

## Konvergo ERP Online version 15.4

- New API for flushing to the database and invalidating the cache with
  [\#87527](https://github.com/odoo/odoo/pull/87527). New methods have
  been added to <span class="title-ref">odoo.models.Model</span> and
  <span class="title-ref">odoo.api.Environment</span>, and are less
  confusing about what is actually done in each case. See the section
  `SQL Execution <reference/orm/sql>`.

## Konvergo ERP Online version 15.3

- The argument <span class="title-ref">args</span> is renamed to
  <span class="title-ref">domain</span> for `~odoo.models.Model.search`,
  `~odoo.models.Model.search_count` and `~odoo.models.Model._search`.
  [\#83687](https://github.com/odoo/odoo/pull/83687)
- `~odoo.models.Model.filtered_domain` conserves the order of the
  current recordset. [\#83687](https://github.com/odoo/odoo/pull/83687)
- `~odoo.models.Model.browse` does not accept `str` as
  <span class="title-ref">ids</span>.
  [\#83687](https://github.com/odoo/odoo/pull/83687)
- The methods `~odoo.models.Model.fields_get_keys` and
  `~odoo.models.Model.get_xml_id` on `~odoo.models.Model` are
  deprecated. [\#83687](https://github.com/odoo/odoo/pull/83687)
- The method `~odoo.models.Model._mapped_cache` is removed.
  [\#83687](https://github.com/odoo/odoo/pull/83687)
- Remove the `limit` attribute of `~odoo.fields.One2many` and
  `~odoo.fields.Many2many`.
  [\#83687](https://github.com/odoo/odoo/pull/83687)

## Konvergo ERP Online version 15.2

- Specific index types on fields: With
  [\#83274](https://github.com/odoo/odoo/pull/83274) and
  [\#83015](https://github.com/odoo/odoo/pull/83015), developers can now
  define what type of indexes can be used on fields by PostgreSQL. See
  the `index property <reference/fields>` of
  <span class="title-ref">odoo.fields.Field</span>.
- The `_sequence` attribute of `~odoo.models.Model` is removed. Konvergo ERP
  lets PostgreSQL use the default sequence of the primary key.
  [\#82727](https://github.com/odoo/odoo/pull/82727)
- The method `~odoo.models.Model._write` does not raise an error for
  non-existing records.
  [\#82727](https://github.com/odoo/odoo/pull/82727)
- The `column_format` and `deprecated` attributes of
  `~odoo.fields.Field` are removed.
  [\#82727](https://github.com/odoo/odoo/pull/82727)
