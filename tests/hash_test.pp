
$repos = hiera('repos')

$baseurl0 = $repos[0]['baseurl']
notify { "hello.":
  message => "DDD $baseurl0",
}
