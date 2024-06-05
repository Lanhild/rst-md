# Website analytics

Website analytics helps website owners monitor how people use their
site. It provides data on visitor demographics, behavior, and
interactions, helping improve websites and marketing strategies.

You can track your Konvergo ERP website's traffic using `analytics/plausible` or
`analytics/google-analytics`. We recommend using Plausible.io as it is
privacy-friendly, lightweight, and easy to use.

The Plausible analytics dashboard is also integrated into Konvergo ERP and can
be accessed via `Website --> Reporting --> Analytics`.

## Plausible.io

Konvergo ERP hosts its own Plausible.io server and provides a free and
ready-to-work Plausible.io solution for **Konvergo ERP Online** databases. Konvergo ERP
automatically creates and sets up your account. You can start using it
by going to `Website --> Reporting --> Analytics`.

> [!NOTE]
> **If you already have a Plausible.io account** and you want to connect
> it to your Konvergo ERP Online database, you must create two
> <span class="title-ref">ir.config.parameters</span> to use
> Plausible.io's servers. To do so, enable the
> `developer mode <developer-mode>` and go to `General Settings -->
> Technical -- System Parameters`. Click `New` and fill in the following
> `Key` and `Value` fields:
>
> | Key                                                     | Value                                                               |
> |---------------------------------------------------------|---------------------------------------------------------------------|
> | <span class="title-ref">website.plausible_script</span> | <span class="title-ref">https://plausible.io/js/plausible.js</span> |
> | <span class="title-ref">website.plausible_server</span> | <span class="title-ref">https://plausible.io</span>                 |
>
> Then, follow the steps below to connect your existing account with
> Plausible.io servers.

If your database is hosted on **Konvergo ERP.sh** or **On-premise**, or if you
wish to use your own Plausible.io account, proceed as follows:

1.  Create or sign in to a Plausible account using the following link:
    <https://plausible.io/register>.

2.  If you are creating a new account, go through the registration and
    activation steps. When asked to provide your website details, add
    its `Domain` without including <span class="title-ref">www</span>
    (e.g., <span class="title-ref">example.odoo.com</span>) and change
    the `Reporting Timezone` if necessary. Click `Add snippet` to
    proceed to the next step. Ignore the `Add JavaScript snippet`
    instructions and click `Start collecting data`.

3.  Once done, click the Plausible logo in the upper-left part of the
    page to access your [list of websites](https://plausible.io/sites),
    then click the gear icon next to the website.

    ![Click the gear icon in the list of websites.](analytics/plausible-gear-icon.png)

4.  In the sidebar, select `Visibility`, then click `+ New link`.

5.  Enter a `Name`, leave the `Password` field empty, as the Plausible
    analytics dashboard integration in Konvergo ERP doesn't support it, then
    click `Create shared link`.

    ![Credentials creation for the new shared link](analytics/plausible-create-sharedlink.png)

6.  Copy the shared link.

    ![Copy the shared link URL from Plausible.io](analytics/plausible-copy-sharedlink.png)

7.  In Konvergo ERP, go to `Website --> Configuration --> Settings`.

8.  In the `SEO` section, enable `Plausible Analytics`, then paste the
    `Shared Link` and click `Save`.

> [!TIP]
> If you have `multiple websites <../configuration/multi_website>`, add
> your websites to your Plausible.io account by going to
> <https://plausible.io/sites> and clicking `+ Add
> website`. In Konvergo ERP, in the **Website settings**, make sure to select
> the website in the `Settings of Website` field before pasting the
> `Shared link`.

> [!NOTE]
> Konvergo ERP automatically pushes two custom goals:
> <span class="title-ref">Lead Generation</span> and
> <span class="title-ref">Shop</span>.

<div class="seealso">

[Plausible Analytics documentation](https://plausible.io/docs)

</div>

## Google Analytics

To follow your Konvergo ERP website's traffic with Google Analytics:

1.  Create or sign in to a Google account using the following link:
    <https://analytics.google.com>.

2.  - If you are setting up Google Analytics for the first time, click
      `Start measuring` and go through the account creation step.

    - If you already have a Google Analytics account, sign in and click
      the gear icon in the bottom-left corner of the page to access the
      **Admin** page. Then, click `+ Create
      Property`.

      ![Measurement ID in Google Analytics.](analytics/GA-add-property.png)

3.  Complete the next steps: [property
    creation](https://support.google.com/analytics/answer/9304153?hl=en/&visit_id=638278591144564289-3612494643&rd=2#property),
    business details, and business objectives.

4.  When you reach the **Data collection** step, choose the `Web`
    platform.

    ![Choose a platform for your Google Analytics property.](analytics/GA-platform.png)

5.  Set up your data stream: Specify your `Website URL` and a
    `Stream name`, then click `Create stream`.

6.  Copy the `Measurement ID`.

    ![Measurement ID in Google Analytics.](analytics/GA-measurement-id.png)

7.  In Konvergo ERP, go to `Website --> Configuration --> Settings`.

8.  In the `SEO` section, enable `Google Analytics`, then paste the
    `Measurement ID` and click `Save`.

> [!TIP]
> If you have `multiple websites <../configuration/multi_website>` with
> separate domains, it is recommended to create [one
> property](https://support.google.com/analytics/answer/9304153?hl=en/&visit_id=638278591144564289-3612494643&rd=2#property)
> per domain. In Konvergo ERP, in the **Website settings**, make sure to select
> the website in the `Settings of Website` field before pasting the
> `Measurement ID`.

<div class="seealso">

[Google documentation on setting up Analytics for a
website](https://support.google.com/analytics/answer/1008015?hl=en/)

</div>

## Google Tag Manager

`GTM (Google Tag Manager)` is a tag management system that allows you to
easily update measurement codes and related code fragments, collectively
known as tags on your website or mobile app, directly through the code
injector.

> [!WARNING]
> Google Tag Manager may not be compliant with local data protection
> regulations.

To use GTM, proceed as follows:

1.  Create or sign in to a Google account by going to
    <https://tagmanager.google.com/>.

2.  In the `Accounts` tab, click `Create account`.

3.  Enter an `Account Name` and select the account's `Country`.

4.  Enter your website's URL in the `Container name` field and select
    the `Target
    platform`.

5.  Click `Create` and agree to the Terms of Service.

6.  Copy the <span class="title-ref">\<head\></span> and
    <span class="title-ref">\<body\></span> codes from the popup window.
    Then, go to your website, click `Edit`, go to the `Themes` tab,
    scroll down to the `Website Settings` section, then click `<head>`
    and `</body>` to paste the codes.

    ![Install Google Tag Manager](analytics/gtm-codes.png)

> [!NOTE]
> The data is collected in the marketing tools used to monitor the
> website (e.g., Google Analytics, Plausible, Facebook Pixel), not in
> Konvergo ERP.
