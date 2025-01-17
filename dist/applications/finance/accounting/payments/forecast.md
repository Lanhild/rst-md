# Forecast future bills to pay

In Konvergo ERP, you can manage payments by setting automatic **Payments Terms**
and **follow-ups**.

## Configuration: payment terms

In order to track vendor conditions, we use **Payment Terms** in Konvergo ERP.
They allow keeping track of due dates on invoices. Examples of **Payment
Terms** are:

- 50% within 30 days
- 50% within 45 days

To create them, go to
`Accounting --> Configuration --> Invoicing: Payment Terms` and click on
`Create` to add new terms or click existing ones to modify them.

<div class="seealso">

[Konvergo ERP Tutorials: Payment
Terms](https://www.odoo.com/slides/slide/payment-terms-1679?fullscreen=1)

</div>

Once **Payment Terms** are defined, you can assign them to your vendor
by default. To do so, go to `Vendors --> Vendors`, select a vendor,
click the `Sales & Purchase` tab, and select a specific **Payment
Term**. This way, every time you purchase from this vendor, Konvergo ERP
automatically proposes the chosen Payment Term.

> [!NOTE]
> If you do not set a specific Payment Term on a vendor, you can still
> set one on the vendor bill.

## Forecast bills to pay with the aged payable report

To track amounts to be paid to the vendors, use the **Aged Payable**
report. To access it, go to
`Accounting --> Reporting --> Partner Reports: Aged Payable`. This
report gives you a summary per vendor of the amounts to pay, compared to
their due date (the due date being computed on each bill using the
terms). This report tells you how much you will have to pay within the
following months.

## Select bills to pay

You can get a list of all your vendor bills by going to
`Vendors --> Bills`. To view only the bills that you need to pay, click
`Filters --> Bills to Pay`. To view only overdue payments, select the
`Overdue` filter instead.

You can also group bills by their due date by clicking
`Group By --> Due Date` and selecting a time period.
