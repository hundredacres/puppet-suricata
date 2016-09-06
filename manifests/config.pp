# == Class suricata::config
#
# This class is called from suricata
#
class suricata::config {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  # disable offloading
  # generic-receive-offload
  exec { 'disable_gro':
    command => "/sbin/ethtool -K ${suricata::monitor_interface} gro off",
    unless  => "/sbin/ethtool -k ${suricata::monitor_interface} | grep 'generic-receive-offload: off'",
  }
  if $rx_vlan_offload {
    # rx-vlan-offload
    exec { 'disable_rxvlan':
      command => "/sbin/ethtool -K ${suricata::monitor_interface} rxvlan off",
      unless  => "/sbin/ethtool -k ${suricata::monitor_interface} | grep 'rx-vlan-offload: off'",
    }
  }
  # generic-segmentation-offload
  exec { 'disable_gso':
    command => "/sbin/ethtool -K ${suricata::monitor_interface} gso off",
    unless  => "/sbin/ethtool -k ${suricata::monitor_interface} | grep 'generic-segmentation-offload: off'",
  }
  # tcp-segmentation-offload
  exec { 'disable_sg':
    command => "/sbin/ethtool -K ${suricata::monitor_interface} sg off",
    unless  => "/sbin/ethtool -k ${suricata::monitor_interface} | grep 'tcp-segmentation-offload: off'",
  }
  # rx-checksumming
  exec { 'disable_rx':
    command => "/sbin/ethtool -K ${suricata::monitor_interface} rx off",
    unless  => "/sbin/ethtool -k ${suricata::monitor_interface} | grep 'rx-checksumming: off'",
  }

  # set promisc mode
  exec { 'set_promisc':
    command => "/sbin/ifconfig ${suricata::monitor_interface} promisc",
    unless  => "/sbin/ifconfig ${suricata::monitor_interface} | grep 'PROMISC'",
  }

  # enable interface
  exec { 'set_enable':
    command => "/sbin/ifconfig ${suricata::monitor_interface} up",
    unless  => "/sbin/ifconfig ${suricata::monitor_interface} | grep 'UP'",
  }

  # create logdir
  file{ 'logdir':
    ensure => directory,
    path   => $suricata::default_log_dir,
  }

  # create suricata configs
  file{ 'suricata-default':
    owner   => $suricata::suricata_user,
    group   => 'root',
    path    => "${suricata::sysdir}/suricata",
    content => template("suricata/suricata-${::osfamily}.erb"),
    mode    => 0644,
  }
  file{ 'suricata.yaml':
    path    => '/etc/suricata/suricata.yaml',
    source  => $suricata::manage_file_source,
    content => $suricata::manage_file_content,
  }
  file{ 'reference.config':
    owner   => $suricata::suricata_user,
    group   => $suricata::suricata_group,
    path    => '/etc/suricata/reference.config',
    content => template('suricata/reference.config.erb'),
    mode    => 0644,
  }
}
