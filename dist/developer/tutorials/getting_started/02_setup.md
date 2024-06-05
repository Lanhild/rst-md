# Chapter 2: Development environment setup

Depending on the intended use case, there are multiple ways to install
Konvergo ERP. For developers of the Konvergo ERP community and Konvergo ERP employees alike, the
preferred way is to perform a source install
(`running Konvergo ERP from the source code`).

## Prepare the environment

First, follow the `contributing/development/setup` section of the
contributing guide to prepare your environment.

By now, you should have downloaded the source code into two local
repositories, one for <span class="title-ref">odoo/odoo</span> and one
for <span class="title-ref">odoo/enterprise</span>. These repositories
are set up to push changes to pre-defined forks on GitHub. This will
prove to be convenient when you start contributing to the codebase, but
for the scope of this tutorial, we want to avoid polluting them with
training material. Let's then develop your own module in a third
repository <span class="title-ref">odoo/tutorials</span>. Like the first
two repositories, it will be part of the
<span class="title-ref">addons-path</span> that references all
directories containing Konvergo ERP modules. In this repository, we will create
our first module!

> [!NOTE]
> This repository also already contains some bare modules that will be
> used in other tutorials.

1.  Following the same process as with the
    <span class="title-ref">odoo/odoo</span> and
    <span class="title-ref">odoo/enterprise</span> repositories, clone
    the <span class="title-ref">odoo/tutorials</span> repository on your
    machine with:

    ``` console
    $ git clone git@github.com:odoo/tutorials.git
    ```

