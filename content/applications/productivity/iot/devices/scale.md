# Connect a scale

A scale can be connected to the `IoT (Internet of Things)` box on an
Odoo database in a few easy steps. After setup, the *Point of Sale* app
can be used to weigh products, which is helpful if their prices are
calculated based on weight.

## Connection

To link the scale to the `IoT (Internet of Things)` box, connect it with
a `USB
(Universal Serial Bus)` cable.

<div class="note">

<div class="title">

Note

</div>

In some cases, a serial port to `USB (Universal Serial Bus)` adapter may
be needed.

</div>

If the scale is [compatible with Odoo IoT
Box](https://www.odoo.com/page/iot-hardware), there is no need to set up
anything because it will be automatically detected as soon as it is
connected.

![IOT box auto detection.](scale/iot-choice.png)

The `IoT (Internet of Things)` box may need to be restarted and the
scale's drivers may need to be downloaded to the box in some cases. To
update the drivers, go to the `IoT (Internet of
Things)` box homepage and click on `Drivers List`. Then, click on `Load
Drivers`.

![View of the IoT box settings and driver list.](scale/driver-list.png)

If loading the drivers still doesn't allow for the scale to function, it
may be that the scale is not compatible with the Odoo `IoT (Internet of
Things)` box. In this case, a different scale will need to be used.

## Use a scale in a point of sale (POS) system

To use the scale in the *Point of Sale app*, go to `PoS app --> 3-Dot
Menu on the PoS
--> Settings`, then enable the `IoT (Internet of Things)` box feature.
After this is complete, the scale device can be set.

Select the scale from the `Electronic Scale` drop-down menu. Then click
`Save` to save the changes, if required.

![List of the external tools that can be used with PoS and the IoT
box.](scale/electronic-scale-feature.png)

The scale is now available in all the `PoS (Point of Sale)` sessions.
Now, if a product has a price per weight set, clicking on it on the
`PoS` screen opens the scale screen, where the cashier can weigh the
product and add the correct price to the cart.

![Electronic Scale dashboard view when no items are being
weighed.](scale/scale-view.png)
