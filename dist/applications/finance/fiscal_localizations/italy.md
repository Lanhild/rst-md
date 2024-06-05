# Italy

## Configuration

`Install <general/install>` the following modules to get all the
features of the Italian localization:

| Name                       | Technical name                                         | Description                                                           |
|----------------------------|--------------------------------------------------------|-----------------------------------------------------------------------|
| Italy - Accounting         | <span class="title-ref">l10n_it</span>                 | Default `fiscal localization package <fiscal_localizations/packages>` |
| Italy - E-invoicing        | <span class="title-ref">l10n_it_edi</span>             | e-invoice implementation                                              |
| Italy - E-invoicing        | <span class="title-ref">l10n_it_edi_withholding</span> | e-invoice withholding                                                 |
| Italy - Accounting Reports | <span class="title-ref">l10n_it_reports</span>         | Country-specific reports                                              |
| Italy - Stock DDT          | <span class="title-ref">l10n_it_stock_ddt</span>       | Transport documents - Documento di Trasporto (DDT)                    |

<img src="italy/italy-modules.png" class="align-center"
alt="Italian localization modules" />

### Company information

Configuring the company's information ensures your Accounting database
is properly set up. To add information, go to
`Settings --> General Settings`, and in the `Companies` section, click
`Update info`. From here, fill out the fields:

- `Address`: the address of the company;
- `VAT`: VAT of the company;
- `Codice Fiscale`: the fiscal code of the company;
- `Tax System`: the tax system under which the company falls;

<img src="italy/italy-company.png" class="align-center"
alt="Company information to provide" />

### E-invoicing

The `SdI (Sistema di Interscambio)` is the electronic invoicing system
used in Italy. It enables to send and receive electronic invoices to and
from customers. The documents must be in XML format and formally
validated by the system before being delivered.

To be able to receive invoices and notifications, the
`SdI (Sistema di Interscambio)` service must be notified that the user's
files are to be sent to **Konvergo ERP** and processed on their behalf. To so,
you must set up Konvergo ERP's `Codice Destinatario` on the **Agenzia Delle
Entrate** portal.

1.  Go to <https://ivaservizi.agenziaentrate.gov.it/portale/> and
    authenticate;
2.  Go to section `Fatture e Corrispettivi`;
3.  Set the user as Legal Party for the VAT number you wish to configure
    the electronic address;
4.  In
    `Servizi Disponibili --> Fatturazione Elettronica --> Registrazione
    dell’indirizzo telematico dove ricevere tutte le fatture elettroniche`,
    insert Konvergo ERP's `Codice Destinatario`
    <span class="title-ref">K95IV18</span>, and confirm.

#### Electronic Data Interchange (EDI)

Konvergo ERP uses the **FatturaPA** `EDI (Electronic Data Interchange)` format
for the Italian localization and is enabled on the default journals when
installed. When the **file processing authorization** has been set, all
**invoices** and **bills** are automatically sent.

> [!NOTE]
> You can
> `enable electronic invoicing for other sales and purchase journals
> <e-invoicing/configuration>` than the default ones.

You can check the current status of an invoice by the
`Electronic invoicing` field. The XML file can be found in the
**chatter** of the invoice.

<img src="italy/italy-test.png" class="align-center"
alt="Electronic invoicing status (waiting for confirmation)" />

<div class="seealso">

`../accounting/customer_invoices/electronic_invoicing`

</div>

### File processing authorization (Konvergo ERP)

Since the files are transmitted through Konvergo ERP's server before being sent
to the `SdI (Sistema
di Interscambio)` or received by your database, you need to authorize
Konvergo ERP to process your files from your database. To do so, go to
`Accounting --> Configuration --> Settings -->
Electronic Document Invoicing`.

There are **three** modes available:

`Demo`  
This mode simulates an environment in which invoices are sent to the
government. In this mode, invoices need to be *manually* downloaded as
XML files and uploaded to the **Agenzia delle Entrate**'s website.

