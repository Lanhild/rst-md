# Safeguard your code with unit tests

<div class="important">

<div class="title">

Important

</div>

This tutorial is an extension of the `getting_started` tutorial. Make
sure you have completed it and use the
<span class="title-ref">estate</span> module you have built as a base
for the exercises in this tutorial.

</div>

**Reference**: [Odoo's Test Framework: Learn Best
Practices](https://www.youtube.com/watch?v=JEIscps0OOQ) (Odoo Experience
2020) on YouTube.

Writing tests is a necessity for multiple reasons. Here is a
non-exhaustive list:

  - Ensure it will not be broken in the future
  - Define the scope of your code
  - Give examples of use cases
  - It is one way to technically document the code
  - Help you develop by defining your goal before working towards it

## Running Tests

Before knowing how to write tests, we need to know how to run them.

``` console
$ odoo-bin -h
Usage: odoo-bin [options]

Options:
--version             show program's version number and exit
-h, --help            show this help message and exit

[...]

Testing Configuration:
  --test-file=TEST_FILE
                      Launch a python test file.
  --test-enable       Enable unit tests.
  --test-tags=TEST_TAGS
                      Comma-separated list of specs to filter which tests to
                      execute. Enable unit tests if set. A filter spec has
                      the format: [-][tag][/module][:class][.method] The '-'
                      specifies if we want to include or exclude tests
                      matching this spec. The tag will match tags added on a
                      class with a @tagged decorator (all Test classes have
                      'standard' and 'at_install' tags until explicitly
                      removed, see the decorator documentation). '*' will
                      match all tags. If tag is omitted on include mode, its
                      value is 'standard'. If tag is omitted on exclude
                      mode, its value is '*'. The module, class, and method
                      will respectively match the module name, test class
                      name and test method name. Example: --test-tags
                      :TestClass.test_func,/test_module,external  Filtering
                      and executing the tests happens twice: right after
                      each module installation/update and at the end of the
                      modules loading. At each stage tests are filtered by
                      --test-tags specs and additionally by dynamic specs
                      'at_install' and 'post_install' correspondingly.
  --screencasts=DIR   Screencasts will go in DIR/{db_name}/screencasts.
  --screenshots=DIR   Screenshots will go in DIR/{db_name}/screenshots.
                      Defaults to /tmp/odoo_tests.

$ # run all the tests of account, and modules installed by account
$ # the dependencies already installed are not tested
$ # this takes some time because you need to install the modules, but at_install
$ # and post_install are respected
$ odoo-bin -i account --test-enable
$ # run all the tests in this file
$ odoo-bin --test-file=addons/account/tests/test_account_move_entry.py
$ # test tags can help you filter quite easily
$ odoo-bin --test-tags=/account:TestAccountMove.test_custom_currency_on_account_1
```

## Integration Bots

<div class="note">

<div class="title">

Note

</div>

This section is only for Odoo employees and people that are contributing
to <span class="title-ref">github.com/odoo</span>. We highly recommend
having your own CI if it is not the case.

</div>

When a test is written, it is important to make sure it always passes
when modifications are applied to the source code. To automate this
task, we use a development practice called Continuous Integration (CI).
This is why we have some bots running all the tests at different
moments. Whether you are working at Odoo or not, if you are trying to
merge something inside <span class="title-ref">odoo/odoo</span>,
<span class="title-ref">odoo/enterprise</span>,
<span class="title-ref">odoo/upgrade</span> or on odoo.sh, you will have
to go through the CI. If you are working on another project, you should
think of adding your own CI.

### Runbot

