# == Class suricata::params
#
# This class is meant to be called from suricata
# It sets variables according to platform
#
class suricata::params {
  $custom_references = undef
  $default_log_dir = '/var/log/suricata'
  $home_net = '192.168.0.0/16,10.0.0.0/8,172.16.0.0/12'
  $ruleset = 'emerging'
  $scirius_ruleset_name = 'ETpro'
  $source = ''
  $threads = $::processorcount
  $template = 'suricata/suricata.yaml.erb'
  $rx_vlan_offload = true

  case $::osfamily {
    'Debian': {
      $package_name = 'suricata'
      $service_name = 'suricata'
      $sysdir = '/etc/default'
      $monitor_interface = 'eth1'
    }
    'RedHat', 'Amazon': {
      $package_name = 'suricata'
      $service_name = 'suricata'
      $sysdir = '/etc/sysconfig'
      $monitor_interface = 'eth1'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
