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
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        replace => false,
    }
}
