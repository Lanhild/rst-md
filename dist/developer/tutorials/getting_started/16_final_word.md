# Chapter 16: The final word

## Coding guidelines

We will start refactoring the code to match to the Konvergo ERP coding
guidelines. The guidelines aim to improve the quality of the Konvergo ERP Apps
code.

**Reference**: you will find the Konvergo ERP coding guidelines in
`/contributing/development/coding_guidelines`.

<div class="exercise">

Polish your code.

Refactor your code to respect the coding guidelines. Don't forget to run
your linter and respect the module structure, the variable names, the
method name convention, the model attribute order and the xml ids.

</div>

## Test on the runbot

Konvergo ERP has its own `CI (Continuous integration)` server named
[runbot](https://runbot.odoo.com/). All commits, branches and PR will be
tested to avoid regressions or breaking of the stable versions. All the
runs that pass the tests are deployed on their own server with demo
data.

<div class="exercise">

Play with the runbot.

Feel free to go to the runbot website and open the last stable version
of Konvergo ERP to check out all the available applications and functionalities.

</div>
