# Set up a content delivery network (CDN)

## Deploying with KeyCDN

A `CDN (Content Delivery Network)` or *content distribution network*, is
a geographically distributed network of servers that provides high speed
internet content. The `CDN (Content
Delivery Network)` provides quick, high-quality content delivery for
content-heavy websites.

This document will guide you through the setup of a
[KeyCDN](https://www.keycdn.com) account with an Odoo powered website.

### Create a pull zone in the KeyCDN dashboard

On the KeyCDN dashboard, start by navigating to the `Zones` menu item on
the left. On the form, give a value to the `Zone Name`, which will
appear as part of the `CDN
(Content Delivery Network)`'s `URL (Uniform Resource Locator)`. Then,
set the `Zone
Status` to `active` to engage the zone. For the `Zone Type` set the
value to `Pull`, and then, finally, under the `Pull Settings`, enter the
`Origin URL`— this address should be the full Odoo database `URL
(Uniform Resource
Locator)`.

<div class="example">

Use `https://yourdatabase.odoo.com` and replace the *yourdatabase*
subdomain prefix with the actual name of the database. A custom `URL
(Uniform Resource Locator)` can be used, as well, in place of the Odoo
subdomain that was provided to the database.

</div>

![KeyCDN's Zone configuration page.](cdn/keycdn-zone.png)

Under the `General Settings` heading below the zone form, click the
`Show all
settings` button to expand the zone options. This should be the last
option on the page. After expanding the `General Settings` ensure that
the `CORS` option is `enabled`.

Next, scroll to the bottom of the zone configuration page and `Save` the
changes. KeyCDN will indicate that the new zone will be deployed. This
can take about 10 minutes.

![KeyCDN deploying the new Zone.](cdn/zone-url.png)

<div class="note">

<div class="title">

Note

</div>

A new `Zone URL` has been generated for your Zone, in this example it is
`pulltest-xxxxx.kxcdn.com`. This value will differ for each database.

</div>

Copy this `Zone URL` to a text editor for later, as it will be used in
the next steps.

### Configure the Odoo instance with the new zone

In the Odoo `Website` app, go to the `Settings` and then activate the
`Content Delivery Network (CDN)` setting and copy/paste the `Zone URL`
value from the earlier step into the `CDN Base URL` field. This field is
only visible and configurable when `Developer Mode
<../../applications/general/developer_mode>` is activated.

<div class="note">

<div class="title">

Note

</div>

Ensure that there are two *forward slashes*
(<span class="title-ref">//</span>) before the `CDN Base URL` and one
forward slash (<span class="title-ref">/</span>) after the `CDN Base
URL`.

</div>

`Save` the settings when complete.

![Activate the CDN setting in Odoo.](cdn/cdn-base-url.png)

Now the website is using the CDN for the resources matching the `CDN
filters` regular expressions.

In the HTML of the Odoo website, the `CDN (content delivery network)`
integration is evidenced as working properly by checking the `URL
(Uniform Resource Locators)` of images. The *CDN Base URL* value can be
seen by using your web browser's `Inspect` feature on the Odoo website.
Look for it's record by searching within the `Network` tab inside of
devtools.

![The CDN Base URL can be seen using the inspect function on the Odoo
website.](cdn/test-pull.png)

### Prevent security issues by activating cross-origin resource sharing (CORS)

A security restriction in some browsers (such as Mozilla Firefox and
Google Chrome) prevents a remotely linked CSS file to fetch relative
resources on this same external server.

If the `CORS (Cross-Origin Resource Sharing)` option isn't enabled in
the `CDN
Zone`, the more obvious resulting problem on a standard Odoo website
will be the lack of *Font Awesome* icons because the font file declared
in the *Font Awesome* CSS won't be loaded from the remote server.

When these cross-origin resource issues occur, a security error message
similar to the output below will appear in the web browser's developer
console:

`Font from origin 'http://pulltest-xxxxx.kxcdn.com' has been blocked
from loading /shop:1 by Cross-Origin Resource Sharing policy: No
'Access-Control-Allow-Origin' header is present on the requested
resource. Origin 'http://yourdatabase.odoo.com' is therefore not allowed
access.`

![Error message populated in the browser
console.](cdn/odoo-security-message.png)

Enabling the `CORS (Cross-Origin Resource Sharing)` option in the `CDN
(Content Delivery
Network)` settings fixes this issue.
