# Tips

Tipping is customary in multiple countries. Point of Sale allows tipping
in `shops <pos/sell>`, `bars <../restaurant>`, or
`restaurants <../restaurant>`.

## Configuration

To allow tipping in your POS, activate the `Tips` feature in
`Point of Sale
--> Configuration --> Settings`. At the top of the page, select the POS
in which you wish to allow **tipping**, scroll down to the `Payment`
section and check `Tips`. Once enabled, add a `Tip Product` in the
corresponding field, and save. The designated product will be used as a
reference on customers' receipts.

![enable tips in a POS](tips/tips-setup.png)

### Tip products

**Tip products** can be created on the spot. To do so, enter a product's
name in the `Tip
Product <configuration>` field and click `Create` or press **enter**.
The product is automatically configured to be used as a tip at the
payment screen.

However, if you wish to be able to select the tip product in a POS
session, you must activate the **Available in POS** setting. To do so,
click `Create and edit...` to open the product configuration form. Then,
go to the `Sales` tab, tick the `Available in POS` checkbox, and click
`Save & Close`.

> [!NOTE]
> - When you create a product to use as a tip, leave the **product
> type** as `Consumable` to avoid unnecessary inventory movements. - You
> can only select one tip product per POS, but you can choose a
> different one for each.

### Tip using an Adyen terminal

If you use an `Adyen <../payment_methods/terminals/adyen>` payment
terminal and wish to enable **tips** using the terminal, check
`Add tip through payment terminal (Adyen)` below the
`tip settings <configuration>`.

### Tip after payment

If you use a POS system in a bar or a restaurant, you can enable
`Add tip after payment
(North America specific)`. Doing so generates a bill to print and
complete manually by the customer and the waiter. That bill indicates
the tip value the customer chooses to give after the payment.

> [!IMPORTANT]
> To use this feature, the selected payment method must have a bank
> journal attributed.

## Add tips

To add tips to an order, `access the payment screen <pos/sell>` and
click `♥ Tip`. Then, enter the tipping amount, click `Confirm` to
validate, and process the payment.

![tip popup window](tips/add-tip.png)

Alternatively, you can select the `tip product <tip-product>` on the POS
interface to add it to the cart. When selected, the product is
automatically set as a tip, and its default value equals its **Sales
Price**.

### Tip using an Adyen terminal

During checkout, select **Adyen** as the payment terminal, and send the
payment request to the device by clicking `Send`. The customers are
asked to enter the desired tipping amount on the terminal's screen
before proceeding to the payment.

### Tip after payment

At checkout, select a card payment method and click `Close Tab`. Doing
so generates a bill to complete by the customer.

![tipping bill after payment to complete by customers](tips/tipping-bill.png)

On the following screen, click the percentage (`15%`, `20%`, `25%`),
`No Tip`, or enter the tipping amount the customer chose to give. Then,
click `Settle` to move to the following order.

![screen to select a tip amount to collect after payment](tips/tip-after-payment.png)
