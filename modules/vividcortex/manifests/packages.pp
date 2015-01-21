## vividcortex::packages will ensure packages in params.pp are installed
class vividcortex::packages{

  package { $params::vc_repo:
    ensure   => present,
    source   => $params::vc_repo_source,
    provider => rpm
  }

  package { $params::vc_packages:
    ensure  => latest,
    require => Package[$params::vc_repo],
  }

}