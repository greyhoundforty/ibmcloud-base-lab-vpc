output "frontend_subnet_id" {
  value = ibm_is_subnet.frontend.id
}

output "backend_subnet_id" {
  value = ibm_is_subnet.backend.id
}

