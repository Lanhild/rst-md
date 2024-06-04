# Saudi Arabia

## Configuration

`Install <general/install>` the following modules to get all the
features of the Saudi Arabian localization:

| Name                                    | Technical name                                        | Description                                                           |
|-----------------------------------------|-------------------------------------------------------|-----------------------------------------------------------------------|
| Saudi Arabia - Accounting               | <span class="title-ref">l10n_sa</span>                | Default `fiscal localization package <fiscal_localizations/packages>` |
| Saudi Arabia - E-invoicing              | <span class="title-ref">l10n_sa_edi</span>            | ZATCA e-invoices implementation                                       |
| Saudi Arabia - E-invoicing (Simplified) | <span class="title-ref">l10n_sa_edi_simplified</span> | ZATCA simplified e-invoices implementation (Point of Sale)            |
| Saudi Arabia - Point of Sale            | <span class="title-ref">l10n_sa_pos</span>            | Point of Sale compliance                                              |

## ZATCA e-invoices

The ZATCA e-invoicing system is designed to streamline and digitize the
invoicing process for businesses operating in Saudi Arabia.

<div class="seealso">

[ZATCA e-invoicing
page](https://zatca.gov.sa/en/E-Invoicing/Pages/default.aspx)

</div>

### Company information

Go to `Settings --> General Settings --> Companies`, click
`Update info`, and ensure the following company information is complete
and up-to-date.

- The full `Company Name`.
- All relevant `Address` fields, including the `Building Number` and
  `Plot Identification` (four digits each).
- Select an enterprise `Identification Scheme`. It is recommended to use
  the `Commercial Registration Number`.
- Enter the `Identification Number` for the selected
  `Identification Scheme`.
- The `VAT` number.
- Ensure the `Currency` is set to `SAR`.

> [!NOTE]
> It is also necessary to fill out similar information for partner
> companies.

### Simulation mode

> [!IMPORTANT]
> It is strongly recommended to thoroughly test all invoicing workflows
> using the Fatoora **simulation** portal first, as **any** invoice
> submitted to the regular Fatoora portal will be accounted for, which
> could lead to fines and penalties.

#### Fatoora simulation portal

Log in on the [Fatoora portal](https://fatoora.zatca.gov.sa/) using the
company's ZATCA credentials. Then, click the `Fatoora Simulation Portal`
button to switch to the simulation portal.

<div class="seealso">

[ZACTA Fatoora portal user manual version 3 (May
2023)](https://zatca.gov.sa/en/E-Invoicing/Introduction/Guidelines/Documents/Fatoora_Portal_User_Manual_English.pdf)

</div>

#### ZATCA API integration

On Odoo, go to `Accounting --> Configuration --> Settings`. Under `ZATCA
API Integration`, select the `Simulation (Pre-Production)` `API mode`
and click `Save`.

#### Sales journals

Each sales journal on Odoo needs to be configured. To do so, go to
`Accounting -->
Configuration --> Journals`, open any sales journal (e.g., Customer
Invoices), and go to the `ZATCA` tab. Once there, enter any
`Serial Number` to identify the journal.

> [!NOTE]
> The same serial number can be used for all of the company's sales
> journals.

Next, click `Onboard Journal`. In the dialog box, providing an
`OTP (one-time
password)` code is required. To retrieve it, open the [Fatoora
simulation portal](https://fatoora.zatca.gov.sa/), click
`Onboard New Solution Unit/Device`, choose the number of OTP codes to
generate (one per journal to configure), and click `Generate OTP
Code`. Copy an OTP code, it into the dialog box on Odoo, and click
`Request`.

> [!NOTE]
> OTP codes expire after one hour.

> [!TIP]
> If any issue occurs during onboarding, click `Regenerate CSR` to start
> again.

#### Testing

When confirming an invoice, there is now an option to process the
invoice, sending it directly the Fatoora simulation portal. Odoo
displays the portal's response after each submission. Only rejected
invoices can be reset to draft and edited on Odoo. Furthermore, at the
end of each day, Odoo sends all unprocessed invoices to the portal.

> [!TIP]
> - Testing all invoicing workflows, preferably with real invoices and
> for a reasonable amount of time, is recommended. - Compare the
> invoices received statistics page on the Fatoora simulation portal
> with the list of invoices on Odoo to ensure both align.

#### Taxes

When using a **0% tax** in a customer invoice, it is necessary to
specify the reason behind such a rate. To configure taxes, go to
`Accounting --> Configuration --> Settings -->
Taxes`, and open the tax to edit. Under the `Advanced Options`, select
an `Exemption Reason Code` and click `Save`.

When using **retention** or **withholding an amount** in a customer
invoice, the tax used to retain the amount needs to be specified.

### Production mode

When ready for production, change the `API mode <saudi-arabia/api-mode>`
to `Production` and click `Save`.

> [!WARNING]
> Setting the `API mode` to `Production` is **irreversible**.

The sales journals initially linked to the simulation portal now needs
to be linked to the regular portal. To do so,
`onboard the journals <saudi-arabia/journals>` again, ensuring to use
the regular [Fatoora portal](https://fatoora.zatca.gov.sa/) this time.
