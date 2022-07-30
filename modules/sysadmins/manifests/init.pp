# this was an excersize in creating a group called 'sysadmins' and adding users to the group with a specific uid.
class sysadmins {
    $group = 'sysadmins'              # creating a variable just to see how this works. 
    # group i want to have created. 
    group { $group:                   # the created variable is now the name of the group
        ensure => present,
    }
    # users i want to add on nodes.
    user { 'bob':
        ensure => present,
        uid    => '9999',
        groups => 'sysadmins',       # Implied Dependancy for sysadmins group
    }
    user { 'nancy':
        ensure => present,
        uid    => '9998',
        groups => $group,            # can use the variable here.
    }
    user { 'steve':
        ensure => present,
        uid    => '9997',
        groups => $group,            # can use the variable here.
    }
}