**Reference**: the documentation related to this topic can be found in
[Runbot FAQ](https://runbot.odoo.com/doc).

Most of the tests are run on [Runbot](https://runbot.odoo.com) every
time a commit is pushed on GitHub.

You can see the state of a commit/branch by filtering on the runbot
dashboard.

A **bundle** is created for each branch. A bundle consists of a
configuration and contains the batches.

A **batch** is a set of builds, depending on the parameters of the
bundle. A batch is green (i.e. passes the tests) if all the builds are
green.

A **build** is when we launch a server. It can be divided in sub-builds.
Usually there are builds for the community version, the enterprise
version (only if there is an enterprise branch but you can force the
build), and the migration of the branch. A build is green if every
sub-build is green.

A **sub-build** only does some parts of what a full build does. It is
used to speed up the CI process. Generally it is used to split the post
install tests in 4 parallel instances. A sub-build is green if all the
tests are passing and there are no errors/warnings logged.

<div class="note">

<div class="title">

Note

</div>

\* All tests are run whatever the modifications done. Correcting a typo
in an error message or refactoring a whole module triggers the same
tests. It will install all the modules. This means something might not
work if Runbot green but your changes depend on something you don't
depend on. \* The localization modules (i.e. country-specific modules)
are not installed on Runbot (except the generic one), some modules with
external dependencies can be excluded also. \* There is a nightly build
running additional tests, like module operations, localization, single
module installs, multi-builds for nondeterministic bugs, etc. These are
not kept in the standard CI to shorten the time of execution.

</div>

You can also login on a build built by Runbot. There are 3 users usable:
<span class="title-ref">admin</span>,
<span class="title-ref">demo</span> and
<span class="title-ref">portal</span>. The password is the same as the
login. This is useful to quickly test things on different versions
without having to build it locally. The full logs are also available;
these are used for monitoring.

### Robodoo

You will most likely have to gain a little bit more experience before
having the rights to summon robodoo, but here are a few remarks anyways.

Robodoo is the guy spamming the CI status as tags on your PRs, but he is
also the guy that kindly integrates your commits on the main
repositories.

When the last batch is green, the reviewer can ask robodoo to merge your
PR (actually it is more a <span class="title-ref">rebase</span> than a
<span class="title-ref">merge</span>). It will then go to the mergebot.

### Mergebot

[Mergebot](https://mergebot.odoo.com) is the last testing phase before
merging a PR.

It will take the commits in your branch not yet present on the target,
stage it and rerun the tests one more time, including the enterprise
version even if you are only changing something in community.

This step can fail with a <span class="title-ref">Staging failed</span>
error message. This could be due to

  - a nondeterministic bug that is already on the target. If you are an
    Odoo employee, you can check those here:
    <https://runbot.odoo.com/runbot/errors>
  - a nondeterministic bug that you introduced but wasn't detected in
    the CI before
  - an incompatibility with another commit merged right before and what
    you are trying to merge
  - an incompatibility with the enterprise repository if you only did
    changes in the community repo

Always check that the issue does not come from you before asking the
merge bot to retry: rebase your branch on the target and rerun the tests
locally.

## Modules

Because Odoo is modular, the tests need to be also modular. This means
tests are defined in the module that adds the functionality you are
adding in, and tests cannot depend on functionality coming from modules
your module doesn't depend on.

**Reference**: the documentation related to this topic can be found in
`Special Tags<reference/testing/tags>`.

``` python
from odoo.tests.common import SavepointCase
from odoo.tests import tagged

# The CI will run these tests after all the modules are installed,
# not right after installing the one defining it.
@tagged('post_install', '-at_install')  # add `post_install` and remove `at_install`
class PostInstallTestCase(SavepointCase):
    def test_01(self):
        ...

@tagged('at_install')  # this is the default
class AtInstallTestCase(SavepointCase):
    def test_01(self):
        ...
```

If the behavior you want to test can be changed by the installation of
another module, you need to ensure that the tag
<span class="title-ref">at\_install</span> is set; otherwise, you can
use the tag <span class="title-ref">post\_install</span> to speed up the
CI and ensure it is not changed if it shouldn't.

## Writing a test

**Reference**: the documentation related to this topic can be found in
[Python unittest](https://docs.python.org/3/library/unittest.html) and
`Testing Odoo<reference/testing>`.

Here are a few things to take into consideration before writing a test

  - The tests should be independent of the data currently in the
    database (including demo data)
  - Tests should not impact the database by leaving/changing residual
    data. This is usually done by the test framework by doing a
    rollback. Therefore, you must never call `cr.commit` in a test (nor
    anywhere else in the business code).
  - For a bug fix, the test should fail before applying the fix and pass
    after.
  - Don't test something that is already tested elsewhere; you can trust
    the ORM. Most of the tests in business modules should only test the
    business flows.
  - You shouldn't need to flush data into the database.

<div class="note">

<div class="title">

Note

</div>

Remember that `onchange` only applies in the Form views, not by changing
the attributes in python. This also applies in the tests. If you want to
emulate a Form view, you can use `odoo.tests.common.Form`.

</div>

The tests should be in a `tests` folder at the root of your module. Each
test file name should start with <span class="title-ref">test\_</span>
and be imported in the `__init__.py` of the test folder. You shouldn't
import the test folder/module in the `__init__.py` of the module.

``` bash
estate
├── models
│   ├── *.py
│   └── __init__.py
├── tests
│   ├── test_*.py
│   └── __init__.py
├── __init__.py
└── __manifest__.py
```

<div class="note">

<div class="title">

Note

</div>

Some older tests are extending `odoo.tests.common.TransactionCase`, but
they are less scalable. The difference is that the setup is done per
test method and not per test class. The data changed are rollbacked
between each test in <span class="title-ref">SavepointCase</span> to
have the same behavior as in
<span class="title-ref">TransactionCase</span>.

</div>

All the tests should extend `odoo.tests.common.SavepointCase`. You
usually define a `setUpClass`, and the tests. After doing the
<span class="title-ref">setUpClass</span>, you have an
<span class="title-ref">env</span> available on the class and can start
interacting with the ORM.

These test classes are built on top of the `unittest` python module.

``` python
from odoo.tests.common import SavepointCase
from odoo.exceptions import UserError
from odoo.tests import tagged

# The CI will run these tests after all the modules are installed,
# not right after installing the one defining it.
@tagged('post_install', '-at_install')
class EstateTestCase(SavepointCase):

    @classmethod
    def setUpClass(cls):
        # add env on cls and many other things
        super(EstateTestCase, cls).setUpClass()

        # create the data for each tests. By doing it in the setUpClass instead
        # of in a setUp or in each test case, we reduce the testing time and
        # the duplication of code.
        cls.properties = cls.env['estate.property'].create([...])

    def test_creation_area(self):
        """Test that the total_area is computed like it should."""
        self.properties.living_area = 20
        self.assertRecordValues(self.properties, [
           {'name': ..., 'total_area': ...},
           {'name': ..., 'total_area': ...},
        ])


    def test_action_sell(self):
        """Test that everything behaves like it should when selling a property."""
        self.properties.action_sold()
        self.assertRecordValues(self.properties, [
           {'name': ..., 'state': ...},
           {'name': ..., 'state': ...},
        ])

        with self.assertRaises(UserError):
            self.properties.forbidden_action_on_sold_property()
```

<div class="note">

<div class="title">

Note

</div>

For better readability, split your tests into multiple files depending
on the scope of the tests. You can also have a Common class that most of
the tests should inherit from; this common class can define the whole
setup for the module. For instance, in
[account](%7BGITHUB_PATH%7D/addons/account/tests/common.py).

</div>

<div class="exercise">

Ensure no one can create an offer for a sold Property, and create a test
for it.

</div>

<div class="exercise">

Someone keeps breaking the reset of Garden Area and Orientation when you
uncheck the Garden checkbox. Make sure it doesn't happen again.

<div class="tip">

<div class="title">

Tip

</div>

Tip: remember the note about <span class="title-ref">Form</span> a
little bit above.

</div>

</div>
