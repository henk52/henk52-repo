henk52-repo
===========

Repo conf administration

This module will disable the default fedora repositories and add the three mirror repositories.
 - Base
 - Upgrade
 - Everything

This is the repo module.


Installation:
sudo puppet apply /etc/puppet/modules/repo/tests/init.pp

License
-------


Contact
-------


Support
-------

Please log tickets and issues at our [Projects site](http://projects.example.com)


Examples
--------

/etc/puppet/data/defaults.yaml 
---
repos:
    - name: base
      baseurl: http://10.1.233.3/isoimages/centos_65_x86_64
      gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
      gpgcheck: 1
    - name: extras
      baseurl: http://10.1.233.3/extrarepos/centos-65-x86_64-20140925
      gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
      gpgcheck: 1
    - name: puppet
      baseurl: http://10.1.233.3/extrarepos/centos-65-x86_64-puppetlabs
      gpgcheck: 0
    - name: cloudstack 
      baseurl: http://10.1.233.3/extrarepos/cloudstack_4.4
      gpgcheck: 0

puppet apply /etc/puppet/modules/repo/tests/init.pp
yum clean all