`Test (experimental)`  
This mode sends invoices to a non-production (i.e., test) service made
available by the **Agenzia delle Entrate**. Saving this change directs
all companies on the database to use this configuration.

`Official`  
This is a production mode that sends your invoices directly to the
**Agenzia delle Entrate**.

Once a mode is selected, you need to accept the **terms and conditions**
by ticking `Allow
Konvergo ERP to process invoices`, and then `Save`. You can now record your
transactions in Konvergo ERP Accounting.

> [!WARNING]
> Selecting either `Test (experimental)` or `Official` is
> **irreversible**. Once in `Official` mode, it is not possible to
> select `Test (experimental)` or `Demo`, and same for
> `Test (experimental)`. We recommend creating a separate database for
> testing purposes only.

> [!NOTE]
> When in `Test (Experimental)` mode, all invoices sent *must* have a
> partner using one of the following fake `Codice Destinatario` given by
> the **Agenzia Delle Entrate**:
> <span class="title-ref">0803HR0</span> -
> <span class="title-ref">N8MIMM9</span> -
> <span class="title-ref">X9XX79Z</span>. Any real production
> `Codice Destinario` of your customers will not be recognized as valid
> by the test service.

<img src="italy/italy-edi.png" class="align-center"
alt="Italy&#39;s electronic document invoicing options" />

## Taxes configuration

Many of the e-invoicing features are implemented using Konvergo ERP's tax
system. As such, it is very important that taxes are properly configured
in order to generate invoices correctly and handle other billing use
cases. For example, specific configurations are required for the
**reverse charge** type of taxes. In case of a **reverse charge** tax,
the seller does *not* charge the customer for the VAT but, instead, the
customer pays the VAT *themselves* to their government. There are
**two** main types:

- `external reverse charge <italy/external-reverse>`;
- `internal reverse charge  <italy/internal-reverse>`.

### External reverse charge

#### Invoices

To make an export invoice, make sure that the invoice lines all use a
tax configured for **reverse charge**. The **Italian** localization
contains an **example** of a reverse charge tax for export in the EU to
be used as reference (<span class="title-ref">0% EU</span>, invoice
label <span class="title-ref">00eu</span>), which can be found under
`Accounting --> Configuration --> Taxes`. Exports are exempt from VAT,
and therefore **reverse charge** taxes require the
`Has exoneration of tax (Italy)` option ticked, with both the
`Exoneration` kind and `Law Reference` filled in.

<img src="italy/italy-tax.png" class="align-center"
alt="External reverse charge settings" />

> [!NOTE]
> If you need to use a different kind of `Exoneration`, click
> `Action -->
> Duplicate` within the tax menu to create a copy of an existing similar
> tax. Then, select another `Exoneration`, and `Save`. Repeat this
> process as many times as you need different kind of `Exoneration`
> taxes.

> [!TIP]
> **Rename** your taxes in the `Name` field according to their
> `Exoneration` to differentiate them easily.

On your invoice, select the corresponding tax you need in the `Taxes`
field. You can find the following **additional info** by opening the
**XML** file of the issued invoice:

- `SdI address (Codice Destinatario)`: must be filled for both **EU** or
  **non-EU**;
- `Country Id`: must contain the country of the foreign seller in the
  two-letter ISO (Alpha-2) code (ex., <span class="title-ref">IT</span>
  for 'Italy');
- `CAP`: must be filled with <span class="title-ref">00000</span>;
- `Partita Iva` (**VAT number**): must contain the **VAT** number for
  **EU businesses** and <span class="title-ref">OO99999999999</span>
  (double 'O' **letter**, not 'zero') for **non-EU businesses**. In case
  of private customers without **VAT** number, use
  <span class="title-ref">0000000</span>;
- `Fiscal Code`: for foreign entities without an actual **Codice
  Fiscale**, any recognizable identifier is valid.

