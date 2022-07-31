# puppet

Hello!
This is just a repository I am using to keep track of my code that I have written in studying Puppet. I will add details to this as I grow in my knowledge. 

A decent portion of this are based on tutorials in https://www.udemy.com/course/power-puppet/ 
The original config for my puppet server and nodes is largely thanks to a guide I found in linode's tutorials https://www.linode.com/docs/guides/getting-started-with-puppet-6-1-basic-installation-and-setup/.


current setup
Dell 7010 Desktop 
32 GB RAM
Proxmox OS

VMs
1. Puppetmaster server. (ubuntu Server 22.04 LTS)
2. Agent node 1. (ubuntu Server 22.04 LTS)
3. Agent node 2. (ubuntu Server 22.04 LTS)

Modules folder - contains my puppet modules.
    apache - this is my module that installs apache and sets a default homepage for the index.html. Note this will not replace a default anymore it merely insures there is an index.html.
    sysadmins - this is my module that defines a sysadmin group and creates users with defined UIDs assigned to that group.
    unattendedupgrades - module ensures that the packages unattended-upgrades and apt-listupgrades is installed.
Manifests folder - contains my puppet manifests folder. 
    site.pp - file defining my nodes is in here. 
    
  
