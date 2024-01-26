  - custom-css  
    showcase\_tables.css

# RST cheat sheet

## Headings

For each formatting line (e.g., `===`), write as many symbols (`=`) as
there are characters in the header.  
The symbols used for the formatting are, in fact, not important. Only
the order in which they are written matters, as it determines the size
of the decorated heading. This means that you may encounter different
heading formatting and in a different order, in which case you should
follow the formatting in place in the document. In any other case, use
the formatting shown below.

<table style="width:53%;">
<colgroup>
<col style="width: 20%" />
<col style="width: 31%" />
</colgroup>
<thead>
<tr class="header">
<th>Heading size</th>
<th>Formatting</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>H1</td>
<td><pre class="text"><code>=======
Heading
=======</code></pre></td>
</tr>
<tr class="even">
<td>H2</td>
<td><pre class="text"><code>Heading
=======</code></pre></td>
</tr>
<tr class="odd">
<td>H3</td>
<td><pre class="text"><code>Heading
-------</code></pre></td>
</tr>
<tr class="even">
<td>H4</td>
<td><pre class="text"><code>Heading
~~~~~~~</code></pre></td>
</tr>
<tr class="odd">
<td>H5</td>
<td><pre class="text"><code>Heading
*******</code></pre></td>
</tr>
<tr class="even">
<td>H6</td>
<td><pre class="text"><code>Heading
^^^^^^^</code></pre></td>
</tr>
</tbody>
</table>

<div class="important">

<div class="title">

Important

</div>

Each document must have **exactly one H1 heading**. No less, no more.

</div>

## Markups

### Emphasis (italic)

To emphasize a part of the text. The text is rendered in italic.

<table>
<tbody>
<tr class="odd">
<td>Fill out the information <em>before</em> saving the form.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>Fill out the information *before* saving the form.</code></pre></td>
</tr>
</tbody>
</table>

### Strong emphasis (bold)

To emphasize a part of the text. The text is rendered in bold.

<table>
<tbody>
<tr class="odd">
<td>A <strong>subdomain</strong> is a domain that is a part of another domain.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>A **subdomain** is a domain that is a part of another domain.</code></pre></td>
</tr>
</tbody>
</table>

### Technical term (literal)

To write a technical term or a specific value to insert. The text is
rendered in literal.

<table>
<tbody>
<tr class="odd">
<td>Insert the IP address of your printer, for example, <span class="title-ref">192.168.1.25</span>.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>Insert the IP address of your printer, for example, `192.168.1.25`.</code></pre></td>
</tr>
</tbody>
</table>

### Definitions

Use the <span class="title-ref">dfn</span> markup to define a term.

<table>
<tbody>
<tr class="odd">
<td>The documentation is written in RST and needs to be built (<code class="interpreted-text" role="dfn">converted to HTML</code>) to display nicely.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>The documentation is written in RST and needs to be built (:dfn:`converted to HTML`) to display
nicely.</code></pre></td>
</tr>
</tbody>
</table>

### Abbreviations

Use the <span class="title-ref">abbr</span> markup to write a
self-defining abbreviation that is displayed as a tooltip.

<table>
<tbody>
<tr class="odd">
<td>Odoo uses <code class="interpreted-text" role="abbr">OCR (optical character recognition)</code> and artificial intelligence technologies to recognize the content of the documents.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>Odoo uses :abbr:`OCR (optical character recognition)` and artificial intelligence technologies to
recognize the content of the documents.</code></pre></td>
</tr>
</tbody>
</table>

### `GUI (graphical user interface)` element

Use the <span class="title-ref">guilabel</span> markup to identify any
text of the interactive user interface (e.g., button labels, view
titles, field names, lists items, ...).

<table>
<tbody>
<tr class="odd">
<td>Update your credentials, then click on <code class="interpreted-text" role="guilabel">Save</code>.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>Update your credentials, then click on :guilabel:`Save`.</code></pre></td>
</tr>
</tbody>
</table>

### Menu selection

Use the <span class="title-ref">menuselection</span> markup to guide the
user through a sequence of menus.

<table>
<tbody>
<tr class="odd">
<td>To review your sales performance, go to <code class="interpreted-text" role="menuselection">Sales --&gt; Reporting --&gt; Dashboard</code>.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>To review your sales performance, go to :menuselection:`Sales --&gt; Reporting --&gt; Dashboard`.</code></pre></td>
</tr>
</tbody>
</table>

