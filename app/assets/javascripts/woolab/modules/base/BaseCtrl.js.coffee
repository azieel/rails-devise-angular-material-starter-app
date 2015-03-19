angular.module('BaseModule').controller("BaseCtrl", [
    '$scope', '$state', 'Auth', 'promiseTracker'
    ($scope, $state, Auth, promiseTracker)->        
        console.log "BaseCtrl"

        if Auth.isAuthenticated()
            $state.go('dashboard')
])