> [!NOTE]
> Konvergo ERP does not support sending user-modified XML files.

For **invoices**, multiple configurations are technically identified by
a `Tipo Documento` code:

- <span class="title-ref">TD02</span> - Down payments;
- <span class="title-ref">TDO7</span> - Simplified invoice;
- <span class="title-ref">TD08</span> - Simplified credit note;
- <span class="title-ref">TD09</span> - Simplified debit note;
- <span class="title-ref">TD24</span> - Deferred invoice.

<div class="tabs">

<div class="tab">

<span class="title-ref">TD02</span>

Down payments.

**Down payment** invoices are imported/exported with a different
`Tipo Documento` code <span class="title-ref">TDO2</span> than regular
invoices. Upon import of the invoice, it creates a regular vendor bill.

Konvergo ERP exports moves as <span class="title-ref">TD02</span> if the
following conditions are met:

- Is an invoice;

\- All invoice lines are related to **sales order lines** that have the flag <span class="title-ref">is_downpayment</span>  
set as <span class="title-ref">True</span>.

</div>

<div class="tab">

<span class="title-ref">TD07</span>,
<span class="title-ref">TD08</span>, and
<span class="title-ref">TD09</span>

Simplified invoices, and credit/debit notes.

Simplified invoices and credit notes can be used to certify **domestic
transactions** under **400 EUR** (VAT included). Its status is the same
as a regular invoice, but with fewer information requirements.

For a **simplified** invoice to be established, it must include:

- `Customer Invoice` reference: **unique** numbering sequence with **no
  gaps**;
- `Invoice Date`: issue **date** of the invoice;
- `Company Info`: the **seller**'s full credentials (VAT/TIN number,
  name, full address) under `General Settings --> Companies (section)`;
- `VAT`: the **buyer**'s VAT/TIN number (on their profile card);
- `Total`: the total **amount** (VAT included) of the invoice.

In the `EDI (Electronic Data Interchange)`, Konvergo ERP exports invoices as
simplified if:

- It is a **domestic** transaction (i.e., the partner is from Italy);
- The buyer's data is **insufficient** for a regular invoice;
- The **required fields** for a regular invoice (address, ZIP code,
  city, country) are provided;
- The total amount VAT included is **less** than **400 EUR**.

