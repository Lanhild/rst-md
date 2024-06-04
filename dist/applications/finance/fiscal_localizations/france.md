# France

## FEC - Fichier des Écritures Comptables

An FEC `Fichier des Écritures Comptables` audit file contains all the
accounting data and entries recorded in all the accounting journals for
a financial year. The entries in the file must be arranged in
chronological order.

Since January 1st, 2014, every French company is required to produce and
transmit this file upon request by the tax authorities for audit
purposes.

### FEC Import

To make the onboarding of new users easier, Odoo Enterprise's French
`fiscal localization
package <fiscal_localizations/packages>` includes the **FEC Import**
feature (module name: `l10n_fr_fec_import`), which enables the import of
existing FEC files from older software.

To enable this feature, go to
`Accounting --> Configuration --> Settings -->
Accounting Import`, enable **FEC Import**, and *Save*.

Next, go to `Accounting --> Configuration --> FEC Import`, upload your
FEC file, and click on *Import*.

<div class="note">

<div class="title">

Note

</div>

Importing FEC files from different year takes no particular action or
computation.  
Should multiple files contain any "Reports à Nouveaux" (RAN) with the
starting balance of the year, you might need to cancel those entries in
the User Interface. Odoo makes those entries (RAN) useless.

</div>

#### File formats

FEC files can only be in CSV format, as the XML format is not supported.

> [!NOTE]
> The FEC CSV file has a plain text format representing a data table,
> with the first line being a header and defining the list of fields for
> each entry, and each following line representing one accounting entry,
> in no predetermined order.

Our module expects the files to meet the following technical
specifications:

- **Encoding**: UTF-8, UTF-8-SIG and iso8859_15.
- **Separator**: any of these: <span class="title-ref">;</span> or
  <span class="title-ref">\|</span> or <span class="title-ref">,</span>
  or <span class="title-ref">TAB</span>.
- **Line terminators**: both CR+LF (<span class="title-ref">rn</span>)
  and LF (<span class="title-ref">n</span>) character groups are
  supported.
- **Date format**: <span class="title-ref">%Y%m%d</span>

#### Fields description and use

