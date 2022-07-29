class unattendedupgrades {
  package  { 'unattended-upgrades':
    ensure => installed,
  }
}
