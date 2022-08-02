# handles the install and setting a homepage for apache. 
# this is also the first instance of me attempting to service a file from my puppet master to another device. 
class apache {    
    # case statement to allow additional support for RHEL packages as well as Debian packages for apache. 
    case $::facts['os']['family']{
       "Redhat" : {
        $package_name = 'httpd'
        $service_name = 'httpd'
        $config_file  = '/etc/httpd/conf/httpd.conf'
        $static_config = 'puppet:///modules/apache/httpdbase.conf'
       }
       "Debian" : {
        $package_name = 'apache2'
        $service_name = 'apache2'
        $config_file  = '/etc/apache2/apache2.conf'
        $static_config = 'puppet:///modules/apache/apache2base.conf'
       }
       default: {
        fail('Unknown operating system')           # default for any OS that are not defined. 
       }
    }
    $index_file = '/var/www/html/index.html'   
    
    # I see a lot of value from variables, but I also see some cases where this affects readability.
    # I think readability is affected pretty heavily in this module. 
    # I can also see how it might be easy to have a "generic" init.pp ready to go for about anything with variables. 
    # The ability to declare variables for modularity seems quite useful and may be worth the tradeoff. 

    package {'webserver':
        ensure => installed,
        name   => $package_name,        
    } 
    # this is the default page serviced by apache. This is different than the original. 
    file { $index_file:
        ensure  => file,
        source  => 'puppet:///modules/apache/index.html',
        owner   => 'root',                    # user (root in this case) has an implied dependancy for this if root did not exist this could not be applied 
        group   => 'root',                    # (more important for non root owners...)
        mode    => '0644',
        replace => true,                     # This line means that it will not replace the file if not present but will put it there if its lost. (EDIT set to replace 8/2/22)
        require => Package['webserver'],      # ensures that apache is installed before trying to enforce this. 
    }
    file { $config_file:
        ensure  => file,
        source  => $static_config,
        require => Package['webserver'],
    }
    service { $service_name :
        ensure    => running,
        enable    => true,      
        subscribe => File[$config_file],   # Like the require keyword with the addition that the service will restart if the file is changed. 
    }
}
