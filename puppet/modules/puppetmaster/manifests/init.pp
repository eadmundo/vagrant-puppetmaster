class puppetmaster {
    package { 'puppetmaster':
        ensure => installed,
    }

    file { '/etc/puppet/autosign.conf':
        source => "puppet:///modules/puppetmaster/autosign.conf",
        ensure => present,
    }

    file { '/etc/puppet/modules':
        source  => "puppet:///modules/puppetmaster/modules/",
        recurse => true,
        ensure  => present,
    }

    file { '/etc/puppet/manifests':
        source => "puppet:///modules/puppetmaster/manifests/",
        recurse => true,
        ensure => present,
    }

    file { '/etc/puppet':
        ensure  => directory,
        recurse => true,
        require => File['/etc/puppet/manifests'],
        owner   => root,
    }
}