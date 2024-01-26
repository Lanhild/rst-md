# Intrastat

**Intrastat** is the system for data collection and statistic production
of goods traded among the EU Member States. Organizations whose annual
trade surpasses a certain threshold must provide data about the goods
traded with other EU countries.

<div class="seealso">

\- [Eurostat Statistics Explained - Glossary:
Intrastat](https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Glossary:Intrastat)

</div>

<div class="note">

<div class="title">

Note

</div>

As of January 1, 2022, the reporting requirements have changed. One main
modification concerns the transaction codes which are now switching to a
2-digits format. All transactions recorded after this date have to
follow the new system’s rules.

</div>

## Configuration

Go to `Accounting --> Settings --> Customer Invoices`, then enable
**Intrastat** and *Save*. Once the Intrastat has been activated you are
able to choose the **Default incoterm**.

<div class="important">

<div class="title">

Important

</div>

If you created your Odoo database prior to **January 13, 2022**, please
`upgrade
<general/upgrade>` the `account_intrastat` module to add the new
transaction codes and `install <general/install>` the
`account_intrastat_expiry` module to archive the old codes.

</div>