### File

Use the <span class="title-ref">file</span> markup to indicate a file
path or name.

<table>
<tbody>
<tr class="odd">
<td>Create redirections with the <code class="interpreted-text" role="file">redirects.txt</code> file at the root of the repository.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>Create redirections with the :file:`redirects.txt` file at the root of the repository.</code></pre></td>
</tr>
</tbody>
</table>

### Command

Use the <span class="title-ref">command</span> markup to highlight a
command.

<table>
<tbody>
<tr class="odd">
<td>Run the command <code class="interpreted-text" role="command">make clean html</code> to delete existing built files and build the documentation to HTML.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>Run the command :command:`make clean html` to delete existing built files and build the
documentation to HTML.</code></pre></td>
</tr>
</tbody>
</table>

## Lists

### Bulleted list

<table>
<tbody>
<tr class="odd">
<td><ul>
<li>This is a bulleted list.</li>
<li>It has two items, the second item uses two lines.</li>
</ul></td>
</tr>
<tr class="even">
<td><pre class="text"><code>- This is a bulleted list.
- It has two items, the second
  item uses two lines.</code></pre></td>
</tr>
</tbody>
</table>

### Numbered list

<table>
<tbody>
<tr class="odd">
<td><ol>
<li>This is a numbered list.</li>
<li>Numbering is automatic.</li>
</ol></td>
</tr>
<tr class="even">
<td><pre class="text"><code>#. This is a numbered list.
#. Numbering is automatic.</code></pre></td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr class="odd">
<td><ol start="6" type="1">
<li>Use this format to start the numbering with a number other than one.</li>
<li>The numbering is automatic from there.</li>
</ol></td>
</tr>
<tr class="even">
<td><pre class="text"><code>6. Use this format to start the numbering
   with a number other than one.
#. The numbering is automatic from there.</code></pre></td>
</tr>
</tbody>
</table>

<div class="tip">

<div class="title">

Tip

</div>

Prefer the use of autonumbered lists with
<span class="title-ref">\#.</span> for better code resilience.

</div>

### Nested lists

<table>
<tbody>
<tr class="odd">
<td><ul>
<li>This is the first item of a bulleted list.
<ol>
<li>It has a nested numbered list</li>
<li>with two items.</li>
</ol></li>
</ul></td>
</tr>
<tr class="even">
<td><pre class="text"><code>- This is the first item of a bulleted list.

  #. It has a nested numbered list
  #. with two items.</code></pre></td>
</tr>
</tbody>
</table>

## Hyperlinks

### External hyperlinks

External hyperlinks are links to a URL with a custom label. They follow
this syntax: `` `label <URL>`_ ``

<div class="note">

<div class="title">

Note

</div>

\- The URL can be a relative path to a file within the documentation. -
Use the `documentation pages hyperlinks
<contributing/doc-pages-hyperlinks>` if you target another documentation
page.

</div>

<table>
<tbody>
<tr class="odd">
<td>For instance, <a href="https://www.odoo.com">this is an external hyperlink to Odoo's website</a>.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>For instance, `this is an external hyperlink to Odoo&#39;s website &lt;https://www.odoo.com&gt;`_.</code></pre></td>
</tr>
</tbody>
</table>

### External hyperlink aliases

External hyperlink aliases allow creating shortcuts for external
hyperlinks.  
The definition syntax is as follows: `.. _target: URL`  
There are two ways to reference them, depending on the use case:

1.  `target_` creates a hyperlink with the target name as label and the
    URL as reference. Note that the `_` moved after the target\!
2.  `` `label <target_>`_ `` does exactly what you expect: the label
    replaces the name of the target, and the target is replaced by the
    URL.

<table>
<tbody>
<tr class="odd">
<td>A <a href="https://en.wikipedia.org/wiki/Proof_of_concept">proof-of-concept</a> is a simplified version, a prototype of what is expected to agree on the main lines of expected changes. <a href="https://en.wikipedia.org/wiki/Proof_of_concept">PoC</a> is a common abbreviation.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. _proof-of-concept: https://en.wikipedia.org/wiki/Proof_of_concept

   A proof-of-concept_ is a simplified version, a prototype of what is expected to agree on the main
   lines of expected changes. `PoC &lt;proof-of-concept_&gt;`_ is a common abbreviation.</code></pre></td>
