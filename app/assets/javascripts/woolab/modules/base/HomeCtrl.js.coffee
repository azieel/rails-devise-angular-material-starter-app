angular.module('BaseModule').controller("HomeCtrl", [
    '$scope', '$state', 'Auth'
    ($scope, $state, Auth)->        
        console.log "Homectrl"
])