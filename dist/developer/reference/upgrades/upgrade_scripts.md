# Upgrade scripts

An upgrade script is a Python file containing a function called
`migrate`, which the upgrade process invokes during the update of a
module.

<div class="method">

migrate(cr, version)

param cr  
current database cursor

type cr  
`~odoo.sql_db.Cursor`

param str version  
installed version of the module

</div>

Typically, this function executes one or multiple SQL queries and can
also access Odoo's ORM, as well as the `./upgrade_utils`.

## Writing upgrade scripts

Upgrade scripts follow a specific tree structure with a naming
convention which determines when they are executed.

The structure of an upgrade script path is
`$module/migrations/$version/{pre,post,end}-*.py`, where
<span class="title-ref">\$module</span> is the module for which the
script will run, <span class="title-ref">\$version</span> is the full
version of the module (including Odoo's major version and the module's
minor version) and <span class="title-ref">{pre\|post\|end}-\*.py</span>
is the file that needs to be executed. The file's name will determine
the `phase
<upgrade-scripts/phases>` and order in which it is executed for that
module and version.

> [!NOTE]
> From Odoo 13 the top-level directory for the upgrade scripts can also
> be named <span class="title-ref">upgrades</span>. This naming is
> preferred since it has the correct meaning: *migrate* can be confused
> with *moving out of Odoo*. Thus `$module/upgrades/$version/` is also
> valid.

> [!NOTE]
> Upgrade scripts are only executed when the module is being updated.
> Therefore, the module's minor version set in the
> <span class="title-ref">\$version</span> directory needs to be higher
> than the module's installed version and equal or lower to the updated
> version of the module.

<div class="example">

Directory structure of an upgrade script for a custom module named
<span class="title-ref">awesome_partner</span> upgraded to version
<span class="title-ref">2.0</span> on Odoo 17.

``` text
awesome_partner/
|-- migrations/
|   |-- 17.0.2.0/
|   |   |-- pre-exclamation.py
```

Two upgrade scripts examples with the content of the
`pre-exclamation.py`, file adding "!" at the end of partners' names:

``` python
import logging

_logger = logging.getLogger(__name__)


def migrate(cr, version):
    cr.execute("UPDATE res_partner SET name = name || '!'")
    _logger.info("Updated %s partners", cr.rowcount)
```

``` python
import logging
from odoo.upgrade import util

_logger = logging.getLogger(__name__)


def migrate(cr, version):
    env = util.env(cr)

    partners = env["res.partner"].search([])
    for partner in partners:
        partner.name += "!"

    _logger.info("Updated %s partners", len(partners))
```

Note that in the second example, the script takes advantage of the
`./upgrade_utils` to access the ORM. Check the documentation to find out
more about this library.

</div>

## Phases of upgrade scripts

The upgrade process consists of three phases for each version of each
module:

> 1.  The pre-phase, before the module is loaded.
> 2.  The post-phase, after the module and its dependencies are loaded
>     and updated.
> 3.  The end-phase, after all modules have been loaded and updated for
>     that version.

Upgrade scripts are grouped according to the first part of their
filenames into the corresponding phase. Within each phase, the files are
executed according to their lexical order.

<div class="admonition">

Execution order of example scripts for one module in one version

1.  `pre-10-do_something.py`
2.  `pre-20-something_else.py`
3.  `post-do_something.py`
4.  `post-something.py`
5.  `end-01-migrate.py`
6.  `end-migrate.py`

</div>
