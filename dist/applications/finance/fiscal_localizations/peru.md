# Peru

## Introduction

The Peruvian localization has been improved and extended, in this
version the next modules are available:

- **l10n_pe**: Adds accounting features for the Peruvian localization,
  which represent the minimal configuration required for a company to
  operate in Peru and under the SUNAT regulations and guidelines. The
  main elements included in this module are: Chart of account, taxes,
  document types.
- **l10n_pe_edi**: includes all technical and functional requirements to
  generate and validate Electronic Invoice, based on the SUNAT
  specification to create and process valid electronic documents, for
  more technical detail you can access the [SUNAT EDI
  specifications](https://cpe.sunat.gob.pe/node/88/), that keeps track
  of new changes and updates. The features of this module are based on
  the resolutions published on the [SUNAT
  Legislation](https://www.sunat.gob.pe/legislacion/general/index.html/).

<div class="seealso">

\- [App Tour - Localización de Peru](https://youtu.be/Ic3mGovkf8Y) -
[Smart Tutorial - Localización de
Peru](https://www.odoo.com/slides/smart-tutorial-localizacion-de-peru-133)

</div>

## Configuration

### Install the Peruvian localization modules

Go to *Apps* and search for Peru, then click Install in the module Peru
EDI. This module has a dependency with *Peru - Accounting*. In case this
last one is not installed, Odoo installs it automatically within EDI.

<img src="peru/peru-modules.png" class="align-center"
alt="The &quot;Module&quot; filter is set on &quot;Peru&quot;" />

> [!NOTE]
> When you install a database from scratch selecting Peru as country,
> Odoo automatically installs the base module: Peru - Accounting.

#### Configure your company

In addition to the basic information in the Company, we need to set Peru
as the Country, this is essential for the Electronic Invoice to work
properly. The field **Address Type Code** represents the establishment
code assigned by the SUNAT when companies register their RUC (Unique
Contributor Registration):

<img src="peru/peru-company.png" class="align-center"
alt="Company data for Peru including RUC and Address type code" />

> [!TIP]
> In case the Address type code is unknown, you can set it as the
> default value: 0000. Be aware that if an incorrect value is entered,
> the Electronic invoice validation might have errors.

> [!NOTE]
> The NIF should be set following the RUC format.

#### Chart of Account

The chart of accounts is installed by default as part of the set of data
included in the localization module, the accounts are mapped
automatically in:

- Taxes
- Default Account Payable.
- Default Account Receivable

The chart of accounts for Peru is based on the most updated version of
the `PCGE (Plan
Contable General Empresarial)`, which is grouped in several categories
and is compatible with NIIF accounting.

### Accounting Settings

Once the modules are installed and the basic information of your company
is set, you need to configure the elements required for Electronic
Invoice. For this, go to `Accounting
--> Settings --> Peruvian Localization`.

#### Basic Concepts

Here are some terms that are essential on the Peruvian localization:

- **EDI**: Electronic Data Interchange, which in this refers to the
  Electronic Invoice.
- **SUNAT**: is the organization that enforces customs and taxation in
  Peru.
- **OSE**: Electronic Service Operator, [OSE SUNAT's
  definition](https://cpe.sunat.gob.pe/aliados/ose#:~:text=El%20Operador%20de%20Servicios%20Electr%C3%B3nicos%20(OSE)%20es%20qui%C3%A9n%20se%20encarga,otro%20documento%20que%20se%20emita).
- **CDR**: Receipt certificate (Constancia de Recepción).
- **SOL Credentials**: Sunat Operaciones en Línea. User and password are
  provided by the SUNAT and grant access to Online Operations systems.

#### Signature Provider

As part of the requirements for Electronic Invoice in Peru, your company
needs to select a Signature Provider that will take care of the document
signing process and manage the SUNAT validation response. Odoo offers
three options:

1.  IAP (Odoo In-App Purchase)
2.  Digiflow
3.  SUNAT

Please refer to the sections below to check the details and
considerations for each option.

##### IAP (Odoo In-App Purchase)

This is the default and the suggested option, considering the digital
ceritificate is included as part of the service.

<img src="peru/peru-IAP.png" class="align-center"
alt="IAP option as signature providers" />

###### What is the IAP?

This is a signature service offered directly by Odoo, the service takes
care of the next process:

1.  Provides the Electronic invoice Certificate, so you do not need to
    acquire one by yourself.
2.  Send the document to the OSE, in this case, Digiflow.
3.  Receive the OSE validation and CDR.

###### How does it work?

The service requires Credits in order to process your electronic
documents. Odoo provides 1000 credits for free in new databases. After
these credits are consumed, you need to buy a Credit Package.

| Credits | EUR |
|---------|-----|
| 1000    | 22  |
| 5000    | 110 |
| 10,000  | 220 |
| 20,000  | 440 |

The credits are consumed per each document that is sent to the OSE.

> [!IMPORTANT]
> If you have a validation error and the document needs to be sent one
> more time, one additional credit will be charged. Therefore, it is
> paramount that you verify all information is correct before sending
> your document to the OSE.

###### What do you need to do?

- In Odoo, once your enterprise contract is activated and you start
  working in Production, you need to buy credits once the first 1000 are
  consumed.
- As Digiflow is the OSE used in the IAP, you need to affiliate it as
  the official OSE for your company on the SUNAT website. This is a
  simple process. For more information, please check [OSE Affiliation
  guide](https://drive.google.com/file/d/1BkrMTZIiJyi5XI0lGMi3rbMzHddOL1pa/view?usp=sharing).
- Register Digiflow as the authorized PSE, please check [PSE Affiliation
  guide](https://drive.google.com/file/d/1QZoqWvtQERpS0pqp6LcKmw7EBlm9EroU/view?usp=sharing).

##### Digiflow

This option can be used as an alternative, instead of using the IAP
services you can send your document validation directly to Digiflow. In
this case you need to consider:

- Buy your own digital Certificate: For more detail regarding the
  official vendor list, and the process to acquire it, please refer to
  [SUNAT Digital
  Ceritifcates](https://cpe.sunat.gob.pe/informacion_general/certificados_digitales/).
- Sign a service agreement directly with
  [Digiflow](https://www.digiflow.pe/).
- Provide your SOL credentials.

<img src="peru/peru-Digiflow.png" class="align-center" alt="Digiflow" />

##### SUNAT

In case your company wants to sign directly with the SUNAT, it is
possible to select this option in your configuration. In this case you
need to consider: - Get the SUNAT Certification process accepted.

- Buy your own digital Certificate: For more detail regarding the
  official vendor list, and the process to acquire it, please refer to
  [SUNAT Digital
  Ceritifcates](https://cpe.sunat.gob.pe/informacion_general/certificados_digitales/).
- Provide you SOL credentials.

> [!IMPORTANT]
> When using direct connection with the SUNAT, the SOL User must be set
> with the Company RUT + User Id. Example: `20121888549JOHNSMITH`

#### Testing environment

Odoo provides a testing environment that can be activated before your
company goes into production.

When using the testing environment and the IAP signature, you don’t need
to buy testing credits for your transactions as all of them are
validated by default.

> [!TIP]
> By default the databases are set to work on production, make sure to
> enable the testing mode if needed.

#### Certificate

In case you don’t use Odoo IAP, in order to generate the electronic
invoice signature, a digital certificate with the extension `.pfx` is
required. Proceed to this section and load your file and password.

<img src="peru/peru-Certificate.png" class="align-center"
alt="EDI Certificate wizard" />

#### Multicurrency

The official currency exchange rate in Peru is provided by the Bank of
Peru. Odoo can connect directly to its services and get the currency
rate either automatically or manually.

<img src="peru/peru-multicurrency.png" class="align-center"
alt="Bank of Peru is displayed in Multicurrency Service option" />

Please refer to the next section in our documentation for more
information about
`multicurrencies <../accounting/get_started/multi_currency>`.

### Configure Master data

#### Taxes

As part of the localization module the taxes are created automatically
with their related financial account and electronic invoice
configuration.

<img src="peru/peru-taxes.png" class="align-center"
alt="List of default taxes" />

##### EDI Configuration

As part of the taxes configuration, there are three new fields required
for electronic invoice, the taxes created by default have this data
included, but in case you create new taxes make sure you fill in the
fields:

<img src="peru/peru-taxes-edi.png" class="align-center"
alt="Taxes EDI data for Peru" />

#### Fiscal Positions

There are two main fiscal positions included by default when you install
the Peruvian localization.

**Extranjero - Exportación**: Set this fiscal position on customers for
Exportation transactions.

**Local Peru**: Set this fiscal position on local customers.

#### Document Types

In some Latin American countries, including Peru, some accounting
transactions like invoices and vendor bills are classified by document
types, defined by the government fiscal authorities, in this case by the
SUNAT.

Each document type can have a unique sequence per journal where it is
assigned. As part of the localization, the Document Type includes the
country on which the document is applicable;the data is created
automatically when the localization module is installed.

The information required for the document types is included by default
so the user does not need to fill anything on this view:

<img src="peru/peru-document-type.png" class="align-center"
alt="Document Type list" />

> [!WARNING]
> Currently the documents supported on customer invoices are: Invoice,
> Boleta, Debit Note and Credit Note.

#### Journals

When creating Sales Journals, the following information must be filled,
in addition to the standard fields on the Journals:

##### Use Documents

This field is used to define if the journal uses Document Types. It is
only applicable to Purchase and Sales journals, which are the ones that
can be related to the different set of document types available in Peru.
By default, all the sales journals created use documents.

##### Electronic Data Interchange

This section indicates which EDI workflow is used in the invoice, for
Peru we must select “Peru UBL 2.1”.

<img src="peru/peru-journal-edi.png" class="align-center"
alt="Journal EDI field" />

> [!WARNING]
> By default, the value Factur-X (FR) is always displayed, make sure you
> can uncheck it manually.

#### Partner

##### Identification Type and VAT

As part of the Peruvian localization, the identification types defined
by the SUNAT are now available on the Partner form, this information is
essential for most transactions either on the sender company and in the
customer, make sure you fill in this information in your records.

<img src="peru/peru-id-type.png" class="align-center"
alt="Partner identification type" />

#### Product

Additional to the basic information in your products, for the Peruvian
localization, the UNSPC Code on the product is a required value to be
configured.

<img src="peru/peru-unspc-code.png" class="align-center"
alt="UNSPC Code on products" />

## Usage and testing

### Customer invoice

#### EDI Elements

Once you have configured your master data, the invoices can be created
from your sales order or manually. Additional to the basic invoice
information described on `our page about the
invoicing process <../accounting/customer_invoices/overview>`, there are
a couple of fields required as part of the Peru EDI:

- **Document type**: The default value is “Factura Electronica” but you
  can manually change the document type if needed and select Boleta for
  example.

  <img src="peru/peru-invoice-document-type.png" class="align-center"
  alt="Invoice document type field on invoices" />

- **Operation type**: This value is required for Electronic Invoice and
  indicates the transaction type, the default value is “Internal Sale”
  but another value can be selected manually when needed, for example
  Export of Goods.

  <img src="peru/peru-operation-type.png" class="align-center"
  alt="Invoice operation type field on invoices" />

- **EDI Affectation Reason**: In the invoice lines, additional to the
  Tax there is a field “EDI Affectation Reason” that determines the tax
  scope based on the SUNAT list that is displayed. All the taxes loaded
  by default are associated with a default EDI affection reason, if
  needed you can manually select another one when creating the invoice.

  <img src="peru/peru-tax-affectation-reason.png" class="align-center"
  alt="Tax affectation reason in invoice line" />

#### Invoice validation

Once you check all the information in your invoice is correct, you can
proceed to validate it. This action registers the account move and
triggers the Electronic invoice workflow to send it to the OSE and the
SUNAT. The following message is displayed at the top of the invoice:

<img src="peru/peru-posted-invoice.png" class="align-center"
alt="Sending of EDI Invoice in blue" />

Asynchronous means that the document is not sent automatically after the
invoice has been posted.

##### Electronic Invoice Status

**To be Sent**: Indicates the document is ready to be sent to the OSE,
this can be done either automatically by Odoo with a *cron* that runs
every hour, or the user can send it immediately by clicking on the
button “Sent now”.

<img src="peru/peru-sent-manual.png" class="align-center"
alt="Send EDI manually" />

**Sent**: Indicates the document was sent to the OSE and was
successfully validated. As part of the validation a ZIP file is
downloaded and a message is logged in the chatter indicating the correct
Government validation.

<img src="peru/peru-invoice-sent.png" class="align-center"
alt="Message on chatter when the invoice is valid" />

In case there is a validation error the Electronic Invoice status
remains in “To be sent” so the corrections can be made and the invoice
can be sent again.

> [!WARNING]
> One credit is consumed each time that you send a document for
> validation, in this sense if an error is detected on an invoice and
> you send it one more time, two credits are consumed in total.

#### Common Errors

There are multiple reasons behind a rejection from the OSE or the SUNAT,
when this happens Odoo sends a message at the top of the invoice
indicating the error details and in the most common cases a hint to fix
the issue.

If a validation error is received, you have two options:

- In case the error is related to master data on the partner, customer
  or taxes, you can simply apply the change on the record (example
  customer identification type) and once it is done click on the Retry
  button.

- If the error is related to some data recorded on the invoice directly
  (Operation type, missing data on the invoice lines), the correct
  solution is to reset the invoice to Draft, apply the changes, and then
  send the invoice again to the SUNAT for another validation.

  <img src="peru/peru-errors.png" class="align-center"
  alt="List of common errors on invoices" />

For more detail please refert to [Common errors in
SUNAT](https://www.nubefact.com/codigos-error-sunat/).

#### Invoice PDF Report

After the invoice is accepted and validated by the SUNAT, the invoice
PDF report can be printed. The report includes a QR code, indicating the
invoice is a valid fiscal document.

<img src="peru/peru-PDF.png" class="align-center"
alt="Invoice PDF report" />

#### IAP Credits

Odoo’s Electronic IAP offers 1000 credits for free, after these credits
are consumed in your production database, your company must buy new
credits in order to process your transactions.

Once you run out of credits a red label is displayed at the top of the
invoice indicating that additional credits are required, you can easily
buy them by accessing the link provided in the message.

<img src="peru/peru-credits-IAP.png" class="align-center"
alt="Buying credits in the IAP" />

In the IAP service includes packages with different pricing based on the
number of credits. The price list in the IAP is always displayed in EUR.

#### Special Use cases

##### Cancellation process

Some scenarios require an invoice cancellation, for example, when an
invoice was created by mistake. If the invoice was already sent and
validated by the SUNAT, the correct way to proceed is by clicking on the
button Request Cancellation:

<img src="peru/peru-cancellation.png" class="align-center"
alt="Request invoice cancellation button" />

In order to cancel an invoice, please provide a cancellation Reason.

###### Electronic Invoice Status

**To Cancel**: Indicates the cancellation request is ready to be sent to
the OSE, this can be done either automatically by Odoo with a *cron*
that runs every hour, or the user can send it immediately by clicking on
the button “Send now”. Once it is sent, a cancellation ticket is
created, as a result the next message and CDR File are logged in the
chatter:

<img src="peru/peru-cancellation-cdr.png" class="align-center"
alt="Cancellation CDR sent by the SUNAT" />

**Cancelled**: Indicates the cancellation request was sent to the OSE
and was successfully validated. As part of the validation a ZIP file is
downloaded and a message is logged in the chatter indicating the correct
Government validation.

<img src="peru/peru-cancelled.png" class="align-center"
alt="nvoice after cancellation" />

> [!WARNING]
> One credit is consumed on each cancellation request.

##### Cancellation process

When creating exportation invoices, take into account the next
considerations:

- The Identification type on your customer must be Foreign ID.
- Operation type in your invoice must be an Exportation one.
- The taxes included in the invoice lines should be EXP taxes.

<img src="peru/peru-exp-invoice.png" class="align-center"
alt="Exportation invoices main data" />

##### Advance Payments

1.  Create the advance payment Invoice and apply its related payment.
2.  Create the final invoice without considering the advance payment.
3.  Create a credit note for the Final invoice with the advance payment
    amount.
4.  Reconcile the Credit note with the final invoice.
5.  The remaining balance on the final invoice should be paid with a
    regular payment transaction.

##### Detraction Invoices

When creating invoices that is subject to Detractions, take into account
the next considerations:

1.  All the products included in the invoice must have these fields
    configured:

    <img src="peru/peru-detraction.png" class="align-center"
    alt="Detraction fields on products" />

2.  Operation type in your invoice must be `1001`

    <img src="peru/peru-detraction-invoice.png" class="align-center"
    alt="Detraction code on invoices." />

### Credit Notes

When a correction or refund is needed over a validated invoice, a credit
note must be generated, for this just click on the button “Add Credit
Note”, a part of the Peruvian localization you need to prove a Credit
Reason selecting one of the options in the list.

<img src="peru/peru-credit-note.png" class="align-center"
alt="Add Credit Note from invoice" />

> [!TIP]
> When creating your first credit Note, select the Credit Method:
> Partial Refund, this allows you to define the credit note sequence.

By default the Credit Note is set in the document type:

<img src="peru/peru-credit-note-document.png" class="align-center"
alt="Credit Note document type" />

To finish the workflow please follow the instructions on
`our page about Credit Notes
<../accounting/customer_invoices/credit_notes>`.

> [!NOTE]
> The EDI workflow for the Credit notes works in the same way as the
> invoices.

### Debit Notes

As part of the Peruvian localization, besides creating credit notes from
an existing document you can also create debit Notes. For this just use
the button “Add Debit Note”.

By default the Debit Note is set in the document type.

### Electronic delivery guide 2.0

The *Guía de Remisión Electrónica* (GRE) is an electronic document
generated by the shipper to support the transportation or transfer of
goods from one place to another, such as a warehouse or establishment.
In Odoo, there are several configuration steps needed before you can
successfully use this feature.

The use of the *guía de remisión electrónica* electronic document is
mandatory and required by
`SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`
for taxpayers who need to transfer their products, except those under
the *Single Simplified Regime* (régimen único simplificado or RUS).

#### Delivery guide types

##### Sender

The *Sender* delivery guide type is issued when a sale is made, a
service is rendered (including processing), goods are assigned for use,
or goods are transferred between premises of the same company and
others.

This delivery guide is issued by the owner of the goods (i.e., the
sender) at the beginning of the shipment. The sender delivery guide is
supported in Odoo.

<div class="seealso">

[SUNAT guía de remisión](https://www.gob.pe/7899-guia-de-remision)

</div>

##### Carrier

The *Carrier* delivery guide type justifies the transportation service
the driver (or carrier) performs.

This delivery guide is issued by the carrier and must be issued to each
shipper when the shipment goes through public transport.

> [!IMPORTANT]
> The carrier delivery guide is **not** supported in Odoo.

<div class="seealso">

[SUNAT guía de remisión
transportista](https://tefacturo.pe/blog/sunat/guia-de-remision-electronica/guia-de-remision-transportista/)

</div>

#### Transportation types

##### Private

The *Private* transportation type option is used when the owner
transfers goods using their own vehicles. In this case, a sender's
delivery guide must be issued.

##### Public

The *Public* transportation type option is used when an external carrier
moves the goods. In this case, two delivery guides must be issued: the
sender's delivery guide and the carrier's delivery guide.

#### Direct submission to SUNAT

The creation of the `GRE (Guía de Remisión Electrónica)` delivery guide
in Odoo **must** be sent directly to the
`SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`,
regardless of the electronic document provider: IAP, Digiflow, or
`SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`.

#### Required information

Version 2.0 of the electronic delivery guide requires additional
information on the general configuration, vehicles, contacts, and
products. In the general configuration, it is necessary to add new
credentials that you can retrieve from the
`SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`
portal.

#### Cancellations

**Both** the sender and the carrier can cancel the electronic waybill as
long as the following conditions are met:

- The shipment has not been initiated.
- If the shipment has been initiated, the receiver **must** be changed
  before reaching the final destination.

> [!IMPORTANT]
> The
> `SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`
> no longer uses the term "Anula", but now uses the term "Dar de baja"
> for cancellations.

#### Testing

The
`SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`
does not support a test environment. This means that any delivery guides
that were generated by mistake **will** be sent to the
`SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`.

If, by mistake, the waybill was created in this environment, it is
necessary to delete it from the
`SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`
portal.

#### Configuration

> [!IMPORTANT]
> - Electronic sender's `GRE (Guía de Remisión Electrónica)` is
> currently the only supported type of waybill in Odoo. - The delivery
> guide is dependent on the Odoo *Inventory* app, the `l10n_pe_edi` and
> `l10n_pe` modules. - A second user **must** be added for the creation
> of electronic documents.

After following the steps to configure the
`electronic invoicing <peru/accounting-settings>` and the
`master data <peru/master_data>`, `install <general/install>` the
`Peruvian - Electronic Delivery Note 2.0` module
(<span class="title-ref">l10n_pe_edi_stock_20</span>).

Next, you need to retrieve the *client ID* and *client secret* from
`SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`.
To do so, follow the [manual de servicios web plataforma nueva
GRE](https://cpe.sunat.gob.pe/sites/default/files/inline-files/Manual_Servicios_GRE.pdf).

> [!NOTE]
> In the
> `SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`
> portal, it is important to have the correct access rights enabled, as
> they may differ from the user set for electronic invoicing.

These credentials should be used to configure the delivery guide general
settings from
`Accounting --> Configuration --> Settings --> Peruvian Electronic Invoicing`.

![Example for the SUNAT Delivery Guide API section configuration.](peru/gre-fields-example.png)

> [!NOTE]
> It is required to follow the format <span class="title-ref">RUC +
> UsuarioSol</span> (e.g.,
> <span class="title-ref">20557912879SOLUSER</span>) for the
> `Guide SOL User` field, depending on the user selected when generating
> the `GRE (Guía de Remisión Electrónica)` API credentials in the
> `SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`
> portal.

##### Operator

The *operator* is the vehicle's driver in cases where the delivery guide
is through *private* transport.

To create a new operator, navigate to `Contacts --> Create` and fill out
the contact information.

First, select `Individual` as the `Company Type`. Then, add the
`Operator License` in the `Accounting` tab of the contact form.

For the customer address, make sure the following fields are complete:

- `District`
- `Tax ID` (`DNI`/`RUC`)
- `Tax ID Number`

![Individual type operator configurations in the Contact form.](peru/operator-configuration.png)

##### Carrier

The *carrier* is used when the delivery guide is through *public*
transport.

To create a new carrier, navigate to `Contacts --> Create` and fill out
the contact information.

First, select `Company` as the `Company Type`. Then, add the `MTC
Registration Number`, `Authorization Issuing Entity`, and the
`Authorization
Number`.

For the company address, make sure the following fields are complete:

- `District`
- `Tax ID` (`DNI`/`RUC`)
- `Tax ID Number`

![Company type operator configurations in the Contact form.](peru/company-operator-configuration.png)

##### Vehicles

To configure the available vehicles, navigate to
`Inventory --> Configuration -->
Vehicles` and fill in the vehicle form with the information needed for
the vehicle:

- `Vehicle Name`
- `License Plate`
- `Is M1 or L?`
- `Special Authorization Issuing Entity`
- `Authorization Number`
- `Default Operator`
- `Company`

> [!IMPORTANT]
> It is important to check the `Is M1 or L?` checkbox if the vehicle has
> fewer than four wheels or fewer than eight seats.

![Vehicle not selected as an M1 or L type with extra fields shown.](peru/vehicle-not-m1-or-l-pe.png)

##### Products

To configure the available products, navigate to
`Inventory --> Products` and open the product to be configured.

Make sure that the applicable information in the product form is fully
configured. The `Partida Arancelaria` (Tariff Item) field needs to be
completed.

#### Generating a GRE

Once the delivery from inventory is created during the sales workflow,
make sure you complete the `GRE (Guía de Remisión Electrónica)` fields
on the top-right section of the transfer form for the fields:

- `Transport Type`
- `Reason for Transfer`
- `Departure start date`

It is also required to complete the `Vehicle` and `Operator` fields
under the `Guia de Remision PE` tab.

The delivery transfer has to be marked as *Done* for the
`Generar Guia de Remision` button to appear on the left menu of the
transfer form.

![Generar Guia de Remision button on a transfer form in the Done stage.](peru/generate-gre-transferview.png)

Once the transfer form is correctly validated by
`SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`,
the generated XML file becomes available in the chatter. You can now
print the delivery slip that shows the transfer details and the QR code
validated by
`SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`.

![Transfer details and QR code on generated delivery slip.](peru/gre-delivery-slip.png)

#### Common errors

- <span class="title-ref">Diferente prefijo para productos (T001 en
  algunos, T002 en otros)</span>

  At the moment, Odoo does not support the automation of prefixes for
  products. This can be done manually for each product output. This can
  also be done for non-storable products. However, keep in mind that
  there will be no traceability.

- <span class="title-ref">2325 - GrossWeightMeasure - El dato no cumple
  con el formato establecido "Hace falta el campo" "Peso"" en el
  producto</span>

  This error occurs when the weight on the product is set as
  <span class="title-ref">0.00</span>. To fix this, you need to cancel
  the waybill and recreate it. Make sure that you fix the weight on the
  product before creating the new waybill, or it will result in the same
  error.

- <span class="title-ref">JSONDecodeError: Expecting value: line 1
  column 1 (char 0) when creating a Delivery Guide</span>

  This error is typically generated due to SOL user issues. Verify the
  user's connection with the
  `SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`;
  the SOL user must be established with the company RUT + user ID. For
  example <span class="title-ref">2012188549JOHNSMITH</span>.

- <span class="title-ref">El número de documento relacionado al traslado
  de mercancía no cumple con el formato establecido: error: documento
  relacionado</span>

  The *Related Document Type* and *Related Document Number* fields only
  apply to invoices and receipts.

- <span class="title-ref">400 Client error: Bad Request for URL</span>

  This error is not solvable from Odoo; it is advised you reach out to
  the
  `SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`
  and verify the user. It may be necessary to create a new user.

- <span class="title-ref">Invalid content was found starting with
  element 'cac:BuyerCustomerParty'</span>

  This error occurs when the transfer reason is set as *other*. Please
  select another option. Following to the official documentation of the
  `SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`'s
  waybill guide, the transfer reasons *03 (sale with shipment to third
  party)* or *12 (others)* does not work in Odoo, since you should not
  have an empty or blank customer.

- <span class="title-ref">Duda cliente: consumo de créditos IAP al usar
  GRE 2.0</span>

  For live clients using IAP, no credit is consumed (in theory) because
  it does not go through the OSE, i.e., these documents are directly
  sent to the
  `SUNAT (Superintendencia Nacional de Aduanas y de Administración Tributaria)`.

- <span class="title-ref">Errores con formato credenciales GRE 2.0
  (traceback error)</span>

  Odoo currently throws an error with a traceback instead of a message
  that the credentials are not correctly configured in the database. If
  this occurs on your database, please verify your credentials.
