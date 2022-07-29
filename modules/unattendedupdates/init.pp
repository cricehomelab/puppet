class {'unattended updates'
  package  { 'unattended-uprades':
    ensure => installed,
  }
}
