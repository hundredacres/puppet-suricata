# == Class suricata::service
#
# This class is meant to be called from suricata
# It ensure the service is running
#
class suricata::service {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }
	case $::service_provider {
    'systemd': {
      $systemd_path = $::operatingsystem ? {
        /(Ubuntu|Debian)/ => '/lib/systemd/system',
        default           => '/usr/lib/systemd/system',
      }

      $service_require = File["${systemd_path}/suricata.service"]

      file { "${systemd_path}/suricata.service":
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => epp('suricata/suricata.service.epp'),
      }

      exec { 'Daemon-reload':
        command     => '/bin/systemctl daemon-reload',
        subscribe   => File["${systemd_path}/suricata.service"],
        refreshonly => true,
        notify      => Service[$::suricata::service_name],
      }
    }
    default: {
      $service_require = undef

      notice("Your ${::suricata::service_provider} is not supported")
    }
  }

  # service irqbalance stop
  service { 'irqbalance':
    ensure => stopped,
    enable => false,
  }

  # start service, do not enable at boot to wait for puppet to config nic
  service { $suricata::service_name:
    ensure    => $suricata::service_ensure,
    enable    => $suricata::service_enable,
    hasstatus => false,
    pattern   => '/usr/bin/suricata',
  }
}