> [!NOTE]
> The 400 EUR threshold was defined in [the decree of the 10th of May
> 2019 in the Gazzetta
> Ufficiale](https://www.gazzettaufficiale.it/eli/id/2019/05/24/19A03271/sg).
> We advise you to check the current official value.

</div>

<div class="tab">

<span class="title-ref">TD24</span>

Deferred invoices.

The **deferred invoice** is an invoice that is **issued at a later
time** than the sale of goods or the provision of services. A **deferred
invoice** has to be issued at the latest within the **15th day** of the
month following the delivery covered by the document.

It usually is a **summary invoice** containing a list of multiple sales
of goods or services, carried out in the month. The business is allowed
to **group** the sales into **one invoice**, generally issued at the
**end of the month** for accounting purposes. Deferred invoices are
default for **wholesaler** having recurrent clients.

If the goods are transported by a **carrier**, every delivery has an
associated **Documento di Transporto (DDT)**, or **Transport Document**.
The deferred invoice **must** indicate the details of all the **DDTs**
information for better tracing.

> [!NOTE]
> E-invoicing of deferred invoices requires the
> <span class="title-ref">l10n_it_stock_ddt</span>
> `module <italy/modules>`. In this case, a dedicated `Tipo Documento`
> <span class="title-ref">TD24</span> is used in the e-invoice.

Konvergo ERP exports moves as <span class="title-ref">TD24</span> if the
following conditions are met:

- Is an invoice;
- Is associated to deliveries whose **DDTs** have a **different** date
  than the issuance date of the invoice.

</div>

</div>

#### Vendor bills

Italian companies buying goods or services from EU countries (or
services from non-EU countries) must send the information contained
within the bill received to the **Agenzia delle Entrate**. This allows
you to complete tax-related information on your bill, and to send it.
The seller must be set as `Cedente/Prestatore`, and the buyer as
`Cessionario/Committente`. Contained within the **XML** document for the
vendor bill, the vendor's credentials show as `Cedente/Prestatore`, and
your company's credentials as `Cessionario/Committente`.

> [!NOTE]
> Self-billing invoices or VAT invoice integrations must be issued and
> sent to the tax agency.

When inputting taxes in a vendor bill, it is possible to select
**reverse charge** taxes. These are automatically activated in the
Italian fiscal position. By going to `Accounting -->
Configuration --> Taxes`, the <span class="title-ref">10%</span> and
<span class="title-ref">22%</span> `Goods` and `Services` tax scopes are
activated and preconfigured with the correct tax grids. These are set up
automatically to ensure the correct booking of accounting entries and
display of the tax report.

For **vendor bills**, **three** types of configurations are technically
identified by a code called `Tipo Documento`:

- <span class="title-ref">TD17</span> - Buying services from **EU** and
  **non-EU** countries;
- <span class="title-ref">TD18</span> - Buying **goods** from **EU**;
- <span class="title-ref">TD19</span> - Buying **goods** from a
  **foreign** vendor, but the **goods** are already in **Italy** in a
  **VAT deposit**.

<div class="tabs">

<div class="tab">

<span class="title-ref">TD17</span>

Buying **services** from **EU** and **non-EU** countries:

The foreign *seller* invoices a service with a **VAT-excluded** price,
as it is not taxable in Italy. The VAT is paid by the *buyer* in Italy;

- Within EU: the *buyer* integrates the invoice received with the **VAT
  information** due in Italy (i.e., **vendor bill tax integration**);
- Non-EU: the *buyer* sends themselves an invoice (i.e.,
  **self-billing**).

Konvergo ERP exports a transaction as <span class="title-ref">TD17</span> if the
following conditions are met:

- Is a vendor bill;
- At least one tax on the invoice lines targets the tax grids
  `VJ <italy/grids>`;
- All invoice lines either have `Services` as **products**, or a tax
  with the `Services` as **tax scope**.

</div>

<div class="tab">

<span class="title-ref">TD18</span>

Buying **goods** from **EU**:

Invoices issued within the EU follow a **standard format**, therefore
only an integration of the existing invoice is required.

Konvergo ERP exports a transaction as <span class="title-ref">TD18</span> if the
following conditions are met:

- Is a vendor bill;
- At least one tax on the invoice lines targets the tax grids
  `VJ <italy/grids>`;
- All invoice lines either have `Consumable` as **products**, or a tax
  with the `Goods` as **tax scope**.

</div>

<div class="tab">

<span class="title-ref">TD19</span>

Buying **goods** from a **foreign** vendor, but the **goods** are
already in **Italy** in a **VAT deposit**:

- From EU: the *buyer* integrates the invoice received with the **VAT
  information** due in Italy (i.e., **vendor bill tax integration**);
- Non-EU: the *buyer* sends an invoice to *themselves* (i.e.,
  **self-billing**).

Konvergo ERP exports a move as a <span class="title-ref">TD19</span> if the
following conditions are met:

- Is a vendor bill;
- At least one tax on the invoice lines targets the tax grid
  `VJ3 <italy/grids>`;
- All invoice lines either have `Consumable` products, or a tax with
  `Goods` as tax scope.

</div>

</div>

> [!WARNING]
> Konvergo ERP does not offer the [Conservazione
> Sostitutiva](https://www.agid.gov.it/index.php/it/piattaforme/conservazione)
> requirements. Other providers and **Agenzia delle Entrate** supply
> free and certified storage to meet the requested conditions.

### Internal reverse charge

> [!WARNING]
> Konvergo ERP currently does not support domestic **internal reverse charge**
> processes.

### 'Reverse Charge' tax grids

The Italian localization has a specific **tax grid** section for
**reverse charge** taxes. These tax grids are identifiable by the
`VJ <italy/grids>` tag, and can be found under
`Accounting --> Reporting --> Audit Reports: Tax Report`.

<img src="italy/italy-grids.png" class="align-center"
alt="Italian reverse charge tax grids" />

## San Marino

### Invoices

San Marino and Italy have special agreements on e-invoicing operations.
As such, **invoices** follow the regular **reverse charge** rules.
Additional requirements are not enforced by Konvergo ERP, however, the user is
requested by the **State** to:

- Select a tax with the option `Has exoneration of tax (Italy)` ticked,
  and the `Exoneration` set to <span class="title-ref">N3.3</span>;
- Use the generic `SdI (Sistema di Interscambio)` `Codice Destinatario`
  <span class="title-ref">2R4GT08</span>. The invoice is then routed by
  a dedicated office in San Marino to the correct business.

### Bills

When a **paper bill** is received from San Marino, any Italian company
**must** submit that invoice to the **Agenzia delle Entrate** by
indicating the e-invoice's `Tipo Documento` field with the special value
<span class="title-ref">TD28</span>.

<div class="tabs">

<div class="tab">

<span class="title-ref">TD28</span>

Konvergo ERP exports a move as <span class="title-ref">TD28</span> if the
following conditions are met:

- Is a vendor bill;
- At least one tax on the invoice lines targets the tax grids
  `VJ <italy/grids>`;
- The **country** of the partner is **San Marino**.

</div>

</div>

## Pubblica amministrazione (B2G)

> [!WARNING]
> Konvergo ERP does **not** send invoices directly to the government as they
> need to be signed. If we see that the codice destinatario is 6 digits,
> then it is not sent to the PA automatically, but you can download the
> XML, sign it with an external program and send it through the portal.

### Digital qualified signature

For invoices and bills intended to the **Pubblica Amministrazione
(B2G)**, a **Digital Qualified Signature** is required for all files
sent through the `SdI (Sistema di Interscambio)`. The **XML** file must
be certified using a certificate that is either:

- a **smart card**;
- a **USB token**;
- a **Hardware Security Module (HSM)**.

### CIG, CUP, DatiOrdineAcquisto

To ensure the effective traceability of payments by public
administrations, electronic invoices issued to the public
administrations must contain:

- The `CIG (Codice Identificativo Gara)`, except in cases of exclusion
  from traceability obligations provided by law n. 136 of August 13,
  2010;
- The `CUP (Codice Unico di Progetto)`, in case of invoices related to
  public works.

If the **XML** file requires it, the **Agenzia Delle Entrate** can
*only* proceed payments of electronic invoices when the **XML** file
contains a `CIG (Codice Identificativo Gara)` and
`CUP (Codice Unico di Progetto)`. For each electronic invoice, it is
**necessary** to indicate the `CUU (Codice Univoco Ufficio)`, which
represents the unique identifier code that allows the
`SdI (Sistema di Interscambio)` to correctly deliver the electronic
invoice to the recipient office.

> [!NOTE]
> - The `Codice Unico di Progetto)` and the
> `CIG (Codice Identificativo Gara)` must be included in one of the
> **2.1.2** (DatiOrdineAcquisto), **2.1.3** (Dati Contratto), **2.1.4**
> (DatiConvenzione), **2.1.5** (Date Ricezione), or **2.1.6** (Dati
> Fatture Collegate) information blocks. These correspond to the
> elements named `CodiceCUP` and `CodiceCIG` of the electronic invoice
> **XML** file, whose table can be found on the government
> [website](http://www.fatturapa.gov.it/). - The
> `CUU (Codice Univoco Ufficio)` must be included in the electronic
> invoice corresponding to the element **1.1.4** (`CodiceDestinario`).
