class {'unattended-upgrades'
  package  { 'unattended-upgrades':
    ensure => installed,
  }
}
