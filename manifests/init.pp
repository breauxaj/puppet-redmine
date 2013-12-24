class redmine (
  $target = '/var/vhost',
) {
  file { $target:
    ensure => directory,
  }

  exec { 'pull-redmine':
    path    => '/bin:/usr/bin',
    command => "git clone https://github.com/redmine/redmine.git",
    cwd     => $target,
    creates => "${target}/redmine/.git',
    timeout => 10000,
    require => [ Package['git','ruby'], File[$target] ],
  }

  exec { 'redmine-dependencies':
    path    => '/bin:/usr/bin',
    command => 'bundle install',
    cwd     => "${target}/redmine",
    timeout => 10000,
    require => Exec['pull-redmine'],
  }

}
