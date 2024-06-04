# Australia

## Employment Hero Australian Payroll

The Employment Hero module synchronizes payslip accounting entries
(e.g., expenses, social charges, liabilities, taxes) from Employment
Hero to Odoo automatically. Payroll administration is still done in
Employment Hero. We only record the journal entries in Odoo.

> [!IMPORTANT]
> KeyPay was rebranded as **Employment Hero** in March 2023.

### Configuration

1.  `Activate <general/install>` the
    `Employment Hero Australian Payroll` module (technical name:
    <span class="title-ref">l10n_au_keypay</span>).

2.  Configure the **Employment Hero API** by going to
    `Accounting --> Configuration -->
    Settings`. More fields become visible after clicking on
    `Enable Employment Hero
    Integration`.

    ![Enabling Employment Hero Integration in Odoo Accounting displays new fields in the
    settings](australia/employment-hero-integration.png)

    - You can find the API Key in the `My Account` section of the
      Employment Hero platform.

      !["Account Details" section on the Employment Hero dashboard](australia/employment-hero-myaccount.png)

    - The **Payroll URL** is pre-filled with
      <span class="title-ref">https://keypay.yourpayroll.com.au</span>.
      *Please do not change it.*

    - You can find the **Business ID** in the Employment Hero URL.
      (i.e., <span class="title-ref">189241</span>)

      ![The Employment Hero "Business ID" number is in the URL](australia/employment-hero-business-id.png)

    - You can choose any Odoo journal to post the payslip entries.

### How does the API work?

The API syncs the journal entries from Employment Hero to Odoo and
leaves them in draft mode. The reference includes the Employment Hero
payslip entry ID in brackets for the user to easily retrieve the same
record in Employment Hero and Odoo.

![Example of a Employment Hero Journal Entry in Odoo Accounting (Australia)](australia/employment-hero-journal-entry.png)

By default, the synchronization happens once per week. You can fetch the
records manually by going to `Accounting --> Configuration --> Settings`
and, in the `Enable
Employment Hero Integration` option, click on `Fetch Payruns Manually`.

Employment Hero payslip entries also work based on double-entry
bookkeeping.

The accounts used by Employment Hero are defined in the section
`Payroll settings`.

![Chart of Accounts menu in Employment Hero](australia/employment-hero-chart-of-accounts.png)

For the API to work, you need to create the same accounts as the default
accounts of your Employment Hero business (**same name and same code**)
in Odoo. You also need to choose the correct account types in Odoo to
generate accurate financial reports.
