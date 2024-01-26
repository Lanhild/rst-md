# Extract API

Odoo provides a service to automate the processing of documents of type
**invoices**, **expenses** or **resumes**.

The service scans documents using an `OCR (Optical Character
Recognition)` engine and then uses `AI(Artificial Intelligence)`-based
algorithms to extract fields of interest such as the total, due date, or
invoice lines for *invoices*, the total, date for *expenses*, or the
name, email, phone number for *resumes*.

This service is a paid service. Each document processing will cost you
one credit. Credits can be bought on
[iap.odoo.com](https://iap.odoo.com/iap/in-app-services/259?sortby=date).

You can either use this service directly in the Accounting, Expense, or
Recruitment App or through the API. The Extract API, which is detailed
in the next section, allows you to integrate our service directly into
your own projects.

## Overview

The extract API uses the
[JSON-RPC2](https://www.jsonrpc.org/specification) protocol; its
endpoint routes are located at
<span class="title-ref">https://extract.api.odoo.com</span>.

### Version

The version of the Extract API is specified in the route.

  - The latest versions are:
    
      - invoices: 122
      - expenses: 132
      - applicant: 102

### Flow

The flow is the same for each document type.

1.  Call `/parse <extract_api/parse>` to submit your documents (one call
    for each document). On success, you receive a
    <span class="title-ref">document\_token</span> in the response.

2.  You then have to regularly poll `/get_result
    <extract_api/get_result>` to get the document's parsing status.  
    Alternatively, you can provide a
    <span class="title-ref">webhook\_url</span> at the time of the call
    to `/parse <extract_api/parse>` and you will be notified (via a POST
    request) when the result is ready.

The HTTP POST method should be used for all of them. A python
implementation of the full flow for invoices can be found `here
<extract_api/implementation.py>` and a token for integration testing is
provided in the `integration testing section
<latestextract_api/integration_testing>`.

## Parse

Request the processing of a document from the OCR. The route will return
a <span class="title-ref">document\_token</span>, you can use it to
obtain the result of your request.

### Routes

>   - /api/extract/invoice/2/parse
>   - /api/extract/expense/2/parse
>   - /api/extract/applicant/2/parse

### Request

<div class="rst-class">

o-definition-list

</div>

  - `jsonrpc` (required)  
    see [JSON-RPC2](https://www.jsonrpc.org/specification)

  - `method` (required)  
    see [JSON-RPC2](https://www.jsonrpc.org/specification)

  - `id` (required)  
    see [JSON-RPC2](https://www.jsonrpc.org/specification)

  - `params`
    
    <div class="rst-class">
    
    o-definition-list
    
    </div>
    
      - `account_token` (required)  
        The token of the account from which credits will be taken. Each
        successful call costs one token.
    
      - `version` (required)  
        The version will determine the format of your requests and the
        format of the server response. You should use the `latest
        version available <extract_api/version>`.
    
      - `documents` (required)  
        The document must be provided as a string in the ASCII encoding.
        The list should contain only one string. If multiple strings are
        provided only the first string corresponding to a pdf will be
        processed. If no pdf is found, the first string will be
        processed. This field is a list only for legacy reasons. The
        supported extensions are *pdf*, *png*, *jpg* and *bmp*.
    
      - `dbuuid` (optional)  
        Unique identifier of the Odoo database.
    
      - `webhook_url` (optional)  
        A webhook URL can be provided. An empty POST request will be
        sent to `webhook_url/document_token` when the result is ready.
    
      - `user_infos` (optional)  
        Information concerning the person sending the document to the
        extract service. It can be the client or the supplier (depending
        on the `perspective`). This information is not required in order
        for the service to work but it greatly improves the quality of
        the result.
        
        <div class="rst-class">
        
        o-definition-list
        
        </div>
        
          - `user_company_vat` (optional)  
            VAT number of the user.
        
          - `user_company_name` (optional)  
            Name of the user’s company.
        
          - `user_company_country_code` (optional)  
            Country code of the user. Format: [ISO3166
            alpha-2](https://www.iban.com/country-codes).
        
          - `user_lang` (optional)  
            The user language. Format: *language\_code + \_ + locale*
            (e.g. fr\_FR, en\_US).
        
          - `user_email` (optional)  
            The user email.
        
          - `purchase_order_regex` (optional)  
            Regex for purchase order identification. Will default to
            Odoo PO format if not provided.
        
          - `perspective` (optional)
            
            <div class="rst-class">
            
            o-definition-list
            
            </div>
            
            Can be `client` or `supplier`. This field is useful for
            invoices only. `client` means that the user information
            provided are related to the client of the invoice.
            `supplier` means that it's related to the supplier. If not
            provided, client will be used.

<!-- end list -->

``` js
{
    "jsonrpc": "2.0",
    "method": "call",
    "params": {
        "account_token": string,
        "version": int,
        "documents": [string],
        "dbuuid": string,
        "webhook_url": string,
        "user_infos": {
            "user_company_vat": string,
            "user_company_name": string,
            "user_company_country_code": string,
            "user_lang": string,
            "user_email": string,
            "purchase_order_regex": string,
            "perspective": string,
        },
    },
    "id": string,
}
```

<div class="note">

<div class="title">

Note

</div>

The `user_infos` parameter is optional but it greatly improves the
quality of the result, especially for invoices. The more information you
can provide, the better.

</div>

### Response

<div class="rst-class">

o-definition-list

</div>

  - `jsonrpc`  
    see [JSON-RPC2](https://www.jsonrpc.org/specification)

  - `id`  
    see [JSON-RPC2](https://www.jsonrpc.org/specification)

  - `result`
    
    <div class="rst-class">
    
    o-definition-list
    
    </div>
    
      - `status`  
        The code indicating the status of the request. See the table
        below.
    
      - `status_msg`  
        A string giving verbose details about the request status.
    
      - `document_token`  
        Only present if the request is successful.

| status                                                     | status\_msg                                                   |
| ---------------------------------------------------------- | ------------------------------------------------------------- |
| <span class="title-ref">success</span>                     | Success                                                       |
| <span class="title-ref">error\_unsupported\_version</span> | Unsupported version                                           |
| <span class="title-ref">error\_internal</span>             | An error occurred                                             |
| <span class="title-ref">error\_no\_credit</span>           | You don't have enough credit                                  |
| <span class="title-ref">error\_unsupported\_format</span>  | Unsupported file format                                       |
| <span class="title-ref">error\_maintenance</span>          | Server is currently under maintenance, please try again later |

``` js
{
    "jsonrpc": "2.0",
    "id": string,
    "result": {
        "status": string,
        "status_msg": string,
        "document_token": string,
    }
}
```

<div class="note">

<div class="title">

Note

</div>

The API does not actually use the JSON-RPC error scheme. Instead the API
has its own error scheme bundled inside a successful JSON-RPC result.

</div>

## Get results

### Routes

>   - /api/extract/invoice/2/get\_result
>   - /api/extract/expense/2/get\_result
>   - /api/extract/applicant/2/get\_result

### Request

<div class="rst-class">

o-definition-list

</div>

  - `jsonrpc` (required)  
    see [JSON-RPC2](https://www.jsonrpc.org/specification)

  - `method` (required)  
    see [JSON-RPC2](https://www.jsonrpc.org/specification)

  - `id` (required)  
    see [JSON-RPC2](https://www.jsonrpc.org/specification)

  - `params`
    
    <div class="rst-class">
    
    o-definition-list
    
    </div>
    
      - `version` (required)  
        The version should match the version passed to the `/parse
        <extract_api/parse>` request.
    
      - `document_token` (required)  
        The `document_token` for which you want to get the current
        parsing status.
    
      - `account_token` (required)  
        The token of the account that was used to submit the document.

<!-- end list -->

``` js
{
    "jsonrpc": "2.0",
    "method": "call",
    "params": {
        "version": int,
        "document_token": int,
        "account_token": string,
    },
    "id": string,
}
```

### Response

When getting the results from the parse, the detected field vary a lot
depending on the type of document. Each response is a list of
dictionaries, one for each document. The keys of the dictionary are the
name of the field and the value is the value of the field.

<div class="rst-class">

o-definition-list

</div>

  - `jsonrpc`  
    see [JSON-RPC2](https://www.jsonrpc.org/specification)

  - `id`  
    see [JSON-RPC2](https://www.jsonrpc.org/specification)

  - `result`
    
    <div class="rst-class">
    
    o-definition-list
    
    </div>
    
      - `status`  
        The code indicating the status of the request. See the table
        below.
    
      - `status_msg`  
        A string giving verbose details about the request status.
    
      - `results`  
        Only present if the request is successful.
        
        <div class="rst-class">
        
        o-definition-list
        
        </div>
        
          - `full_text_annotation`  
            Contains the unprocessed full result from the OCR for the
            document

| status                                                            | status\_msg                                                   |
| ----------------------------------------------------------------- | ------------------------------------------------------------- |
| <span class="title-ref">success</span>                            | Success                                                       |
| <span class="title-ref">error\_unsupported\_version</span>        | Unsupported version                                           |
| <span class="title-ref">error\_internal</span>                    | An error occurred                                             |
| <span class="title-ref">error\_maintenance</span>                 | Server is currently under maintenance, please try again later |
| <span class="title-ref">error\_document\_not\_found</span>        | The document could not be found                               |
| <span class="title-ref">error\_unsupported\_size</span>           | The document has been rejected because it is too small        |
| <span class="title-ref">error\_no\_page\_count</span>             | Unable to get page count of the PDF file                      |
| <span class="title-ref">error\_pdf\_conversion\_to\_images</span> | Couldn't convert the PDF to images                            |
| <span class="title-ref">error\_password\_protected</span>         | The PDF file is protected by a password                       |
| <span class="title-ref">error\_too\_many\_pages</span>            | The document contains too many pages                          |

``` js
{
    "jsonrpc": "2.0",
    "id": string,
    "result": {
        "status": string,
        "status_msg": string,
        "results": [
            {
                "full_text_annotation": string,
                "feature_1_name": feature_1_result,
                "feature_2_name": feature_2_result,
                ...
            },
            ...
        ]
    }
}
```

#### Common fields

##### `feature_result`

Each field of interest we want to extract from the document such as the
total or the due date are also called **features**. An exhaustive list
of all the extracted features associated to a type of document can be
found in the sections below.

For each feature, we return a list of candidates and we spotlight the
candidate our model predicts to be the best fit for the feature.

<div class="rst-class">

o-definition-list

</div>

  - `selected_value` (optional)  
    The best candidate for this feature.

  - `selected_values` (optional)  
    The best candidates for this feature.

  - `candidates` (optional)  
    List of all the candidates for this feature ordered by decreasing
    confidence score.

<!-- end list -->

``` js
"feature_name": {
    "selected_value": candidate_12,
    "candidates": [candidate_12, candidate_3, candidate_4, ...]
}
```

##### candidate

For each candidate we give its representation and position in the
document. Candidates are sorted by decreasing order of suitability.

<div class="rst-class">

o-definition-list

</div>

  - `content`  
    Representation of the candidate.

  - `coords`
    
    <div class="rst-class">
    
    o-definition-list
    
    </div>
    
    `[center_x, center_y, width, height, rotation_angle]`. The position
    and dimensions are relative to the size of the page and are
    therefore between 0 and 1. The angle is a clockwise rotation
    measured in degrees.

  - `page`  
    Page of the original document on which the candidate is located
    (starts at 0).

<!-- end list -->

``` js
"candidate": [
    {
        "content": string|float,
        "coords": [float, float, float, float, float],
        "page": int
    },
    ...
]
```

#### Invoices

Invoices are complex and can have a lot of different fields. The
following table gives an exhaustive list of all the fields we can
extract from an invoice.

<table>
<colgroup>
<col style="width: 26%" />
<col style="width: 73%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature name</th>
<th>Specifities</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>SWIFT_code</code></td>
<td><p><code>content</code> is a dictionary encoded as a string.</p>
<p>It contains information about the detected SWIFT code (or <a href="https://www.iso9362.org/isobic/overview.html">BIC</a>).</p>
<p>Keys:</p>
<div class="rst-class">
<p>o-definition-list</p>
</div>
<dl>
<dt><code>bic</code></dt>
<dd><p>detected BIC (string).</p>
</dd>
<dt><code>name</code> (optional)</dt>
<dd><p>bank name (string).</p>
</dd>
<dt><code>country_code</code></dt>
<dd><p>ISO3166 alpha-2 country code of the bank (string).</p>
</dd>
<dt><code>city</code> (optional)</dt>
<dd><p>city of the bank (string).</p>
</dd>
<dt><code>verified_bic</code></dt>
<dd><p>True if the BIC has been found in our DB (bool).</p>
</dd>
</dl>
<p>Name and city are present only if verified_bic is true.</p></td>
</tr>
<tr class="even">
<td><code>iban</code></td>
<td><code>content</code> is a string</td>
</tr>
<tr class="odd">
<td><code>aba</code></td>
<td><code>content</code> is a string</td>
</tr>
<tr class="even">
<td><code>VAT_Number</code></td>
<td><p><code>content</code> is a string</p>
<p>Depending on the value of perspective in the user_infos, this will be the VAT number of the supplier or the client. If perspective is client, it'll be the supplier's VAT number. If it's supplier, it's the client's VAT number.</p></td>
</tr>
<tr class="odd">
<td><code>qr-bill</code></td>
<td><code>content</code> is a string</td>
</tr>
<tr class="even">
<td><code>payment_ref</code></td>
<td><code>content</code> is a string</td>
</tr>
<tr class="odd">
<td><code>purchase_order</code></td>
<td><p><code>content</code> is a string</p>
<p>Uses <code>selected_values</code> instead of <code>selected_value</code></p></td>
</tr>
<tr class="even">
<td><code>country</code></td>
<td><code>content</code> is a string</td>
</tr>
<tr class="odd">
<td><code>currency</code></td>
<td><code>content</code> is a string</td>
</tr>
<tr class="even">
<td><code>date</code></td>
<td><p><code>content</code> is a string</p>
<p>Format : <em>YYYY-MM-DD</em></p></td>
</tr>
<tr class="odd">
<td><code>due_date</code></td>
<td>Same as for <code>date</code></td>
</tr>
<tr class="even">
<td><code>total_tax_amount</code></td>
<td><code>content</code> is a float</td>
</tr>
<tr class="odd">
<td><code>invoice_id</code></td>
<td><code>content</code> is a string</td>
</tr>
<tr class="even">
<td><code>subtotal</code></td>
<td><code>content</code> is a float</td>
</tr>
<tr class="odd">
<td><code>total</code></td>
<td><code>content</code> is a float</td>
</tr>
<tr class="even">
<td><code>supplier</code></td>
<td><code>content</code> is a string</td>
</tr>
<tr class="odd">
<td><code>client</code></td>
<td><code>content</code> is a string</td>
</tr>
<tr class="even">
<td><code>email</code></td>
<td><code>content</code> is a string</td>
</tr>
<tr class="odd">
<td><code>website</code></td>
<td><code>content</code> is a string</td>
</tr>
</tbody>
</table>

##### `feature_result` for the `invoice_lines` feature

It follows a more specific structure. It is basically a list of
dictionaries where each dictionary represents an invoice line. Each
value follows a `latestextract_api/get_result/feature_result` structure.

``` js
"invoice_lines": [
    {
        "description": feature_result,
        "discount": feature_result,
        "product": feature_result,
        "quantity": feature_result,
        "subtotal": feature_result,
        "total": feature_result,
        "taxes": feature_result,
        "total": feature_result,
        "unit": feature_result,
        "unit_price": feature_result
    },
    ...
]
```

#### Expense

The expenses are less complex than invoices. The following table gives
an exhaustive list of all the fields we can extract from an expense
report.

| Feature name  | Specifities           |
| ------------- | --------------------- |
| `description` | `content` is a string |
| `country`     | `content` is a string |
| `date`        | `content` is a string |
| `total`       | `content` is a float  |
| `currency`    | `content` is a string |

#### Applicant

This third type of document is meant for processing resumes. The
following table gives an exhaustive list of all the fields we can
extract from a resume.

| Feature name | Specifities           |
| ------------ | --------------------- |
| `name`       | `content` is a string |
| `email`      | `content` is a string |
| `phone`      | `content` is a string |
| `mobile`     | `content` is a string |

## Integration Testing

You can test your integration by using *integration\_token* as
`account_token` in the `/parse <extract_api/parse>` request.

Using this token put you in test mode and allows you to simulate the
entire flow without really parsing a document and without being billed
one credit for each successful **document** parsing.

The only technical differences in test mode is that the document you
send is not parsed by the system and that the response you get from
`/get_result <extract_api/get_result>` is a hard-coded one.

A python implementation of the full flow for invoices can be found `here
<extract_api/implementation.py>`.
