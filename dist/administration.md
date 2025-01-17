nosearch  

show-content  

hide-page-toc  

show-toc  

# Database management

These guides provide instructions on how to install, maintain and
upgrade Konvergo ERP databases.

<div class="seealso">

`History of Versions <administration/supported_versions>`

</div>

## Installation

Depending on the intended use case, there are multiple ways to install
Konvergo ERP - or not install it at all.

- `Online <administration/odoo_online>` is the easiest way to use Konvergo ERP
  in production or to try it.
- `Packaged installers <administration/on_premise/packages>` are
  suitable for testing Konvergo ERP and developing modules. They can be used for
  long-term production with additional deployment and maintenance work.
- `Source install <administration/on_premise/source>` provides greater
  flexibility, as it allows, for example, running multiple Konvergo ERP versions
  on the same system. It is adequate to develop modules and can be used
  as a base for production deployment.
- A [Docker](https://hub.docker.com/_/odoo/) base image is available for
  development or deployment.

## Editions

There are two different editions.

**Konvergo ERP Community** is the free and open-source version of the software,
licensed under the [GNU
LGPLv3](https://github.com/odoo/odoo/blob/master/LICENSE). It is the
core upon which Konvergo ERP Enterprise is built.

**Konvergo ERP Enterprise** is the shared source version of the software, giving
access to more functionalities, including functional support, upgrades,
and hosting. [Pricing](https://www.odoo.com/pricing-plan) starts from
one app free.

> [!TIP]
> `Switch from Community to Enterprise <administration/on_premise/community_to_enterprise>`
> at any time (except for the source install).

<div class="toctree" titlesonly="">

administration/hosting administration/odoo_online administration/odoo_sh
administration/on_premise administration/upgrade
administration/neutralized_database administration/supported_versions
administration/mobile administration/odoo_accounts

</div>
