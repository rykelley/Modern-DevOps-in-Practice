data "azurerm_resource_group" "packt-aks" {
  name = "MC_packt-aks_packt-aks_eastus"
}

resource "azurerm_public_ip" "dev-ui" {
  name                = "kraken-dev-ui"
  location            = "East US"
  resource_group_name = "${data.azurerm_resource_group.packt-aks.name}"
  allocation_method   = "Static"

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190225"
    app = "kraken-ui"
    environment = "development"
  }
}

resource "azurerm_public_ip" "dev-api" {
  name                = "kraken-dev-api"
  location            = "East US"
  resource_group_name = "${data.azurerm_resource_group.packt-aks.name}"
  allocation_method   = "Static"

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190225"
    app = "kraken-api"
    environment = "development"
  }
}

resource "azurerm_public_ip" "qa-ui" {
  name                = "kraken-qa-ui"
  location            = "East US"
  resource_group_name = "${data.azurerm_resource_group.packt-aks.name}"
  allocation_method   = "Static"

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190225"
    app = "kraken-ui"
    environment = "qa"
  }
}

resource "azurerm_public_ip" "qa-api" {
  name                = "kraken-qa-api"
  location            = "East US"
  resource_group_name = "${data.azurerm_resource_group.packt-aks.name}"
  allocation_method   = "Static"

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190225"
    app = "kraken-api"
    environment = "qa"
  }
}

resource "azurerm_public_ip" "prod-ui" {
  name                = "kraken-prod-ui"
  location            = "East US"
  resource_group_name = "${data.azurerm_resource_group.packt-aks.name}"
  allocation_method   = "Static"

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190225"
    app = "kraken-ui"
    environment = "production"
  }
}

resource "azurerm_public_ip" "prod-api" {
  name                = "kraken-prod-api"
  location            = "East US"
  resource_group_name = "${data.azurerm_resource_group.packt-aks.name}"
  allocation_method   = "Static"

  tags {
    created-by = "cory.cordell@cordell-tech.com"
    created-date = "20190225"
    app = "kraken-api"
    environment = "production"
  }
}