</tr>
</tbody>
</table>

### Custom anchors

Custom anchors follow the same syntax as external hyperlink aliases but
without any URL. Indeed, they are internal. They allow referencing a
specific part of a document by using the target as an anchor. When the
user clicks on the reference, the documentation scrolls to the part of
the page containing the anchor.

The definition syntax is: `.. _target:`  
There are two ways to reference them, both using the `ref` markup:

1.  ``:ref:`target``\` creates a hyperlink to the anchor with the
    heading defined below as label.
2.  ``:ref:`label <target>``\` creates a hyperlink to the anchor with
    the given label.

See `contributing/relative-links` to learn how to write proper relative
links for internal references.

<div class="note">

<div class="title">

Note

</div>

\- Custom anchors can be referenced from other files than the ones in
which they are defined. - Notice that there is no `_` at the end,
contrary to what is done with `external
hyperlinks <contributing/external-hyperlinks>`.

</div>

<table>
<tbody>
<tr class="odd">
<td><p>This can easily be done by creating a new product, see <a href="https://example.com/product">How to create a product?</a> for additional help.</p>
<p><strong>How to create a product?</strong></p>
<p>As explained at the <a href="https://example.com/scroll-to-start-of-page">start of the page</a>, ...</p></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. _sales/quotation/start-of-page:

This can easily be done by creating a new product, see :ref:`product` for additional help.

.. _sales/quotation/product:

How to create a product?
========================

As explained at the :ref:`start of the page &lt;sales/quotation/start-of-page&gt;`, ...</code></pre></td>
</tr>
</tbody>
</table>

### Documentation pages hyperlinks

The `doc` markup allows referencing a documentation page wherever it is
in the file tree through a relative file path.  
As usual, there are two ways to use the markup:

1.  ``:doc:`path_to_doc_page``\` creates a hyperlink to the
    documentation page with the title of the page as label.
2.  ``:doc:`label <path_to_doc_page>``\` creates a hyperlink to the
    documentation page with the given label.

<table>
<tbody>
<tr class="odd">
<td>Please refer to <a href="https://example.com/doc/accounting/invoices.html">this documentation</a> and to <a href="https://example.com/doc/sales/proforma.html">Send a pro-forma invoice</a>.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>Please refer to :doc:`this documentation &lt;customer_invoices&gt;` and to
:doc:`../sales/sales/invoicing/proforma`.</code></pre></td>
</tr>
</tbody>
</table>

### File download hyperlinks

The `download` markup allows referencing files (that are not necessarily
`RST
(reStructuredText)` documents) within the source tree to be downloaded.

<table>
<tbody>
<tr class="odd">
<td>Download this <a href="https://example.com/doc/odoosh/extras/my_module.zip">module structure template</a> to start building your module in no time.</td>
</tr>
<tr class="even">
<td><pre class="text"><code>Download this :download:`module structure template &lt;extras/my_module.zip&gt;` to start building your
module in no time.</code></pre></td>
</tr>
</tbody>
</table>

## Images

The `image` markup allows inserting images in a document.

<table>
<tbody>
<tr class="odd">
<td><img src="rst_cheat_sheet/create-invoice.png" class="align-center" alt="Create an invoice." /></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. image:: rst_cheat_sheet/create-invoice.png
   :align: center
   :alt: Create an invoice.</code></pre></td>
</tr>
</tbody>
</table>

<div class="tip">

<div class="title">

Tip

</div>

Add the `:class: o-no-modal`
[option](https://docutils.sourceforge.io/docs/ref/rst/directives.html#common-options)
to an image to prevent opening it in a modal.

</div>

## Alert blocks (admonitions)

### Seealso

<table>
<tbody>
<tr class="odd">
<td><div class="seealso">
<ul>
<li><a href="https://example.com/doc/accounting/invoices.html">Customer invoices</a></li>
<li><a href="https://example.com/doc/sales/proforma.html#activate-the-feature">Pro-forma invoices</a></li>
</ul>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. seealso::
   - :doc:`customer_invoices`
   - `Pro-forma invoices &lt;../sales/sales/invoicing/proforma.html#activate-the-feature&gt;`_</code></pre></td>
</tr>
</tbody>
</table>

### Note

