# == Class: repo
#
# Full description of class repo here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { repo:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class repo(
 $szRepoWebHostAddress = hiera( 'RepoWebHostAddress' ),
) {

file { 'repo_base':
  path    => '/etc/yum.repos.d/distribution-manager.repo',
  ensure  => file,
  content => template('repo/distribution_manager_repo.erb'),
  require => [ 
              Augeas [ 'repo_fedora' ],
              Augeas [ 'repo_fedora_updates' ],
              File [ 'distribution_manager_extras' ],
                    ],
}

file { 'distribution_manager_base':
  path    => '/etc/yum.repos.d/distribution-manager.repo',
  ensure  => file,
  content => template('repo/distribution_manager_repo.erb'),
}

file { 'distribution_manager_upgrade':
  path    => '/etc/yum.repos.d/distribution-manager-upgrade.repo',
  ensure  => file,
  content => template('repo/distribution_manager_upgrade_repo.erb'),
}

file { 'distribution_manager_everything':
  path    => '/etc/yum.repos.d/distribution-manager-everything.repo',
  ensure  => file,
  content => template('repo/distribution_manager_everything_repo.erb'),
}

augeas { 'repo_fedora':
 context => '/files/etc/yum.repos.d/fedora.repo',
  changes => [
    'set fedora/enabled 0',
  ],
}
augeas { 'repo_fedora_updates':
 context => '/files/etc/yum.repos.d/fedora-updates.repo',
  changes => [
    'set updates/enabled 0',
    'set updates-source/enabled 0',
  ],
}



}
