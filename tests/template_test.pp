
$arReposList = hiera('repos')

file { '/etc/yum.repos.d/local.repo':
   ensure  => file,
   content => template('repo/combined_repo.erb'),
}
