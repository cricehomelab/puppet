# This class ensures security updates will be installed. 
class unattendedupgrades {
  package  { 'unattended-upgrades':
    ensure => installed,
  }
  package { 'apt-listchanges' :
  ensure => installed,
  }
}
