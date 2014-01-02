define redmine::config (
  $target = '/var/vhost',
  $adapter = 'mysql',
  $database = 'redmine',
  $host = '127.0.0.1',
  $port = '3306',
  $username = 'redmine',
  $password = 'r3dm1n#'
) {
  file { "$target/redmine/config/database.yml":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('redmine/database.erb'),
  }

}
