# Flashing the SD card

In some circumstances, the `IoT (Internet of Things)` box's micro SD
Card may need to be re-flashed to benefit from Odoo's latest `IoT
(Internet of Things)` image update. This means that the Odoo `IoT
(Internet of Things)` box software may need to be updated.

## Upgrade from the IoT box home page

Go to the `IoT (Internet of Things)` box homepage by navigating to `IoT
app -->
IoT Boxes` and clicking on the `IP address` of the `IoT (Internet of
Things)` box. Then click on `Update` (next to the version number).

If a new version of the `IoT (Internet of Things)` Box image is
available, an `Upgrade to _xx.xx_` button will appear at the bottom of
the page. Click this button to upgrade the unit and the `IoT (Internet
of Things)` box will then flash itself to the new version. All of the
previous configurations will be saved.

<div class="note">

<div class="title">

Note

</div>

This process can take more than 30 minutes. Do not turn off or unplug
the `IoT (Internet of
Things)` box as it would leave it in an inconsistent state. This means
that the `IoT
(Internet of Things)` box will need to be re-flashed with a new image.
See `flash_sdcard/etcher`.

</div>

![IoT box software upgrade in the IoT Box Home
Page.](flash_sdcard/flash-upgrade.png)

## Upgrade with Etcher Software

<div class="note">

<div class="title">

Note

</div>

A computer with a micro SD card reader/adapter is required in order to
re-flash the micro SD card.

</div>

Navigate to Balena's website and download
[Etcher](https://www.balena.io/). It's a free and open-source utility
used for burning image files onto drives. Click to
[download](https://www.balena.io/etcher#download-etcher). Install and
launch the program on the computer.

Then download the version-specific `IoT (Internet of Things)` image from
[nightly](http://nightly.odoo.com/master/iotbox/).

The following are image versions on the
[nightly](http://nightly.odoo.com/master/iotbox/) website with their
corresponding Odoo database version:

  - Odoo V16 --\> iotbox-latest.zip
  - Odoo V15 --\> iotboxv21\_10.zip
  - Odoo V14 --\> iotboxv21\_04.zip
  - Odoo V13 --\> iotboxv20\_10.zip

The images should be downloaded and extracted to a convenient file
location.

After this step is complete, insert the `IoT (Internet of Things)` box's
micro SD card into the computer or reader. Open *Etcher* and select
`Flash from file`, then find and select the image just downloaded and
extracted. Next, select the drive the image should be burned to. Lastly,
click on `Flash` and wait for the process to finish.

![Balena's Etcher software dashboard.](flash_sdcard/etcher-app.png)

<div class="note">

<div class="title">

Note

</div>

An alternative software for flashing the micro SD card is *Raspberry Pi
Imager*. Download the *Raspberry Pi* software
[here](https://www.raspberrypi.com/software/).

</div>
