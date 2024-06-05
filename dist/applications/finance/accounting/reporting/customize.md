# Custom reports

Konvergo ERP comes with a powerful and easy-to-use reporting framework. The
engine allows you to create new reports, such as **tax reports**, or
**balance sheets** and **income statements** with **specific groupings**
and **layouts**.

> [!IMPORTANT]
> Activate the `developer mode <developer-mode>` to access the
> accounting report creation interface.

To create a new report, go to
`Accounting --> Configuration --> Management:
Accounting Reports`. From here, you can either create a
`root report <customize-reports/root>` or a
`variant <customize-reports/variants>`.

<img src="customize/engine-accounting-reports.png" class="align-center"
alt="Accounting reports engine." />

## Root reports

Root reports can be regarded as generic, neutral accounting reports.
They serve as models on which local accounting versions are built. If a
report has no root report, it is considered to be a root report itself.

<div class="example">

A tax report for Belgium and the US would both use the same generic
version as a base and adapt it for their domestic regulations.

</div>

When creating a new root report, you need to create a **menu item** for
it. To do so, open the report and then, on that same report, click on
`Action --> Create Menu Item`. Refresh the page; the report is now
available under `Accounting --> Reporting`.

> [!NOTE]
> Cases that require creating a new root report are rare, such as when a
> country's tax authorities require a new and specific type of report.

<img src="customize/engine-create-menu-item.png" class="align-center"
alt="Create Menu Item button." />

## Variants

Variants are country-specific versions of root reports and, therefore,
always refer to a root report. To create a variant, select a generic
(root) report in the `Root Report` field when creating a new report.

When a root report is opened from one of the accounting app's main
menus, all its variants are displayed in the variant selector in the top
right corner of the view.

<div class="example">

In the following image, `VAT Report (BE)` is the variant of the root
`Generic
Tax report`.

<img src="customize/engine-variant.png" class="align-center"
alt="Report variant selection." />

</div>

## Lines

After having created a report (either root or variant), you need to fill
it with lines. You can either create a new one by clicking on
`Add a line`, or modify an existing line by clicking on it. All lines
*require* a `Name`, and can have an optional additional `Code` (of your
choice) if you wish to use their value in formulas.

<img src="customize/engine-lines-options.png" class="align-center"
alt="Engine lines options." />

## Expressions

Each line can contain one or multiple **expressions**. Expressions can
be seen as **sub-variables** needed by a report line. To create an
expression, click on `Add a line` *within* a line report.

When creating an expression, you must attribute a `label` used to refer
to that expression. Therefore, it has to be **unique** among the
expressions of each line. Both a `Computation Engine` and a `Formula`
must also be indicated. The **engine** defines how your **formula(s)**
and **subformula(s)** are interpreted. It is possible to mix expressions
using different computation engines under the same line if you need to.

> [!NOTE]
> Depending on the engine, `subformulas` may also be required.

### 'Konvergo ERP Domain' engine

With this engine, a formula is interpreted as an
`Konvergo ERP domain <reference/orm/domains>` targeting
<span class="title-ref">account.move.line</span> objects.

The subformula allows you to define how the move lines matching the
domain are used to compute the value of the expression:

<span class="title-ref">sum</span>  
The result is the sum of all the balances of the matched move lines.

<span class="title-ref">sum_if_pos</span>  
The result is the sum of all the balances of the matched move lines if
this amount is positive. Otherwise, it is
<span class="title-ref">0</span>.

<span class="title-ref">sum_if_neg</span>  
The result is the sum of all the balances of the matched move lines if
this amount is negative. Otherwise, it is
<span class="title-ref">0</span>.

<span class="title-ref">count_rows</span>  
The result is the number of sub-lines of this expression. If the parent
line has a group-by value, this will correspond to the number of
distinct grouping keys in the matched move lines. Otherwise, it will be
the number of matched move lines.

You can also put a <span class="title-ref">-</span> sign at the
beginning of the subformula to **reverse** the sign of the result.

<img src="customize/engine-expressions.png" class="align-center"
alt="Expression line within a line report" />

### 'Tax Tags' engine

A formula made for this engine consists of a name used to match tax
tags. If such tags do not exist when creating the expression, they will
be created.

When evaluating the expression, the expression computation can roughly
be expressed as: **(amount of the move lines with**
<span class="title-ref">+</span> **tag)**
<span class="title-ref">-</span> **(amount of the move lines with**
<span class="title-ref">-</span> **tag)**.

