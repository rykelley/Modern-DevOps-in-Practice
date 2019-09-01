provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.22.0"

  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

resource "azurerm_resource_group" "main" {
  name     = "packt-course"
  location = "East US"

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190214"
    purpose = "packt-course"
  }
}

resource "azurerm_key_vault" "main" {
  name                        = "packt-course"
  location                    = "${azurerm_resource_group.main.location}"
  resource_group_name         = "${azurerm_resource_group.main.name}"
  enabled_for_disk_encryption = true
  tenant_id                   = "${var.tenant_id}"

  sku {
    name = "standard"
  }

  access_policy {
    tenant_id = "${var.tenant_id}"
    object_id = "7294bc7c-d7ae-44a1-881c-d3f5066f4af4"

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]
  }

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190214"
    purpose = "packt-course"
  }
}