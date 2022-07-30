# handles the install and setting a homepage for apache. 
# this is also the first instance of me attempting to service a file from my puppet master to another device. 
class apache {
    package {'webserver':
        ensure => installed,
        name   => apache2,        
    } 
    # this is the default page serviced by apache. This is different than the original. 
    file { '/var/www/html/index.html':
        ensure  => file,
        source  => 'puppet:///modules/apache/index.html',
        owner   => 'root',                    # user (root in this case) has an implied dependancy for this if root did not exist this could not be applied 
        group   => 'root',                    # (more important for non root owners...)
        mode    => '0644',
        replace => false,                     # This line means that it will not replace the file if not present but will put it there if its lost.
        require => Package['webserver'],      # ensures that apache is installed before trying to enforce this. 
    }
    file { '/etc/apache2/apache2.conf':
        ensure  => file,
        source  => 'puppet:///modules/apache/apache2base.conf',
        require => Package['webserver'],
    }
    service { 'apache2' :
        ensure    => running,
        enable    => true,      
        subscribe => File['/etc/apache2/apache2.conf'],   # Like the require keyword with the addition that the service will restart if the file is changed. 
    }
    
}
