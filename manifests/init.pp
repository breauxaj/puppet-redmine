class redmine (
  $target = '/var/vhost',
  $version = 'master'
) {
  file { $target:
    ensure => directory,
  }

  exec { 'pull-redmine':
    path    => '/bin:/usr/bin',
    command => "git clone https://github.com/redmine/redmine.git -b ${version}",
    cwd     => $target,
    creates => "${target}/redmine/.git',
    timeout => 10000,
    require => [ Package['git','ruby'], File[$target] ],
  }

  file { '/etc/profile.d/redmine.sh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('redmine/profile.erb'),
  }

}