<table style="width:97%;">
<colgroup>
<col style="width: 4%" />
<col style="width: 13%" />
<col style="width: 33%" />
<col style="width: 30%" />
<col style="width: 15%" />
</colgroup>
<thead>
<tr class="header">
<th><blockquote>
<p>#</p>
</blockquote></th>
<th>Field name</th>
<th>Description</th>
<th>Use</th>
<th>Format</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>01</td>
<td>JournalCode</td>
<td>Journal Code</td>
<td><span class="title-ref">journal.code</span> and <span
class="title-ref">journal.name</span> if <span
class="title-ref">JournalLib</span> is not provided</td>
<td>Alphanumeric</td>
</tr>
<tr class="even">
<td>02</td>
<td>JournalLib</td>
<td>Journal Label</td>
<td><span class="title-ref">journal.name</span></td>
<td>Alphanumeric</td>
</tr>
<tr class="odd">
<td>03</td>
<td>EcritureNum</td>
<td>Numbering specific to each journal sequence number of the entry</td>
<td><span class="title-ref">move.name</span></td>
<td>Alphanumeric</td>
</tr>
<tr class="even">
<td>04</td>
<td>EcritureDate</td>
<td>Accounting entry Date</td>
<td><span class="title-ref">move.date</span></td>
<td>Date (yyyyMMdd)</td>
</tr>
<tr class="odd">
<td>05</td>
<td>CompteNum</td>
<td>Account Number</td>
<td><span class="title-ref">account.code</span></td>
<td>Alphanumeric</td>
</tr>
<tr class="even">
<td>06</td>
<td>CompteLib</td>
<td>Account Label</td>
<td><span class="title-ref">account.name</span></td>
<td>Alphanumeric</td>
</tr>
<tr class="odd">
<td>07</td>
<td>CompAuxNum</td>
<td>Secondary account Number (accepts null)</td>
<td><span class="title-ref">partner.ref</span></td>
<td>Alphanumeric</td>
</tr>
<tr class="even">
<td>08</td>
<td>CompAuxLib</td>
<td>Secondary account Label (accepts null)</td>
<td><span class="title-ref">partner.name</span></td>
<td>Alphanumeric</td>
</tr>
<tr class="odd">
<td>09</td>
<td>PieceRef</td>
<td>Document Reference</td>
<td><span class="title-ref">move.ref</span> and <span
class="title-ref">move.name</span> if <span
class="title-ref">EcritureNum</span> is not provided</td>
<td>Alphanumeric</td>
</tr>
<tr class="even">
<td>10</td>
<td>PieceDate</td>
<td>Document Date</td>
<td><span class="title-ref">move.date</span></td>
<td>Date (yyyyMMdd)</td>
</tr>
<tr class="odd">
<td>11</td>
<td>EcritureLib</td>
<td>Account entry Label</td>
<td><span class="title-ref">move_line.name</span></td>
<td>Alphanumeric</td>
</tr>
<tr class="even">
<td>12</td>
<td>Debit</td>
<td>Debit amount</td>
<td><span class="title-ref">move_line.debit</span></td>
<td>Float</td>
</tr>
<tr class="odd">
<td>13</td>
<td>Credit</td>
<td>Credit amount (Field name "Crédit" is not allowed)</td>
<td><span class="title-ref">move_line.credit</span></td>
<td>Float</td>
</tr>
<tr class="even">
<td>14</td>
<td>EcritureLet</td>
<td>Accounting entry cross reference (accepts null)</td>
<td><span class="title-ref">move_line.fec_matching_number</span></td>
<td>Alphanumeric</td>
</tr>
<tr class="odd">
<td>15</td>
<td>DateLet</td>
<td>Accounting entry date (accepts null)</td>
<td>unused</td>
<td>Date (yyyyMMdd)</td>
</tr>
<tr class="even">
<td>16</td>
<td>ValidDate</td>
<td>Accounting entry validation date</td>
<td>unused</td>
<td>Date (yyyyMMdd)</td>
</tr>
<tr class="odd">
<td>17</td>
<td>Montantdevise</td>
<td>Currency amount (accepts null)</td>
<td><span class="title-ref">move_line.amount_currency</span></td>
<td>Float</td>
</tr>
<tr class="even">
<td>18</td>
<td>Idevise</td>
<td>Currency identifier (accepts null)</td>
<td><span class="title-ref">currency.name</span></td>
<td>Alphanumeric</td>
</tr>
</tbody>
</table>

These two fields can be found in place of the others in the sence above.

|     |         |                                        |                                                                                                              |       |
|-----|---------|----------------------------------------|--------------------------------------------------------------------------------------------------------------|-------|
| 12  | Montant | Amount                                 | <span class="title-ref">move_line.debit</span> or <span class="title-ref">move_line.credit</span>            | Float |
| 13  | Sens    | Can be "C" for Credit or "D" for Debit | determines <span class="title-ref">move_line.debit</span> or <span class="title-ref">move_line.credit</span> | Char  |

#### Implementation details

The following accounting entities are imported from the FEC files:
**Accounts, Journals, Partners**, and **Moves**.

Our module determines the encoding, the line-terminator character, and
the separator that are used in the file.

A check is then performed to see if every line has the correct number of
fields corresponding to the header.

If the check passes, then the file is read in full, kept in memory, and
scanned. Accounting entities are imported one type at a time, in the
following order.

##### Accounts

Every accounting entry is related to an account, which should be
determined by the field <span class="title-ref">CompteNum</span>.

##### Code matching

Should a similar account code already be present in the system, the
existing one is used instead of creating a new one.

Accounts in Odoo generally have a number of digits that are default for
the fiscal localization. As the FEC module is related to the French
localization, the default number of relevant digits is 6.

This means that the account codes the trailing zeroes are right-trimmed,
and that the comparison between the account codes in the FEC file and
the ones already existing in Odoo is performed only on the first six
digits of the codes.

<div class="example">

The account code <span class="title-ref">65800000</span> in the file is
matched against an existing <span class="title-ref">658000</span>
account in Odoo, and that account is used instead of creating a new one.

</div>

##### Reconcilable flag

An account is technically flagged as *reconcilable* if the first line in
which it appears has the <span class="title-ref">EcritureLet</span>
field filled out, as this flag means that the accounting entry is going
to be reconciled with another one.

