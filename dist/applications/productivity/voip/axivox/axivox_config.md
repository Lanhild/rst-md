# VoIP services in Odoo with Axivox

## Introduction

Odoo VoIP (Voice over Internet Protocol) can be set up to work together
with [Axivox](https://www.axivox.com/). In that case, an Asterisk server
is **not** necessary, as the infrastructure is hosted and managed by
Axivox.

To use this service, [contact Axivox](https://www.axivox.com/contact/)
to open an account. Before doing so, verify that Axivox covers the
company's area, along with the areas the company's users wish to call.

## Configuration

To configure Axivox in Odoo, go to the `Apps` application, and search
for <span class="title-ref">VoIP</span>. Then, install the `VoIP`
module.

Next, go to
`Settings app --> General Settings --> Integrations section`, and fill
out the `Asterisk (VoIP)` field:

- `OnSIP Domain`: set the domain created by Axivox for the account
  (e.g., <span class="title-ref">yourcompany.axivox.com</span>)
- `WebSocket`: type in
  <span class="title-ref">wss://pabx.axivox.com:3443</span>
- `VoIP Environment`: set as `Production`

<img src="axivox_config/voip-configuration.png" class="align-center"
alt="Integration of Axivox as VoIP provider in an Odoo database." />

> [!TIP]
> Access the domain on the Axivox administrative panel by navigating to
> <https://manage.axivox.com/>. After logging into the portal, go to
> `Users -->
> Edit (next to any user) --> SIP Identifiers tab --> Domain`.

### Configure VoIP user in Odoo

Next, the user is configured in Odoo, which **must** take place for
every Axivox/Odoo user using VoIP.

In Odoo, go to `Settings app --> Users & Companies --> Users`, then open
the desired user's form to configure
`VoIP (Voice over Internet Protocol)`. Under the `Preferences` tab, fill
out the `VOIP Configuration` section:

- `VoIP username` / `Browser's Extension`: (Axivox) `SIP username`
- `VoIP Secret`: (Axivox) `SIP Password`
- `External device number`: SIP external phone extension
- `How to place calls on mobile`: method to make calls on a mobile
  device
- `OnSIP Auth User`: (Axivox) `SIP username`
- `Call from another device`: option to always transfer phone calls to
  handset
- `Reject All Incoming Calls`: option to reject all incoming calls

<img src="axivox_config/odoo-user.png" class="align-center"
alt="Integration of Axivox user in the Odoo user preference." />

> [!TIP]
> Access the domain on the Axivox administrative panel by navigating to
> <https://manage.axivox.com/>. After logging into the portal, go to
> `Users -->
> Edit (next to the user) --> SIP Identifiers tab --> SIP username / SIP password`.
>
> <img src="axivox_config/manager-sip.png" class="align-center"
> alt="SIP credentials in the Axivox manager." />

> [!IMPORTANT]
> When entering the `SIP Password` into the user's `Preferences` tab,
> this value **must** be typed out manually and **not** pasted in.
> Pasting in causes a <span class="title-ref">401 server rejection
> error</span>.
