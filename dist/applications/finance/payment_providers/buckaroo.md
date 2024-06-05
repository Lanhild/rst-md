# Buckaroo

[Buckaroo](https://www.buckaroo.eu/) is a Dutch-based company that
offers several online payment possibilities.

## Configuration on Buckaroo Plaza

1.  Log into [Buckaroo Plaza](https://plaza.buckaroo.nl), go to
    `My Buckaroo -->
    Websites` and select the `Push settings` tab.
2.  Tick the `Enable Push Response` check box in the
    `Delayed and Push responses` section.
3.  Enter the URL of your Konvergo ERP database, followed by
    <span class="title-ref">/payment/buckaroo/webhook</span> in both the
    `Push URI Success/Pending` and `Push URI Failure` text fields. For
    example:
    <span class="title-ref">https://yourcompany.odoo.com/payment/buckaroo/webhook</span>.
4.  Leave the other fields as they are and click `Save`.
5.  In the `General` tab, copy the website `Key` (i.e., the key used to
    uniquely identify your website with Buckaroo) and save it for later.
6.  Go to `Configuration --> Security --> Secret key`, enter or
    `Generate` a `Secret key` and click `Save`. Save the key for later.

## Configuration on Konvergo ERP

1.  `Navigate to the payment provider Buckaroo <payment_providers/add_new>`
    and change its state to `Enabled`.
2.  In the `Credentials` tab, fill the `Website Key` and `Secret Key`
    fields with the values you saved at the step
    `payment_providers/buckaroo/configure_dashboard`.
3.  Configure the options in the other tabs to your liking.

<div class="seealso">

`../payment_providers`

</div>