> [!NOTE]
> In case the line somehow has this field not filled out, but the entry
> still has to be reconciled with a payment that hasn't yet been
> recorded, this isn't a problem anyway; the account is flagged as
> reconcilable as soon as the import of the move lines requires it.

##### Account type and Templates matching

As the **type** of the account is not specified in the FEC format,
**new** accounts are created with the default type *Current Assets* and
then, at the end of the import process, they are matched against the
installed Chart of Account templates. Also, the *reconcile* flag is also
computed this way.

The match is done with the left-most digits, starting by using all
digits, then 3, then 2.

<div class="example">

| Name       | Code                                    | Full comparison                         | 3-digits comparison                | 2-digits comparison               |
|------------|-----------------------------------------|-----------------------------------------|------------------------------------|-----------------------------------|
| Template   | <span class="title-ref">400000</span>   | <span class="title-ref">400000</span>   | <span class="title-ref">400</span> | <span class="title-ref">40</span> |
| CompteNum  | <span class="title-ref">40100000</span> | <span class="title-ref">40100000</span> | <span class="title-ref">401</span> | <span class="title-ref">40</span> |
| **Result** |                                         |                                         |                                    | Match **found**                   |

</div>

The type of the account is then flagged as *payable* and *reconcilable*
as per the account template.

##### Journals

Journals are also checked against those already existing in Odoo to
avoid duplicates, also in the case of multiple FEC files imports.

Should a similar journal code already be present in the system, the
existing one is used instead of creating a new one.

New journals have their name prefixed by the string `FEC-`.

<div class="example">

<span class="title-ref">ACHATS</span> -\>
<span class="title-ref">FEC-ACHATS</span>

</div>

The journals are *not* archived, the user is entitled to handle them as
he wishes.

##### Journal type determination

The journal type is also not specified in the format (as per the
accounts) and therefore it is at first created with the default type
<span class="title-ref">general</span>.

At the end of the import process, the type is determined as per these
rules regarding related moves and accounts:

