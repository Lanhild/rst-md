# Belgium

## Fiscal certification: POS restaurant

In Belgium, the owner of a cooking business such as a restaurant or food
truck is required by law to use a government-certified **Cash Register
System** for their receipts. This applies if their yearly earnings
(excluding VAT, drinks, and take-away food) exceed 25,000 euros.

This government-certified system entails the use of a `certified POS
system
<belgium/certified-pos>`, along with a device called a `Fiscal Data
Module <belgium/fdm>` (or **black box**) and a `VAT Signing Card
<belgium/vat>`.

<div class="important">

<div class="title">

Important

</div>

Do not forget to register as *foodservice industry manager* on the
[Federal Public Service Finance registration
form](https://www.systemedecaisseenregistreuse.be/fr/enregistrement).

</div>

### Certified POS system

The Odoo POS system is certified for the major versions of databases
hosted on **Odoo Online** and **Odoo.sh**. Please refer to the following
table to ensure that your POS system is certified.

|           | Odoo Online   | Odoo.sh       | On-Premise    |
| --------- | ------------- | ------------- | ------------- |
| Odoo 16.0 | Certified     | Certified     | Not certified |
| Odoo 15.2 | Not certified | Not certified | Not certified |
| Odoo 15.0 | Certified     | Certified     | Not certified |
| Odoo 14.0 | Certified     | Certified     | Not certified |

<div class="seealso">

`/administration/maintain/supported_versions`

</div>

A [certified POS
system](https://www.systemedecaisseenregistreuse.be/systemes-certifies)
must adhere to rigorous government regulations, which means it operates
differently from a non-certified POS.

  - On a certified POS, you cannot:
      - Make a refund.
      - Set up and use the **global discounts** feature (the
        <span class="title-ref">pos\_discount</span> module is
        blacklisted and cannot be activated).
      - Set up and use the **loyalty programs** feature (the
        <span class="title-ref">pos\_loyalty</span> module is
        blacklisted and cannot be activated).
      - Reprint receipts (the
        <span class="title-ref">pos\_reprint</span> module is
        blacklisted and cannot be activated).
      - Modify prices in order lines.
      - Modify or delete order lines in POS orders.
      - Sell products without a valid VAT number.
      - Use a POS that is not connected to an IoT box.
  - The `cash rounding
    <../../sales/point_of_sale/pricing/cash_rounding>` feature must be
    activated and set to a `Rounding Precision` of
    <span class="title-ref">0,05</span> and a `Rounding Method` set as
    `Half-Up`.
  - Taxes must be set as included in the price. To set it up, go to
    `Point of Sale -->
    Configuration --> Settings`, and from the `Taxes` section, open the
    `Default
    Sales Tax` form by clicking the arrow next to the default sales tax
    field. There, click `Advanced Options` and enable `Included in
    Price`.
  - At the start of a POS session, users must click `Work in` to clock
    in. Doing so allows the registration of POS orders. If users are not
    clocked in, they cannot make POS orders. Likewise, they must click
    `Work Out` to clock out at the end of the session.

<div class="warning">

<div class="title">

Warning

</div>

If you configure a POS to work with a black box, you cannot use it again
without it.

</div>

### The Fiscal Data Module

The `FDM (Fiscal Data Module)`, or [black
box](https://www.boîtenoire.be/fonctionnement), is a
government-certified device that works together with the Point of Sale
application and saves your POS orders information. Concretely, a
**hash** (`unique code`) is generated for each POS order and added to
its receipt. This allows the government to verify that all revenue is
declared.

<div class="note">

<div class="title">

Note

</div>

Ensure your black box is approved by the Belgian government. You can
check the compliance of your black box by visiting the [Federal Public
Service
Finance](https://www.systemedecaisseenregistreuse.be/systemes-certifies#FDM%20certifiés)
website.

</div>

#### Configuration

Before setting up your database to work with an FDM, ensure you have the
following hardware:

  - a registered `black box <belgium/blackbox>` (go to
    [www.boîtenoire.be](https://www.boîtenoire.be/ma-caisse/) to order
    yours);
  - an RS-232 serial null modem cable per FDM;
  - an RS-232 serial-to-USB adapter per FDM;
  - an `IoT Box <belgium/iotbox>` (one IoT box per black box); and
  - a receipt printer.

##### Black box module

As a pre-requisite, `activate <general/install>` the
<span class="title-ref">Belgian Registered Cash Register</span> module
(technical name: <span class="title-ref">pos\_blackbox\_be</span>).

![black box modules for belgian fiscal
certification](belgium/be-modules.png)

Once the module is activated, add your VAT number to your company
information. To set it up, go to `Settings --> Companies --> Update
Info`, and fill in the `VAT` field. Then, enter a national registration
number for every staff member who operates the POS system. To do so, go
to the `Employees` app and open an employee form. There, go to `HR
settings tab --> Attendance`, and fill in the `INSZ or BIS number`
field.

![ISNZ or BIS number field on employee form](belgium/bis-number.png)

<div class="tip">

<div class="title">

Tip

</div>

To input your information, click on your avatar, go to `My Profile -->
Preference
tab`, and enter your INSZ or BIS number in the designated field.

</div>

<div class="warning">

<div class="title">

Warning

</div>

You must configure the black box directly in the production database.
Utilizing it in a testing environment may result in incorrect data being
stored within the black box.

</div>

##### IoT Box

In order to use a Fiscal Data Module, you need a registered IoT Box. To
register your IoT box, you must contact us through our [support contact
form](https://www.odoo.com/help) and provide the following information:

  - your VAT number;
  - your company's name, address, and legal structure; and
  - the Mac address of your IoT Box.

Once your IoT box is certified, `connect
<../../productivity/iot/config/connect>` it to your database. To verify
that the IoT Box recognizes the FDM, go to the IoT homepage and scroll
down the `IOT Device` section, which should display the FDM.

![Hardware status page on a registered IoT Box](belgium/iot-devices.png)

Then, add the IoT to your POS. To do so, go to `Point of Sale -->
Configuration -->
Point of Sale`, select your POS, scroll down to the `Connected Device`
section, and enable `IoT Box`. Lastly, add the FMD in the `Fiscal Data
Module` field.

<div class="note">

<div class="title">

Note

</div>

To be able to use an FDM, you must at least connect one `Receipt
Printer`.

</div>

### VAT signing card

When you open a POS session and make your initial transaction, you are
prompted to enter the PIN provided with your `VSC (VAT signing card)`.
The card is delivered by the `FPS (Service
Public Federal Finances)` upon
[registration](https://www.systemedecaisseenregistreuse.be/fr/enregistrement).
