# this was the first agent I created.
node "puppet-agent-ubuntu.example.com" {
    include apache
    include sysadmins
    include unattended-updates
}
# I've been mirroring effort onto this agent just for repitition. 
node "puppet-agent-ubuntu-2.example.com" {
    include sysadmins
    include apache
    include unattended-updates
}
# this was an experiment to get a base set of things on the first check in. 
node "default" {
    include sysadmins
    include unattended-upgrades    
}
