# == Class suricata::service
#
# This class is meant to be called from suricata
# It ensure the service is running
#
class suricata::service {
# service irqbalance stop
  service { 'irqbalance':
    ensure => stopped,
    enable => false,
  }

  service { $suricata::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
