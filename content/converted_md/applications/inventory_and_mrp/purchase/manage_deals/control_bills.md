# Control and know when vendor bills should be paid

With Odoo, you can define how your vendor bills are controlled. For each
purchase order, you can decide when the related vendor bill should be
paid: either before or after you have received your products. You can
also check at a glance what is the billing status of each purchase
order.

With the 3-way matching feature, Odoo compares the information appearing
on the *Purchase Order*, the *Vendor Bill* and the *Receipt*, and lets
you know if you should pay the bill. This way you can avoid paying
incorrect or fraudulent vendor bills.

## Vendor bills default control policy

As a first step, open your Purchase app and go to `Configuration -->
Settings` to set the default bill control policy for all the products
created onwards.

![Vendor bills default control setting for new products in Odoo
Purchase](control_bills/control-bills-quantities-default-setting.png)

By selecting *On ordered quantities*, you can create a vendor bill as
soon as you confirm an order. The quantities mentioned in the purchase
order are used to generate the draft bill.

If you choose *On received quantities* instead, you can only create one
once you have at least received some of the products you have ordered.
The quantities you have received are used to generate the draft bill. If
you try to create one without having received any product, you get an
error message.

![No invoiceable line error message in Odoo
Purchase](control_bills/control-bills-no-invoiceable-line.png)

### Change a specific product's control policy

If you want to modify a specific product's control policy, go to
`Products -->
Products`, open it, click on *Edit* and go to the *Purchase tab*. There
you can change a product's default bill control policy.

![Vendor bills default control setting for new products in Odoo
Purchase](control_bills/control-bills-quantities-on-product.png)

## View a purchase order's billing status

Once you confirm an order, you can view its *Billing Status* by going to
the *Other Information* tab.

![Purchase order billing status in Odoo
Purchase](control_bills/control-bills-billing-status.png)

Below you can find a list of the different *Billing Status*, and when
they are displayed, depending on the products' bill control policy.

<table>
<colgroup>
<col style="width: 21%" />
<col style="width: 78%" />
</colgroup>
<tbody>
<tr class="odd">
<td><dl>
<dt><strong>Billing status</strong></dt>
<dd><ul>
<li></li>
</ul>
</dd>
</dl></td>
<td><blockquote>
<p><strong>Conditions</strong></p>
</blockquote>
<dl>
<dt>------------------------------------------------+-------------------------+</dt>
<dd><p><em>On received quantities</em> | <em>On ordered quantities</em></p>
</dd>
</dl></td>
</tr>
<tr class="even">
<td><em>Nothing to Bill</em></td>
<td><blockquote>
<p>PO confirmed; no products received | <em>(Not applicable)</em></p>
</blockquote></td>
</tr>
<tr class="odd">
<td><em>Waiting Bills</em></td>
<td><blockquote>
<p>All/some products received; bill not created | PO confirmed</p>
</blockquote></td>
</tr>
<tr class="even">
<td><em>Fully Billed</em></td>
<td>All/some products received; draft bill created | Draft bill created</td>
</tr>
</tbody>
</table>

## Determine when to pay with 3-way matching

First, go to `Configuration --> Settings` and activate *3-way matching*.

![3-way-matching setting in Odoo
Purchase](control_bills/control-bills-3-way-matching-setting.png)

<div class="note">

<div class="title">

Note

</div>

3-way matching is intended to work with the bill control policy set to
*On received quantities*.

</div>

### Should I pay the vendor bill?

With the feature activated, your vendor bills now display the *Should Be
Paid* field under the *Other info* tab.

![Should Be Paid field under a vendor bill in Odoo
Purchase](control_bills/control-bills-should-be-paid.png)

As you can't create a bill until you have received your products - and
if you haven't received all of them, Odoo only includes the products you
have received in the draft bill - the *Should Be Paid* status is set to
*Yes* when you create one.

If you edit a draft bill to increase the billed quantity, change the
price, or add other products, the *Should Be Paid* status is set to
*Exception*. It means Odoo notices the discrepancy, but that you might
have a valid reason to have done so.

Once the payment has been registered and mentions *Paid*, the *Should Be
Paid* status is set to *No*.

![Paid bill in Odoo
Purchase](control_bills/control-bills-paid-status.png)

<div class="tip">

<div class="title">

Tip

</div>

The *Should Be Paid* status is set automatically by Odoo. However, you
can change the status manually when you are viewing a bill in edit mode.

</div>
