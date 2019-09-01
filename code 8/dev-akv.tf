resource "azurerm_resource_group" "dev" {
  name     = "kraken-dev"
  location = "East US"

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190225"
    app = "kraken"
    environment = "development"
  }
}

resource "azurerm_key_vault" "dev" {
  name                        = "kraken-dev"
  location                    = "${azurerm_resource_group.dev.location}"
  resource_group_name         = "${azurerm_resource_group.dev.name}"
  enabled_for_disk_encryption = true
  tenant_id                   = "${var.tenant_id}"

  sku {
    name = "standard"
  }

  access_policy {
    tenant_id = "${var.tenant_id}"
    object_id = "4e10e28b-4502-4daa-a670-5c5fa6929a13"

    key_permissions = [
      "get","create","list", "delete"
    ]

    secret_permissions = [
      "get","set","list", "delete"
    ]
  }

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190225"
    app = "kraken"
    environment = "development"
  }
}