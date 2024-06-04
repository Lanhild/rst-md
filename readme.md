# RST to MD Converter

## Overview

This repository provides a solution to automatically sync and convert RST files from the Odoo 16 documentation repository to Markdown files while preserving the directory structure.

## Structure

- `source/`: Contains RST files fetched from the Odoo documentation.
- `dist/`: Contains converted Markdown files.
- `scripts/`: Contains the scripts used for conversion and workflow management.

## Setup and Usage

### Prerequisites

- Python 3.x
- pip (Python package installer)

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/lucasjoliveau/rst-md.git
   cd rst-to-md-converter
   ```
2. Install Pandoc

### Running the Conversion Script

To manually convert RST files to Markdown:

    ```sh
    bash scripts/clone-repo.sh
    bash scripts/convert-rst-md.sh
    ```