<table>
<tbody>
<tr class="odd">
<td><div class="note">
<div class="title">
<p>Note</p>
</div>
<p>Use this alert block to grab the reader's attention about additional information.</p>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. note::
   Use this alert block to grab the reader&#39;s attention about additional information.</code></pre></td>
</tr>
</tbody>
</table>

### Tip

<table>
<tbody>
<tr class="odd">
<td><div class="tip">
<div class="title">
<p>Tip</p>
</div>
<p>Use this alert block to inform the reader about a useful trick that requires an action.</p>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. tip::
   Use this alert block to inform the reader about a useful trick that requires an action.</code></pre></td>
</tr>
</tbody>
</table>

### Example

<table>
<tbody>
<tr class="odd">
<td><div class="example">
<p>Use this alert block to show an example.</p>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. example::
   Use this alert block to show an example.</code></pre></td>
</tr>
</tbody>
</table>

### Exercise

<table>
<tbody>
<tr class="odd">
<td><div class="exercise">
<p>Use this alert block to suggest an exercise to the reader.</p>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. exercise::
   Use this alert block to suggest an exercise to the reader.</code></pre></td>
</tr>
</tbody>
</table>

### Important

<table>
<tbody>
<tr class="odd">
<td><div class="important">
<div class="title">
<p>Important</p>
</div>
<p>Use this alert block to notify the reader about important information.</p>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. important::
   Use this alert block to notify the reader about important information.</code></pre></td>
</tr>
</tbody>
</table>

### Warning

<table>
<tbody>
<tr class="odd">
<td><div class="warning">
<div class="title">
<p>Warning</p>
</div>
<p>Use this alert block to require the reader to proceed with caution with what is described in the warning.</p>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. warning::
   Use this alert block to require the reader to proceed with caution with what is described in the
   warning.</code></pre></td>
</tr>
</tbody>
</table>

### Danger

<table>
<tbody>
<tr class="odd">
<td><div class="danger">
<div class="title">
<p>Danger</p>
</div>
<p>Use this alert block to bring the reader's attention to a serious threat.</p>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. danger::
   Use this alert block to bring the reader&#39;s attention to a serious threat.</code></pre></td>
</tr>
</tbody>
</table>

### Custom

<table>
<tbody>
<tr class="odd">
<td><div class="admonition">
<p>Title</p>
<p>Customize this alert block with a <strong>Title</strong> of your choice.</p>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. admonition:: Title

   Customize this alert block with a **Title** of your choice.</code></pre></td>
</tr>
</tbody>
</table>

## Tables

### List tables

List tables use two-level bulleted lists to convert data into a table.
The first level represents the rows and the second level represents the
columns.

<table>
<tbody>
<tr class="odd">
<td><table>
<thead>
<tr class="header">
<th>Name</th>
<th>Country</th>
<th>Favorite color</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Raúl</td>
<td>Montenegro</td>
<td>Purple</td>
</tr>
<tr class="even">
<td>Mélanie</td>
<td>France</td>
<td>Red</td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. list-table::
   :header-rows: 1
   :stub-columns: 1

   * - Name
     - Country
     - Favorite colour
   * - Raúl
     - Montenegro
     - Purple
   * - Mélanie
     - France
     - Turquoise</code></pre></td>
</tr>
</tbody>
</table>

### Grid tables

Grid tables represent the rendered table and are more visual to work
with.

<table>
<tbody>
<tr class="odd">
<td><table style="width:76%;">
<colgroup>
<col style="width: 33%" />
<col style="width: 20%" />
<col style="width: 22%" />
</colgroup>
<thead>
<tr class="header">
<th></th>
<th>Shirts</th>
<th>T-shirts</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><dl>
<dt><strong>Available colours</strong></dt>
<dd><ul>
<li></li>
</ul>
</dd>
</dl></td>
<td><blockquote>
<p>Purple</p>
</blockquote>
<dl>
<dt>--------------+</dt>
<dd><p>Turquoise</p>
</dd>
</dl></td>
<td><blockquote>
<p>Green</p>
</blockquote>
<dl>
<dt>---------------+</dt>
<dd><p>Orange</p>
</dd>
</dl></td>
</tr>
<tr class="even">
<td><strong>Sleeves length</strong></td>
<td>Long sleeves</td>
<td>Short sleeves</td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td><pre class="text"><code>+-----------------------+--------------+---------------+
|                       | Shirts       | T-shirts      |
+=======================+==============+===============+
| **Available colours** | Purple       | Green         |
|                       +--------------+---------------+
|                       | Turquoise    | Orange        |
+-----------------------+--------------+---------------+
| **Sleeves length**    | Long sleeves | Short sleeves |
+-----------------------+--------------+---------------+</code></pre></td>
</tr>
</tbody>
</table>

