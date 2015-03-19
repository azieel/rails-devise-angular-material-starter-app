angular.module('BaseModule').controller("BaseCtrl", [
    '$scope', '$state', 'Auth', 'promiseTracker'
    ($scope, $state, Auth, promiseTracker)->        
        console.log "BaseCtrl"

        $scope.loadingTracker = promiseTracker()

        if Auth.isAuthenticated()
            $state.go('dashboard')
])