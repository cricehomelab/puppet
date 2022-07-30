# handles the install and setting a homepage for apache. 
# this is also the first instance of me attempting to service a file from my puppet master to another device. 
class apache {
    package {'webserver':
        ensure => installed,
        name   => apache2,        
    } 
    file { '/var/www/html/index.html':
        ensure  => file,
        source  => 'puppet:///modules/apache/index.html',
        owner   => 'root',                    # user (root in this case) has an implied dependancy for this if root did not exist this could not be applied (more important for non root owners...)
        group   => 'root',
        mode    => '0644',
        replace => false,                     # line means that it will not replace the file if not present but will put it there if its lost.
        require => Package['webserver'],
    }
    service { 'apache2' :
        ensure  => running,
        require => Package['webserver'],      # ensures that apache is installed before trying to enforce this. 
    }
}
