# == Class suricata::install
#
class suricata::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  # install packages
  $packages = [
    #'software-properties-common',
    #'python-software-properties',
    'ethtool',
    #'python-pyinotify',
  ]
  ensure_packages($packages)

  # install suricata repo
  #apt::ppa{ 'ppa:oisf/suricata-stable':
  #  require => Package['python-software-properties'],
  #} ~>
  ## update apt
  #exec { 'apt-update':
  #  command     => '/usr/bin/apt-get update',
  #  require     => Apt::Ppa['ppa:oisf/suricata-stable'],
  #  refreshonly => true,
  #}

  # install suricata package
  #package {'libhtp1':
  #  ensure  => latest,
  #  require => [ Apt::Ppa['ppa:oisf/suricata-stable'], Exec['apt-update'] ],
  #}
  package { $suricata::package_name:
    ensure  => latest,
    #require => [ Apt::Ppa['ppa:oisf/suricata-stable'], Exec['apt-update'] ],
  }
}
