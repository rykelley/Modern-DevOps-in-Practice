resource "azurerm_resource_group" "kraken-core" {
  name     = "kraken"
  location = "East US"

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190225"
    app = "kraken"
  }
}

resource "azurerm_container_registry" "acr" {
  name                     = "kraken"
  resource_group_name      = "${azurerm_resource_group.kraken-core.name}"
  location                 = "${azurerm_resource_group.kraken-core.location}"
  sku                      = "Basic"
  admin_enabled            = false
}