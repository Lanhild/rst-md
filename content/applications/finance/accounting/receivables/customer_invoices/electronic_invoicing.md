# Electronic invoicing (`EDI (electronic data interchange)`)

EDI, or electronic data interchange, is the inter-company communication
of business documents, such as purchase orders and invoices, in a
standard format. Sending documents according to an EDI standard ensures
that the machine receiving the message can interpret the information
correctly. Various EDI file formats exist and are available depending on
your company's country.

EDI feature enables automating the administration between companies and
might also be required by some governments for fiscal control or to
facilitate the administration.

Electronic invoicing of your documents such as customer invoices, credit
notes or vendor bills is one of the application of EDI.

Odoo supports, among others, the following formats.

| Format Name                              | Applicability                                                                                                    |
| ---------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Factur-X (CII)                           | Default format on Odoo (enabled by default)                                                                      |
| Peppol BIS Billing 3.0 (UBL)             | For companies whose countries are part of the [EAS list](https://docs.peppol.eu/poacc/billing/3.0/codelist/eas/) |
| E-FFF                                    | For Belgian companies                                                                                            |
| XRechnung (UBL)                          | For German companies                                                                                             |
| Fattura PA (IT)                          | For Italian companies                                                                                            |
| CFDI (4.0)                               | For Mexican companies                                                                                            |
| Peru UBL 2.1                             | For Peruvian companies                                                                                           |
| SII IVA Llevanza de libros registro (ES) | For Spanish companies                                                                                            |

<div class="seealso">

`fiscal_localizations/packages`

</div>

## Configuration

Go to `Accounting --> Configuration --> Journals --> Customer Invoices
--> Advanced
Settings --> Electronic Invoicing` and enable the formats you need for
this journal.

![Select the EDI format you need](electronic_invoicing/formats.png)

Once an electronic invoicing format is enabled, XML documents are
generated when clicking on `Confirm` in documents such as invoices,
credit notes, etc. These documents are either visible in the attachment
section, or embedded in the PDF.

<div class="note">

<div class="title">

Note

</div>

\- For E-FFF, the xml file only appears after having generated the PDF
(`Print` or `Send & Print` button), since the PDF needs to be embedded
inside the xml. - By default, the `Factur-X` option is enabled. It means
that an XML file is automatically included in the PDF document that is
sent. - The formats available depend on the country registered in your
company's `General
Information`. - Odoo supports the **Peppol BIS Billing 3.0** format that
can be used via existing access points.

</div>

### Add new formats to a database created before July 2022

If your database was created before July 2022 and you wish to use one of
the formats available from July 2022, you have to `install
<general/install>` the module `Import/Export
electronic invoices with UBL/CII` (module’s technical name:
<span class="title-ref">account\_edi\_ubl\_cii</span>) and your
country-specific module.

<div class="example">

If you want to use the Belgian format E-FFF in a database created prior
to July 2022, you need to `install <general/install>`:

| Name                                           | Technical name                                        |
| ---------------------------------------------- | ----------------------------------------------------- |
| Belgium - E-Invoicing (UBL 2.0, e-fff)         | <span class="title-ref">l10n\_be\_edi</span>          |
| Import/Export electronic invoices with UBL/CII | <span class="title-ref">account\_edi\_ubl\_cii</span> |

</div>

<div class="note">

<div class="title">

Note

</div>

Once the new module is installed, UBL 2.0 and UBL 2.1 formats no longer
appear in the journal since UBL BIS Billing 3.0 is available and more
widely supported.

</div>
