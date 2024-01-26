# Secure connection (HTTPS)

If **Direct Devices** is enabled in a Point of Sale settings (for
example, if you use an ePos printer), HTTP becomes the default protocol.

## Force your Point of Sale to use a secure connection (HTTPS)

Add a new **key** in the **System Parameters** to force your Point of
Sale to use a secure connection with the HTTPS protocol.

To do so, activate the `developer mode <developer-mode>`, go to
`Settings -->
Technical --> Parameters --> System Parameters`, then create a new
parameter, add the following values and click on *Save*.

  - **Key**:
    <span class="title-ref">point\_of\_sale.enforce\_https</span>
  - **Value**: <span class="title-ref">True</span>

<div class="seealso">

\- `epos_ssc`

</div>
