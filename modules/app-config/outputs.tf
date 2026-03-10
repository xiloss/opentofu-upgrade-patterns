output "config_file" {
  description = "Path to the generated local configuration file."
  value       = local_file.config.filename
}
