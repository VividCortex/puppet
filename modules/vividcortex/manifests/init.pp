##
## In order to utilize this module the you must, at a minimum, update params.pp with your
##  apitoken. Otherwise, declare as follows
##
## node { x:
##    include vividcortex('apitoken')
## }
##
## the following paramaters are optional for the delcaration
##   cdnuri
##   apiuri
##   proxyuri
##
##


class vividcortex(
  $apitoken = $vc_apitoken,
  $cdnuri = $vc_cdnuri,
  $apiuri = $vc_apiuri,
  $proxyuri = $vc_proxyuri
  ) inherits vividcortex::params {

    include vividcortex::params
    include vividcortex::packages
    include vividcortex::config
    include vividcortex::services

}