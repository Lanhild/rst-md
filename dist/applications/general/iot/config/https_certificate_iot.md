# HTTPS certificate (IoT)

## What is HTTPS?

*Hypertext Transfer Protocol Secure* (HTTPS) is the secure version of
*Hypertext Transfer Protocol* (HTTP), which is the primary protocol used
to send data back and forth between a web browser and a website.
`HTTPS (Hypertext Transfer Protocol Secure)` is encrypted in order to
increase the security of data transfer.

`HTTPS (Hypertext Transfer Protocol Secure)` uses an encryption protocol
to encrypt communications. The protocol is called *Transport Layer
Security* (TLS), although formerly it was known as *Secure Sockets
Layer* (SSL).

`HTTPS (Hypertext Transfer Protocol Secure)` occurs based upon the
transmission of `TLS
(Transport Layer Security)`/`SSL (Secure Sockets Layer)` certificates,
which verify that a particular provider is who they say they are.

> [!NOTE]
> In this documentation and throughout Konvergo ERP the term "HTTPS certificate"
> will be used to define the fact that the `SSL (Secure Sockets Layer)`
> certificate is valid and allows a `HTTPS
> (Hypertext Transfer Protocol Secure)` connection.

### Why is it needed?

In order to communicate with certain network devices (in particular for
payment terminals), the usage of
`HTTPS (Hypertext Transfer Protocol Secure)` is mandatory. If the `HTTPS
(Hypertext Transfer Protocol Secure)` certificate isn't valid, some
devices won't be able to interact with the `IoT (Internet of Things)`
Box.

## How to obtain a Hypertext Transfer Protocol Secure (HTTPS) certificate

The generation of the `HTTPS (Hypertext Transfer Protocol Secure)`
certificate is automatic.

The `IoT (Internet of Things)` Box will send a specific request to
<https://www.odoo.com> which will send back the
`HTTPS (Hypertext Transfer Protocol Secure)` certificate if the
`IoT (Internet of Things)` box and database are eligible.

### Internet of Things (IoT) eligibility

> 1.  The database should be a **production** instance. The database
>     instance should not be a copy, a duplicate, a staging, or a
>     development environment.
>
> 2.  The Konvergo ERP subscription must:
>
>     > - Have an `IoT Box Subscription` line.
>     > - `Status` must be `In Progress`.
>
>     If the subscription is linked to a <https://www.odoo.com> portal
>     user check the information on the portal subscription page.
>
>     <figure>
>     <img src="https_certificate_iot/sub-example-in-progress.png"
>     class="align-center"
>     alt="https_certificate_iot/sub-example-in-progress.png" />
>     <figcaption>In this case, both subscriptions are considered "in
>     progress" as the <code class="interpreted-text"
>     role="guilabel">Filter By\:
>     In Progress</code> was used.</figcaption>
>     </figure>
>
>     > [!NOTE]
>     > If the subscription is in question, contact the database's
>     > Account Manager or Partner regarding the matter.

## Troubleshooting Hypertext Transfer Protocol Secure (HTTPS) certificate errors

If anything goes wrong during the process of the "HTTPS certificate"
generation or reception, a specific error will code be given on the
`IoT (Internet of Things)` box home page.

> [!TIP]
> Accessing the `IoT (Internet of Things)` box homepage will check for
> the presence of the "HTTPS certificate" and will attempt its
> generation if it is missing. As such, if there is an error on the
> `IoT (Internet of Things)` box home page, refresh the
> `IoT (Internet of
> Things)` home page to see if the error disappears.

### <span class="title-ref">ERR_IOT_HTTPS_CHECK_NO_SERVER</span>

Reason:  
The configuration regarding the server is missing. In other words, the
Konvergo ERP instance is not connected with the IoT box.

Solution:  
Ensure that the server is configured.

<div class="seealso">

`/applications/general/iot/config/connect`

</div>

### <span class="title-ref">ERR_IOT_HTTPS_CHECK_CERT_READ_EXCEPTION</span>

Reason:  
An unhandled error happened when trying to read the existing
`HTTPS (Hypertext Transfer
Protocol Secure)` certificate.

Solution:  
Ensure that the `HTTPS (Hypertext Transfer Protocol Secure)` certificate
file is readable.

### <span class="title-ref">ERR_IOT_HTTPS_LOAD_NO_CREDENTIAL</span>

Reason:  
The contract and/or database `UUID (Universal Unique Identifier)` is
missing.

Solution:  
Ensure that both values are configured as intended. To modify them, go
to the `IoT
(Internet of Things)` box home page, and navigate to `Credential`.

### <span class="title-ref">ERR_IOT_HTTPS_LOAD_REQUEST_EXCEPTION</span>

Reason:  
An unexpected error happened when the `IoT (Internet of Things)` box
tried to reach <https://www.odoo.com>. The causes are likely due to the
network infrastructure/configuration:

> - The `IoT (Internet of Things)` box does not have access to internet.
> - The network does not allow the `IoT (Internet of Things)` box to
>   communicate with <https://www.odoo.com>. This may be due to network
>   devices preventing the communication (firewalls, etc.) or the
>   network configuration (`VPN (Virtual Private Network)`, etc.).

> [!NOTE]
> More information regarding the error that occurred can be found in the
> full request exception details, which are in the
> `IoT (Internet of Things)` box logs.

Solution:  
> [!WARNING]
> Consult with your system or network administrator should this issue
> arise. This error code depends on the network infrastructure and goes
> beyond Konvergo ERP support's service scope.

