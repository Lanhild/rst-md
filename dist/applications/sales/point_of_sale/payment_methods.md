show-content  

# Payment methods

To add a payment method, you first need to create it. Go to
`Point of Sale -->
Configuration --> Payment Methods --> New`, and set a name. Check
`Identify Customer` to allow this payment method *exclusively* for
registered customers.

Then, select the `Journal`. Choose `Cash` to use this payment method for
cash payments, or `Bank` to use it for card payments.

![Creating a new payment method for a POS.](payment_methods/payment-method.png)

> [!NOTE]
> Selecting a `bank` journal automatically adds the
> `Use a Payment Terminal` field in which you can add your
> `payment terminal's information
> <payment_methods/terminals>`.

<div class="seealso">

`payment_methods/terminals`.

</div>

Once the payment method is created, you can select it in your POS
settings. To do so, go to the `POS' settings <configuration/settings>`,
click `Edit`, and add the payment method under the `Payments` section.

<div class="toctree" titlesonly="">

payment_methods/terminals

</div>
