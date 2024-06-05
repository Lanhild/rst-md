# Product images with Google Images

Having appropriate product images in Konvergo ERP is useful for a number of
reasons. However, if a lot of products need images, assigning them can
become incredibly time-consuming.

Fortunately, by configuring the *Google Custom Search* API within an
Konvergo ERP database, finding product images for products (based on their
barcode) is extremely efficient.

## Configuration

In order to utilize *Google Custom Search* within an Konvergo ERP database, both
the database and the Google API must be properly configured.

> [!NOTE]
> Free Google accounts allow users to select up to 100 free images per
> day. If a higher amount is needed, a billing upgrade is required.

### Google API dashboard

1.  Go to the [Google Cloud Platform API &
    Services](https://console.developers.google.com/) page to generate
    Google Custom Search API credentials. Then, log in with a Google
    account. Next, agree to their `Terms of Service` by checking the
    box, and clicking `Agree and
    Continue`.

2.  From here, select (or create) an API project to store the
    credentials. Start by giving it a memorable `Project Name`, select a
    `Location` (if any), then click `Create`.

3.  With the `Credentials` option selected in the left sidebar, click
    `Create
    Credentials`, and select `API key` from the drop-down menu.

    <img src="product_images/credentials-api-key.png" class="align-center"
    alt="API &amp; Services page on Google Cloud Platform." />

4.  Doing so reveals an `API key created` pop-up window, containing a
    custom `API
    key`. Copy and save `Your API key` in the pop-up window -- it will
    be used later. Once the key is copied (and saved for later use),
    click `Close` to remove the pop-up window.

    <img src="product_images/api-key-pop-up.png" class="align-center"
    alt="The API key created pop-up window that appears." />

5.  On this page, search for <span class="title-ref">Custom Search
    API</span>, and select it.

    <img src="product_images/custom-search-api-search-bar.png"
    class="align-center"
    alt="Search bar containing &quot;Custom Search API&quot; on Google Cloud Platform." />

6.  From the `Custom Search API` page, enable the API by clicking
    `Enable`.

    <img src="product_images/gcp-custom-search-api-page.png"
    class="align-center"
    alt="&quot;Custom Search API&quot; page with Enable button highlighted on Google Cloud Platform." />

### Google Programmable Search dashboard

1.  Next, go to [Google Programmable Search
    Engine](https://programmablesearchengine.google.com/), and click
    either of the `Get started` buttons. Log in with a Google account,
    if not already logged in.

    <img src="product_images/google-pse-get-started.png"
    class="align-center"
    alt="Google Programmable Search Engine page with the Get Started buttons." />

2.  On the `Create a new search engine` form, fill out the name of the
    search engine, along with what the engine should search, and be sure
    to enable `Image Search` and `SafeSearch`.

    <img src="product_images/create-new-search.png" class="align-center"
    alt="Create new search engine form that appears with search engine configurations." />

3.  Validate the form by clicking `Create`.

4.  Doing so reveals a new page with the heading:
    `Your new search engine has been
    created`.

    <img src="product_images/new-search-engine-has-been-created.png"
    class="align-center"
    alt="The Your New Search Engine Has Been Created page that appears with copy code." />

5.  From this page, click `Customize` to open the `Overview --> Basic`
    page. Then, copy the ID in the `Search engine ID` field. This ID is
    needed for the Konvergo ERP configuration.

    <img src="product_images/basic-overview-search-engine-id.png"
    class="align-center"
    alt="Basic overview page with search engine ID field." />

### Konvergo ERP

1.  In the Konvergo ERP database, go to the `Settings app` and scroll to the
    `Integrations` section. From here, check the box beside
    `Google Images`. Then, click `Save`.

    <img src="product_images/google-images-setting.png" class="align-center"
    alt="The Google Images setting in the Konvergo ERP Settings app page." />

2.  Next, return to the `Settings app`, and scroll to the `Integrations`
    section. Then, enter the `API Key` and `Search Engine ID` in the
    fields beneath the `Google Images` feature.

3.  Click `Save`.

## Product images in Konvergo ERP with Google Custom Search API

Adding images to products in Konvergo ERP can be done on any product or product
variant. This process can be completed in any Konvergo ERP application that
provides access to product pages (e.g. *Sales* app, *Inventory* app,
etc.).

Below is a step-by-step guide detailing how to utilize the *Google
Custom Search API* to assign images to products in Konvergo ERP using the Konvergo ERP
*Sales* application:

1.  Navigate to the `Products` page in the *Sales* app (`Sales app -->
    Products --> Products`). Or, navigate to the `Product Variants` page
    in the *Sales* app (`Sales app --> Products --> Product Variants`).

2.  Select the desired product that needs an image.

    > [!NOTE]
    > Only products (or product variants) that have a barcode, but
    > **not** an image, are processed.
    >
    > If a product with one or more variants is selected, each variant
    > that matches the aforementioned criteria is processed.

3.  Click the `Action ⚙️ (gear)` icon on the product page, and select
    `Get
    Pictures from Google Images` from the menu that pops up.

    <img src="product_images/get-pictures-from-google-action.png"
    class="align-center"
    alt="The Get Pictures from Google Images option from the Action drop-down menu in Konvergo ERP." />

4.  On the pop-up window that appears, click `Get Pictures`.

    <img src="product_images/click-get-picture-from-pop-up.png"
    class="align-center"
    alt="The pop-up that appears in which the user should click Get Picture in Konvergo ERP Sales." />

5.  Once clicked, the image(s) will appear incrementally.

    > [!NOTE]
    > Only the first 10 images are fetched immediately. If you selected
    > more than 10, the rest are fetched as a background job.
    >
    > The background job processes about 100 images in a minute. If the
    > quota authorized by Google (either with a free or a paid plan) is
    > reached, the background job puts itself on hold for 24 hours.
    > Then, it will continue where it stopped the day before.

<div class="seealso">

[Create, modify, or close your Google Cloud Billing
account](https://cloud.google.com/billing/docs/how-to/manage-billing-account)

</div>
