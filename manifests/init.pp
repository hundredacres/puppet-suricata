# == Class: suricata
#
# Full description of class suricata here.
#
# === Parameters
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, suricata main config file will have the param: source => $source
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, suricata main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Defaults to suricata/suricata.yaml.erb
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class suricata (
  Stdlib::Absolutepath $default_log_dir      = $suricata::params::default_log_dir,
  $custom_references    = $suricata::params::custom_references,
  String  $package_name         = $suricata::params::package_name,
  String  $service_name         = $suricata::params::service_name,
  Boolean $service_enable       = $suricata::params::service_enable,
  Enum['running', 'stopped'] $service_ensure       = $suricata::params::service_ensure,
  Stdlib::Absolutepath $sysdir               = $suricata::params::sysdir,
  $monitor_interface    = $suricata::params::monitor_interface,
  $scirius_ruleset_name = $suricata::params::scirius_ruleset_name,
  $source               = $suricata::params::source,
  $threads              = $suricata::params::threads,
  $template             = $suricata::params::template,
  $rx_vlan_offload      = $suricata::params::rx_vlan_offload,
  String $suricata_user        = $suricata::params::suricata_user,
  String $suricata_group       = $suricata::params::suricata_group,
) inherits suricata::params {
  # validate parameters
  validate_string($default_log_dir)
  validate_string($sysdir)
  validate_string($package_name)
  validate_string($service_name)
  validate_string($monitor_interface)
  validate_string($scirius_ruleset_name)
  validate_integer($threads)
  validate_bool($rx_vlan_offload)
  #include apt

  $manage_file_source = $suricata::source ? {
    ''      => undef,
    default => $suricata::source,
  }
  $manage_file_content = $suricata::template ? {
    ''      => undef,
    default => template($suricata::template),
  }

  if $suricata::monitor_interface in $::interfaces {
    class { 'suricata::install': } ->
    class { 'suricata::config': } ~>
    class { 'suricata::service': } ->
    Class['suricata']
  } else {
    notice "${monitor_interface} not present"
    notice "Available interfaces: ${::interfaces}"
    fail('Please use a available interface')
  }
}
