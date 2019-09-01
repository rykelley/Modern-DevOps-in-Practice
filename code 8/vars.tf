variable "client_id" {
    type = "string"
    default="2a9ce1d9-8dbc-4ec9-9ab4-cfea3fbd714b"
    description = "The SP app Id"
}
variable "tenant_id" {
    type = "string"
    default="cb3ace77-d654-4d5e-b6c4-f2cd7de7bee6"
    description = "The Azure AD Id"
}
variable "subscription_id" {
    type = "string"
    default="c9e497b4-56d8-4abb-ae32-82a97e44b7db"
    description = "The Azure account subscription Id"
}
variable "client_secret" {
    description = "The authentication token for the SP"
}