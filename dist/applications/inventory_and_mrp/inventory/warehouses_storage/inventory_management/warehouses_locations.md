# Manage Warehouses and Locations

## Terminology

### Warehouse

In Odoo, a **Warehouse** is the actual building/place in which a
company's items are stocked. Multiple warehouses can be set up in Odoo
and the user can create moves between warehouses.

### Location

A **Location** is a specific space within the warehouse. It can be a
sublocation of the warehouse (a shelf, a floor, an aisle, and so on).
Therefore, a location is part of one warehouse only and it is not
possible to link one location to multiple warehouses. In Odoo, as many
locations can be configured as needed under one warehouse.

There are three types of locations:

- The **Physical Locations** are internal locations that are part of the
  warehouses that the company owns. They can be the loading and
  unloading areas of the warehouse, a shelf, a department, etc.
- The **Partner Locations** are spaces within a customer and/or vendor's
  warehouse. They work the same way as physical locations, with the only
  difference being that they are not owned by the user's company.
- The **Virtual Locations** are places that do not exist, but in which
  products can be placed when they are not physically in an inventory
  yet (or anymore). They come in handy when recording lost products
  (**Inventory Loss**), or accounting for products that are on their way
  to the warehouse (**Procurements**).

In Odoo, locations are structured hierarchically. Locations can be
structured as a tree, dependent on a parent-child relationship. This
gives more detailed levels of analysis of the stock operations and the
organization of the warehouses.

## Configuration

To activate locations, go to `Configuration --> Settings` and enable
`Storage Locations`. Then, click `Save`.

<img src="warehouses_locations/storage-location-warehouse-setting.png"
class="align-center"
alt="Enable the storage location feature in Odoo Inventory settings." />

> [!IMPORTANT]
> To manage several routes within the warehouses, also enable
> `Multi-Step Routes` and check
> `/applications/inventory_and_mrp/inventory/warehouses_storage/inventory_management/use_routes`.

## Create a new warehouse

To create a warehouse, go to
`Configuration --> Warehouse Management --> Warehouses` and click on
`Create`.

Then, fill out a `Warehouse Name` and a `Short Name`. The short name is
five characters maximum.

<img src="warehouses_locations/create-new-warehouse.png"
class="align-center"
alt="Short name field of a warehouse on Odoo Inventory." />

> [!IMPORTANT]
> The `Short Name` appears on transfer orders and other warehouse
> documents. Odoo recommends using an understandable one like
> "WH/\[first letters of location\]".

Now, go back to the `Inventory` dashboard. There, new operations related
to the newly created warehouse have been automatically generated.

<img src="warehouses_locations/new-transfer-types.png"
class="align-center"
alt="Inventory app dashboard displaying new transfer types for the recently created warehouse." />

> [!NOTE]
> Adding a second warehouse will automatically activate the `Locations`
> setting.

## Create a new location

To create a location, go to
`Configuration --> Warehouse Management --> Locations` and click on
`Create`.

Then, fill out a `Location Name` and a `Parent Location` and click
`Save`.

<img src="warehouses_locations/create-new-location.png"
class="align-center"
alt="Create a new warehouse location in Odoo Inventory." />
