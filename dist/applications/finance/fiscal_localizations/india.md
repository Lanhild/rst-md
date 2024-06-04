# India

## Installation

`Install <general/install>` the following modules to get all the
features of the Indian localization:

| Name                            | Technical name                                      | Description                                                           |
|---------------------------------|-----------------------------------------------------|-----------------------------------------------------------------------|
| `Indian - Accounting`           | <span class="title-ref">l10n_in</span>              | Default `fiscal localization package <fiscal_localizations/packages>` |
| `Indian E-invoicing`            | <span class="title-ref">l10n_in_edi</span>          | `Indian e-invoicing integration <india/e-invoicing>`                  |
| `Indian E-waybill`              | <span class="title-ref">l10n_in_edi_ewaybill</span> | `Indian E-way bill integration <india/e-waybill>`                     |
| `Indian - GSTR India eFiling`   | <span class="title-ref">l10n_in_reports_gstr</span> | `Indian GST Return filing <india/gstr>`                               |
| `Indian - Accounting Reports`   | <span class="title-ref">l10n_in_reports</span>      | `Indian tax reports <india/gstr_reports>`                             |
| `Indian - Purchase Report(GST)` | <span class="title-ref">l10n_in_purchase</span>     | Indian GST Purchase report                                            |
| `Indian - Sale Report(GST)`     | <span class="title-ref">l10n_in_sale</span>         | Indian GST Sale report                                                |
| `Indian - Stock Report(GST)`    | <span class="title-ref">l10n_in_stock</span>        | Indian GST Stock report                                               |

![Indian localization modules](india/india-modules.png)

## e-Invoice system

Odoo is compliant with the **Indian Goods and Services Tax (GST)
e-Invoice system** requirements.

### Setup

#### NIC e-Invoice registration

You must register on the `NIC (National Informatics Centre)` e-Invoice
portal to get your **API credentials**. You need these credentials to
`configure your Odoo Accounting app
<india/e-invoicing-configuration>`.

