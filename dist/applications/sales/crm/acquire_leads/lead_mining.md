# Lead mining

Lead mining is a feature that allows CRM users to generate new leads
directly into their Odoo database. To ensure lead qualification, lead
mining output is determined by a variety of filtering criteria, such as
the country, the company size, and the industry.

## Configuration

To get started, go to `CRM --> Configuration --> Settings` and activate
`Lead Mining`.

<img src="lead_mining/activate-lead-mining.png" class="align-center"
alt="Activate lead mining in Odoo CRM settings." />

## Generate leads

After the `Lead Mining` setting is activated, a new button called
`Generate
Leads` is available to use in the `CRM` pipeline. Lead mining requests
are also available through
`CRM --> Configuration --> Lead Mining Requests`, or through
`CRM --> Leads --> Leads` where the `Generate Leads` button is also
available.

<img src="lead_mining/generate-leads-button.png" class="align-center"
alt="The Generate Leads button to use the lead mining feature." />

Click on the `Generate Leads` button, and a window will appear offering
a variety of criteria by which to generate leads.

<img src="lead_mining/generate-leads-popup.png" class="align-center"
alt="The pop-up window with the selection criteria in order to generate leads in Odoo." />

Choose to generate leads for `Companies` to get company information
only, or choose `Companies and their Contacts` to get company
information as well as individual employee contact information. When
targeting `Companies and their Contacts`, there is an option to filter
contacts based on `Role` or `Seniority`.

Additional filtering options include:

- `Size`: filter leads based on the number of employees at the company
- `Countries`: filter leads based on the country (or countries) they are
  located in
- `States`: further filter leads based on the state they are located in,
  if applicable
- `Industries`: filter leads based on the specific industry they work in
- `Sales Team`: choose which Sales Team the leads will be assigned to
- `Salesperson`: choose which person(s) on the Sales Team the leads will
  be assigned to
- `Default Tags`: choose which tags are applied directly to the leads
  once found

> [!NOTE]
> Make sure to be aware of the latest EU regulations when receiving
> contact information. Get more information about the General Data
> Protection Regulation on [Odoo GDPR](http://odoo.com/gdpr).

## Pricing

Lead mining is an *In-App Purchase* feature and each generated lead
costs one credit.

Choosing to generate `Companies and their Contacts` costs one additional
credit for each contact generated.

> [!NOTE]
> See here for full pricing information: [Lead Generation by Odoo IAP
> \<https://iap.odoo.com/iap/ in-app-services/167?\>]().

To buy credits, navigate to `CRM --> Configuration --> Settings`. In the
`Lead Generation` section, under the `Lead Mining` feature, click on
`Buy Credits`.

<img src="lead_mining/buy-lead-mining-credits-setting.png"
class="align-center" alt="Buy credits from the lead mining settings." />

Credits may also be purchased by navigating to the
`Settings --> General Settings`. In the `In-App Purchases` section,
under the `Odoo IAP` feature, click on `View My Services`.

<img src="lead_mining/view-my-services-setting.png" class="align-center"
alt="Buy credits in the Odoo IAP settings." />

> [!NOTE]
> Enterprise Odoo users with a valid subscription get free credits to
> test `IAP (In-App
> Purchase)` features before deciding to purchase more credits for the
> database. This includes demo/training databases, educational
> databases, and one-app-free databases.

<div class="seealso">

`/applications/essentials/in_app_purchase`

</div>
