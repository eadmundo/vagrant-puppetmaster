class python {
  include python::modules
}

#
# Python base system modules
#
class python::modules {
  package { [ 'python-virtualenv', 'python-dev', ]:
    ensure => 'installed'
  }
}
