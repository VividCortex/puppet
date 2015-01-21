class vividcortex::services{

  service { "vividcortex":
    ensure  => running,
    require => Package[$params::vc_packages]
  }

}