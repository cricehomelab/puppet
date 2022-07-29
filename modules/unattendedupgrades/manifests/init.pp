class unattendedupgrades {
  package  { 'unattended-upgrades':
    ensure => installed,
  }
  package { 'apt-listchanges' :
  ensure => installed,
  }
}
