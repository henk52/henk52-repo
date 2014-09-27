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

$arReposList = hiera('repos')

file { '/etc/yum.repos.d/local.repo':
   ensure  => file,
   content => template('repo/combined_repo.erb'),
}


file { '/etc/yum.repos.d/fedora.repo':
  ensure  => absent,
}

file { '/etc/yum.repos.d/fedora-updates.repo':
  ensure  => absent,
}

file { '/etc/yum.repos.d/CentOS-Base.repo':
  ensure  => absent,
}

file { '/etc/yum.repos.d/CentOS-Debuginfo.repo':
  ensure  => absent,
}

file { '/etc/yum.repos.d/CentOS-Media.repo':
  ensure  => absent,
}

file { '/etc/yum.repos.d/CentOS-Vault.repo':
  ensure  => absent,
}

}
