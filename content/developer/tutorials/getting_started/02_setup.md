# Chapter 2: Development environment setup

Depending on the intended use case, there are multiple ways to install
Odoo. For developers of the Odoo community and Odoo employees alike, the
preferred way is to perform a source install (`running Odoo from the
source code`).

## Prepare the environment

First, follow the `contributing/development/setup` section of the
contributing guide to prepare your environment.

<div class="important">

<div class="title">

Important

</div>

The following steps are intended only for Odoo employees. The mentioned
repositories are not accessible to third parties.

</div>

By now, you should have downloaded the source code into two local
repositories, one for <span class="title-ref">odoo/odoo</span> and one
for <span class="title-ref">odoo/enterprise</span>. These repositories
are set up to push changes to pre-defined shared forks on GitHub. This
will prove to be convenient when you start contributing to the codebase,
but for the scope of this tutorial, we want to avoid polluting the
shared repositories with training material. Let's then develop your own
module in a third repository
<span class="title-ref">technical-training-sandbox</span>. Like the
first two repositories, it will be part of the
<span class="title-ref">addons-path</span> that references all
directories containing Odoo modules.

1.  Following the same process as with the
    <span class="title-ref">odoo/odoo</span> and
    <span class="title-ref">odoo/enterprise</span> repositories, visit
    [github.com/odoo/technical-training-sandbox](https://github.com/odoo/technical-training-sandbox)
    and click the `Fork` button to create a fork of the repository under
    your account.

2.  Clone the repository on your machine with:
    
    ``` console
    $ git clone git@github.com:odoo/technical-training-sandbox.git
    ```

3.  Configure the repository to push changes to your fork:
    
    ``` console
    $ cd technical-training-sandbox/
    $ git remote add dev git@github.com:<your_github_account>/technical-training-sandbox.git
    $ git remote set-url --push origin you_should_not_push_on_this_repository
    ```

That's it\! Your environment is now prepared to run Odoo from the
sources, and you have successfully created a repository to serve as an
addons directory. This will allow you to push your work to GitHub.

Now, make a small change in the
<span class="title-ref">technical-training-sandbox</span> repository,
such as updating the `README.md` file. Then, follow the
`contributing/development/first-contribution` section of the
contributing guide to push your changes to GitHub and create a `PR (Pull
Request)`. This will enable you to share your upcoming work and receive
feedback. Adjust the instructions to use the branch
<span class="title-ref">master</span> and the repository
<span class="title-ref">technical-training-sandbox</span>.

To ensure a continuous feedback loop, we recommend pushing a new commit
as soon as you reach a new milestone, such as completing a chapter of
the tutorial.

<div class="note">

<div class="title">

Note

</div>

The specific location of the repositories on your file system is not
crucial. However, for the sake of simplicity, we will assume that you
have cloned all the repositories under the same directory. If this is
not the case, make sure to adjust the following commands accordingly,
providing the appropriate relative path from the
<span class="title-ref">odoo/odoo</span> repository to the
<span class="title-ref">odoo/technical-training-sandbox</span>
repository.

</div>

## Run the server

### Launch with <span class="title-ref">odoo-bin</span>

Once all dependencies are set up, Odoo can be launched by running
<span class="title-ref">odoo-bin</span>, the command-line interface of
the server.

``` console
$ cd $HOME/src/odoo/
$ ./odoo-bin --addons-path="addons/,../enterprise/,../technical-training-sandbox" -d rd-demo
```

There are multiple `command-line arguments <reference/cmdline/server>`
that you can use to run the server. In this training you will only need
some of them.

<div class="option">

\-d \<database\>

The database that is going to be used.

</div>

<div class="option">

\--addons-path \<directories\>

A comma-separated list of directories in which modules are stored. These
directories are scanned for modules.

</div>

<div class="option">

\--limit-time-cpu \<limit\>

Prevent the worker from using more than \<limit\> CPU seconds for each
request.

</div>

<div class="option">

\--limit-time-real \<limit\>

Prevent the worker from taking longer than \<limit\> seconds to process
a request.

</div>

<div class="tip">

<div class="title">

Tip

</div>

\- The `--limit-time-cpu` and `--limit-time-real` arguments can be used
to prevent the worker from being killed when debugging the source code.
- | You may face an error similar to
<span class="title-ref">AttributeError: module '\<MODULE\_NAME\>' has no
attribute '\<$ATTRIBUTE'\></span>. In this case, you may need to
re-install the module with `$ pip
install --upgrade --force-reinstall <MODULE_NAME>`. | If this error
occurs with more than one module, you may need to re-install all the
requirements with `$ pip install --upgrade --force-reinstall -r
requirements.txt`. | You can also clear the python cache to solve the
issue:

``` console
$ cd $HOME/.local/lib/python3.8/site-packages/
$ find -name '*.pyc' -type f -delete
```

  - Other commonly used arguments are:

\- `-i <odoo-bin --init>`: Install some modules before running the
server (comma-separated list). - `-u <odoo-bin --update>`: Update some
modules before running the server (comma-separated list).

</div>

### Log in to Odoo

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

<div class="note">

<div class="title">

Note

</div>

The main page of the Settings screen is only accessible if at least one
application is installed. You will be led into installing your own
application in the next chapter.

</div>

## Extra tools

### Useful Git commands

Here are some useful Git commands for your day-to-day work.

  - Switch branches:  
    When you switch branches, both repositories (odoo and enterprise)
    must be synchronized, i.e. both need to be in the same branch.
    
    ``` console
    $ cd $HOME/src/odoo
    $ git switch {CURRENT_MAJOR_BRANCH}
    
    $ cd $HOME/src/enterprise
    $ git switch {CURRENT_MAJOR_BRANCH}
    ```

  - Fetch and rebase:
    
    ``` console
    $ cd $HOME/src/odoo
    $ git fetch --all --prune
    $ git rebase --autostash odoo/{CURRENT_MAJOR_BRANCH}
    
    $ cd $HOME/src/enterprise
    $ git fetch --all --prune
    $ git rebase --autostash enterprise/{CURRENT_MAJOR_BRANCH}
    ```

### Code Editor

If you are working at Odoo, many of your colleagues are using
[VSCode](https://code.visualstudio.com),
[VSCodium](https://vscodium.com) (the open source equivalent),
[PyCharm](https://www.jetbrains.com/pycharm/download/#section=linux), or
[Sublime Text](https://www.sublimetext.com). However, you are free to
choose your preferred editor.

It is important to configure your linters correctly. Using a linter
helps you by showing syntax and semantic warnings or errors. Odoo source
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

  - Host name/address:
    <span class="title-ref">/var/run/postgresql</span>
  - Port: <span class="title-ref">5432</span>
  - Username: <span class="title-ref">$USER</span>

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

Now that your server is running, it's time to start `writing your own
application
<tutorials/getting_started/03_newapp>`\!
