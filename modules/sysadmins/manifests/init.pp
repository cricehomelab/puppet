# this was an excersize in creating a group called 'sysadmins' and adding users to the group with a specific uid.
class sysadmins {
    $group = 'sysadmins'                   # creating a variable just to see how this works. 
    # group i want to have created. 
    group { $group:                        # the created variable is now the name of the group
        ensure => present,
    }
    
    # Example on Interpolating variables. 
    $firstname = 'Bob'
    $lastname = 'Smith'
    $comment = "${firstname} ${lastname}"  # example of interpolated variables. 
    # users I want to add on nodes.
    user { 'bob':
        ensure  => present,
        comment => $comment,               # interpolated variable added. 
        uid     => '9999',
        groups  => 'sysadmins',            # Implied Dependancy for sysadmins group
    }
    user { 'nancy':
        ensure => present,
        uid    => '9998',
        groups => $group,                  # can use the variable here.
    }
    user { 'steve':
        ensure => present,
        uid    => '9997',
        groups => $group,                  # can use the variable here.
    }
    # array example
    $moreusers = ['austin', 'willy', 'trina']  # example of array. 
    # create 3 users, 1 for each member of the array that is above.
    # using an iterator to create the users and add a .bashrc for the users.    
    # works on centos7 not on ubuntu....  
    $moreusers.each | $u | {
        user { $u :
            ensure     => present,
            managehome => true,   
        }
        
        file { "home/${u}/.bashrc":
            ensure  => file,
            owner   => $u,
            group   => $u,
            content => 'export PATH=$PATH:/opt/puppetlabs/puppet/bin',
        }
    }
    /*
    # old way of doing this 
    user {$moreusers:
        ensure => present,
        groups => $group,
    }
    */

}