- \`bank\`: Moves in these journals always have a line (debit or credit)
  impacting a liquidity account.  
  <span class="title-ref">cash</span> /
  <span class="title-ref">bank</span> can be interchanged, so
  <span class="title-ref">bank</span> is set everywhere when this
  condition is met.

- \`sale\`: Moves in these journals mostly have debit lines on
  receivable accounts and credit lines on tax income accounts.  
  Sale refund journal items are debit/credit inverted.

- \`purchase\`: Moves in these journals mostly have credit lines on
  payable accounts and debit lines on expense accounts.  
  Purchase refund journal items are debit/credit inverted.

- \`general\`: for everything else.

<div class="note">

<div class="title">

Note

</div>

- A minimum of three moves is necessary for journal type identification.
- A threshold of 70% of moves must correspond to a criteria for a
  journal type to be determined.

</div>

<div class="example">

Suppose we are analyzing the moves that share a certain
<span class="title-ref">journal_id</span>.

| Moves                                                      | Count | Percentage |
|------------------------------------------------------------|-------|------------|
| that have a sale account line and no purchase account line | 0     | 0          |
| that have a purchase account line and no sale account line | 1     | 25%        |
| that have a liquidity account line                         | 3     | **75%**    |
| **Total**                                                  | 4     | 100%       |

The journal <span class="title-ref">type</span> would be
<span class="title-ref">bank</span>, because the bank moves percentage
(75%) exceeds the threshold (70%).

</div>

##### Partners

Each partner keeps its <span class="title-ref">Reference</span> from the
field <span class="title-ref">CompAuxNum</span>.

> [!NOTE]
> These fields are searchable, in line with former FEC imports on the
> accounting expert's side for fiscal/audit purposes.

> [!TIP]
> Users can merge partners with the Data Cleaning App, where Vendors and
> Customers or similar partner entries may be merged by the user, with
> assistance from the system that groups them by similar entries.

##### Moves

Entries are immediately posted and reconciled after submission, using
the <span class="title-ref">EcritureLet</span> field to do the matching
between the entries themselves.

The <span class="title-ref">EcritureNum</span> field represents the name
of the moves. We noticed that sometimes it may not be filled out. In
this case, the field <span class="title-ref">PieceRef</span> is used.

##### Rounding issues

There is a rounding tolerance with a currency-related precision on debit
and credit (i.e., 0.01 for EUR). Under this tolerance, a new line is
added to the move, named *Import rounding difference*, targeting the
accounts:

- <span class="title-ref">658000</span> Charges diverses de gestion
  courante, for added debits
- <span class="title-ref">758000</span> Produits divers de gestion
  courante, for added credits

##### Missing move name

Should the <span class="title-ref">EcritureNum</span> not be filled out,
it may also happen that the <span class="title-ref">PieceRef</span>
field is also not suited to determine the move name (it may be used as
an accounting move line reference) leaving no way to actually find which
lines are to be grouped in a single move, and effectively impeding the
creation of balanced moves.

One last attempt is made, grouping all lines from the same journal and
date (<span class="title-ref">JournalLib</span>,
<span class="title-ref">EcritureDate</span>). Should this grouping
generate balanced moves (sum(credit) - sum(debit) = 0), then each
different combination of journal and date creates a new move.

<div class="example">

<span class="title-ref">ACH</span> +
<span class="title-ref">2021/05/01</span> --\> new move on journal
<span class="title-ref">ACH</span> with name
<span class="title-ref">20210501</span>.

</div>

Should this attempt fail, the user is prompted an error message with all
the move lines that are supposedly unbalanced.

##### Partner information

If a line has the partner information specified, the information is
copied to the accounting move itself if the targeted Journal is of type
*payable* or *receivable*.

### Export

If you have installed the French
`fiscal localization package <fiscal_localizations/packages>`, you
should be able to download the FEC. To do so, go to
`Accounting --> Reporting -->
France --> FEC`.

> [!TIP]
> If you do not see the submenu **FEC**, go to `Apps`, remove the *Apps*
> filter, then search for the module named **France-FEC** and make sure
> it is installed.

<div class="seealso">

- [Official Technical Specification
  (fr)](https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000027804775)
- [Test-Compta-Demat (Official FEC Testing
  tool)](https://github.com/DGFiP/Test-Compta-Demat)

</div>

## French Accounting Reports

If you have installed the French Accounting, you will have access to
some accounting reports specific to France:

- Bilan comptable
- Compte de résultats
- Plan de Taxes France

## Get the VAT anti-fraud certification with Odoo

As of January 1st 2018, a new anti-fraud legislation comes into effect
in France and DOM-TOM. This new legislation stipulates certain criteria
concerning the inalterability, security, storage and archiving of sales
data. These legal requirements are implemented in Odoo, version 9
onward, through a module and a certificate of conformity to download.

### Is my company required to use anti-fraud software?

Your company is required to use an anti-fraud cash register software
like Odoo (CGI art. 286, I. 3° bis) if:

- You are taxable (not VAT exempt) in France or any DOM-TOM,
- Some of your customers are private individuals (B2C).

This rule applies to any company size. Auto-entrepreneurs are exempted
from VAT and therefore are not affected.

### Get certified with Odoo

Getting compliant with Odoo is very easy.

Your company is requested by the tax administration to deliver a
certificate of conformity testifying that your software complies with
the anti-fraud legislation. This certificate is granted by Odoo SA to
Odoo Enterprise users
[here](https://www.odoo.com/my/contract/french-certification/). If you
use Odoo Community, you should `upgrade to Odoo Enterprise
</administration/on_premise/community_to_enterprise>` or contact your
Odoo service provider.

In case of non-conformity, your company risks a fine of €7,500.

To get the certification, just follow the following steps:

- If you use **Odoo Point of Sale**, `install <general/install>` the
  **France - VAT Anti-Fraud Certification for Point of Sale (CGI 286 I-3
  bis)** module by going to `Apps`, removing the *Apps* filter, then
  searching for *l10n_fr_pos_cert*, and installing the module.
- Make sure a country is set on your company, otherwise your entries
  won’t be encrypted for the inalterability check. To edit your
  company’s data, go to `Settings --> Users & Companies --> Companies`.
  Select a country from the list; Do not create a new country.
- Download the mandatory certificate of conformity delivered by Odoo SA
  [here](https://www.odoo.com/my/contract/french-certification/).

<div class="note">

<div class="title">

Note

</div>

- To install the module in any system created before December 18th 2017,
  you should update the modules list. To do so, activate the
  `developer mode <developer-mode>`. Then go to the *Apps* menu and
  press *Update Modules List* in the top-menu.
- In case you run Odoo on-premise, you need to update your installation
  and restart your server beforehand.
- If you have installed the initial version of the anti-fraud module
  (prior to December 18th 2017), you need to update it. The module's
  name was *France - Accounting - Certified CGI 286 I-3 bis*. After an
  update of the modules list, search for the updated module in *Apps*,
  select it and click *Upgrade*. Finally, make sure the following module
  *l10n_fr_sale_closing* is installed.

</div>

### Anti-fraud features

The anti-fraud module introduces the following features:

- **Inalterability**: deactivation of all the ways to cancel or modify
  key data of POS orders, invoices and journal entries;
- **Security**: chaining algorithm to verify the inalterability;
- **Storage**: automatic sales closings with computation of both period
  and cumulative totals (daily, monthly, annually).

#### Inalterability

All the possible ways to cancel and modify key data of paid POS orders,
confirmed invoices and journal entries are deactivated, if the company
is located in France or in any DOM-TOM.

> [!NOTE]
> If you run a multi-companies environment, only the documents of such
> companies are impacted.

#### Security

To ensure inalterability, every order or journal entry is encrypted upon
validation. This number (or hash) is calculated from the key data of the
document as well as from the hash of the precedent documents.

The module introduces an interface to test the data inalterability. If
any information is modified on a document after its validation, the test
will fail. The algorithm recomputes all the hashes and compares them
against the initial ones. In case of failure, the system points out the
first corrupted document recorded in the system.

Users with *Manager* access rights can launch the inalterability check.
For POS orders, go to
`Point of Sales --> Reporting --> French Statements`. For invoices or
journal entries, go to
`Invoicing/Accounting --> Reporting --> French Statements`.

#### Storage

The system also processes automatic sales closings on a daily, monthly
and annual basis. Such closings distinctly compute the sales total of
the period as well as the cumulative grand totals from the very first
sales entry recorded in the system.

Closings can be found in the *French Statements* menu of Point of Sale,
Invoicing and Accounting apps.

<div class="note">

<div class="title">

Note

</div>

- Closings compute the totals for journal entries of sales journals
  (Journal Type = Sales).
- For multi-companies environments, such closings are performed by
  company.
- POS orders are posted as journal entries at the closing of the POS
  session. Closing a POS session can be done anytime. To prompt users to
  do it on a daily basis, the module prevents from resuming a session
  opened more than 24 hours ago. Such a session must be closed before
  selling again.
- A period’s total is computed from all the journal entries posted after
  the previous closing of the same type, regardless of their posting
  date. If you record a new sales transaction for a period already
  closed, it will be counted in the very next closing.

</div>

<div class="tip">

<div class="title">

Tip

</div>

- For test & audit purposes such closings can be manually generated in
  the `developer mode <developer-mode>`.
- Then go to
  `Settings --> Technical --> Automation --> Scheduled Actions`.

</div>

### Responsibilities

Do not uninstall the module! If you do so, the hashes will be reset and
none of your past data will be longer guaranteed as being inalterable.

Users remain responsible for their Odoo instance and must use it with
due diligence. It is not permitted to modify the source code which
guarantees the inalterability of data.

Odoo absolves itself of all and any responsibility in case of changes in
the module’s functions caused by 3rd party applications not certified by
Odoo.

### More Information

You can find more information about this legislation in the following
official documents.

<div class="seealso">

- [Frequently Asked
  Questions](https://www.economie.gouv.fr/files/files/directions_services/dgfip/controle_fiscal/actualites_reponses/logiciels_de_caisse.pdf)
- [Official
  Statement](http://bofip.impots.gouv.fr/bofip/10691-PGP.html?identifiant=BOI-TVA-DECLA-30-10-30-20160803)
- [Item 88 of Finance Law
  2016](https://www.legifrance.gouv.fr/affichTexteArticle.do?idArticle=JORFARTI000031732968&categorieLien=id&cidTexte=JORFTEXT000031732865)

</div>
