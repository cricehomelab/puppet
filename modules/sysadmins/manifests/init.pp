# this was an excersize in creating a group called 'sysadmins' and adding users to the group with a specific uid.
class sysadmins {
    # group i want to have created. 
    group { 'sysadmins':
        ensure => present,
    }
    # users i want to add on nodes.
    user { 'bob':
        ensure => present,
        uid    => '9999',
        groups => 'sysadmins',  # Implied Dependancy for sysadmins group
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
