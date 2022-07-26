class sysadmins {
    group { 'sysadmins':
        ensure => present,
    }
    user { 'bob':
        ensure => present,
        uid    => '9999',
        groups => 'sysadmins',
    }

    user { 'nancy':
        ensure => present,
        uid    => '9998',
        groups => 'sysadmins',
    }

    user { 'steve':
        ensure => present,
        uid    => '9997',
        groups => 'sysadmins',
    }
}
