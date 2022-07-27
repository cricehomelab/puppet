node "puppet-agent-ubuntu.example.com" {
    include apache
    include sysadmins
}
node "puppet-agent-ubuntu-2.example.com" {
    include sysadmins
    include apache
}
node "*.example.com" {
    include sysadmins
}
