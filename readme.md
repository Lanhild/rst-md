# RST to MD Converter

## Overview

This repository provides a solution to automatically sync and convert RST files from the Odoo documentation repository to Markdown files while preserving the directory structure.

## Structure

- `src/`: Contains RST files fetched from the Odoo documentation.
- `dist/`: Contains converted Markdown files.
- `scripts/`: Contains the scripts used for conversion and workflow management.

## Setup

### Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/lucasjoliveau/rst-md.git
   cd rst-md
   ```

2. Install Pandoc:
   ```sh
   sudo apt-get install -y pandoc
   ```

### Running the Conversion Script

To manually convert RST files to Markdown:

```sh
bash scripts/clone-repo.sh
bash scripts/convert_rst_to_md.sh
bash scripts/combine-md.sh
```