<div class="tip">

<div class="title">

Tip

</div>

\- Use <span class="title-ref">=</span> instead of
<span class="title-ref">-</span> to define header rows. - Remove
<span class="title-ref">-</span> and <span class="title-ref">|</span>
separators to merge cells. - Make use of [this convenient table
generator](https://www.tablesgenerator.com/text_tables) to build your
tables. Then, copy-paste the generated formatting into your document.

</div>

## Code blocks

<table>
<tbody>
<tr class="odd">
<td><div class="sourceCode" id="cb1"><pre class="sourceCode python"><code class="sourceCode python"><span id="cb1-1"><a href="#cb1-1" aria-hidden="true"></a><span class="kw">def</span> main():</span>
<span id="cb1-2"><a href="#cb1-2" aria-hidden="true"></a>    <span class="bu">print</span>(<span class="st">&quot;Hello world!&quot;</span>)</span></code></pre></div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. code-block:: python

   def main():
       print(&quot;Hello world!&quot;)</code></pre></td>
</tr>
</tbody>
</table>

## Spoilers

<table>
<tbody>
<tr class="odd">
<td><div class="spoiler">
<p>Answer to the Ultimate Question of Life, the Universe, and Everything</p>
<p><strong>42</strong></p>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. spoiler:: Answer to the Ultimate Question of Life, the Universe, and Everything

   **42**</code></pre></td>
</tr>
</tbody>
</table>

## Content tabs

<div class="caution">

<div class="title">

Caution

</div>

The <span class="title-ref">tabs</span> markup may not work well in some
situations. In particular:

  - The tabs' headers cannot be translated.
  - A tab cannot contain `headings <contributing/headings>`.
  - An `alert block <contributing/alert-blocks>` cannot contain tabs.
  - A tab cannot contain `custom anchors <contributing/custom-anchors>`.

</div>

### Basic tabs

Basic tabs are useful to split the content into multiple options. The
<span class="title-ref">tabs</span> markup is used to define sequence of
tabs. Each tab is then defined with the
<span class="title-ref">tab</span> markup followed by a label.

<table>
<tbody>
<tr class="odd">
<td><div class="tabs">
<div class="tab">
<p>Odoo Online</p>
<p>Content dedicated to Odoo Online users.</p>
</div>
<div class="tab">
<p>Odoo.sh</p>
<p>Alternative for Odoo.sh users.</p>
</div>
<div class="tab">
<p>On-premise</p>
<p>Third version for On-premise users.</p>
</div>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. tabs::

   .. tab:: Odoo Online

      Content dedicated to Odoo Online users.

   .. tab:: Odoo.sh

      Alternative for Odoo.sh users.

   .. tab:: On-premise

      Third version for On-premise users.</code></pre></td>
</tr>
</tbody>
</table>

### Nested tabs

Tabs can be nested inside one another.

<table>
<tbody>
<tr class="odd">
<td><div class="tabs">
<div class="tab">
<p>Stars</p>
<div class="tabs">
<div class="tab">
<p>The Sun</p>
<p>The closest star to us.</p>
</div>
<div class="tab">
<p>Proxima Centauri</p>
<p>The second closest star to us.</p>
</div>
<div class="tab">
<p>Polaris</p>
<p>The North Star.</p>
</div>
</div>
</div>
<div class="tab">
<p>Moons</p>
<div class="tabs">
<div class="tab">
<p>The Moon</p>
<p>Orbits the Earth.</p>
</div>
<div class="tab">
<p>Titan</p>
<p>Orbits Jupiter.</p>
</div>
</div>
</div>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. tabs::

   .. tab:: Stars

      .. tabs::

         .. tab:: The Sun

            The closest star to us.

         .. tab:: Proxima Centauri

            The second closest star to us.

         .. tab:: Polaris

            The North Star.

   .. tab:: Moons

      .. tabs::

         .. tab:: The Moon

            Orbits the Earth.

         .. tab:: Titan

            Orbits Jupiter.</code></pre></td>
</tr>
</tbody>
</table>

### Group tabs

Group tabs are special tabs that synchronize based on a group label. The
last selected group is remembered and automatically selected when the
user returns to the page or visits another page with the tabs group. The
<span class="title-ref">group-tab</span> markup is used to define group
tabs.

<table>
<tbody>
<tr class="odd">
<td><div class="tabs">
<div class="group-tab">
<p>C++</p>
<p>C++</p>
</div>
<div class="group-tab">
<p>Python</p>
<p>Python</p>
</div>
<div class="group-tab">
<p>Java</p>
<p>Java</p>
</div>
</div>
<div class="tabs">
<div class="group-tab">
<p>C++</p>
<div class="sourceCode" id="cb1"><pre class="sourceCode c++"><code class="sourceCode cpp"><span id="cb1-1"><a href="#cb1-1" aria-hidden="true"></a><span class="dt">int</span> main(<span class="at">const</span> <span class="dt">int</span> argc, <span class="at">const</span> <span class="dt">char</span> **argv) {</span>
<span id="cb1-2"><a href="#cb1-2" aria-hidden="true"></a>    <span class="cf">return</span> <span class="dv">0</span>;</span>
<span id="cb1-3"><a href="#cb1-3" aria-hidden="true"></a>}</span></code></pre></div>
</div>
<div class="group-tab">
<p>Python</p>
<div class="sourceCode" id="cb2"><pre class="sourceCode python"><code class="sourceCode python"><span id="cb2-1"><a href="#cb2-1" aria-hidden="true"></a><span class="kw">def</span> main():</span>
<span id="cb2-2"><a href="#cb2-2" aria-hidden="true"></a>    <span class="cf">return</span></span></code></pre></div>
</div>
<div class="group-tab">
<p>Java</p>
<div class="sourceCode" id="cb3"><pre class="sourceCode java"><code class="sourceCode java"><span id="cb3-1"><a href="#cb3-1" aria-hidden="true"></a><span class="kw">class</span> Main {</span>
<span id="cb3-2"><a href="#cb3-2" aria-hidden="true"></a>    <span class="kw">public</span> <span class="dt">static</span> <span class="dt">void</span> <span class="fu">main</span>(<span class="bu">String</span>[] args) {}</span>
<span id="cb3-3"><a href="#cb3-3" aria-hidden="true"></a>}</span></code></pre></div>
</div>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. tabs::

   .. group-tab:: C++

      C++

   .. group-tab:: Python

      Python

   .. group-tab:: Java

      Java

.. tabs::

   .. group-tab:: C++

      .. code-block:: c++

         int main(const int argc, const char **argv) {
             return 0;
         }

   .. group-tab:: Python

      .. code-block:: python

         def main():
             return

   .. group-tab:: Java

      .. code-block:: java

         class Main {
             public static void main(String[] args) {}
         }</code></pre></td>
</tr>
</tbody>
</table>

### Code tabs

Code tabs are essentially `group tabs <contributing/tabs/group>` that
treat the content as a `code block <contributing/code-blocks>`. The
<span class="title-ref">code-tab</span> markup is used to define a code
tab. Just as for the <span class="title-ref">code-block</span> markup,
the language defines the syntax highlighting of the tab. If set, the
label is used instead of the language for grouping tabs.

<table>
<tbody>
<tr class="odd">
<td><div class="tabs">
<div class="code-tab">
<p>c++ Hello C++</p>
<p>#include &lt;iostream&gt;</p>
<dl>
<dt>int main() {</dt>
<dd><p>std::cout &lt;&lt; "Hello World"; return 0;</p>
</dd>
</dl>
<p>}</p>
</div>
<div class="code-tab">
<p>python Hello Python</p>
<p>print("Hello World")</p>
</div>
<div class="code-tab">
<p>javascript Hello JavaScript</p>
<p>console.log("Hello World");</p>
</div>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. tabs::

   .. code-tab:: c++ Hello C++

      #include &lt;iostream&gt;

      int main() {
          std::cout &lt;&lt; &quot;Hello World&quot;;
          return 0;
      }

   .. code-tab:: python Hello Python

      print(&quot;Hello World&quot;)

   .. code-tab:: javascript Hello JavaScript

      console.log(&quot;Hello World&quot;);</code></pre></td>
</tr>
</tbody>
</table>

## Cards

<table>
<tbody>
<tr class="odd">
<td><div class="cards">
<div class="card" target="../documentation" data-tag="Step-by-step guide" data-large="">
<p>Documentation</p>
<p>Use this guide to acquire the tools and knowledge you need to write documentation.</p>
</div>
<div class="card" target="content_guidelines">
<p>Content guidelines</p>
<p>List of guidelines and trips and tricks to make your content shine at its brightest!</p>
</div>
<div class="card" target="rst_guidelines">
<p>RST guidelines</p>
<p>List of technical guidelines to observe when writing with reStructuredText.</p>
</div>
</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>.. cards::

   .. card:: Documentation
      :target: ../documentation
      :tag: Step-by-step guide
      :large:

      Use this guide to acquire the tools and knowledge you need to write documentation.

   .. card:: Content guidelines
      :target: content_guidelines

      List of guidelines and trips and tricks to make your content shine at its brightest!

   .. card:: RST guidelines
      :target: rst_guidelines

      List of technical guidelines to observe when writing with reStructuredText.</code></pre></td>
</tr>
</tbody>
</table>

## Document metadata

Sphinx supports document-wide metadata markups that specify a behavior
for the entire page.  
They must be placed between colons (<span class="title-ref">:</span>) at
the top of the source file.

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 81%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Metadata</strong></td>
<td><strong>Purpose</strong></td>
</tr>
<tr class="even">
<td><span class="title-ref">show-content</span></td>
<td><blockquote>
<p>Make a toctree page accessible from the navigation menu.</p>
</blockquote></td>
</tr>
<tr class="odd">
<td><span class="title-ref">show-toc</span></td>
<td><blockquote>
<p>Show the table of content on a page that has the <span class="title-ref">show-content</span> metadata markup.</p>
</blockquote></td>
</tr>
<tr class="even">
<td><span class="title-ref">code-column</span></td>
<td><blockquote>
<div class="line-block">Show a dynamic side column that can be used to display interactive tutorials or code excerpts.<br />
For example, see <code class="interpreted-text" role="doc">/applications/finance/accounting/getting_started/cheat_sheet</code>.</div>
</blockquote></td>
</tr>
<tr class="odd">
<td><span class="title-ref">hide-page-toc</span></td>
<td>Hide the "On this page" sidebar and use full page width for the content.</td>
</tr>
<tr class="even">
<td><span class="title-ref">custom-css</span></td>
<td>Link CSS files (comma-separated) to the document.</td>
</tr>
<tr class="odd">
<td><span class="title-ref">custom-js</span></td>
<td>Link JS files (comma-separated) to the document.</td>
</tr>
<tr class="even">
<td><span class="title-ref">classes</span></td>
<td>Assign the specified classes to the <span class="title-ref">&lt;main/&gt;</span> element of the document.</td>
</tr>
<tr class="odd">
<td><span class="title-ref">orphan</span></td>
<td>Suppress the need to include the document in a toctree.</td>
</tr>
<tr class="even">
<td><span class="title-ref">nosearch</span></td>
<td>Exclude the document from search results.</td>
</tr>
</tbody>
</table>

## Formatting tips

### Break the line but not the paragraph

<table>
<tbody>
<tr class="odd">
<td><div class="line-block">A first long line that you break in two -&gt; here &lt;- is rendered as a single line.<br />
A second line that follows a line break.</div></td>
</tr>
<tr class="even">
<td><pre class="text"><code>| A first long line that you break in two
  -&gt; here &lt;- is rendered as a single line.
| A second line that follows a line break.</code></pre></td>
</tr>
</tbody>
</table>

### Escape markup symbols (Advanced)

Markup symbols escaped with backslashes (`\`) are rendered normally. For
instance, `this \*\*line of text\*\* with \*markup\* symbols` is
rendered as “this \*\*line of text\*\* with \*markup\* symbols”.

When it comes to backticks (`  `<span class="title-ref">), which are
used in many cases such as :ref:\`external hyperlinks
\<contributing/external-hyperlinks\></span>, using backslashes for
escaping is no longer an option because the outer backticks interpret
enclosed backslashes and thus prevent them from escaping inner
backticks. For instance, `` `\`this formatting\ ```produces an`\[UNKNOWN
NODE title\_reference\]`error. Instead,``` `this formatting ```` `
should be used to produce the following
result: ``<span class="title-ref">this formatting</span>\`\`.
