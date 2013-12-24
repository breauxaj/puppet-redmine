class redmine (
  $target = '/var/vhost',
) {
  exec { 'pull-drush':
    path    => '/bin:/usr/bin',
    command => "git clone https://github.com/redmine/redmine.git",
    cwd     => $target,
    creates => "${target}/redmine/.git',
    timeout => 10000,
    require => Package['git','ruby'],
  }

}
