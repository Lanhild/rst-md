# Devices and integrations

`VoIP (Voice over Internet Protocol)` can be used on many different
devices, such as a computer, tablet, mobile phone, and many more. This
is helpful in that it reduces costs, and employees can work from
anywhere in the world, so long as they have a broadband internet
connection.

Konvergo ERP *VoIP* is SIP (Session Initiation Protocol) compatible, which means
it can be used with *any* `SIP (Session Initiation Protocol)` compatible
application.

This document covers the process of setting up Konvergo ERP *VoIP* across
different devices and integrations.

Konvergo ERP is fully-integrated with all Konvergo ERP apps, allowing users to click
into any app, and schedule a call as an activity in the chatter.

<div class="example">

For example, in the *CRM* app, a user can click into an opportunity, and
click on `Activities` in the chatter.

Next, they can choose `Call`, and under `Due Date`, they can select a
date.

Once they click `Save`, an activity shows up in the chatter.

Should the `Due Date` be for today's date, the activity shows up in the
`VoIP
(Voice over Internet Protocol)` widget.

<img src="devices_integrations/crm-voip-widget.png" class="align-center"
alt="View of CRM leads and the option to schedule an activity for Konvergo ERP Discuss." />

</div>

## Konvergo ERP VoIP (laptop/desktop computer)

The Konvergo ERP *VoIP* (Voice over Internet Protocol) module and widget can be
used from any browser on a laptop or desktop device. Simply click on the
`☎️ (phone)` icon in the upper-right corner, while in the Konvergo ERP database,
and the widget appears.

<div class="seealso">

To see how to use the `VoIP (Voice over Internet Protocol)` widget on a
desktop/laptop computer, check out this documentation: `voip_widget`.

</div>

## Konvergo ERP VoIP (tablet/mobile device)

The Konvergo ERP *VoIP* app can be used on tablets and mobile phones, through
the Konvergo ERP Android or Apple IOS applications. Additionally, a mobile web
browser can be used to access the database.

> [!WARNING]
> Konvergo ERP Android and Apple IOS applications are no longer being maintained
> by Konvergo ERP on the Android and Apple portals. This means Konvergo ERP support only
> handles limited scopes of Konvergo ERP Android or Apple IOS support tickets.

> [!IMPORTANT]
> While outgoing calls can be placed using Konvergo ERP on a mobile device, be
> aware that Konvergo ERP is **not** a full
> `VoIP (Voice over Internet Protocol)` application, and does **not**
> ring on incoming calls. If the user needs to be reachable on a mobile
> device at all times, an app, like Zoiper, should be used. Apps like
> that stay connected in the background at all times.
>
> For more information, see this documentation: `voip/zoiper`.

While in the mobile application on a mobile device/tablet, access the
Konvergo ERP *VoIP* widget, by tapping on the `☎️ (phone)` icon in the
upper-right corner. The widget appears in the lower-left corner.

When first making a call from the tablet using the mobile application,
the user is prompted to `Allow` the database to use the microphone.
Click `Allow` when prompted to continue with the call using the
microphone.

This step is **necessary**, whether using the mobile Konvergo ERP application or
web browser.

<img src="devices_integrations/allow-mic.png" class="align-center"
alt="Allow the database to access the microphone." />

Konvergo ERP then asks how to make the call. The two options are : `VOIP` or
`Phone` (should the tablet be enabled for calling). Click the box next
to `Remember ?` should this decision be the default moving forward.

<img src="devices_integrations/voip-phone.png" class="align-center"
alt="Window prompt to choose whether to use VOIP or the devices phone to make the call." />

Here is the layout of what the Konvergo ERP *VoIP* app looks like on a mobile
device:

<img src="devices_integrations/voip-odoo-dashboard.png"
class="align-center"
alt="Layout of what the VoIP app looks like on the a mobile device." />

## Zoiper Lite

*Zoiper Lite* is a free `VoIP (Voice over Internet Protocol)`
`SIP (Session Initiation
Protocol)` dialer with voice and video.

To start using the *Zoiper* app, download it to the device, via the
[Zoiper download
page](https://www.zoiper.com/en/voip-softphone/download/current).

A mobile device is the most common installation, and this document
covers how to set up on the *Zoiper* IOS application. Screenshots and
steps may differ depending on the set up conditions.

After installing the *Zoiper* application on the mobile phone, open the
application, and tap on `Settings`. Navigate to `Accounts`, and tap on
the `+ (plus)` icon to add an account.

If the `VoIP (Voice over Internet Protocol)` account is already set up,
then click `Yes`. This means an account username and password has
already been produced.

<img src="devices_integrations/account-settings-zoiper-group.png"
class="align-center"
alt="Zoiper account setup, shown in the view from a mobile device." />

Next, tap on `Select a provider`. On the screen that populates, tap
`Country`, in the upper-right corner, to narrow the providers down to a
specific country. Choose the country for the provider that is being
configured, then find the `Provider`, and select it.

<div class="example">

If the provider being configured is *Axivox*, then select `Belgium`.
Then, choose `Axivox` as the provider.

</div>

<img src="devices_integrations/provider-zoiper-odoo.png"
class="align-center"
alt="Zoiper account setup, choosing the provider." />

Under `SIP (Session Initiation Protocol)` options, enter the
`Account name`, `Domain`, `Username`, and `Password`. All this
information varies, based on the account.

> [!TIP]
> To access this information, via the *Axivox* portal, navigate to
> `Users --> Choose
> user --> Edit --> SIP Identifiers tab`. The `SIP username`, `Domain`,
> `SIP password`, and `Address of the proxy server` are all present in
> this tab.

| Zoiper Field | Axivox Field      |
|--------------|-------------------|
| Account name | *Can be anything* |
| Domain       | Domain            |
| Username     | SIP username      |
| Password     | SIP password      |

Once this account information is entered, click the green `Register`
button at the top of the screen. Once the registration information is
checked, *Zoiper* populates a message, stating
`Registration Status: OK`.

At this point, *Zoiper* is now set up to make phone calls using the
`VoIP (Voice over Internet
Protocol)` service.

<img src="devices_integrations/sip-options-zoiper.png"
class="align-center"
alt="Zoiper account setup, registration successful." />

## Linphone

*Linphone* is an open-source `VoIP (Voice over Internet Protocol)`
`SIP (Session
Initiation Protocol)` softphone, used for voice, video, messaging (group
and individual), as well as conference calls.

To start using the *Linphone* app, download it to the device, via the
[Linphone download
page](https://new.linphone.org/technical-corner/linphone?qt-technical_corner=2#qt-technical_corner).

A mobile device is the most common installation, and this document
covers how to set up the *Linphone* IOS application. Screenshots and
steps may differ depending on the circumstances.

To begin configuring *Linphone* for use with a
`SIP (Session Initiation Protocol)` provider, first open *Linphone*, and
an assistant screen appears.

From this screen, select `Use SIP Account`. Then, on the following
screen, enter the `Username`, `Password`, `Domain`, and `Display Name`.
Once complete, press `Login`.

At this point, *Linphone* is ready to start making calls, once there is
a green button at the top of the application screen that reads,
`Connected`.

<img src="devices_integrations/linphone-odoo-setup.png"
class="align-center"
alt="Linphone account setup, registration successful." />

> [!TIP]
> *Linphone* makes a variety of applications for mobile and desktop
> devices in operating systems, such as Windows, Linux, Apple, and
> Android. Because *Linphone* is an open-source project, many new
> updates are released on a regular basis.
>
> See [Linphone's wiki-documentation
> page](https://wiki.linphone.org/xwiki/wiki/public/view/Linphone/).
