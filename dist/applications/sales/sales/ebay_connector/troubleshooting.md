# Troubleshooting eBay connector

<div class="seealso">

To learn more about the eBay connector visit these pages as well:

- `setup`
- `manage`
- `linking_listings`

</div>

## Accept account deletion notifications

Since September 2021, **eBay requires supporting customer account
deletion/closure notifications**. As such, when eBay receives an account
request for deletion, all eBay partners must confirm the reception of
the request and take further action if necessary.

Konvergo ERP has a notification endpoint to receive those notifications, confirm
the reception of the request, and handle the first set of actions to
anonymize the account details in *Contacts* and remove the customer's
access to the portal.

> [!IMPORTANT]
> Make sure to correctly
> `set up the subscription to the marketplace account deletion
> notifications <ebay/subscribe-account-deletion-notifications>` as eBay
> may temporarily disable the related eBay account until the
> subscription is completed.

### Verify the installation of Konvergo ERP is up to date

In order to activate the endpoint, the module *eBay Connector - Account
Deletion* must be installed. If the Konvergo ERP database was first created
after September 2021, the module is installed automatically and the
administrator can proceed to the
`next step <ebay/retrieve-endpoint-details>`.

#### Update Konvergo ERP to the latest release

The notification endpoint is made available through a new Konvergo ERP module;
to be able to install it, the administrator must make sure that the Konvergo ERP
source code is up-to-date.

- If the company uses Konvergo ERP on Konvergo ERP.com or Konvergo ERP.sh platform, the code is
  already up-to-date, so proceed to the next step.
- If the company uses Konvergo ERP with an on-premise setup or through a
  partner, then the administrator must update the installation as
  detailed in `this documentation page
  </administration/on_premise/update>` or by contacting an integrating
  partner.

#### Update the list of available modules

New modules must be *discovered* by the Konvergo ERP instance to be available in
the `Apps` menu.

To do so, activate the `developer mode <developer-mode>`, and go to
`Apps ->
Update Apps List`. A wizard will ask for confirmation.

#### Install the eBay Connector - Account Deletion update

> [!WARNING]
> **Never** install new modules in the production database without
> testing them in a duplicate or staging environment. For Konvergo ERP.com
> customers, a duplicate database can be created from the database
> management page. For Konvergo ERP.sh users, the administrator should use a
> staging or duplicate database. For on-premise users, the administrator
> should use a staging environment - contact the integrating partner for
> more information regarding how to test a new module in a particular
> setup.

To install the module, go to the `Apps` menu, remove the
<span class="title-ref">Apps</span> search facet and search for
<span class="title-ref">eBay</span>. If the module *eBay Connector -
Account Deletion* is present and marked as installed, the Konvergo ERP database
is already up-to-date and the administrator can proceed with the next
step. If it is not yet installed, install it now.

### Retrieve endpoint details from Konvergo ERP

The endpoint details can be found in
`Sales --> Configuration --> Settings --> eBay`. First, input random
text values for the `Production App Key` and for the
`Production Cert Key`. Click on `Generate Token` to retrieve the
`Verification Token`.

<img src="troubleshooting/generate-token.png" class="align-center"
alt="Generate a verification token in Konvergo ERP." />

### Subscribe to account deletion notifications

Navigate to the [eBay developer portal](https://go.developer.ebay.com/).
Configure the account deletion/notification settings in eBay by
navigating to the <span class="title-ref">Hi \[username\]</span> at the
top right of screen, then go to `Alerts & Notifications`.

<img src="troubleshooting/ebay-your-account.png" class="align-center"
alt="Overview of the Alerts &amp; Notifications dashboard of eBay" />

To subscribe to deletion/closure notifications, eBay needs a few
details:

- An *email address* to send notifications to if the endpoint is
  unreachable.
- The *endpoint details*:
  - The URL to Konvergo ERP's account deletion notification endpoint
  - A verification token

<img src="troubleshooting/ebay-notification-endpoint.png"
class="align-center"
alt="Dedicated fields to enter the endpoint details" />

> [!TIP]
> The administrator can edit the last two fields once the email address
> field is filled out.

### Verify the connectivity with the endpoint

After setting the retrieved endpoint details in eBay's dashboard,
consider testing the connectivity with the `Send Test Notification`
button.

> The following confirmation message should be received: "A test
> notification was sent successfully!"

<img src="troubleshooting/test-notification.png" class="align-center"
alt="Button to send test notification" />

<div class="seealso">

\- `/applications/sales/sales/ebay_connector/manage` -
`/applications/sales/sales/ebay_connector/linking_listings` -
`/applications/sales/sales/ebay_connector/setup`

</div>