### <span class="title-ref">ERR_IOT_HTTPS_LOAD_REQUEST_STATUS</span>

Reason:  
The IoT-box was able to reach <https://www.odoo.com> but received an
unusual [HTTP response (status
codes)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status).

This error code will also give the HTTP response status codes. For
example, if the error reads
<span class="title-ref">ERR_IOT_HTTPS_LOAD_REQUEST_STATUS 404</span> it
means that the page returned a 404 error, which is the "Page Not Found"
code.

Solution:  
Check if <https://www.odoo.com> is down using a web browser, as it's
possible that it is down due to maintenance.

> - If <https://www.odoo.com> is down due to maintenance, unfortunately
>   there is nothing that can be done but instead wait for it to
>   recover.
> - If <https://www.odoo.com> is not down due to maintenance, open a
>   [support ticket](https://www.odoo.com/help) on the matter. Ensure
>   that the 3 digits status code next to the code error is included in
>   the support ticket.

### <span class="title-ref">ERR_IOT_HTTPS_LOAD_REQUEST_NO_RESULT</span>

Reason:  
The `IoT (Internet of Things)` box was able to reach
<https://www.odoo.com> but it refused to deliver the
`HTTPS (Hypertext Transfer Protocol Secure)` certificate.

Solution:  
Ensure that the `IoT (Internet of Things)` box and database are eligible
for a certificate:
`Internet of Things (IoT) eligibility <iot/iot-eligibility>`.

## How to ensure that the HTTPS certificate is correct

If the certificate has been applied successfully, a new
`HTTPS (Hypertext Transfer Protocol
Secure)` `URL (Uniform Resource Locator)` for the
`IoT (Internet of Things)` box ending with
<span class="title-ref">.odoo-iot.com</span> will appear on the Konvergo ERP
database, inside of the `IoT` application on that specific device's
form.

<img src="https_certificate_iot/odoo-new-domain.png"
class="align-center"
alt="Konvergo ERP IoT app IoT box with .odoo-iot.com domain." />

When navigating to the `URL (Uniform Resource Locator)` in a browser a
secured `HTTPS
(Hypertext Transfer Protocol Secure)` connection will be established.

<figure>
<img src="https_certificate_iot/secured-connection.png"
class="align-center"
alt="https_certificate_iot/secured-connection.png" />
<figcaption>Padlock in Chrome on Windows 10 attesting the fact that the
connection is secured in <code class="interpreted-text"
role="abbr">HTTPS
(Hypertext Transfer Protocol Secure)</code>.</figcaption>
</figure>

The IoT-box homepage will now display an
<span class="title-ref">OK</span> status next to
<span class="title-ref">HTTPS certificate</span>. The drop-down menu
icon, when clicked, will reveal information regarding the certificate.

<img src="https_certificate_iot/status-ok.png" class="align-center"
alt="IoT box homepage with HTTPS certificate OK status." />

## Domain Name System (DNS) issue

If the `IoT (Internet of Things)` box can be accessed from its
`IP (Intrernet Protocol)` address but not the Konvergo ERP assigned domain:
<span class="title-ref">.odoo-iot.com</span>; then the
`IoT (Internet of Things)` box is likely running into a
`DNS (Domain Name System)` issue. On some browsers, it will give an
error code mentioning `DNS (Domain Name System)` (like
<span class="title-ref">DNS_PROBE_FINISHED_NXDOMAIN</span>).

These `DNS (Domain Name System)` issues may appear as the following in
different browsers:

<div class="tabs">

<div class="tab">

Chrome

<figure>
<img src="https_certificate_iot/dns-chrome.png" class="align-center"
alt="https_certificate_iot/dns-chrome.png" />
<figcaption>DNS issue on Chrome browser on Windows 10.</figcaption>
</figure>

</div>

<div class="tab">

Firefox

<figure>
<img src="https_certificate_iot/dns-firefox.png" class="align-center"
alt="https_certificate_iot/dns-firefox.png" />
<figcaption>DNS issue on Firefox browser on Windows 10.</figcaption>
</figure>

</div>

<div class="tab">

Edge

<figure>
<img src="https_certificate_iot/dns-edge.png" class="align-center"
alt="https_certificate_iot/dns-edge.png" />
<figcaption>DNS issue on Edge browser on Windows 10.</figcaption>
</figure>

</div>

</div>

### Domain Name System (DNS) issue solution

1.  Should the router allow the `DNS (Domain Name System)` to be
    manually changed, change the DNS to use [Google
    DNS](https://developers.google.com/speed/public-dns).

2.  If your router doesn't allow for this, then a change will need to be
    made on the `DNS
    (Domain Name System)` settings of each of the devices using [Google
    DNS](https://developers.google.com/speed/public-dns). This will need
    to occur on **every** device that plans to interact with the
    `IoT (Internet of Things)` box (e.g. computer, tablet or phone). The
    individual device configuration processes can be found on the
    website of the device's manufacturer.

    > [!NOTE]
    > Other `IoT (Internet of Things)` devices such as payment terminals
    > likely won't need their `DNS (Domain Name System)` settings
    > changed as they are already configured with custom
    > `DNS (Domain Name System)`.

    > [!WARNING]
    > Consult with your system or network administrator should this
    > issue arise. This error code depends on the network
    > infrastructure, and it goes beyond Konvergo ERP support's service scope.
