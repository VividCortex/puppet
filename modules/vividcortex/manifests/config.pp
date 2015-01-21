## vividcortex::config will ensure that all the configuration files are in place
class vividcortex::config{

  # Ensure the vc path exists after the vc-release package is installed
  file { $params::vc_path :
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0700',
    require => Package[$params::vc_packages],
  }

  # vc config, requires the vc-release package to be installed
  file { "${params::vc_path}global.conf":
    ensure  => present,
    content => template('vividcortex/global.conf.erb'),
    require => [Package["$params::vc_packages"], File["$params::vc_path"]],
    notify  => Service["vividcortex"],
  }


}