2.  Configure your fork and Git to push changes to your fork rather than
    to the main codebase. If you work at Konvergo ERP, configure Git to push
    changes to the shared fork created on the account **odoo-dev**.

    <div class="tabs">

    <div class="tab">

    Link Git with your fork

    1.  Visit
        [github.com/odoo/tutorials](https://github.com/odoo/tutorials)
        and click the `Fork` button to create a fork of the repository
        on your account.

    2.  In the command below, replace
        <span class="title-ref">\<your_github_account\></span> with the
        name of the GitHub account on which you created the fork.

        ``` console
        $ cd /TutorialsPath
        $ git remote add dev git@github.com:<your_github_account>/tutorials.git
        ```

    </div>

    <div class="tab">

    Link Git with odoo-dev

    ``` console
    $ cd /tutorials
    $ git remote add dev git@github.com:odoo-dev/tutorials.git
    $ git remote set-url --push origin you_should_not_push_on_this_repository
    ```

    </div>

    </div>

That's it! Your environment is now prepared to run Konvergo ERP from the
sources, and you have successfully created a repository to serve as an
addons directory. This will allow you to push your work to GitHub.

> [!IMPORTANT]
> **For Konvergo ERP employees only:**
>
> 1.  Make sure to read very carefully
>     `contributing/development/first-contribution`. In particular, your
>     branch name must follow our conventions.
>
> 2.  Once you have pushed your first change to the shared fork on
>     **odoo-dev**, create a `PR (Pull Request)`. Please put your
>     quadrigram in the PR title (e.g., "abcd - Technical Training").
>
>     This will enable you to share your upcoming work and receive
>     feedback from your coaches. To ensure a continuous feedback loop,
>     we recommend pushing a new commit as soon as you complete a
>     chapter of the tutorial. Note that the PR is automatically updated
>     with commits you push to **odoo-dev**, you don't need to open
>     multiple PRs.
>
> 3.  At Konvergo ERP we use [Runbot](https://runbot.odoo.com) extensively for
>     our `CI (Continuous
>     Integration)` tests. When you push your changes to **odoo-dev**,
>     Runbot creates a new build and test your code. Once logged in, you
>     will be able to see your branches [Tutorials
>     project](https://runbot.odoo.com/runbot/tutorials-12).

> [!NOTE]
> The specific location of the repositories on your file system is not
> crucial. However, for the sake of simplicity, we will assume that you
> have cloned all the repositories under the same directory. If this is
> not the case, make sure to adjust the following commands accordingly,
> providing the appropriate relative path from the
> <span class="title-ref">odoo/odoo</span> repository to the
> <span class="title-ref">odoo/tutorials</span> repository.

## Run the server

### Launch with <span class="title-ref">odoo-bin</span>

Once all dependencies are set up, Konvergo ERP can be launched by running
<span class="title-ref">odoo-bin</span>, the command-line interface of
the server.

``` console
$ cd $HOME/src/odoo/
$ ./odoo-bin --addons-path="addons/,../enterprise/,../tutorials" -d rd-demo
```

There are multiple `command-line arguments <reference/cmdline/server>`
that you can use to run the server. In this training you will only need
some of them.

<div class="option">

-d \<database\>

The database that is going to be used.

</div>

<div class="option">

--addons-path \<directories\>

A comma-separated list of directories in which modules are stored. These
directories are scanned for modules.

</div>

<div class="option">

--limit-time-cpu \<limit\>

Prevent the worker from using more than \<limit\> CPU seconds for each
request.

</div>

<div class="option">

--limit-time-real \<limit\>

Prevent the worker from taking longer than \<limit\> seconds to process
a request.

</div>

> [!TIP]
> - The `--limit-time-cpu` and `--limit-time-real` arguments can be used
> to prevent the worker from being killed when debugging the source
> code. - \| You may face an error similar to
> <span class="title-ref">AttributeError: module '\<MODULE_NAME\>' has
> no attribute '\<\$ATTRIBUTE'\></span>. In this case, you may need to
> re-install the module with `$ pip
> install --upgrade --force-reinstall <MODULE_NAME>`. \| If this error
> occurs with more than one module, you may need to re-install all the
> requirements with
> `$ pip install --upgrade --force-reinstall -r requirements.txt`. \|
> You can also clear the python cache to solve the issue:
>
> ``` console
> $ cd $HOME/.local/lib/python3.8/site-packages/
> $ find -name '*.pyc' -type f -delete
> ```
>
> - Other commonly used arguments are:
>
> \- `-i <odoo-bin --init>`: Install some modules before running the
> server (comma-separated list). This is equivalent to going to `Apps`
> in the user interface, and installing the module from there. -
> `-u <odoo-bin --update>`: Update some modules before running the
> server (comma-separated list). This is equivalent to going to `Apps`
> in the user interface, selecting a module, and upgrading it from
> there.

> [!NOTE]
> For now you cannot add
> <span class="title-ref">../technical-training-sandbox</span> to your
> <span class="title-ref">addons-path</span> as it is empty and will
> result into an invalid addons-path folder error, but you will have to
> add it back later on !

### Log in to Konvergo ERP

Open <http://localhost:8069/> on your browser. We recommend using
[Chrome](https://www.google.com/intl/en/chrome/),
[Firefox](https://www.mozilla.org/firefox/new/), or any other browser
with development tools.

To log in as the administrator user, use the following credentials:

- email: <span class="title-ref">admin</span>
- password: <span class="title-ref">admin</span>

## Enable the developer mode

The developer or debug mode is useful for training as it gives access to
additional (advanced) tools. In the next chapters, **we will always
assume that you have enabled the developer mode**.

`Enable the developer mode <developer-mode>` now. Choose the method that
you prefer; they are all equivalent.

> [!NOTE]
> The main page of the Settings screen is only accessible if at least
> one application is installed. You will be led into installing your own
> application in the next chapter.

## Extra tools

### Useful Git commands

Here are some useful Git commands for your day-to-day work.

- Switch branches:  
  When you switch branches, both repositories (odoo and enterprise) must
  be synchronized, i.e. both need to be in the same branch.

  ``` console
  $ cd $HOME/src/odoo
  $ git switch {BRANCH}

  $ cd $HOME/src/enterprise
  $ git switch {BRANCH}
  ```

- Fetch and rebase:

  ``` console
  $ cd $HOME/src/odoo
  $ git fetch --all --prune
  $ git rebase --autostash odoo/{BRANCH}

  $ cd $HOME/src/enterprise
  $ git fetch --all --prune
  $ git rebase --autostash enterprise/{BRANCH}
  ```

### Code Editor

If you are working at Konvergo ERP, many of your colleagues are using
[VSCode](https://code.visualstudio.com),
[VSCodium](https://vscodium.com) (the open source equivalent),
[PyCharm](https://www.jetbrains.com/pycharm/download/#section=linux), or
[Sublime Text](https://www.sublimetext.com). However, you are free to
choose your preferred editor.

It is important to configure your linters correctly. Using a linter
helps you by showing syntax and semantic warnings or errors. Konvergo ERP source
code tries to respect Python's and JavaScript's standards, but some of
them can be ignored.

For Python, we use PEP8 with these options ignored:

- \`E501\`: line too long
- \`E301\`: expected 1 blank line, found 0
- \`E302\`: expected 2 blank lines, found 1

For JavaScript, we use ESLint and you can find a [configuration file
example
here](https://github.com/odoo/odoo/wiki/Javascript-coding-guidelines#use-a-linter).

### Administrator tools for PostgreSQL

You can manage your PostgreSQL databases using the command line as
demonstrated earlier or using a GUI application such as
[pgAdmin](https://www.pgadmin.org/download/pgadmin-4-apt/) or
[DBeaver](https://dbeaver.io/).

To connect the GUI application to your database we recommend you connect
using the Unix socket.

- Host name/address: <span class="title-ref">/var/run/postgresql</span>
- Port: <span class="title-ref">5432</span>
- Username: <span class="title-ref">\$USER</span>

### Python Debugging

When facing a bug or trying to understand how the code works, simply
printing things out can go a long way, but a proper debugger can save a
lot of time.

You can use a classic Python library debugger
([pdb](https://docs.python.org/3/library/pdb.html),
[pudb](https://pypi.org/project/pudb/) or
[ipdb](https://pypi.org/project/ipdb/)), or you can use your editor's
debugger.

In the following example we use ipdb, but the process is similar with
other libraries.

1.  Install the library:

    ``` console
    pip install ipdb
    ```

2.  Place a trigger (breakpoint):

    ``` python
    import ipdb; ipdb.set_trace()
    ```

    <div class="example">

    ``` python
    def copy(self, default=None):
        import ipdb; ipdb.set_trace()
        self.ensure_one()
        chosen_name = default.get('name') if default else ''
        new_name = chosen_name or _('%s (copy)') % self.name
        default = dict(default or {}, name=new_name)
        return super(Partner, self).copy(default)
    ```

    </div>

Here is a list of commands:

<div class="option">

h(elp) \[command\]

Print the list of available commands if not argument is supplied. With a
command as an argument, print the help about that command.

</div>

<div class="option">

pp expression

The value of the <span class="title-ref">expression</span> is
pretty-printed using the <span class="title-ref">pprint</span> module.

</div>

<div class="option">

w(here)

Print a stack trace with the most recent frame at the bottom.

</div>

<div class="option">

d(own)

Move the current frame one level down in the stack trace (to a newer
frame).

</div>

<div class="option">

u(p)

Move the current frame one level up in the stack trace (to an older
frame).

</div>

<div class="option">

n(ext)

Continue the execution until the next line in the current function is
reached or it returns.

</div>

<div class="option">

c(ontinue)

Continue the execution and only stop when a breakpoint is encountered.

</div>

<div class="option">

s(tep)

Execute the current line. Stop at the first possible occasion (either in
a function that is called or on the next line in the current function).

</div>

<div class="option">

q(uit)

Quit the debugger. The program being executed is aborted.

</div>

Now that your server is running, it's time to start
`writing your own application
<tutorials/getting_started/03_newapp>`!
