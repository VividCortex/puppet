class vividcortex(
  String $apitoken                                              = undef,
  Optional[String] $apiuri                                      = undef,
  Optional[String] $cdnuri                                      = undef,
  Optional[String] $drv_manual_host_uri                         = undef,
  Optional[String] $drv_mysql_query_capture                     = undef,
  Optional[String] $drv_pgsql_query_capture                     = undef,
  Optional[String] $host_discovery_limit                        = undef,
  Optional[String] $proxyuri                                    = undef,
  Optional[String] $security_gateway                            = undef,
  Variant[Enum['true','false'],Boolean, Undef] $skip_certs      = undef,
  Variant[Enum['true','false'],Boolean, Undef] $use_drv_cstar   = undef,
  Variant[Enum['true','false'],Boolean, Undef] $use_drv_manual  = undef,
  Variant[Enum['true','false'],Boolean, Undef] $use_drv_mongo   = undef,
  Variant[Enum['true','false'],Boolean, Undef] $use_drv_mysql   = undef,
  Variant[Enum['true','false'],Boolean, Undef] $use_drv_pgsql   = undef,
  Variant[Enum['true','false'],Boolean, Undef] $use_drv_redis   = undef,
) {

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
    path    => '/etc/vividcortex/global.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    require => Package['vividcortex-agents'],
    notify  => Service['vividcortex'],
    content => template('vividcortex/global.conf.erb'),
  }
  service { 'vividcortex':
    ensure => 'running',
  }

}
