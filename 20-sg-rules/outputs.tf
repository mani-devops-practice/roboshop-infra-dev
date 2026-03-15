output "my_ipv4" {
  value = chomp(data.http.my_public_ip4.response_body)
}