# Google Search Console

Google Search Console is a free web service provided by Google that
allows website owners to monitor, maintain, and troubleshoot their
site's presence in Google Search results. It offers valuable insights
into how Google views and interacts with your site, helping you optimize
its performance.

To enable GSC, go to [Google Search
Console](https://search.google.com/search-console/welcome), enter your
domain or URL prefix, follow the instructions, and copy the code from
Google.

![Google Search Console domain or URL prefix](google_search_console/add-domain-or-url-prefix.png)

![Verify domain or URL prefix](google_search_console/verify.png)

Then, access your Odoo database, go to
`Website --> Configuration --> Settings`, and enable
`Google Search Console` in the `SEO` section. Paste the code in the
dedicated field.

![Website Settings pasting GSC code](google_search_console/paste-gsc-code-settings.png)

> [!IMPORTANT]
> To prevent Google from indexing both your custom domain name
> <span class="title-ref">www.example.com</span> and your original Odoo
> database URL <span class="title-ref">www.example.odoo.com</span>,
> `map your domain name with your Odoo website
> <domain-name/website-map>`.

<div class="seealso">

`domain_names`

</div>
