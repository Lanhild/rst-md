# Cookies bar

Cookies are small text files sent to your device when you visit a
website. They are processed and stored by your browser and contain
information about your visit, such as login data, location, language,
etc. There are two main types of cookies:

- Essential cookies, which are necessary for the website to function
  properly;
- Non-essential or optional cookies, which are used to analyze your
  behavior or display advertisements.

<img src="cookies_bar/popup.png" width="500"
alt="Example of a cookies bar with the popup layout." />

Notifying users about data collection, as well as its methods and
purposes, is required by data protection laws such as
[GDPR](https://gdpr.eu). Cookies bars are commonly used to fulfill this
obligation in a user-friendly and transparent manner. They are displayed
immediately upon a user's first visit to inform them that the website
uses cookies and let them decide whether they want to store
non-essential cookies on their device.

## Configuration

To enable the cookies bar on your Konvergo ERP website, go to
`Website --> Configuration` and enable `Cookies Bar` in the `Privacy`
section.

You can
`customize the appearance of your cookies bar <cookies-bar/customization>`
and `edit the content of
the related Cookie Policy page <cookies-bar/policy>`.

## Customization

To adapt the display of the cookies bar, click `Edit` and select the
`Cookies
Bar` building block in the `Invisible Elements` at the bottom of the
panel. Customize it using the options in the `Customize` tab in the edit
panel. Three `Layouts` are available:

- `Discrete`: thin bar
- `Classic`: banner
- `Popup`: you can change the popup's `Position` to the `Top`, `Middle`,
  or `Bottom` of the screen.

You can also:

- modify the `Size` of the cookies bar;
- enable `Backdrop` to gray out the page in the background when the
  cookies bar is displayed on the screen;
- further customize the appearance of the cookies bar using `Block`
  and/or `Column` customization options, which are available after
  clicking anywhere in the building block.

To edit the contents of the cookies bar (i.e., the consent message),
click directly in the building block.

![Konvergo ERP Website's edit panel to customize the cookies bar.](cookies_bar/customization.png)

## Cookie policy

When you enable the cookies bar for your website, Konvergo ERP creates the
**Cookie Policy** page (<span class="title-ref">/cookie-policy</span>)
with the list of essential and optional cookies. To access it, click the
`Cookie Policy` hyperlink in the cookies bar or open the page from
`Website
--> Site --> Pages`.

The contents of the page can be adapted based on your website's features
and characteristics if needed.

> [!TIP]
> You could add a link providing access to this page, in your website's
> footer, for example.
