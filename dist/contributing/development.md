show-content  

# Development

<div class="toctree" titlesonly="">

development/coding_guidelines development/git_guidelines

</div>

If you are reading this, chances are that you are interested in learning
how to contribute to the codebase of Odoo. Whether that's the case or
you landed here by accident, we've got you covered!

<div class="seealso">

`Discover other ways to contribute to Odoo <../contributing>`

</div>

When you feel ready, jump to the `contributing/development/setup`
section to begin your journey in contributing to the development of
Odoo.

## Environment setup

The instructions below help you prepare your environment for making
local changes to the codebase and then push them to GitHub. Skip this
section and go to `contributing/development/first-contribution` if you
have already completed this step.

1.  First, you need to [create a GitHub
    account](https://github.com/join). Odoo uses GitHub to manage the
    source code of its products, and this is where you will make your
    changes and submit them for review.

2.  [Generate a new SSH key and register it on your GitHub
    account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

3.  Go to [github.com/odoo/odoo](https://github.com/odoo/odoo) and click
    on the `Fork` button in the top right corner to create a fork
    (`your own copy`) of the repository on your account. Do the same
    with
    [github.com/odoo/enterprise](https://github.com/odoo/enterprise) if
    you have access to it. This creates a copy of the codebase to which
    you can make changes without affecting the main codebase. Skip this
    step if you work at Odoo.

4.  [Install
    Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
    It is a command-line (`a text interface`) tool that allows tracking
    the history of changes made to a file and, more importantly, working
    on different versions of that file simultaneously. It means you do
    not need to worry about overwriting someone else’s pending work when
    making changes.

    Verify that the installation directory of Git is included in your
    system's <span class="title-ref">PATH</span> variable.

    <div class="tabs">

    <div class="group-tab">

    Linux and macOS

    Follow the [guide to update the PATH variable on Linux and
    macOS](https://unix.stackexchange.com/a/26059) with the installation
    path of Git (by default `/usr/bin/git`).

    </div>

    <div class="group-tab">

    Windows

    Follow the [guide to update the PATH variable on
    Windows](https://www.howtogeek.com/118594/how-to-edit-your-system-path-for-easy-command-line-access/)
    with the installation path of Git (by default
    `C:\\Program Files\\Git`).

    </div>

    </div>

5.  Configure Git to identify yourself as the author of your future
    contributions. Enter the same email address you used to register on
    GitHub.

    ``` console
    $ git config --global user.name “Your Name”
    $ git config --global user.email “youremail@example.com”
    ```

6.  `Install Odoo from the sources <../administration/on_premise/source>`.
    Make sure to fetch the sources through Git with SSH.

7.  Configure Git to push changes to your fork(s) rather than to the
    main codebase. If you work at Odoo, configure Git to push changes to
    the shared forks created on the account **odoo-dev**.

    <div class="tabs">

    <div class="tab">

    Link Git with your fork(s)

    In the command below, replace
    <span class="title-ref">\<your_github_account\></span> with the name
    of the GitHub account on which you created the fork(s).

    ``` console
    $ cd /CommunityPath
    $ git remote add dev git@github.com:<your_github_account>/odoo.git
    ```

    If you have access to
    <span class="title-ref">odoo/enterprise</span>, configure the
    related remote too.

    ``` console
    $ cd /EnterprisePath
    $ git remote add dev git@github.com:<your_github_account>/enterprise.git
    ```

    </div>

    <div class="tab">

    Link Git with odoo-dev

    ``` console
    $ cd /CommunityPath
    $ git remote add dev git@github.com:odoo-dev/odoo.git
    $ git remote set-url --push origin you_should_not_push_on_this_repository

    $ cd /EnterprisePath
    $ git remote add dev git@github.com:odoo-dev/enterprise.git
    $ git remote set-url --push origin you_should_not_push_on_this_repository
    ```

    </div>

    </div>

8.  That's it! You are ready to `make your first contribution
    <contributing/development/first-contribution>`.

## Make your first contribution

> [!IMPORTANT]
> - Odoo development can be challenging for beginners. We recommend you
> to be knowledgeable enough to code a small module before contributing.
> If that is not the case, take some time to go through the
> `developer tutorials </developer/howtos>` to fill in the gaps. - Some
> steps of this guide require to be comfortable with Git. Here are some
> [tutorials](https://www.atlassian.com/git/tutorials) and an
> [interactive training](https://learngitbranching.js.org/) if you are
> stuck at some point.

Now that your environment is set up, you can start contributing to the
codebase. In a terminal, navigate to the directory where you installed
Odoo from sources and follow the guide below.

1.  Choose the version of Odoo to which you want to make changes. Keep
    in mind that contributions targeting an
    `unsupported version of Odoo </administration/supported_versions>`
    are not accepted. This guide assumes that the changes target Odoo
    {CURRENT_VERSION}, which corresponds to branch
    <span class="title-ref">{CURRENT_BRANCH}</span>.

2.  Create a new branch starting from branch {CURRENT_BRANCH}. Prefix
    the branch name with the base branch:
    <span class="title-ref">{CURRENT_BRANCH}-...</span>. If you work at
    Odoo, suffix the branch name with your Odoo handle:
    <span class="title-ref">{CURRENT_BRANCH}-...-xyz</span>.

    <div class="example">

    ``` console
    $ git switch -c {CURRENT_BRANCH}-fix-invoices
    ```

    ``` console
    $ git switch -c {CURRENT_BRANCH}-fix-invoices-xyz
    ```

    </div>

3.  [Sign the Odoo CLA](%7BGITHUB_PATH%7D/doc/cla/sign-cla.md) if not
    already done. Skip this step if you work at Odoo.

4.  Make the desired changes to the codebase. When working on the
    codebase, follow these rules:

    - Keep your changes focused and specific. It is best to work on one
      particular feature or bug fix at a time rather than tackle
      multiple unrelated changes simultaneously.
    - Respect the [stable
      policy](https://github.com/odoo/odoo/wiki/Contributing#what-does-stable-mean)
      when working in another branch than
      <span class="title-ref">master</span>.
    - Follow the `coding guidelines <development/coding_guidelines>`.
    - Test your changes thoroughly and
      `write tests </developer/reference/backend/testing>` to ensure
      that everything is working as expected and that there are no
      regressions or unintended consequences.

5.  Commit your changes. Write a clear commit message as instructed in
    the `Git guidelines
    <development/git_guidelines>`.

    ``` console
    $ git add .
    $ git commit
    ```

6.  Push your change to your fork, for which we added the remote alias
    <span class="title-ref">dev</span>.

    <div class="example">

    ``` console
    $ git push -u dev {CURRENT_BRANCH}-fix-invoices-xyz
    ```

    </div>

7.  Open a `PR (Pull Request)` on GitHub to submit your changes for
    review.

    1.  Go to the [compare page of the odoo/odoo
        codebase](https://github.com/odoo/odoo/compare), or the [compare
        page of the odoo/enterprise
        codebase](https://github.com/odoo/enterprise/compare), depending
        on which codebase your changes target.
    2.  Select **{CURRENT_BRANCH}** for the base.
    3.  Click on `compare across forks`.
    4.  Select **\<your_github_account\>/odoo** or
        **\<your_github_account\>/enterprise** for the head repository.
        Replace <span class="title-ref">\<your_github_account\></span>
        with the name of the GitHub account on which you created the
        fork or by **odoo-dev** if you work at Odoo.
    5.  Review your changes and click on the `Create pull request`
        button.
    6.  Tick the `Allow edits from maintainer` checkbox. Skip this step
        if you work at Odoo.
    7.  Complete the description and click on the `Create pull request`
        button again.

8.  At the bottom of the page, check the mergeability status and address
    any issues.

9.  As soon as your `PR (Pull Request)` is ready for merging, a member
    of the Odoo team will be automatically assigned for review. If the
    reviewer has questions or remarks, they will post them as comments
    and you will be notified by email. Those comments must be resolved
    for the contribution to go forward.

10. Once your changes are approved, the review merges them and they
    become available for all Odoo users after the next code update!
