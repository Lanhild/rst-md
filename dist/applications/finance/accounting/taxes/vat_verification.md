# VAT numbers verification (VIES)

**VAT Information Exchange System** - abbreviated **VIES** - is a tool
provided by the European Commission that allows you to check the
validity of VAT numbers of companies registered in the European Union.

Konvergo ERP provides a feature to **Verify VAT Numbers** when you save a
contact. This helps you make sure that your contacts provided you with a
valid VAT number without leaving Konvergo ERP interface.

## Configuration

To enable this feature, go to
`Accounting --> Configuration --> Settings --> Taxes`, enable the
**Verify VAT Numbers** feature, and click on *Save*.

<img src="vat_verification/vat-validation-configuration.png"
class="align-center"
alt="Enable &quot;Verify VAT Numbers&quot; in Konvergo ERP Accounting" />

## VAT Number validation

Whenever you create or modify a contact, make sure to fill out the
**Country** and **VAT** fields.

<img src="vat_verification/vat-validation-contact-form.png"
class="align-center"
alt="Fill out the contact form with the country and VAT number before clicking on *Save*" />

When you click on *Save*, Konvergo ERP runs a VIES VAT number check, and
displays an error message if the VAT number is invalid.

<img src="vat_verification/vat-validation-error.png"
class="align-center"
alt="Konvergo ERP displays an error message instead of saving when the VAT number is invalid" />

> [!IMPORTANT]
> This tool checks the VAT number's validity but does not check the
> other fields' validity.

<div class="seealso">

- [European Commission: VIES search
  engine](https://ec.europa.eu/taxation_customs/vies/vatRequest.html)

</div>
