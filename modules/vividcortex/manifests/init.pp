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
    $apitoken = $apitoken,
    $cdnuri = $cdnuri,
    $apiuri = $apiuri,
    $proxyuri = $proxyuri) {

    include vividcortex::params
    include vividcortex::config
    include vividcortex::packages
    include vividcortex::services

}