<div class="example">

If the formula is <span class="title-ref">tag_name</span>, the engine
matches tax tags <span class="title-ref">+tag_name</span> and
<span class="title-ref">-tag_name</span>, creating them if necessary. To
exemplify further: two tags are matched by the formula. If the formula
is <span class="title-ref">A</span>, it will require (and create, if
needed) tags <span class="title-ref">+A</span> and
<span class="title-ref">-A</span>.

</div>

### 'Aggregate Other Formulas' engine

Use this engine when you need to perform arithmetic operations on the
amounts obtained for other expressions. Formulas here are composed of
references to expressions separated by one of the four basic arithmetic
operators (addition <span class="title-ref">+</span>, subtraction
<span class="title-ref">-</span>, division
<span class="title-ref">/</span>, and multiplication
<span class="title-ref">\*</span>). To refer to an expression, type in
its parent line's **code** followed by a period
<span class="title-ref">.</span> and the expression's **label** (ex.
**code.label**).

**Subformulas** can be one of the following:

<span class="title-ref">if_above(CUR(amount))</span>  
The value of the arithmetic expression will be returned only if it is
greater than the provided bound. Otherwise, the result will be
<span class="title-ref">0</span>.

<span class="title-ref">if_below(CUR(amount))</span>  
The value of the arithmetic expression will be returned only if it is
lower than the provided bound. Otherwise, the result will be
<span class="title-ref">0</span>.

<span class="title-ref">if_between(CUR1(amount1), CUR2(amount2))</span>  
The value of the arithmetic expression will be returned only if it is
strictly between the provided bounds. Otherwise, it will be brought back
to the closest bound.

<span class="title-ref">if_other_expr_above(LINE_CODE.EXPRESSION_LABEL, CUR(amount))</span>  
The value of the arithmetic expression will be returned only if the
value of the expression denoted by the provided line code and expression
label is greater than the provided bound. Otherwise, the result will be
<span class="title-ref">0</span>.

<span class="title-ref">if_other_expr_below(LINE_CODE.EXPRESSION_LABEL, CUR(amount))</span>  
The value of the arithmetic expression will be returned only if the
value of the expression denoted by the provided line code and expression
label is lower than the provided bound. Otherwise, the result will be
<span class="title-ref">0</span>.

<span class="title-ref">CUR</span> is the currency code in capital
letters, and <span class="title-ref">amount</span> is the amount of the
bound expressed in that currency.

You can also use the <span class="title-ref">cross_report</span>
subformula to match an expression found in another report.

### 'Prefix of Account Codes' engine

This engine is used to match amounts made on accounts using the prefixes
of these accounts' codes as variables in an arithmetic expression.

<div class="example">

\| <span class="title-ref">21</span> \| Arithmetic expressions can also
be a single prefix, such as here.

</div>

<div class="example">

\| <span class="title-ref">21 + 10 - 5</span> \| This formula adds the
balances of the move lines made on accounts whose codes start with
<span class="title-ref">21</span> and <span class="title-ref">10</span>,
and subtracts the balance of the ones on accounts with the prefix
<span class="title-ref">5</span>.

</div>

It is also possible to ignore a selection of sub-prefixes.

<div class="example">

\| <span class="title-ref">21 + 10(101, 102) - 5(57)</span> \| This
formula works the same way as the previous example but ignores the
prefixes <span class="title-ref">101</span>,
<span class="title-ref">102</span>, and
<span class="title-ref">57</span>.

</div>

You can apply 'sub-filtering' on **credits and debits** using the
<span class="title-ref">C</span> and <span class="title-ref">D</span>
suffixes. In this case, an account will only be considered if its prefix
matches, *and* if the total balance of the move lines made on this
account is **credit/debit**.

<div class="example">

Account <span class="title-ref">210001</span> has a balance of -42 and
account <span class="title-ref">210002</span> has a balance of 25. The
formula <span class="title-ref">21D</span> only matches the account
<span class="title-ref">210002</span>, and hence returns 25.
<span class="title-ref">210001</span> is not matched, as its balance is
*credit*.

</div>

Prefix exclusions can be mixed with the <span class="title-ref">C</span>
and <span class="title-ref">D</span> suffixes.

<div class="example">

