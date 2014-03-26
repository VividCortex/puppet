class vividcortex($apitoken, $cdnuri = '', $apiuri = '', $proxyuri = '') {

    package { 'vividcortex-release':
        ensure => present,
        source => 'https://repo.vividcortex.com/repo/centos/6/x86_64/vividcortex-release-1-1.el6.noarch.rpm',
        provider => rpm,
    }
    package { 'vividcortex-agents':
        ensure => latest,
        require => Package["vividcortex-release"],
    }
    file { 'vividcortex-dir':
        path => '/etc/vividcortex/',
        ensure => directory,
        owner => 'root',
        group => 'root',
        mode => '0700',
    }
    file { 'vividcortex-config':
        path => '/etc/vividcortex/global.conf',
        owner => 'root',
        group => 'root',
        mode => '0600',
        content => template('vividcortex/global.conf.erb'),
    }

}
