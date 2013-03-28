class puppetslave {

  line { 'line-puppetmaster-hosts':
    ensure => present,
    file   => '/etc/hosts',
    line   => '173.16.1.101     puppet',
  }

}