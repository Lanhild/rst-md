# Wire transfers

The **Wire transfer** payment method allows you to provide payment
instructions to your customers, such as the bank details and
communication. They are displayed:

  - at the end of the checkout process, once the customer has selected
    `Wire transfer` as a payment method and clicked the `Pay now`
    button:
    
    ![Payment instructions at
    checkout](wire_transfer/payment_instructions_checkout.png)

  - on the customer portal:
    
    ![Payment instructions on the customer
    portal](wire_transfer/payment_instructions_portal.png)

<div class="note">

<div class="title">

Note

</div>

\- While this method is very accessible and requires minimal setup, it
is very inefficient process-wise. We recommend setting up a `payment
acquirer <../payment_acquirers>` instead. - Online orders remain in the
`Quotation sent` (i.e., unpaid order) stage until you receive the
payment and `Confirm` the order.

</div>

<div class="tip">

<div class="title">

Tip

</div>

**Wire transfer** can be used as a template for other payment methods
that are processed manually, such as checks, by renaming or duplicating
it.

</div>

## Configuration

**Wire Transfer** is installed and enabled by default.

To configure it, go to `Accounting / Website --> Configuration -->
Payment Acquirers`, and open the `Wire Transfer` card. Then, select the
`Communication` to be used in the `Configuration` tab:

>   - `Based on Document Reference`: sales order or invoice number
>   - `Based on Customer ID`: customer identifier

Define the payment instructions in the `Messages` tab:

![Define payment instructions](wire_transfer/payment_instructions.png)

<div class="seealso">

`../accounting/getting_started/cheat_sheet`

</div>
