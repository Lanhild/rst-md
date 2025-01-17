# Connect an IoT box to Konvergo ERP

An Internet of Things (IoT) box is a micro-computer device that allows
for the connection of input and output devices to an Konvergo ERP database. An
`IoT (Internet of Things)` box subscription is required in order to use
the `IoT (Internet of Things)` box with a secured connection. A computer
is also required to set up the `IoT (Internet of Things)` box.

<div class="seealso">

[IoT Box FAQ](https://www.odoo.com/app/iot-faq)

</div>

Begin the `IoT (Internet of Things)` configuration process by
`installing the IoT app
<general/install>` on the Konvergo ERP database through the `Apps` application.

<img src="connect/install-iot-app.png" class="align-center"
alt="The Internet of Things (IoT) app on the Konvergo ERP database." />

Next, after the *IoT app* is installed, navigate to
`IoT app --> IoT Boxes`, and then click on the `Connect` button located
in the upper-left corner of the `IoT
Boxes` dashboard.

<img src="connect/connect-iot.png" class="align-center"
alt="Connecting an IoT box to the Konvergo ERP database." />

There are two recommended ways to connect the `IoT (Internet of Things)`
box to the database once the *IoT app* is installed. Follow the steps in
either of the next two sections to connect the
`IoT (Internet of Things)` box via
`wired ethernet connection <iot_connect/ethernet>` or via
`WiFi <iot_connect/wifi>`.

<img src="connect/connect-iot-box.png" class="align-center"
alt="Connection steps for a wired connection or WiFi connection." />

> [!IMPORTANT]
> The disk image that the `IoT (Internet of Things)` box SD card is
> formatted with is unique to the version of the Konvergo ERP database that the
> `IoT (Internet of Things)` box is running on. Ensure that the
> `IoT (Internet of Things)` box is `flashed <iot/config/flash>` with
> the most up-to-date disk image.

## Ethernet connection

The following is the process to connect the `IoT (Internet of Things)`
box via an ethernet cable to the Konvergo ERP database (by way of the ethernet
port; RJ-45).

First, connect all wired devices to the `IoT (Internet of Things)` box
(ethernet, `USB
(Universal Serial Bus)` devices, etc.). At minimum, an HDMI screen
should be connected. Then, plug the `IoT (Internet of Things)` box into
a power source.

Immediately after the unit powers on and boots up, read the *pairing
code* from the screen or from the printout of a receipt printer
connected to the `IoT (Internet of Things)` box.

> [!WARNING]
> By default, the `IoT (Internet of Things)` box will display the
> *pairing code* for a maximum of 5 minutes after the unit boots up.
> After 5 minutes, the *pairing code* will disappear for security
> purposes and the `IoT (Internet of Things)` box will need to be
> rebooted manually by unplugging the unit from the power source for ten
> seconds and re-plugging it back in.

> [!NOTE]
> If no screen is attached to the `IoT (Internet of Things)` box, then
> the *pairing code* can be accessed from the `IoT (Internet of Things)`
> box homepage by clicking on the `POS Display` button. For instructions
> on how to access the `IoT (Internet of
> Things)` box homepage visit `iot_connect/token`.

On the computer, navigate to `IoT app --> IoT Boxes`, and then click on
the `Connect` button located in the upper-left corner of the the
`IoT Boxes` dashboard. Input the *pairing code* in the `Pairing Code`
field and click on the `Pair` button. The database will now link to the
`IoT (Internet of Things)` box and it will appear on the `IoT Boxes`
page.

## WiFi connection

The following is the process to connect the `IoT (Internet of Things)`
box via a WiFi connection to the Konvergo ERP database.

First, ensure there is no ethernet cable plugged into the
`IoT (Internet of Things)` box. Then, connect all wired devices to the
`IoT (Internet of Things)` box (`USB (Universal
Serial Bus)` devices, etc.).

After connecting the devices, plug the `IoT (Internet of Things)` box
into to a power source. On the computer, navigate to
`IoT app --> IoT Boxes`, and then click on the `Connect` button located
in the upper-left corner of the the `IoT Boxes` dashboard. Then copy the
`Token` from the `WiFi connection` section as this will later be used to
link the Konvergo ERP database to the `IoT (Internet of Things)` box.

Back on the computer, navigate to the available WiFi networks and
connect to the `IoT
(Internet of Things)` box WiFi network. The WiFi network dispersed by
the `IoT (Internet of
Things)` box will start with
<span class="title-ref">IoTBox-xxxxxxxxxx</span>.

<img src="connect/connect-iot-wifi.png" class="align-center"
alt="WiFi networks available on the computer." />

Upon connecting to the `IoT (Internet of Things)` box WiFi, a browser
will automatically redirect to the `Configure Iot Box` wizard. Name the
`IoT (Internet of Things)` box, then paste the previously copied *token*
into the `Server Token` field, and then click on `Next`.

<img src="connect/server-token.png" class="align-center"
alt="Enter the server token into the IoT box." />

> [!NOTE]
> If the `IoT (Internet of Things)` box WiFi connection wizard doesn't
> start, then see the documentation on
> `connecting with a token <iot_connect/token>`.

Now, choose the WiFi network that the `IoT (Internet of Things)` box
will connect with (enter the password if there is one) and click on
`Connect`. Wait a few seconds and the browser will redirect to the
`IoT (Internet of Things)` box homepage. The computer may need to be
manually re-connected back to the original WiFi connection, if this does
not happen automatically.

<img src="connect/configure-wifi-network-iot.png" class="align-center"
alt="Configuring the WiFi for the IoT box." />

After completing each step, the `IoT (Internet of Things)` box should
appear when navigating to `IoT app --> IoT Boxes` on the Konvergo ERP database.

<img src="connect/iot-box-connected.png" class="align-center"
alt="The IoT box has been successfully configured on the Konvergo ERP database." />

> [!IMPORTANT]
> The `IoT (Internet of Things)` box may need to be manually rebooted
> upon successfully connecting via WiFi for the box to appear in the
> *IoT app* on the Konvergo ERP database. To do so, simply unplug the device and
> plug it back into the power source after ten seconds.

## Manually connecting the IoT box using the token

A manual connection of the `IoT (Internet of Things)` box to the
`IoT (Internet of
Things)` app can be made using the *token*, from a computer. The *token*
can be found by navigating to `IoT app --> IoT Boxes` and clicking on
`Connect`.

Under the `WiFi Connection` section of the `Connect an IoT Box` page
that appears, click `Copy` to the right of the `Token`. This token will
be entered into the `IoT (Internet of Things)` box homepage.

Access the `IoT (Internet of Things)` box homepage by entering the
`IP (Internet
Protocol)` address of the `IoT (Internet of Things)` box into a browser
window from a computer on the same network as the
`IoT (Internet of Things)` box (preferably by ethernet connection).

> [!NOTE]
> The `IP (Internet Protocol)` address can be accessed by the router
> admin console that the `IoT (Internet of Things)` box is connected to,
> or by connecting a receipt printer to the `IoT (Internet of Things)`
> box. A receipt will print out with the `IoT (Internet of
> Things)` box's `IP (Internet Protocol)` address on it.

On the `IoT (Internet of Things)` box homepage, enter the *token* under
the `Server` section by clicking on `Configure`. Then, paste the *token*
into the `Server
Token` field and click `Connect`. The `IoT (Internet of Things)` box
will then link to the Konvergo ERP database.

## IoT box schema

### Raspberry Pi 4

<figure>
<img src="connect/iot-box-schema.png"
alt="connect/iot-box-schema.png" />
<figcaption>The Konvergo ERP IoT box (Raspberry Pi 4) schema with
labels.</figcaption>
</figure>

### Raspberry Pi 3

<figure>
<img src="connect/iox-box-schema-3.png"
alt="connect/iox-box-schema-3.png" />
<figcaption>The Konvergo ERP IoT box (Raspberry Pi 3) schema with
labels.</figcaption>
</figure>