\| <span class="title-ref">21D + 10(101, 102)C - 5(57)</span> \| This
formula adds the balances of the move lines made on accounts whose code
starts with <span class="title-ref">21</span> *if* it is debit
(<span class="title-ref">D</span>) and <span class="title-ref">10</span>
*if* it is credit (<span class="title-ref">C</span>), but ignores
prefixes <span class="title-ref">101</span>,
<span class="title-ref">102</span>, and subtracts the balance of the
ones on accounts with the prefix <span class="title-ref">5</span>,
ignoring the prefix <span class="title-ref">57</span>.

</div>

To match the letter <span class="title-ref">C</span> or
<span class="title-ref">D</span> in a prefix and not use it as a suffix,
use an empty exclusion <span class="title-ref">()</span>.

<div class="example">

\| <span class="title-ref">21D()</span> \| This formula matches accounts
whose code starts with <span class="title-ref">21D</span>, regardless of
their balance sign.

</div>

In addition to using code prefixes to include accounts, you can also
match them with **account tags**. This is especially useful, for
example, if your country lacks a standardized chart of accounts, where
the same prefix might be used for different purposes across companies.

<div class="example">

\| <span class="title-ref">tag(25)</span> \| This formula matches
accounts whose associated tags contain the one with id *25*.

</div>

If the tag you reference is defined in a data file, an xmlid can be used
instead of the id.

<div class="example">

\| <span class="title-ref">tag(my_module.my_tag)</span> \| This formula
matches accounts whose associated tags include the tag denoted by
*my_module.my_tag*.

</div>

You can also use arithmetic expressions with tags, possibly combining
them with prefix selections.

<div class="example">

\| <span class="title-ref">tag(my_module.my_tag) + tag(42) + 10</span>
\| The balances of accounts tagged as *my_module.my_tag* will be summed
with those of accounts linked to the tag with ID *42* and accounts with
the code prefix <span class="title-ref">10</span>

</div>

<span class="title-ref">C</span> and <span class="title-ref">D</span>
suffixes can be used in the same way with tags.

<div class="example">

\| <span class="title-ref">tag(my_module.my_tag)C</span> \| This formula
matches accounts with the tag *my_module.my_tag* and a credit balance.

</div>

Prefix exclusion also works with tags.

<div class="example">

\| <span class="title-ref">tag(my_module.my_tag)(10)</span> \| This
formula matches accounts with the tag *my_module.my_tag* and a code not
starting with <span class="title-ref">10</span>.

</div>

### 'External Value' engine

The 'external value' engine is used to refer to **manual** and
**carryover values**. Those values are not stored using
<span class="title-ref">account.move.line</span>, but with
<span class="title-ref">account.report.external.value</span>. Each of
these objects directly points to the expression it impacts, so very
little needs to be done about their selection here.

**Formulas** can be one of the following:

<span class="title-ref">sum</span>  
If the result must be the sum of all the external values in the period.

<span class="title-ref">most_recent</span>  
If the result must be the value of the latest external value in the
period.

In addition, **subformulas** can be used in two ways:

<span class="title-ref">rounding=X</span>  
Replacing <span class="title-ref">X</span> with a number instructs to
round the amount to X decimals.

<span class="title-ref">editable</span>  
Indicates this expression can be edited manually, triggering the display
of an icon in the report, allowing the user to perform this action.

> [!NOTE]
> Manual values are created at the
> <span class="title-ref">date_to</span> currently selected in the
> report.

Both subformulas can be mixed by separating them with a
<span class="title-ref">;</span>.

<div class="example">

\| <span class="title-ref">editable;rounding=2</span> \| is a correct
subformula mixing both behaviors.

</div>

### 'Custom Python Function' engine

This engine is a means for developers to introduce custom computation of
expressions on a case-by-case basis. The formula is the name of a
**python function** to call, and the subformula is a **key** to fetch in
the **dictionary** returned by this function. Use it only if you are
making a custom module of your own.

## Columns

Reports can have an **indefinite number** of columns to display. Each
column gets its values from the **expressions** declared on the
**lines**. The field `expression_label` of the column gives the label of
the expressions whose value is displayed. If a line has no
**expression** in that field, then nothing is displayed for it in this
column. If multiple columns are required, you must use different
**expression** labels.

<img src="customize/engine-columns.png" class="align-center"
alt="Columns of report." />

When using the **period comparison** feature found under the `Options`
tab of an accounting report, all columns are repeated in and for each
period.
