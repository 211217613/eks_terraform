output "az_s" {
  value = data.aws_availability_zones.available.names
}

output "az_ss" {
  value = data.aws_availability_zones.available.zone_ids[0]
}
