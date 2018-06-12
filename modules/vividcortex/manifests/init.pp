class vividcortex($apitoken, $cdnuri = '', $apiuri = '', $proxyuri = '') {

    package { 'vividcortex-agents':
        provider => 'rpm',
        ensure => installed,
        source => 'https://static-download.vividcortex.com/linux/rpms/vividcortex-agents-1.7-815.amzn1.x86_64.rpm',
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
    service { 'vividcortex':
        ensure => 'running',    
    }

}
