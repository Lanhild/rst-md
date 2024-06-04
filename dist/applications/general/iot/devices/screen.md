# Connect a screen

In Odoo, an `IoT (Internet of Things)` box can be connected to a screen
display. After being configured, the screen can be used to display a
Point of Sale (PoS) order to a client.

<figure>
<img src="screen/screen-pos-client-display.png"
alt="screen/screen-pos-client-display.png" />
<figcaption>An example of a PoS (point of sale) order on a screen
display.</figcaption>
</figure>

Access the customer display by going to the `IoT (Internet of Things)`
box homepage and clicking on the `PoS Display` button. To get to the
`IoT (Internet of Things)` box homepage, navigate to
`IoT app --> IoT Boxes` and click on the `IoT (Internet
of Things)` box homepage link.

## Connection

The way to connect the screen display to the `IoT (Internet of Things)`
box differs depending on the model.

<div class="tabs">

<div class="tab">

IoT Box model 4

Connect up to two screens with micro-HDMI cables on the side of the
`IoT (Internet of
Things)` box. If two screens are connected, they can display distinct
content (see `Screen Usage <iot/usage_screen>`).

</div>

<div class="tab">

IoT Box model 3

Connect the screen with an HDMI cable on the side of the
`IoT (Internet of Things)` box.

</div>

</div>

<div class="seealso">

`See the Raspberry Pi Schema <iot/connect_schema>`.

</div>

> [!IMPORTANT]
> Screen(s) should be connected before the `IoT (Internet of Things)`
> box is switched on. If it is already on, connect the screen(s), and
> then restart the `IoT (Internet of Things)` box by unplugging it for
> ten seconds and plugging it back into its power source.

> [!WARNING]
> The usage of HDMI/micro-HDMI adapters may cause issues which will
> result in a blank, black screen on the screen display. Using the
> specific cable for the display connection is recommended.

If the connection was successful, the screen should display the
`POS Client display` screen.

<img src="screen/screen-pos-client-display-no-order.png"
class="align-center"
alt="The default &quot;POS Client Display&quot; screen that appears when a screen display is successfully
connected to an IoT box." />

The screen should also appear in the list of `Displays` on the
`IoT (Internet of
Things)` box homepage. Alternatively, the display can be seen by
accessing `IoT app
--> Devices`.

<img src="screen/screen-screen-name-example.png" class="align-center"
alt="An example of a screen display name shown on the IoT Box Home Page." />

> [!NOTE]
> If no screen is detected, a default display named `Distant Display`
> will be displayed instead. This indicates that there is no hardware
> screen connected.
>
> <img src="screen/screen-no-screen.png" class="align-center"
> alt="The &quot;Distant Display&quot; screen name will be used if no screen is detected." />

## Usage

### Show Point of Sale orders to customers

To use the screen in the *Point of Sale app*, go to `Point of Sale -->
Configuration --> Point of Sale`, select a `PoS (Point of Sale)`, click
`Edit` if necessary, and enable the `IoT Box` feature.

Next, select the screen from the `Customer Display` drop-down menu. Then
click `Save`, if required.

<img src="screen/screen-pos-screen-config.png" class="align-center"
alt="Connect the screen display to the Point of Sale app." />

The screen is now available for `PoS (Point of Sale)` sessions. A screen
icon will appear in the menu at the top of the screen to indicate the
screen's connection status.

<img src="screen/screen-pos-icon.png" class="align-center"
alt="The &quot;screen&quot; icon on the Point of Sale display shows the connection status with the
screen." />

The screen will automatically show the `PoS (Point of Sale)` orders and
update when changes are made to the order.

<img src="screen/screen-pos-client-display.png" class="align-center"
alt="An example of a PoS order on a screen display." />

### Display a website on the screen

Open the screen form view by accessing
`IoT app --> Devices --> Customer Display`. This allows the user to
choose a particular website URL to display on the screen using the
`Display URL` field.
