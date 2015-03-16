angular.module('BaseModule').controller("BaseCtrl", [
    '$scope', '$state', 'Auth'
    ($scope, $state, Auth)->        
        console.log "BaseCtrl"
        if Auth.isAuthenticated()
            $state.go('dashboard')
])