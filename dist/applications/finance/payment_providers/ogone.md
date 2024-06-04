# Ogone

[Ogone](https://www.ingenico.com/), also known as **Ingenico Payment
Services** is a France-based company that provides the technology
involved in secure electronic transactions.

<div class="seealso">

\- `payment_providers/add_new` - [Ogone's
documentation](https://epayments-support.ingenico.com/get-started/).

</div>

> [!WARNING]
> The provider Ogone is deprecated. It is recommended to use `stripe`
> instead.

## Settings in Ogone

### Create an API user

Log into your Ogone account and head to the `Configuration` tab.

You need to create an **API user** to be used in the creation of
transactions from Odoo. While you can use your main account to do so,
using an **API user** ensures that if the credentials used in Odoo are
leaked, no access to your Ogone configuration is possible. Additionally,
passwords for **API users** do not need to be updated regularly, unlike
normal users.

To create an **API user**, go to `Configuration --> Users` and click on
`New User`. The following fields must be configured:

<div id="ogone/ogone">

- `UserID`: you can choose anything you want.
- `User's Name, E-mail and Timezone`: you can enter the information you
  want.
- `Profile`: should be set to `Admin`.
- `Special user for API`: should be checked.

</div>

After the creation of the user, you are required to generate a password.
Save the password and **UserID**, as they will be required later on
during the setup.

> [!TIP]
> If you already have an user set up, make sure it is activated without
> any error. If not, simply click the `Activate(Errors)` button to reset
> the user.

### Set up Ogone for Odoo

Ogone must now be configured to accept payments from Odoo. Head to
`Configuration -->
Technical Information --> Global Security Parameters`, select `SHA-512`
as `Hash Algorithm` and `UTF-8` as `character encoding`. Then, go to the
`Data and Origin verification` tab of the same page and leave the URL
field of the `e-Commerce and Alias Gateway` section blank.

> [!TIP]
> If you need to use another algorithm, such as
> <span class="title-ref">sha-1</span> or
> <span class="title-ref">sha-256</span>, within Odoo, activate the
> `developer mode <developer-mode>` and go to the **Payment Providers**
> page in `Accounting --> Configuration --> Payment Providers`. Click on
> `Ogone`, and in the `Credentials` tab, select the algorithm you wish
> to use in the `Hash function` field.

You are now required to generate **SHA-IN** passphrases. **SHA-IN** and
**SHA-OUT** passphrases are used to digitally sign the transaction
requests and responses between Odoo and Ogone. By using these secret
passphrases and the <span class="title-ref">sha-1</span> algorithm, both
systems can ensure that the information they receive from the other was
not altered or tampered with.

Enter the same **SHA-IN** passphrase in both
`Checks for e-Commerce & Alias Gateway` and
`Checks for DirectLink and Batch (Automatic)`. You can leave the IP
address field blank.

Your **SHA-IN** and **SHA-OUT** passphrases should be different, and
between 16 and 32 characters long. Make sure to use the same **SHA-IN**
and **SHA-OUT** passphrases throughout the entire Ogone configuration,
as Odoo only allows a single **SHA-IN** and single **SHA-OUT**
passphrase.

In order to retrieve the **SHA-OUT** key, log into your Ogone account,
go to
`Configuration --> Technical Information --> Transaction feedback --> All
transaction submission modes`, and get or generate your **API Key** and
**Client Key**. Be careful to copy your API key as you’ll not be allowed
to get it later without generating a new one.

When done, head to
`Configuration --> Technical Information --> Transaction Feedback` and
check the following options:

- The `URL` fields for `HTTP redirection in the browser` can be left
  empty, as Odoo will specify these URLs for every transaction request.
- `I would like to receive transaction feedback parameters on the redirection URLs`:
  should be checked.
- `Direct HTTP server-to-server request`: should to be set to
  <span class="title-ref">Online but switch to a deferred request when
  the online request fails</span>.
- Both **URL** fields should contain the same following URL, with
  <span class="title-ref">\<example\></span> replaced by your database:
  <span class="title-ref">https://\<example\>/payment/ogone/return</span>.
- `Dynamic eCommerce Parameters` should contain the following values:
  <span class="title-ref">ALIAS</span>,
  <span class="title-ref">AMOUNT</span>,
  <span class="title-ref">CARDNO</span>,
  <span class="title-ref">CN</span>,
  <span class="title-ref">CURRENCY</span>,
  <span class="title-ref">IP</span>,
  <span class="title-ref">NCERROR</span>
  <span class="title-ref">ORDERID</span>,
  <span class="title-ref">PAYID</span>,
  <span class="title-ref">PM</span>,
  <span class="title-ref">STATUS</span>,
  <span class="title-ref">TRXDATE</span>. Other parameters can be
  included (if you have another integration with Ogone that requires
  them), but are not advised.
- In the `All transaction submission modes` section, fill out
  **SHA-OUT** passphrase and disable <span class="title-ref">HTTP
  request for status change</span>.

To allow your customers to save their credit card credentials for future
use, head to `Configuration --> Alias --> My alias information`. From
this tab, you can configure how the user can have its card details
saved, for how long the information is saved, if a checkbox to save the
card information should be displayed, etc.

## Settings in Odoo

To set up Ogone in Odoo, head to
`Accounting --> Configuration --> Payment Providers` and open the Ogone
provider. In the `Credentials` tab, enter the **PSPID** of your Ogone
account, and fill out the other fields as configured in your
`Ogone portal <ogone/ogone>`.
