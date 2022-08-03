class restartrequired {
    $params = {
        "os_description" => $::facts['os']['distro']['description'],
        "os_family"      => $::facts['os']['family'],
        "hostname"       => $::facts['hostname'],
    }
    case $facts::['os']['family'] {
      "Debian" : {
        $file        = '/var/run/reboot-required'
        $file_exists = find_file($file)
      }
      default : {
        fail('Not a Debian OS.')
      }
    }
    if $file_exists {
      exec { 'reboot' : 
        provider => shell,
      }
    }
    

}