1.  Log in to the [NIC e-Invoice portal](https://einvoice1.gst.gov.in/)
    by clicking `Login` and entering your `Username` and `Password`;

    > [!NOTE]
    > If you are already registered on the NIC portal, you can use the
    > same login credentials.

    ![Register Odoo ERP system on e-invoice web portal](india/e-invoice-system-login.png)

2.  From the dashboard, go to
    `API Registration --> User Credentials --> Create API
    User`;

3.  After that, you should receive an `OTP (one-time password)` code on
    your registered mobile number. Enter the OTP code and click
    `Verify OTP`;

4.  Select `Through GSP` for the API interface, set
    `Tera Software Limited` as GSP, and type in a `Username` and
    `Password` for your API. Once it is done, click `Submit`.

    ![Submit API specific Username and Password](india/submit-api-registration-details.png)

#### Configuration in Odoo

To enable the e-Invoice service in Odoo, go to
`Accounting --> Configuration -->
Settings --> Indian Electronic Invoicing`, and enter the `Username` and
`Password` previously set for the API.

![Setup e-invoice service](india/e-invoice-setup.png)

##### Journals

To automatically send e-Invoices to the NIC e-Invoice portal, you must
first configure your *sales* journal by going to
`Accounting --> Configuration --> Journals`, opening your *sales*
journal, and in the `Advanced Settings` tab, under `Electronic Data
Interchange`, enable `E-Invoice (IN)` and save.

### Workflow

#### Invoice validation

Once an invoice is validated, a confirmation message is displayed at the
top. Odoo automatically uploads the JSON-signed file of validated
invoices to the NIC e-Invoice portal after some time. If you want to
process the invoice immediately, click `Process now`.

![Indian e-invoicing confirmation message](india/e-invoice-process.png)

> [!NOTE]
> - You can find the JSON-signed file in the attached files in the
> chatter. - You can check the document's
> `EDI (electronic data interchange)` status under the `EDI Document`
> tab or the `Electronic invoicing` field of the invoice.

#### Invoice PDF report

Once an invoice is validated and submitted, the invoice PDF report can
be printed. The report includes the `IRN (Invoice Reference Number)`,
`Ack. No` (acknowledgment number) and `Ack. Date` (acknowledgment date),
and QR code. These certify that the invoice is a valid fiscal document.

![IRN and QR code](india/invoice-report.png)

#### e-Invoice cancellation

If you want to cancel an e-Invoice, go to the `Other info` tab of the
invoice and fill out the `Cancel reason` and `Cancel remarks` fields.
Then, click `Request
EDI cancellation`. The status of the `Electronic invoicing` field
changes to `To
Cancel`.

> [!IMPORTANT]
> Doing so cancels both the `e-Invoice <india/e-invoicing>` and the
> `E-Way bill
> <india/e-waybill>`.

![cancel reason and remarks](india/e-invoice-cancellation.png)

> [!NOTE]
> - If you want to abort the cancellation before processing the invoice,
> then click `Call
> Off EDI Cancellation`. - Once you request to cancel the e-Invoice,
> Odoo automatically submits the JSON-signed file to the NIC e-Invoice
> portal. You can click `Process now` if you want to process the invoice
> immediately.

#### GST e-Invoice verification

After submitting an e-Invoice, you can verify if the invoice is signed
from the GST e-Invoice system website itself.

1.  Download the JSON file from the attached files. It can be found in
    the chatter of the related invoice;

2.  Open the [NIC e-Invoice portal](https://einvoice1.gst.gov.in/) and
    go to `Search --> Verify Signed Invoice`;

3.  Select the JSON file and submit it;

    ![select the JSON file for verify invoice](india/verify-invoice.png)

    If the file is signed, a confirmation message is displayed.

    ![verified e-invoice](india/signed-invoice.png)

## E-Way bill

### Setup

Odoo is compliant with the **Indian Goods and Services Tax (GST)
E-waybill system** requirements.

#### API registration on NIC E-Way bill

You must register on the `NIC (National Informatics Centre)` E-Way bill
portal to create your **API credentials**. You need these credentials to
`configure your Odoo Accounting app
<india/e-waybill-configuration>`.

1.  Log in to the [NIC E-Way bill portal](https://ewaybillgst.gov.in/)
    by clicking `Login` and entering your `Username` and `Password`;

2.  From your dashboard, go to `Registration --> For GSP`;

3.  Click `Send OTP`. Once you have received the code on your registered
    mobile number, enter it and click `Verify OTP`;

4.  Check if `Tera Software Limited` is already on the registered
    GSP/ERP list. If so, use the username and password used to log in to
    the NIC portal. Otherwise, follow the next steps;

    ![E-Way bill list of registered GSP/ERP](india/e-waybill-gsp-list.png)

5.  Select `Add/New`, select `Tera Software Limited` as your GSP Name,
    create a `Username` and a `Password` for your API, and click `Add`.

    ![Submit GSP API registration details](india/e-waybill-registration-details.png)

#### Configuration in Odoo

To set up the E-Way bill service, go to
`Accounting --> Configuration --> Settings
--> Indian Electronic WayBill --> Setup E-Way bill`, and enter your
`Username` and `Password`.

![E-way bill setup odoo](india/e-waybill-configuration.png)

### Workflow

#### Send an E-Way bill

You can manually send an E-Way bill by clicking `Send E-Way bill`. To
send the E-Way bill automatically when an invoice or a bill is
confirmed, enable `E-Way bill (IN)` in your
`Sales or Purchase journal <india/e-invoicing-journals>`.

![Send E-waybill button on invoices](india/e-waybill-send-button.png)

#### Invoice validation

Once an invoice has been issued and sent via `Send E-Way bill`, a
confirmation message is displayed.

![Indian e-Way bill confirmation message](india/e-waybill-process.png)

> [!NOTE]
> - You can find the JSON-signed file in the attached files in the
> chatter. - Odoo automatically uploads the JSON-signed file to the
> government portal after some time. Click `Process now` if you want to
> process the invoice immediately.

#### Invoice PDF report

You can print the invoice PDF report once you have submitted the E-Way
bill. The report includes the **E-Way bill number** and the **E-Way bill
validity date**.

![E-way bill acknowledgment number and date](india/e-waybill-invoice-report.png)

#### E-Way bill cancellation

If you want to cancel an E-Way bill, go to the `E-Way bill` tab of the
related invoice and fill out the `Cancel reason` and `Cancel remarks`
fields. Then, click `Request EDI Cancellation`.

> [!IMPORTANT]
> Doing so cancels both the `e-Invoice <india/e-invoicing>` (if
> applicable) and the `E-Way bill <india/e-waybill>`.

![Cancel reason and remarks](india/e-waybill-cancellation.png)

> [!NOTE]
> - If you want to abort the cancellation before processing the invoice,
> click `Call Off
> EDI Cancellation`. - Once you request to cancel the E-Way bill, Odoo
> automatically submits the JSON-signed file to the government portal.
> You can click `Process Now` if you want to process the invoice
> immediately.

## Indian GST Return filing

### Enable API access

To file GST Returns in Odoo, you must first enable API access on the GST
portal.

1.  Log into the [GST
    portal](https://services.gst.gov.in/services/login) by entering your
    `Username` and `Password`, and go to `My Profile` on your **profile
    menu**;

    ![Click On the My Profile from profile](india/gst-portal-my-profile.png)

2.  Select `Manage API Access`, and click `Yes` to enable API access;

    ![Click Yes](india/gst-portal-api-yes.png)

3.  Doing so enables a `Duration` drop-down menu. Select the `Duration`
    of your preference, and click `Confirm`.

### Indian GST Service In Odoo

Once you have enabled the `API access <india/gstr_api>` on the GST
portal, you can set up the `Indian GST Service` in Odoo.

Go to `Accounting --> Configuration --> Settings --> Indian GST Service`
and enter the `GST Username`. Click `Send OTP`, enter the code, and
finally, `Validate`.

> ![Please enter your GST portal Username as Username](india/gst-setup.png)

### File-in GST Return

When the `Indian GST Service` is configured, you can file your GST
return. Go to
`Accounting --> Reporting --> India --> GST Return periods` and create a
new **GST Return Period** if it does not exist. GST Return file-in is
done in **three steps** in Odoo:

> [!NOTE]
> **Tax Return Periodicity** can be
> `configured <../accounting/reporting/tax_returns>` according to the
> user's needs.

#### Send GSTR-1

1.  The user can verify the `GSTR-1 <india/gstr-1_report>` report before
    uploading it to the **GST portal** by clicking `GSTR-1 Report`;

2.  If the **GSTR-1** report is correct, then click `Push to GSTN` to
    send it to the **GST portal**. The status of the `GSTR-1` report
    changes to `Sending`;

    ![GSTR-1 in the Sending Status](india/gst-gstr-1-sending.png)

3.  After a few seconds, the status of the **GSTR-1** report changes to
    `Waiting for
    Status`. It means that the **GSTR-1** report has been sent to the
    `GST Portal` and is being verified on the `GST Portal`;

    ![GSTR-1 in the Waiting for Status](india/gst-gstr-1-waiting.png)

4.  Once more, after a few seconds, the status either changes to `Sent`
    or `Error
    in Invoice`. The status `Error in Invoice` indicates that some of
    the invoices are not correctly filled out to be validated by the
    **GST portal**;

    - If the state of the **GSTR-1** is `Sent`, it means your **GSTR-1**
      report is ready to be filed on the **GST portal**.

      ![GSTR-1 Sent](india/gst-gstr-1-sent.png)

    - If the state of the **GSTR-1** is `Error in Invoice`, invoices can
      be checked for errors in the `Log Note`. Once issues have been
      resolved, the user can click `Push to GSTN` to submit the file
      again on the **GST portal**.

      ![GSTR-1 Error in Invoice](india/gst-gstr-1-error.png)

    ![GSTR-1 Error in Invoice Log](india/gst-gstr-1-error-log.png)

5.  Click `Mark as Filed` after filing the **GSTR-1** report on the
    **GST portal**. The status of the report changes to `Filed` in
    **Odoo**.

    ![GSTR-1 in the Filed Status](india/gst-gstr-1-filed.png)

#### Receive GSTR-2B

Users can retrieve the **GSTR-2B Report** from the **GST portal**. This
automatically reconciles the **GSTR-2B** report with your Odoo bills;

1.  Click `Fetch GSTR-2B Summary` to retrieve the **GSTR-2B** summary.
    After a few seconds, the status of the report changes to
    `Waiting for Reception`. This means Odoo is trying to receive the
    **GSTR-2B** report from the **GST portal**;

    ![GSTR-2B in Waiting for Reception](india/gst-gstr-2b-waiting.png)

2.  Once more, after a few seconds, the status of the **GSTR-2B**
    changes to the `Being
    Processed`. It means Odoo is reconciling the **GSTR-2B** report with
    your Odoo bills;

    ![GSTR-2B in Waiting for Reception](india/gst-gstr-2b-processed.png)

3.  Once it is done, the status of the **GSTR-2B** report changes to
    either `Matched` or `Partially Matched`;

    - If the status is `Matched`:

      > ![GSTR-2B Matched](india/gst-gstr-2b-matched.png)

    - If the status is `Partially Matched`, you can make changes in
      bills by clicking `View Reconciled Bills`. Once it is done, click
      `re-match`.

      > ![GSTR-2B Partially Matched](india/gst-gstr-2b-partially.png)
      >
      > ![GSTR-2B Reconciled Bills](india/gst-gstr-2b-reconcile.png)

#### GSTR-3 report

The `GSTR-3 <india/gstr-3_report>` report is a monthly summary of
**sales** and **purchases**. This return is auto-generated by extracting
information from **GSTR-1** and **GSTR-2**.

1.  Users can compare the **GSTR-3** report with the **GSTR-3** report
    available on the **GST portal** to verify if they match by clicking
    `GSTR-3 Report`;

2.  Once the **GSTR-3** report has been verified by the user and the tax
    amount on the **GST portal** has been paid. Once paid, the report
    can be **closed** by clicking `Closing Entry`;

    ![GSTR-3](india/gst-gstr-3.png)

3.  In `Closing Entry`, add the tax amount paid on the **GST portal**
    using challan, and click `POST` to post the `Closing Entry`;

    ![GSTR-3 Post Entry](india/gst-gstr-3-post.png)

4.  Once posted, the **GSTR-3** report status changes to `Filed`.

    ![GSTR-3 Filed](india/gst-gstr-3-filed.png)

## Tax reports

### GSTR-1 report

The `GSTR-1` report is divided into sections. It displays the `Base`
amount, `CGST (Central Goods and Services Tax)`,
`SGST (State Goods and Service Tax)`,
`IGST (Integrated Goods and Services Tax)`, and `CESS` for each section.

> ![GSTR-1 Report](india/gst-gstr-1-sale-report.png)

### GSTR-3 report

The `GSTR-3` report contains different sections:

- Details of inward and outward supply subject to a **reverse charge**;

- Eligible `ITC (Income Tax Credit)`;

- Values of **exempt**, **Nil-rated**, and **non-GST** inward supply;

- Details of inter-state supplies made to **unregistered** persons.

  > ![GSTR-3 Report](india/gst-gstr-3-report.png)
